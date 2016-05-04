package org.yohta.vo;

import java.util.HashSet;
import java.util.Set;

/**
 * Organ entity. @author MyEclipse Persistence Tools
 */

public class Organ implements java.io.Serializable {

	// Fields

	private Integer organId;
	private String organName;
	private Set clerks = new HashSet(0);

	// Constructors

	/** default constructor */
	public Organ() {
	}

	/** full constructor */
	public Organ(String organName, Set clerks) {
		this.organName = organName;
		this.clerks = clerks;
	}

	// Property accessors

	public Integer getOrganId() {
		return this.organId;
	}

	public void setOrganId(Integer organId) {
		this.organId = organId;
	}

	public String getOrganName() {
		return this.organName;
	}

	public void setOrganName(String organName) {
		this.organName = organName;
	}

	public Set getClerks() {
		return this.clerks;
	}

	public void setClerks(Set clerks) {
		this.clerks = clerks;
	}

}