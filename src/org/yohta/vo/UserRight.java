package org.yohta.vo;

/**
 * UserRight entity. @author MyEclipse Persistence Tools
 */

public class UserRight implements java.io.Serializable {

	// Fields

	private Integer userRightId;
	private User user;
	private Right right;

	// Constructors

	/** default constructor */
	public UserRight() {
	}

	/** full constructor */
	public UserRight(User user, Right right) {
		this.user = user;
		this.right = right;
	}

	// Property accessors

	public Integer getUserRightId() {
		return this.userRightId;
	}

	public void setUserRightId(Integer userRightId) {
		this.userRightId = userRightId;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Right getRight() {
		return this.right;
	}

	public void setRight(Right right) {
		this.right = right;
	}

}