package org.yohta.vo;

import java.util.HashSet;
import java.util.Set;

/**
 * Tkj entity. @author MyEclipse Persistence Tools
 */

public class Tkj implements java.io.Serializable {

	// Fields

	private Integer tkjId;
	private String tkjName;
	private Set tks = new HashSet(0);

	// Constructors

	/** default constructor */
	public Tkj() {
	}

	/** full constructor */
	public Tkj(String tkjName, Set tks) {
		this.tkjName = tkjName;
		this.tks = tks;
	}

	// Property accessors

	public Integer getTkjId() {
		return this.tkjId;
	}

	public void setTkjId(Integer tkjId) {
		this.tkjId = tkjId;
	}

	public String getTkjName() {
		return this.tkjName;
	}

	public void setTkjName(String tkjName) {
		this.tkjName = tkjName;
	}

	public Set getTks() {
		return this.tks;
	}

	public void setTks(Set tks) {
		this.tks = tks;
	}

}