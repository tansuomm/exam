package org.yohta.vo;

import java.util.HashSet;
import java.util.Set;

/**
 * Right entity. @author MyEclipse Persistence Tools
 */

public class Right implements java.io.Serializable {

	// Fields

	private Integer rightId;
	private String rightName;
	private Integer parentId;
	private Set userRights = new HashSet(0);

	// Constructors

	/** default constructor */
	public Right() {
	}
	/** full constructor */
	public Right(String rightName, Integer parentId, Set userRights) {
		this.rightName = rightName;
		this.parentId = parentId;
		this.userRights = userRights;
	}

	// Property accessors

	public Integer getRightId() {
		return this.rightId;
	}

	public void setRightId(Integer rightId) {
		this.rightId = rightId;
	}

	public String getRightName() {
		return this.rightName;
	}

	public void setRightName(String rightName) {
		this.rightName = rightName;
	}

	public Integer getParentId() {
		return this.parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public Set getUserRights() {
		return this.userRights;
	}

	public void setUserRights(Set userRights) {
		this.userRights = userRights;
	}

}