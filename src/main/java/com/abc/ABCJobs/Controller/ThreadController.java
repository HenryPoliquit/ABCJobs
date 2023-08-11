package com.abc.ABCJobs.Controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import com.abc.ABCJobs.Entity.Thread;
import com.abc.ABCJobs.Entity.User;
import com.abc.ABCJobs.Service.ThreadService;
import com.abc.ABCJobs.Service.UserService;

@Controller
public class ThreadController {
	@Autowired
	UserService userService;
	
	@Autowired
	ThreadService threadService;
	
	@GetMapping("thread")
	public String thread(@ModelAttribute("thread") Thread thread) {
		return "Users/Thread";
	}
	
	@PostMapping("create_thread")
	public String createThread(@ModelAttribute("thread") Thread thread, Principal principal) {
		String uname = principal.getName();

		User user = userService.findLoginUser(uname);
		
		thread.setUser_id(user.getId());
		
		threadService.save(thread);
		
		return "redirect:dashboard";
	}
}
