package org.yohta.vo;

/**
 * Gdsj entity. @author MyEclipse Persistence Tools
 */

public class Gdsj implements java.io.Serializable {

	// Fields

	private Integer gdsjId;
	private Integer tkClId;
	private Integer tkTkjId;
	private Integer tkLxId;
	private Integer tmId;
	private Integer tmTxId;
	private String tmNr;
	private Integer tmFs;
	private Integer tmNd;
	private String tmZsd;
	private String tmXuanxiang;
	private Integer tmXuanxiangnum;
	private String tmDa;

	// Constructors

	/** default constructor */
	public Gdsj() {
	}

	/** full constructor */
	public Gdsj(Integer tkClId, Integer tkTkjId, Integer tkLxId, Integer tmId,
			Integer tmTxId, String tmNr, Integer tmFs, Integer tmNd,
			String tmZsd, String tmXuanxiang, Integer tmXuanxiangnum,
			String tmDa) {
		this.tkClId = tkClId;
		this.tkTkjId = tkTkjId;
		this.tkLxId = tkLxId;
		this.tmId = tmId;
		this.tmTxId = tmTxId;
		this.tmNr = tmNr;
		this.tmFs = tmFs;
		this.tmNd = tmNd;
		this.tmZsd = tmZsd;
		this.tmXuanxiang = tmXuanxiang;
		this.tmXuanxiangnum = tmXuanxiangnum;
		this.tmDa = tmDa;
	}

	// Property accessors

	public Integer getGdsjId() {
		return this.gdsjId;
	}

	public void setGdsjId(Integer gdsjId) {
		this.gdsjId = gdsjId;
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

	public Integer getTmId() {
		return this.tmId;
	}

	public void setTmId(Integer tmId) {
		this.tmId = tmId;
	}

	public Integer getTmTxId() {
		return this.tmTxId;
	}

	public void setTmTxId(Integer tmTxId) {
		this.tmTxId = tmTxId;
	}

	public String getTmNr() {
		return this.tmNr;
	}

	public void setTmNr(String tmNr) {
		this.tmNr = tmNr;
	}

	public Integer getTmFs() {
		return this.tmFs;
	}

	public void setTmFs(Integer tmFs) {
		this.tmFs = tmFs;
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

	public Integer getTmXuanxiangnum() {
		return this.tmXuanxiangnum;
	}

	public void setTmXuanxiangnum(Integer tmXuanxiangnum) {
		this.tmXuanxiangnum = tmXuanxiangnum;
	}

	public String getTmDa() {
		return this.tmDa;
	}

	public void setTmDa(String tmDa) {
		this.tmDa = tmDa;
	}

}