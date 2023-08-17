package com.abc.ABCJobs.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.abc.ABCJobs.Entity.Role;
import com.abc.ABCJobs.Entity.User;
import com.abc.ABCJobs.Repository.RoleRepository;
import com.abc.ABCJobs.Repository.UserRepository;

@Service
@Transactional
public class UserService {
	
	@Autowired
	UserRepository userRepository;
	
	@Autowired
	RoleRepository roleRepository;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	public List<Role> getAllRoles() {
		return roleRepository.findAll();
	}
	
	public List<Role> getRoles() {
		return roleRepository.findRoles();
	}
	
	public String save(User user) {
		String encodedPassword = passwordEncoder.encode(user.getPassword());
		user.setPassword(encodedPassword);
		user.setRoles(new HashSet<>(roleRepository.findBySpecificRoles("Users")));
		
		userRepository.save(user);
		
		return "User saved successfully";
	}
	
	public User findLoginUser(String userName) {
	
		return userRepository.findByUserName(userName);
		
	}
	
	public User findSpecificUser(long id) {
		
		return userRepository.findByid(id);
		
	}
	
	public User findUsername(String userName) {
		
		return userRepository.findByUserName(userName);
	}
	
	public User findEmail(String email) {
		return userRepository.findByEmail(email);
	}
	
	public List<User> showAllUser(){
		
		return userRepository.findAll();
	}
	
	public String updateCode(User user) {
		userRepository.save(user);
		
		return "User Profile updated";	
	}
	
	public String updateProfile(User user) {
		userRepository.save(user);
		
		return "User Profile updated";	
	}
	
	public String update(User user) {
		String encodedPassword = passwordEncoder.encode(user.getPassword());
		user.setPassword(encodedPassword);
		userRepository.save(user);
		
		return "User updated";
		
	}
	
	public Optional<User> getUserInfo(long uid){
		
		return userRepository.findById(uid);
		
	}
	
	public void deleteUser(long uid) {
		
		userRepository.deleteById(uid);
	}
	
	public void assignNewRole(User user, String role) {
		
		user.getRoles().clear();
		user.setRoles(new HashSet<>(roleRepository.findBySpecificRoles(role)));
		userRepository.save(user);
	}
	
	public List<User> search(String keyword) {
		return userRepository.search(keyword);
		
	}

	public boolean verify(String username) {
		User user = userRepository.findByUserName(username);
		
		if(user == null || user.isEnabled()) {
			return false;
		} else {
			userRepository.enable(user.getId());
			return true;
		}
	}
}
