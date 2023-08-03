package com.abc.ABCJobs.Controller;

import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.abc.ABCJobs.Entity.Role;
import com.abc.ABCJobs.Entity.User;
import com.abc.ABCJobs.Service.EmailSenderService;
import com.abc.ABCJobs.Service.UserService;
import com.abc.ABCJobs.Utility.Utility;

@Controller
public class LoginController {

	@Autowired
	UserService userService;
	
	
	@Autowired
	EmailSenderService emailSender;
	
    @GetMapping("login")
    public String onLogin() {
        return "Auth/login";
    }
    
    @GetMapping("login_error")
    public String onLoginError(RedirectAttributes redir) {
        System.out.println("Incorrect Password or Username");
        String error_msg = "Incorrect credentials";
        redir.addFlashAttribute("error_msg", error_msg);
        return "redirect:login";
    }
    
    @GetMapping("login_success")
    public String onLoginSuccess(RedirectAttributes redir, Principal principal) {
    	
    	String username = principal.getName();
    	
    	User user = userService.findLoginUser(username);
    	
    	String[] role= user.getRoles().stream().map(Role::getName).toArray(String[]::new);
    	
    	String userRole = role[0];
    	
    	String[] roleNames= userService.getAllRoles().stream().map(Role::getName).toArray(String[]::new);
    	
    	for (String roleName: roleNames) {
    		if(roleName == userRole) {
    			System.out.println("Logged in successfully as " + userRole);
    			String success_msg = "Logged in successfully. Click here to go to dashboard.";
    			redir.addFlashAttribute("success_msg", success_msg);
    			return "redirect:login";
    		}
    		
    	}
    	
    	System.out.println("Logged in failed");
        String error_msg = "Logged in failed";
        redir.addFlashAttribute("error_msg", error_msg);
    	return "redirect:login";
    }
    
    @GetMapping("logout")
    public String onLogoutSuccess(Model model, RedirectAttributes redir) {
    	
    	String success_logout = "Successfully logged out! Click here to login.";
        redir.addFlashAttribute("success_logout", success_logout);
    	
    	return "redirect:home";
    }
    
    @GetMapping("register")
    public String onRegister(Model model, @ModelAttribute("user") User user) {
    	List<Role> role = userService.getRoles();
    	
    	model.addAttribute("role", role);
    	
    	return "Auth/registration";
    }
	
    @PostMapping("register_user") 
    public String registerNewUser(@ModelAttribute("user") User user, @RequestParam String role, Model model, HttpServletRequest request) throws UnsupportedEncodingException, MessagingException{
		String code = generateCode();
		String siteURL = Utility.getSiteURL(request);
    	if (userService.findUsername(user.getUserName()) == null|| userService.findUsername(user.getUserName()).getUserName() == null ) {
    		user.setEnabled(false);
    		user.setVerification_code(code);
    		userService.save(user, role);
    		sendEmail(user, siteURL);
    		return "redirect:verify?username=" + user.getUserName();	
    	}
    	
    	System.out.println("Username already exists");
        String error_msg = "Username already exists";
        model.addAttribute("error_msg", error_msg);
    	return "Auth/registration";	
    }
    
    public String generateCode() {
		Random rnd = new Random();
		int number = rnd.nextInt(999999);
		String code = String.format("%06d", number);
		return code;
    }
    
    public void sendEmail(User user, String siteURL) throws UnsupportedEncodingException, MessagingException {
    	String verifyURL = siteURL + "/verify?username=" + user.getUserName();
    	String toEmail = user.getEmail();
    	String subject = "Thank you for registering with Meals on Wheels";
    	String body = "<p>Dear " + user.getName() + ",</p>";
    	body += "<p>Thank you for registering on ABC Jobs, the leading community portal for job seekers and employers. We are delighted to have you as a member of our platform.</p>";
    	body += "<p>To complete your registration, please verify your account by entering the following code on the verification page:</p>"; 
    	body += "<a href=\"" + verifyURL + "\">" +  user.getVerification_code() + "</a>";
    	body += "<p>This code will expire in 24 hours, so please verify your account as soon as possible.</p>";
    	body += "<p>If you have any questions or issues, please contact our support team at support@abcjobs.com.</p>"; 
    	body += "<p>We look forward to helping you find your dream job.</p>"; 
    	body +=	"<p>Sincerely,</p>";
    	body +=	"<p>The ABC Jobs Team</p>";
    			
    	emailSender.sendEmail(toEmail, subject, body);
    }
    
    @GetMapping("verify")
    public String verify(@Param("username") String username, Model model) {
    	User user = userService.findUsername(username);
    	model.addAttribute("username", user.getUserName());
    	return "Auth/Verification";
    }
    
    @PostMapping("verify_user")
    public String verify_user(@RequestParam String code, @RequestParam String username) {
    	User user = userService.findUsername(username);
    	
    	if(user.getVerification_code().equals(code)) {
        	userService.verify(user.getUserName());
        	return "Auth/confirmation";
    	} else {
        	return "Auth/access-denied";
    	}
    
    }
    
    @GetMapping("profile")
    public String viewProfile(Principal principal, Model model) {
    	
    	String username = principal.getName();
    	
    	User userdata = userService.findLoginUser(username);
    	
    	String[] role= userdata.getRoles().stream().map(Role::getName).toArray(String[]::new);
    	
    	String userRole = role[0];
    	
    	String[] roleNames= userService.getAllRoles().stream().map(Role::getName).toArray(String[]::new);
    	
    	List<User> user = new ArrayList<User>();
    	user.add(userdata);
    	
    	model.addAttribute("user", user);
    	
		for (String roleName: roleNames) {
    		if(roleName == userRole && userRole.equalsIgnoreCase("Administrator")) {
    			adminProfile();
    			return userRole + "/profile";
    		}
    		if(roleName == userRole && userRole.equalsIgnoreCase("Member")) {
    			usersProfile(model, principal);
    			return userRole + "/profile";
    		}
		}
    	return "redirect:accessdenied";
	}
	
	public void adminProfile() {	
        System.out.println("View profile as Administrator");
	}
	
	public void usersProfile(Model model, Principal principal) {	
        System.out.println("View profile as User");
	}
	
	@PostMapping("update-profile")
	public String  updateProfile(Principal principal, @ModelAttribute("user") User u, RedirectAttributes redir) {
		String userName = principal.getName();
		
		User user = userService.findLoginUser(userName);
		
		user.setName(u.getName());
		user.setGender(u.getGender());
		user.setAddress(u.getAddress());
		user.setMobile(u.getMobile());
		
		userService.update(user);
		
		String success_msg = "Profile has been updated";
		
		redir.addFlashAttribute("success_msg", success_msg);
		
		return "redirect:profile";
	}
}
