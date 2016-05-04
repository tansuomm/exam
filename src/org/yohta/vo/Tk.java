package org.yohta.vo;

import java.util.HashSet;
import java.util.Set;

/**
 * Tk entity. @author MyEclipse Persistence Tools
 */

public class Tk implements java.io.Serializable {

	// Fields

	private Integer tkId;
	private Tkj tkj;
	private String tkName;
	private Set tms = new HashSet(0);

	// Constructors

	/** default constructor */
	public Tk() {
	}

	/** full constructor */
	public Tk(Tkj tkj, String tkName, Set tms) {
		this.tkj = tkj;
		this.tkName = tkName;
		this.tms = tms;
	}

	// Property accessors

	public Integer getTkId() {
		return this.tkId;
	}

	public void setTkId(Integer tkId) {
		this.tkId = tkId;
	}

	public Tkj getTkj() {
		return this.tkj;
	}

	public void setTkj(Tkj tkj) {
		this.tkj = tkj;
	}

	public String getTkName() {
		return this.tkName;
	}

	public void setTkName(String tkName) {
		this.tkName = tkName;
	}

	public Set getTms() {
		return this.tms;
	}

	public void setTms(Set tms) {
		this.tms = tms;
	}

}