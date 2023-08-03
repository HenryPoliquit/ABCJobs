package com.abc.ABCJobs.Entity;

import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

@Entity
public class User {
@Id
@GeneratedValue(strategy=GenerationType.IDENTITY)
private Long id;

private String name;

@Column(name="user_name", unique = true)
private String userName;

private String password;

@ManyToMany
@JoinTable( name = "user_role", 
			joinColumns = @JoinColumn(name = "user_id"), 
			inverseJoinColumns = @JoinColumn(name = "role_id"))
private Set<Role> roles = new HashSet<>();

private String email;

private String mobile;

private String address;

private String gender;

private boolean enabled;

private String verification_code;

public User() {

}

public User(String userName, String password) {
    this.userName = userName;
    this.password = password;
}

public User(String userName, String password, Set<Role> roles) {
    this.userName = userName;
    this.password = password;
    this.roles = roles;
}

public User(String name, String password, String userName, Set<Role> roles) {
	// TODO Auto-generated constructor stub
	 this.name=name;
     this.password = password;
     this.userName = userName;
     this.roles = roles;
}

public User(Long id, String name, String userName, String password, Set<Role> roles, String email, String mobile,
		String address, String gender, boolean enabled, String verification_code) {
	super();
	this.id = id;
	this.name = name;
	this.userName = userName;
	this.password = password;
	this.roles = roles;
	this.email = email;
	this.mobile = mobile;
	this.address = address;
	this.gender = gender;
	this.enabled = enabled;
	this.verification_code = verification_code;
}

public Long getId() {
	return id;
}

public void setId(Long id) {
	this.id = id;
}

public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}

public String getUserName() {
	return userName;
}

public void setUserName(String userName) {
	this.userName = userName;
}

public String getPassword() {
	return password;
}

public void setPassword(String password) {
	this.password = password;
}

public Set<Role> getRoles() {
	return roles;
}

public void setRoles(Set<Role> roles) {
	this.roles = roles;
}

public String getEmail() {
	return email;
}

public void setEmail(String email) {
	this.email = email;
}

public String getMobile() {
	return mobile;
}

public void setMobile(String mobile) {
	this.mobile = mobile;
}

public String getAddress() {
	return address;
}

public void setAddress(String address) {
	this.address = address;
}

public String getGender() {
	return gender;
}

public void setGender(String gender) {
	this.gender = gender;
}

public boolean isEnabled() {
	return enabled;
}

public void setEnabled(boolean enabled) {
	this.enabled = enabled;
}

public String getVerification_code() {
	return verification_code;
}

public void setVerification_code(String verification_code) {
	this.verification_code = verification_code;
}

@Override
public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;
    User user = (User) o;
    return userName.equals(user.userName) &&
            password.equals(user.password);
}

@Override
public int hashCode() {
    return Objects.hash(userName, password);
}

@Override
public String toString() {
	return "User [id=" + id + ", name=" + name + ", userName=" + userName + ", password=" + password + ", roles="
			+ roles + ", email=" + email + ", mobile=" + mobile + ", address=" + address + ", gender=" + gender
			+ ", enabled=" + enabled + ", verification_code=" + verification_code + "]";
}

}
