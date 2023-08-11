package com.abc.ABCJobs.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.abc.ABCJobs.Entity.Post;

@Repository
public interface PostRepository extends JpaRepository<Post, Long> {

}
