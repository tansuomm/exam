package org.yohta.vo;

/**
 * Clerk entity. @author MyEclipse Persistence Tools
 */

public class Clerk implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	public static final long serialVersionUID = 1L;
	private Integer clerkId;
	private Organ organ;
	private String clerkName;
	private String clerkPwd;
	private String name;

	// Constructors

	/** default constructor */
	public Clerk() {
	}

	/** full constructor */
	public Clerk(Organ organ, String clerkName, String clerkPwd, String name) {
		this.organ = organ;
		this.clerkName = clerkName;
		this.clerkPwd = clerkPwd;
		this.name = name;
	}

	// Property accessors

	public Integer getClerkId() {
		return this.clerkId;
	}

	public void setClerkId(Integer clerkId) {
		this.clerkId = clerkId;
	}

	public Organ getOrgan() {
		return this.organ;
	}

	public void setOrgan(Organ organ) {
		this.organ = organ;
	}

	public String getClerkName() {
		return this.clerkName;
	}

	public void setClerkName(String clerkName) {
		this.clerkName = clerkName;
	}

	public String getClerkPwd() {
		return this.clerkPwd;
	}

	public void setClerkPwd(String clerkPwd) {
		this.clerkPwd = clerkPwd;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

}