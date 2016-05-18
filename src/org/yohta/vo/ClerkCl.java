package org.yohta.vo;

/**
 * ClerkCl entity. @author MyEclipse Persistence Tools
 */

public class ClerkCl implements java.io.Serializable {

	// Fields

	

	private Integer clClerkId;
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((clClerkId == null) ? 0 : clClerkId.hashCode());
		result = prime * result + ((organId == null) ? 0 : organId.hashCode());
		result = prime * result + ((tkClId == null) ? 0 : tkClId.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ClerkCl other = (ClerkCl) obj;
		if (clClerkId == null) {
			if (other.clClerkId != null)
				return false;
		} else if (!clClerkId.equals(other.clClerkId))
			return false;
		if (organId == null) {
			if (other.organId != null)
				return false;
		} else if (!organId.equals(other.organId))
			return false;
		if (tkClId == null) {
			if (other.tkClId != null)
				return false;
		} else if (!tkClId.equals(other.tkClId))
			return false;
		return true;
	}

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