package org.yohta.vo;

import java.util.HashSet;
import java.util.Set;

/**
 * Clerk entity. @author MyEclipse Persistence Tools
 */

public class Clerk implements java.io.Serializable {

	// Fields

	private Integer clerkId;
	private Organ organ;
	private String clerkName;
	private String clerkPwd;
	private String name;
	private Set clerkKscjs = new HashSet(0);

	// Constructors

	/** default constructor */
	public Clerk() {
	}

	/** full constructor */
	public Clerk(Organ organ, String clerkName, String clerkPwd, String name,
			Set clerkKscjs) {
		this.organ = organ;
		this.clerkName = clerkName;
		this.clerkPwd = clerkPwd;
		this.name = name;
		this.clerkKscjs = clerkKscjs;
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

	public Set getClerkKscjs() {
		return this.clerkKscjs;
	}

	public void setClerkKscjs(Set clerkKscjs) {
		this.clerkKscjs = clerkKscjs;
	}

}