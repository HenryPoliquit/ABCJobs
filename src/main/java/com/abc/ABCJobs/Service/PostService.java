package com.abc.ABCJobs.Service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.abc.ABCJobs.Entity.Post;
import com.abc.ABCJobs.Repository.PostRepository;

@Service
@Transactional
public class PostService {
	@Autowired
	PostRepository postRepo;
	
	public Post save(Post post) {
		
		return postRepo.save(post);
	}
	
	public List<Post> getAllPosts() {
		return postRepo.findAll();
	}
}
