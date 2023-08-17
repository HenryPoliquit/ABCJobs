package com.abc.ABCJobs.Service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.abc.ABCJobs.Entity.Comment;
import com.abc.ABCJobs.Entity.Post;
import com.abc.ABCJobs.Entity.User;
import com.abc.ABCJobs.Repository.CommentRepository;

@Service
@Transactional
public class CommentService {
	@Autowired
	CommentRepository comRepo;
	
	public Comment save(Comment comment) {
		
		return comRepo.save(comment);
	}
	
	public List<Comment> getAllComments() {
		return comRepo.findAll(Sort.by(Sort.Direction.DESC, "date"));
	}
	
	public List<Comment> getSpecificThreadComment(long tId, long pId) {
		return comRepo.findByThreadId(tId, pId);
	}
	
	public List<Comment> getSpecificPostComment(long pId, long tId) {
		return comRepo.findByPostId(pId, tId);
	}
	
	public List<Comment> getUserComment(User user) {
		return comRepo.findByUser(user);
	}
	
	public void deleteComment(long cId) {
		comRepo.deleteById(cId);
	}
	public Optional<Comment> getCommentInfo(long cId){
		
		return comRepo.findById(cId);
	}
	public Comment updateComment(Comment comment) {
		
		return comRepo.save(comment);
	}
}
