package org.yohta.vo;

/**
 * ClerkGdksTm entity. @author MyEclipse Persistence Tools
 */

public class ClerkGdksTm implements java.io.Serializable {

	// Fields

	private Integer clerkAnswerId;
	private Integer gdsjId;
	private Integer clerkKscjId;
	private String clerkTmDa;
	private Float tmWddf;

	// Constructors

	/** default constructor */
	public ClerkGdksTm() {
	}

	/** full constructor */
	public ClerkGdksTm(Integer gdsjId, Integer clerkKscjId, String clerkTmDa,
			Float tmWddf) {
		this.gdsjId = gdsjId;
		this.clerkKscjId = clerkKscjId;
		this.clerkTmDa = clerkTmDa;
		this.tmWddf = tmWddf;
	}

	// Property accessors

	public Integer getClerkAnswerId() {
		return this.clerkAnswerId;
	}

	public void setClerkAnswerId(Integer clerkAnswerId) {
		this.clerkAnswerId = clerkAnswerId;
	}

	public Integer getGdsjId() {
		return this.gdsjId;
	}

	public void setGdsjId(Integer gdsjId) {
		this.gdsjId = gdsjId;
	}

	public Integer getClerkKscjId() {
		return this.clerkKscjId;
	}

	public void setClerkKscjId(Integer clerkKscjId) {
		this.clerkKscjId = clerkKscjId;
	}

	public String getClerkTmDa() {
		return this.clerkTmDa;
	}

	public void setClerkTmDa(String clerkTmDa) {
		this.clerkTmDa = clerkTmDa;
	}

	public Float getTmWddf() {
		return this.tmWddf;
	}

	public void setTmWddf(Float tmWddf) {
		this.tmWddf = tmWddf;
	}

}