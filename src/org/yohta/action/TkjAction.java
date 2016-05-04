package org.yohta.action;

import org.yohta.service.IExamTkjService;

public class TkjAction {
	public String list() throws Exception{
		return tkjService.findAllTkj();
	}
	private IExamTkjService tkjService;
	public void setTkjService(IExamTkjService tkjService) {
		this.tkjService = tkjService;
	}
	
}
