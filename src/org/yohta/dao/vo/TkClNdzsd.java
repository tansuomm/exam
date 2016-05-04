package org.yohta.vo;

/**
 * TkClNdzsd entity. @author MyEclipse Persistence Tools
 */

public class TkClNdzsd implements java.io.Serializable {

	// Fields

	private Integer clId;
	private Integer tkClId;
	private Integer tkTkjId;
	private Integer tkLxId;
	private Integer tmTxId;
	private Integer tmNum;

	// Constructors

	/** default constructor */
	public TkClNdzsd() {
	}

	/** full constructor */
	public TkClNdzsd(Integer tkClId, Integer tkTkjId, Integer tkLxId,
			Integer tmTxId, Integer tmNum) {
		this.tkClId = tkClId;
		this.tkTkjId = tkTkjId;
		this.tkLxId = tkLxId;
		this.tmTxId = tmTxId;
		this.tmNum = tmNum;
	}

	// Property accessors

	public Integer getClId() {
		return this.clId;
	}

	public void setClId(Integer clId) {
		this.clId = clId;
	}

	public Integer getTkClId() {
		return this.tkClId;
	}

	public void setTkClId(Integer tkClId) {
		this.tkClId = tkClId;
	}

	public Integer getTkTkjId() {
		return this.tkTkjId;
	}

	public void setTkTkjId(Integer tkTkjId) {
		this.tkTkjId = tkTkjId;
	}

	public Integer getTkLxId() {
		return this.tkLxId;
	}

	public void setTkLxId(Integer tkLxId) {
		this.tkLxId = tkLxId;
	}

	public Integer getTmTxId() {
		return this.tmTxId;
	}

	public void setTmTxId(Integer tmTxId) {
		this.tmTxId = tmTxId;
	}

	public Integer getTmNum() {
		return this.tmNum;
	}

	public void setTmNum(Integer tmNum) {
		this.tmNum = tmNum;
	}

}