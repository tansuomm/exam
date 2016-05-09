package org.yohta.vo;

import java.sql.Timestamp;

/**
 * ClerkKscj entity. @author MyEclipse Persistence Tools
 */

public class ClerkKscj implements java.io.Serializable {

	// Fields

	private Integer clerkKscjId;
	private Integer clerkId;
	private Integer tkClId;
	private Integer clerkKsStatus;
	private Timestamp clerkKsBtime;
	private Timestamp clerkKsEtime;
	private Float cj;
	private Float clerkXzdf;
	private Float clerkWddf;
	private Integer clerkWdpf;
	private Integer ksTime;
	private String clerkPj;

	// Constructors

	/** default constructor */
	public ClerkKscj() {
	}

	/** full constructor */
	public ClerkKscj(Integer clerkId, Integer tkClId, Integer clerkKsStatus,
			Timestamp clerkKsBtime, Timestamp clerkKsEtime, Float cj,
			Float clerkXzdf, Float clerkWddf, Integer clerkWdpf,
			Integer ksTime, String clerkPj) {
		this.clerkId = clerkId;
		this.tkClId = tkClId;
		this.clerkKsStatus = clerkKsStatus;
		this.clerkKsBtime = clerkKsBtime;
		this.clerkKsEtime = clerkKsEtime;
		this.cj = cj;
		this.clerkXzdf = clerkXzdf;
		this.clerkWddf = clerkWddf;
		this.clerkWdpf = clerkWdpf;
		this.ksTime = ksTime;
		this.clerkPj = clerkPj;
	}

	// Property accessors

	public Integer getClerkKscjId() {
		return this.clerkKscjId;
	}

	public void setClerkKscjId(Integer clerkKscjId) {
		this.clerkKscjId = clerkKscjId;
	}

	public Integer getClerkId() {
		return this.clerkId;
	}

	public void setClerkId(Integer clerkId) {
		this.clerkId = clerkId;
	}

	public Integer getTkClId() {
		return this.tkClId;
	}

	public void setTkClId(Integer tkClId) {
		this.tkClId = tkClId;
	}

	public Integer getClerkKsStatus() {
		return this.clerkKsStatus;
	}

	public void setClerkKsStatus(Integer clerkKsStatus) {
		this.clerkKsStatus = clerkKsStatus;
	}

	public Timestamp getClerkKsBtime() {
		return this.clerkKsBtime;
	}

	public void setClerkKsBtime(Timestamp clerkKsBtime) {
		this.clerkKsBtime = clerkKsBtime;
	}

	public Timestamp getClerkKsEtime() {
		return this.clerkKsEtime;
	}

	public void setClerkKsEtime(Timestamp clerkKsEtime) {
		this.clerkKsEtime = clerkKsEtime;
	}

	public Float getCj() {
		return this.cj;
	}

	public void setCj(Float cj) {
		this.cj = cj;
	}

	public Float getClerkXzdf() {
		return this.clerkXzdf;
	}

	public void setClerkXzdf(Float clerkXzdf) {
		this.clerkXzdf = clerkXzdf;
	}

	public Float getClerkWddf() {
		return this.clerkWddf;
	}

	public void setClerkWddf(Float clerkWddf) {
		this.clerkWddf = clerkWddf;
	}

	public Integer getClerkWdpf() {
		return this.clerkWdpf;
	}

	public void setClerkWdpf(Integer clerkWdpf) {
		this.clerkWdpf = clerkWdpf;
	}

	public Integer getKsTime() {
		return this.ksTime;
	}

	public void setKsTime(Integer ksTime) {
		this.ksTime = ksTime;
	}

	public String getClerkPj() {
		return this.clerkPj;
	}

	public void setClerkPj(String clerkPj) {
		this.clerkPj = clerkPj;
	}

}