package com.abc.ABCJobs.Controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.abc.ABCJobs.Entity.Comment;
import com.abc.ABCJobs.Entity.Post;
import com.abc.ABCJobs.Entity.Role;
import com.abc.ABCJobs.Entity.Thread;
import com.abc.ABCJobs.Entity.User;
import com.abc.ABCJobs.Service.CommentService;
import com.abc.ABCJobs.Service.ThreadService;
import com.abc.ABCJobs.Service.UserService;

@Controller
public class ThreadController {
	@Autowired
	UserService userService;
	
	@Autowired
	ThreadService threadService;
	
	@Autowired
	CommentService comService;
	
	@GetMapping("thread")
	public String thread(@ModelAttribute("thread") Thread thread) {
		return "Users/Thread";
	}
	
	@PostMapping("create_thread")
	public String createThread(@ModelAttribute("thread") Thread thread, Principal principal) {
		String uname = principal.getName();

		User user = userService.findLoginUser(uname);
		
		thread.setUser(user);;
		
		threadService.save(thread);
		
		return "redirect:dashboard";
	}
	
	@GetMapping("thread_detail")
	public String viewThreadDetail(@RequestParam long tId, Model model, Principal principal, @ModelAttribute("comment") Comment comment) {
		String username = principal.getName();

		User userdata = userService.findLoginUser(username);
		
		List<User> user = new ArrayList<User>();
		user.add(userdata);
		
		Thread thread_info = threadService.findThread(tId);
		
		List<Thread> thread = new ArrayList<Thread>();
		thread.add(thread_info);
		
		long pId = 0;
		
		List<Comment> comments = comService.getSpecificThreadComment(tId, pId);
		
		model.addAttribute("user", user);
		model.addAttribute("thread", thread);
		model.addAttribute("comments", comments);
		
		return "Common/thread-detail";
	}
	
	@GetMapping("all_threads")
	public String viewAllThreads(Model model, Principal principal) {
		String username = principal.getName();

		User user = userService.findLoginUser(username);

		String[] role = user.getRoles().stream().map(Role::getName).toArray(String[]::new);

		String userRole = role[0];

		String[] roleNames = userService.getAllRoles().stream().map(Role::getName).toArray(String[]::new);

		for (String roleName : roleNames) {
			if (roleName == userRole && userRole.equalsIgnoreCase("Administrator")) {
				adminAllThreads(model, principal);
				return userRole + "/all-threads";
			}
			if (roleName == userRole && userRole.equalsIgnoreCase("Users")) {
				usersAllThreads(model, principal);
				return userRole + "/all-threads";
			}
		}
		return "redirect:accessdenied";
	}

	public void adminAllThreads(Model model, Principal principal) {
		String username = principal.getName();

		User userdata = userService.findLoginUser(username);
		
		List<User> user = new ArrayList<User>();
		user.add(userdata);
		
		List<Thread> thread = threadService.getAllThreads();
		
		model.addAttribute("user", user);
		model.addAttribute("thread", thread);
	}

	public void usersAllThreads(Model model, Principal principal) {
		String username = principal.getName();

		User userdata = userService.findLoginUser(username);
		
		List<User> user = new ArrayList<User>();
		user.add(userdata);
		
		List<Thread> thread = threadService.getAllThreads();
		
		model.addAttribute("user", user);
		model.addAttribute("thread", thread);
	}
	
	@GetMapping("manage_threads")
	public ModelAndView manageThreads(@ModelAttribute("thread") Thread thread, Principal principal, Model model) {
		String username = principal.getName();

		User userdata = userService.findLoginUser(username);
		
		List<User> user = new ArrayList<User>();
		user.add(userdata);
		
		model.addAttribute("user", user);
		
		List<Thread> threads = threadService.getAllThreads();
		return new ModelAndView ("Administrator/manage-threads", "threads", threads);
	}
	
	@PostMapping("edit_thread")
	public String editThread(@ModelAttribute("thread") Thread thread, @RequestParam long tId) {

		Optional<Thread> getThread = threadService.getThreadInfo(tId);
		
		Thread thread_info = getThread.get();
		
		thread_info.setName(thread.getName());
		thread_info.setDescription(thread.getDescription());
		
		threadService.save(thread_info);
		
		return "redirect:manage_threads";
	}
	
	@GetMapping("delete_thread")
	public String deleteThread(@RequestParam long tId) {
		
		threadService.deleteThread(tId);
		
		return "redirect:manage_threads";
	}
}
