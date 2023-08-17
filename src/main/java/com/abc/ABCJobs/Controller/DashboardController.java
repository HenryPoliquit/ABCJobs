package com.abc.ABCJobs.Controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.abc.ABCJobs.Entity.Post;
import com.abc.ABCJobs.Entity.Thread;
import com.abc.ABCJobs.Entity.Role;
import com.abc.ABCJobs.Entity.User;
import com.abc.ABCJobs.Service.PostService;
import com.abc.ABCJobs.Service.ThreadService;
import com.abc.ABCJobs.Service.UserService;

@Controller
public class DashboardController {

	@Autowired
	UserService userService;
	
	@Autowired
	PostService postService;
	
	@Autowired
	ThreadService threadService;

	@GetMapping("dashboard")
	public String dashboard(Principal principal, Model model) {
		String username = principal.getName();

		User user = userService.findLoginUser(username);

		String[] role = user.getRoles().stream().map(Role::getName).toArray(String[]::new);

		String userRole = role[0];

		String[] roleNames = userService.getAllRoles().stream().map(Role::getName).toArray(String[]::new);

		for (String roleName : roleNames) {
			if (roleName == userRole && userRole.equalsIgnoreCase("Administrator")) {
				adminDashboard(model, principal);
				return userRole + "/dashboard";
			}
			if (roleName == userRole && userRole.equalsIgnoreCase("Users")) {
				usersDashboard(model, principal);
				return userRole + "/dashboard";
			}
		}
		return "redirect:accessdenied";
	}

	public void adminDashboard(Model model, Principal principal) {
		String username = principal.getName();

		User userdata = userService.findLoginUser(username);
		
		List<User> user = new ArrayList<User>();
		user.add(userdata);
		
		List<Post> post = postService.getAllPosts();
		List<Post> recent = post.subList(Math.max(post.size() - 3, 0), post.size());
		
		List<Thread> thread = threadService.getAllThreads();
		List<Thread> recentThreads = thread.subList(Math.max(post.size() - 3, 0), thread.size());
		
		model.addAttribute("user", user);
		model.addAttribute("recent", recent);
		model.addAttribute("recentThreads", recentThreads);
		
		System.out.println("Logged in as Administrator");
	}

	public void usersDashboard(Model model, Principal principal) {
		String username = principal.getName();

		User userdata = userService.findLoginUser(username);
		
		List<User> user = new ArrayList<User>();
		user.add(userdata);
		
		List<Post> post = postService.getAllPosts();
		List<Post> recent = post.subList(Math.max(post.size() - 3, 0), post.size());
		
		List<Thread> thread = threadService.getAllThreads();
		List<Thread> recentThreads = thread.subList(Math.max(post.size() - 3, 0), thread.size());
		
		model.addAttribute("user", user);
		model.addAttribute("recent", recent);
		model.addAttribute("recentThreads", recentThreads);
		
		System.out.println("Logged in as Administrator");
		System.out.println("Logged in as User");
	}
}
