package com.abc.ABCJobs.Controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.abc.ABCJobs.Entity.Role;
import com.abc.ABCJobs.Entity.User;
import com.abc.ABCJobs.Service.UserService;

@Controller
public class DashboardController {

	@Autowired
	UserService userService;

	@GetMapping("dashboard")
	public String dashboard(Principal principal, Model model) {
		String username = principal.getName();

		User user = userService.findLoginUser(username);

		String[] role = user.getRoles().stream().map(Role::getName).toArray(String[]::new);

		String userRole = role[0];

		String[] roleNames = userService.getAllRoles().stream().map(Role::getName).toArray(String[]::new);

		for (String roleName : roleNames) {
			if (roleName == userRole && userRole.equalsIgnoreCase("Administrator")) {
				adminDashboard();
				return userRole + "/dashboard";
			}
			if (roleName == userRole && userRole.equalsIgnoreCase("Users")) {
				usersDashboard();
				return userRole + "/dashboard";
			}
		}
		return "redirect:accessdenied";
	}

	public void adminDashboard() {
		System.out.println("Logged in as Administrator");
	}

	public void usersDashboard() {
		System.out.println("Logged in as User");
	}
}
