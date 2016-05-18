package org.yohta.vo;

/**
 * ClerkCl entity. @author MyEclipse Persistence Tools
 */

public class ClerkCl implements java.io.Serializable {

	// Fields

	

	private Integer clClerkId;
	private Integer tkClId;
	private Integer organId;

	// Constructors

	/** default constructor */
	public ClerkCl() {
	}

	/** full constructor */
	public ClerkCl(Integer tkClId, Integer organId) {
		this.tkClId = tkClId;
		this.organId = organId;
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

	public Integer getOrganId() {
		return this.organId;
	}

	public void setOrganId(Integer organId) {
		this.organId = organId;
	}


}