package com.abc.ABCJobs.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.abc.ABCJobs.Entity.Comment;
import com.abc.ABCJobs.Entity.User;

@Repository
public interface CommentRepository extends JpaRepository<Comment, Long> {
	@Query("SELECT c FROM Comment c WHERE c.threadId = ?1 and c.postId = ?2")
	List<Comment> findByThreadId(Long tId, Long pId);
	
	@Query("SELECT c FROM Comment c WHERE c.postId = ?1 and c.threadId = ?2")
	List<Comment> findByPostId(Long pId, Long tId);
	
	List<Comment> findByUser(User user);
}
