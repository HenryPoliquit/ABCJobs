package com.abc.ABCJobs.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.abc.ABCJobs.Entity.Thread;

@Repository
public interface ThreadRepository extends JpaRepository<Thread, Long>{

}
