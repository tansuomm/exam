package org.yohta.action;

import org.yohta.service.IExamTkService;

import com.opensymphony.xwork2.ActionSupport;

public class TkAction extends ActionSupport {
	public String findTkByTkjId()throws Exception{
		System.out.println(tkjId);
		return tkService.findTkByTkjId(tkjId);
	}
	public int getTkjId() {
		return tkjId;
	}
	public void setTkjId(int tkjId) {
		this.tkjId = tkjId;
	}
	private int tkjId;
	private IExamTkService tkService;
	public void setTkService(IExamTkService tkService) {
		this.tkService = tkService;
	}
}
