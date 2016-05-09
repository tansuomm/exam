package org.yohta.vo;

import java.util.HashSet;
import java.util.Set;

/**
 * User entity. @author MyEclipse Persistence Tools
 */

public class User implements java.io.Serializable {

	// Fields

	private Integer userId;
	private String userName;
	private String userPwd;
	private Set userRights = new HashSet(0);

	// Constructors

	/** default constructor */
	public User() {
	}

	/** minimal constructor */
	public User(String userName, String userPwd) {
		this.userName = userName;
		this.userPwd = userPwd;
	}

	/** full constructor */
	public User(String userName, String userPwd, Set userRights) {
		this.userName = userName;
		this.userPwd = userPwd;
		this.userRights = userRights;
	}

	// Property accessors

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPwd() {
		return this.userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public Set getUserRights() {
		return this.userRights;
	}

	public void setUserRights(Set userRights) {
		this.userRights = userRights;
	}

}