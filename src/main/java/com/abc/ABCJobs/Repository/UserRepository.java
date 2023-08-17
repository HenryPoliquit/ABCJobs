package com.abc.ABCJobs.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.abc.ABCJobs.Entity.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long>{
	
	User findByUserName(String name);
	User findByid(Long id);
	User findByEmail(String email);
	
	@Query("UPDATE User u SET u.enabled = true WHERE u.id = ?1")
	@Modifying
	public void enable(long id);
	
	@Query(value = "SELECT u FROM User u WHERE u.name LIKE '%' || :keyword || '%'"
			+ " OR u.userName LIKE '%' || :keyword || '%'"
			+ " OR u.email LIKE '%' || :keyword || '%'"
			+ " OR u.address LIKE '%' || :keyword || '%'")
	public List<User> search(@Param("keyword") String keyword);
}
