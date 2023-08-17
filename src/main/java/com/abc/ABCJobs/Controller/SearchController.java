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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.abc.ABCJobs.Entity.Thread;
import com.abc.ABCJobs.Entity.User;
import com.abc.ABCJobs.Service.UserService;

@Controller
public class SearchController {
	@Autowired
	UserService userService;
	
	@GetMapping("/search")
	public String searchPage(Principal principal, Model model) {
		String username = principal.getName();

		User userdata = userService.findLoginUser(username);
		
		List<User> user = new ArrayList<User>();
		user.add(userdata);
		
		model.addAttribute("user", user);
		return "Search/search";
	}
	
	@GetMapping("/search-results")
	public ModelAndView searchResultsPage(@RequestParam String keyword, Model model, Principal principal) {
		
		String username = principal.getName();
		User userdata = userService.findLoginUser(username);
		model.addAttribute("currentUser", userdata.getUserName());
		
		List<User> searchUser = userService.search(keyword);
		System.out.println(searchUser);
		
		List<User> user = new ArrayList<User>();
		user.add(userdata);
		
		model.addAttribute("user", user);
		model.addAttribute("keyword", keyword);
		return new ModelAndView("Search/search-result", "searchUser", searchUser);
	}
	
	@GetMapping("manage_users")
	public ModelAndView manageUsers(@ModelAttribute("users") User users, Principal principal, Model model) {
		String username = principal.getName();

		User userdata = userService.findLoginUser(username);
		
		List<User> user = new ArrayList<User>();
		user.add(userdata);
		
		model.addAttribute("user", user);
		
		List<User> all_user = userService.showAllUser();
		return new ModelAndView ("Administrator/manage-users", "all_user", all_user);
	}
	
	@PostMapping("edit-profile")
	public String editProfile(@ModelAttribute("user") User u, @RequestParam long uid) {

		Optional<User> user = userService.getUserInfo(uid);
		
		User user_info = user.get();
		
		user_info.setName(u.getName());
		user_info.setGender(u.getGender());
		user_info.setEnabled(u.isEnabled());
		user_info.setAddress(u.getAddress());
		user_info.setMobile(u.getMobile());

		userService.updateProfile(user_info);

		return "redirect:manage_users";
	}
	
	@GetMapping("delete_user")
	public String deleteUser(@RequestParam long uid) {
		
		userService.deleteUser(uid);
		
		return "redirect:manage_users";
	}
}
