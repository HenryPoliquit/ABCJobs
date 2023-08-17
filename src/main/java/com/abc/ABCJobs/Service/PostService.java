package com.abc.ABCJobs.Service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
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
	
	public Post updatePost(Post post) {
		
		return postRepo.save(post);
	}
	
	public List<Post> getAllPosts() {
		return postRepo.findAll(Sort.by(Sort.Direction.DESC, "date"));
	}
	
	public Post findPost(Long pId) {
		return postRepo.getById(pId);
	}
	
	public void deletePost(long pId) {
		postRepo.deleteById(pId);
	}
	public Optional<Post> getPostInfo(long pId){
		
		return postRepo.findById(pId);
	}
}
