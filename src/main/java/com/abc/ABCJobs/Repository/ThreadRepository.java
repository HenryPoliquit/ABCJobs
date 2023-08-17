package com.abc.ABCJobs.Repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.abc.ABCJobs.Entity.Thread;

@Repository
public interface ThreadRepository extends JpaRepository<Thread, Long>{
	Optional<Thread> findById(Long tId);
}
