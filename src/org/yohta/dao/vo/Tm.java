package org.yohta.vo;

import java.util.Date;

/**
 * Tm entity. @author MyEclipse Persistence Tools
 */

public class Tm implements java.io.Serializable {

	// Fields

	private Integer tmId;
	private Tk tk;
	private String tmName;
	private Integer tmType;
	private Integer tmScore;
	private Integer tmNd;
	private String tmZsd;
	private String tmXuanxiang;
	private Integer tmXuanxiangNum;
	private String tmDa;
	private Date tmCreateTime;
	private String tmCreateName;

	// Constructors

	/** default constructor */
	public Tm() {
	}

	/** full constructor */
	public Tm(Tk tk, String tmName, Integer tmType, Integer tmScore,
			Integer tmNd, String tmZsh, String tmXuanxiang,
			Integer tmXuanxiangNum, String tmDa, Date tmCreateTime,
			String tmCreateName) {
		this.tk = tk;
		this.tmName = tmName;
		this.tmType = tmType;
		this.tmScore = tmScore;
		this.tmNd = tmNd;
		this.tmZsd = tmZsd;
		this.tmXuanxiang = tmXuanxiang;
		this.tmXuanxiangNum = tmXuanxiangNum;
		this.tmDa = tmDa;
		this.tmCreateTime = tmCreateTime;
		this.tmCreateName = tmCreateName;
	}

	// Property accessors

	public Integer getTmId() {
		return this.tmId;
	}

	public void setTmId(Integer tmId) {
		this.tmId = tmId;
	}

	public Tk getTk() {
		return this.tk;
	}

	public void setTk(Tk tk) {
		this.tk = tk;
	}

	public String getTmName() {
		return this.tmName;
	}

	public void setTmName(String tmName) {
		this.tmName = tmName;
	}

	public Integer getTmType() {
		return this.tmType;
	}

	public void setTmType(Integer tmType) {
		this.tmType = tmType;
	}

	public Integer getTmScore() {
		return this.tmScore;
	}

	public void setTmScore(Integer tmScore) {
		this.tmScore = tmScore;
	}

	public Integer getTmNd() {
		return this.tmNd;
	}

	public void setTmNd(Integer tmNd) {
		this.tmNd = tmNd;
	}

	public String getTmZsd() {
		return this.tmZsd;
	}

	public void setTmZsd(String tmZsd) {
		this.tmZsd = tmZsd;
	}

	public String getTmXuanxiang() {
		return this.tmXuanxiang;
	}

	public void setTmXuanxiang(String tmXuanxiang) {
		this.tmXuanxiang = tmXuanxiang;
	}

	public Integer getTmXuanxiangNum() {
		return this.tmXuanxiangNum;
	}

	public void setTmXuanxiangNum(Integer tmXuanxiangNum) {
		this.tmXuanxiangNum = tmXuanxiangNum;
	}

	public String getTmDa() {
		return this.tmDa;
	}

	public void setTmDa(String tmDa) {
		this.tmDa = tmDa;
	}

	public Date getTmCreateTime() {
		return this.tmCreateTime;
	}

	public void setTmCreateTime(Date tmCreateTime) {
		this.tmCreateTime = tmCreateTime;
	}

	public String getTmCreateName() {
		return this.tmCreateName;
	}

	public void setTmCreateName(String tmCreateName) {
		this.tmCreateName = tmCreateName;
	}

}