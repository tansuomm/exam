package org.yohta.action;

import org.yohta.service.IClerkKscjService;
import org.yohta.vo.ClerkKscj;

public class ClerkKscjAction extends SuperAction<ClerkKscj> {
	
	public String list()throws Exception{
		//已考试科目列表，时间
		return kscjService.findHasTkClByEtime();	
	}
	public String tkclList()throws Exception{
		return "tkclList";
	}
	public String markPre()throws Exception{
		return "markPre";
	}
	public String mark()throws Exception{
		return "tkclList";
	}
	public String analysePre()throws Exception{
		return "analysePre";
	}
	public String analyse()throws Exception{
		return null;
	}
	
	IClerkKscjService kscjService;
	public void setKscjService(IClerkKscjService kscjService) {
		this.kscjService = kscjService;
	}
	
	
}
