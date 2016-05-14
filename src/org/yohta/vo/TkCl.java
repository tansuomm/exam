package org.yohta.vo;

import java.sql.Timestamp;

/**
 * TkCl entity. @author MyEclipse Persistence Tools
 */

public class TkCl implements java.io.Serializable {

	// Fields

	private Integer tkClId;
	private String tkClName;
	private Integer tkClTime;
	private Timestamp validBtime;
	private Timestamp validEtime;
	private Integer tkClPf;
	private Integer allowSeePaper;
	private Integer isSavePaper;
	private Integer minKsNum;
	private Integer maxKsNum;
	private Integer isOrder;
	private Integer moveOutTimes;
	private Integer tkClType;
	private Integer isAllow;
	private Integer totalScore;
	private Integer passFS;
	// Constructors

	public Integer getTotalScore() {
		return totalScore;
	}

	public void setTotalScore(Integer totalScore) {
		this.totalScore = totalScore;
	}

	public Integer getPassFS() {
		return passFS;
	}

	public void setPassFS(Integer passFS) {
		this.passFS = passFS;
	}

	/** default constructor */
	public TkCl() {
	}

	/** full constructor */
	public TkCl(String tkClName, Integer tkClTime, Timestamp validBtime,
			Timestamp validEtime, Integer tkClPf, Integer allowSeePaper,
			Integer isSavePaper, Integer minKsNum, Integer maxKsNum,
			Integer isOrder, Integer moveOutTimes, Integer tkClType,
			Integer isAllow) {
		this.tkClName = tkClName;
		this.tkClTime = tkClTime;
		this.validBtime = validBtime;
		this.validEtime = validEtime;
		this.tkClPf = tkClPf;
		this.allowSeePaper = allowSeePaper;
		this.isSavePaper = isSavePaper;
		this.minKsNum = minKsNum;
		this.maxKsNum = maxKsNum;
		this.isOrder = isOrder;
		this.moveOutTimes = moveOutTimes;
		this.tkClType = tkClType;
		this.isAllow = isAllow;
	}

	// Property accessors

	public Integer getTkClId() {
		return this.tkClId;
	}

	public void setTkClId(Integer tkClId) {
		this.tkClId = tkClId;
	}

	public String getTkClName() {
		return this.tkClName;
	}

	public void setTkClName(String tkClName) {
		this.tkClName = tkClName;
	}

	public Integer getTkClTime() {
		return this.tkClTime;
	}

	public void setTkClTime(Integer tkClTime) {
		this.tkClTime = tkClTime;
	}

	public Timestamp getValidBtime() {
		return this.validBtime;
	}

	public void setValidBtime(Timestamp validBtime) {
		this.validBtime = validBtime;
	}

	public Timestamp getValidEtime() {
		return this.validEtime;
	}

	public void setValidEtime(Timestamp validEtime) {
		this.validEtime = validEtime;
	}

	public Integer getTkClPf() {
		return this.tkClPf;
	}

	public void setTkClPf(Integer tkClPf) {
		this.tkClPf = tkClPf;
	}

	public Integer getAllowSeePaper() {
		return this.allowSeePaper;
	}

	public void setAllowSeePaper(Integer allowSeePaper) {
		this.allowSeePaper = allowSeePaper;
	}

	public Integer getIsSavePaper() {
		return this.isSavePaper;
	}

	public void setIsSavePaper(Integer isSavePaper) {
		this.isSavePaper = isSavePaper;
	}

	public Integer getMinKsNum() {
		return this.minKsNum;
	}

	public void setMinKsNum(Integer minKsNum) {
		this.minKsNum = minKsNum;
	}

	public Integer getMaxKsNum() {
		return this.maxKsNum;
	}

	public void setMaxKsNum(Integer maxKsNum) {
		this.maxKsNum = maxKsNum;
	}

	public Integer getIsOrder() {
		return this.isOrder;
	}

	public void setIsOrder(Integer isOrder) {
		this.isOrder = isOrder;
	}

	public Integer getMoveOutTimes() {
		return this.moveOutTimes;
	}

	public void setMoveOutTimes(Integer moveOutTimes) {
		this.moveOutTimes = moveOutTimes;
	}

	public Integer getTkClType() {
		return this.tkClType;
	}

	public void setTkClType(Integer tkClType) {
		this.tkClType = tkClType;
	}

	public Integer getIsAllow() {
		return this.isAllow;
	}

	public void setIsAllow(Integer isAllow) {
		this.isAllow = isAllow;
	}

}