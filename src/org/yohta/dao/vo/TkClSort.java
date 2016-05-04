package org.yohta.vo;

/**
 * TkClSort entity. @author MyEclipse Persistence Tools
 */

public class TkClSort implements java.io.Serializable {

	// Fields

	private Integer tkClSortId;
	private String sortName;

	// Constructors

	/** default constructor */
	public TkClSort() {
	}

	/** full constructor */
	public TkClSort(String sortName) {
		this.sortName = sortName;
	}

	// Property accessors

	public Integer getTkClSortId() {
		return this.tkClSortId;
	}

	public void setTkClSortId(Integer tkClSortId) {
		this.tkClSortId = tkClSortId;
	}

	public String getSortName() {
		return this.sortName;
	}

	public void setSortName(String sortName) {
		this.sortName = sortName;
	}

}