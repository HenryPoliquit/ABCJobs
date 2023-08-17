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
import com.abc.ABCJobs.Entity.Thread;
import com.abc.ABCJobs.Entity.User;
import com.abc.ABCJobs.Service.CommentService;
import com.abc.ABCJobs.Service.PostService;
import com.abc.ABCJobs.Service.ThreadService;
import com.abc.ABCJobs.Service.UserService;

@Controller
public class CommentController {
	@Autowired
	UserService userService;
	
	@Autowired
	PostService postService;
	
	@Autowired
	ThreadService threadService;
	
	@Autowired
	CommentService comService;
	
	@PostMapping("create_thread_comment")
	public String createThreadComment(@ModelAttribute("comment") Comment comment, Principal principal) {
		String uname = principal.getName();

		User user = userService.findLoginUser(uname);
		
		comment.setUser(user);
		comment.setPostId((long) 0);
		
		comService.save(comment);
		
		return "redirect:thread_detail?tId=" + comment.getThreadId();
	}
	
	@PostMapping("create_post_comment")
	public String createPostComment(@ModelAttribute("comment") Comment comment, Principal principal) {
		String uname = principal.getName();

		User user = userService.findLoginUser(uname);
		
		comment.setUser(user);
		comment.setThreadId((long) 0);
		
		comService.save(comment);
		
		return "redirect:post_detail?pId=" + comment.getPostId();
	}
	
	@GetMapping("manage_comment")
	public ModelAndView manageComments(@ModelAttribute("comment") Comment comment, Principal principal, Model model) {
		String username = principal.getName();

		User userdata = userService.findLoginUser(username);
		
		List<User> user = new ArrayList<User>();
		user.add(userdata);
		
		model.addAttribute("user", user);
		
		List<Comment> comments = comService.getAllComments();
		return new ModelAndView ("Administrator/manage-comments", "comments", comments);
	}
	
	@PostMapping("edit_comment")
	public String editComment(@ModelAttribute("comment") Comment comment, @RequestParam long cId) {
		
		Optional<Comment> getComment = comService.getCommentInfo(cId);
		
		Comment comment_info = getComment.get();
		
		comment_info.setDescription(comment.getDescription());
		comService.updateComment(comment_info);
		return "redirect:manage_comment";
	}
	
	@GetMapping("delete_comment")
	public String deleteComment(@RequestParam long cId) {
		
		comService.deleteComment(cId);
		
		return "redirect:manage_comment";
	}
}
