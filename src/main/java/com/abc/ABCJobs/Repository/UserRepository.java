package com.abc.ABCJobs.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.abc.ABCJobs.Entity.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long>{
	
	User findByUserName(String name);
	
	@Query("UPDATE User u SET u.enabled = true WHERE u.id = ?1")
	@Modifying
	public void enable(long id);
}
