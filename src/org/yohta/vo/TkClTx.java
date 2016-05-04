package org.yohta.vo;

/**
 * TkClTx entity. @author MyEclipse Persistence Tools
 */

public class TkClTx implements java.io.Serializable {

	// Fields

	private Integer tkClTxId;
	private Integer tkClId;
	private Integer tmTxId;

	// Constructors

	/** default constructor */
	public TkClTx() {
	}

	/** full constructor */
	public TkClTx(Integer tkClId, Integer tmTxId) {
		this.tkClId = tkClId;
		this.tmTxId = tmTxId;
	}

	// Property accessors

	public Integer getTkClTxId() {
		return this.tkClTxId;
	}

	public void setTkClTxId(Integer tkClTxId) {
		this.tkClTxId = tkClTxId;
	}

	public Integer getTkClId() {
		return this.tkClId;
	}

	public void setTkClId(Integer tkClId) {
		this.tkClId = tkClId;
	}

	public Integer getTmTxId() {
		return this.tmTxId;
	}

	public void setTmTxId(Integer tmTxId) {
		this.tmTxId = tmTxId;
	}

}