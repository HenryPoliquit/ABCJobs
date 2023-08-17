package com.abc.ABCJobs.Controller;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.abc.ABCJobs.Entity.Comment;
import com.abc.ABCJobs.Entity.Post;
import com.abc.ABCJobs.Entity.Role;
import com.abc.ABCJobs.Entity.Thread;
import com.abc.ABCJobs.Entity.User;
import com.abc.ABCJobs.Service.CommentService;
import com.abc.ABCJobs.Service.PostService;
import com.abc.ABCJobs.Service.UserService;

@Controller
public class PostController {
	@Autowired
	PostService postService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	CommentService comService;
	
	@PostMapping("create_post")
	public String createPost(@ModelAttribute("post") Post post, Principal principal, @RequestParam("fileImage") MultipartFile multipartFile) throws IOException {
		String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());

		post.setPhotos(fileName);

		Post savedPost = postService.save(post);

		String uploadDir = "./src/main/resources/static/images/post-photo/" + savedPost.getId();

		Path uploadPath = Paths.get(uploadDir);

		if (!Files.exists(uploadPath)) {
			Files.createDirectories(uploadPath);
		}

		try (InputStream inputStream = multipartFile.getInputStream()) {
			Path filePath = uploadPath.resolve(fileName);
			System.out.println(filePath.toFile().getAbsolutePath());
			Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
		} catch (IOException e) {
			throw new IOException("Could not save uploaded file: " + fileName);

		}

		post.setPhotoImagePath("/images/post-photo/" + savedPost.getId() + "/" + savedPost.getPhotos());

		// Get User name
		String uname = principal.getName();

		User user = userService.findLoginUser(uname);
		post.setUser(user);
		
		postService.save(post);
		return "redirect:dashboard";
	}
	
	@GetMapping("post_detail")
	public String viewPostDetail(@RequestParam long pId, Model model, Principal principal, @ModelAttribute("comment") Comment comment) {
		String username = principal.getName();

		User userdata = userService.findLoginUser(username);
		
		List<User> user = new ArrayList<User>();
		user.add(userdata);
		
		Post post_info = postService.findPost(pId);
		
		List<Post> post = new ArrayList<Post>();
		post.add(post_info);
		
		long tId = 0;
		
		List<Comment> comments = comService.getSpecificPostComment(pId, tId);
		
		List<Comment> userComment = comService.getUserComment(userService.findLoginUser(userdata.getUserName()));
		
		model.addAttribute("user", user);
		model.addAttribute("post", post);
		model.addAttribute("comments", comments);
		model.addAttribute("uComment", userComment);
		
		return "Common/post-detail";
	}
	
	@GetMapping("all_posts")
	public String viewAllPosts(Model model, Principal principal) {
		String username = principal.getName();

		User user = userService.findLoginUser(username);

		String[] role = user.getRoles().stream().map(Role::getName).toArray(String[]::new);

		String userRole = role[0];

		String[] roleNames = userService.getAllRoles().stream().map(Role::getName).toArray(String[]::new);

		for (String roleName : roleNames) {
			if (roleName == userRole && userRole.equalsIgnoreCase("Administrator")) {
				adminAllPosts(model, principal);
				return userRole + "/all-post";
			}
			if (roleName == userRole && userRole.equalsIgnoreCase("Users")) {
				usersAllPosts(model, principal);
				return userRole + "/all-post";
			}
		}
		return "redirect:accessdenied";
	}

	public void adminAllPosts(Model model, Principal principal) {
		String username = principal.getName();

		User userdata = userService.findLoginUser(username);
		
		List<User> user = new ArrayList<User>();
		user.add(userdata);
		
		List<Post> post = postService.getAllPosts();
		
		model.addAttribute("user", user);
		model.addAttribute("post", post);
	}

	public void usersAllPosts(Model model, Principal principal) {
		String username = principal.getName();

		User userdata = userService.findLoginUser(username);
		
		List<User> user = new ArrayList<User>();
		user.add(userdata);
		
		List<Post> post = postService.getAllPosts();
		
		model.addAttribute("user", user);
		model.addAttribute("post", post);
	}
	
	@GetMapping("manage_post")
	public ModelAndView managePosts(@ModelAttribute("post") Post post, Principal principal, Model model) {
		String username = principal.getName();

		User userdata = userService.findLoginUser(username);
		
		List<User> user = new ArrayList<User>();
		user.add(userdata);
		
		model.addAttribute("user", user);
		
		List<Post> posts = postService.getAllPosts();
		return new ModelAndView ("Administrator/manage-posts", "posts", posts);
	}
	
	@PostMapping("edit_post")
	public String editPost(@ModelAttribute("post") Post post, @RequestParam long pId) {
		Optional<Post> getPost = postService.getPostInfo(pId);
		
		Post post_info = getPost.get();
		
		post_info.setName(post.getName());
		post_info.setDescription(post.getDescription());
		postService.updatePost(post_info);
		return "redirect:manage_post";
	}
	
	@GetMapping("delete_post")
	public String deletePost(@RequestParam long pId) {
		
		postService.deletePost(pId);
		
		return "redirect:manage_post";
		
	}
}
