package com.abc.ABCJobs.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CommonController {

	@GetMapping("/")
	public String handleRootRequest() {

		return "redirect:home";
	}
	
	@GetMapping("home")
	public String homePage() {
		return "Common/home";
	}
	
	@GetMapping("access-denied")
	public String accessDeniedPage() {
		return "Common/access-denied";
	}
	
	@GetMapping("about-us")
	public String AboutUsPage() {
		return "Common/About-Us";
	}

	@GetMapping("terms-and-conditions")
	public String TermsAndConditionsPage() {
		return "Common/Terms-and-Conditions";
	}

	@GetMapping("contact-us")
	public String ContactUsPage() {
		return "Common/Contact-Us";
	}

	@GetMapping("privacy-policy")
	public String PrivacyPolicyPage() {
		return "Common/Privacy-Policy";
	}
}