package org.yohta.vo;

/**
 * ClerkCl entity. @author MyEclipse Persistence Tools
 */

public class ClerkCl implements java.io.Serializable {

	// Fields

	private Integer clClerkId;
	private Integer tkClId;
	private Integer clerkId;

	// Constructors

	/** default constructor */
	public ClerkCl() {
	}

	/** full constructor */
	public ClerkCl(Integer tkClId, Integer clerkId) {
		this.tkClId = tkClId;
		this.clerkId = clerkId;
	}

	// Property accessors

	public Integer getClClerkId() {
		return this.clClerkId;
	}

	public void setClClerkId(Integer clClerkId) {
		this.clClerkId = clClerkId;
	}

	public Integer getTkClId() {
		return this.tkClId;
	}

	public void setTkClId(Integer tkClId) {
		this.tkClId = tkClId;
	}

	public Integer getClerkId() {
		return this.clerkId;
	}

	public void setClerkId(Integer clerkId) {
		this.clerkId = clerkId;
	}

}