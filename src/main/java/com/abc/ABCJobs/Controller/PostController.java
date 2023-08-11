package com.abc.ABCJobs.Controller;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.abc.ABCJobs.Entity.Post;
import com.abc.ABCJobs.Entity.User;
import com.abc.ABCJobs.Service.PostService;
import com.abc.ABCJobs.Service.UserService;

@Controller
public class PostController {
	@Autowired
	PostService postService;
	
	@Autowired
	UserService userService;
	
	@GetMapping("post")
	public String post(@ModelAttribute("post") Post post) {
		return "Administrator/Post";
	}
	
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
}
