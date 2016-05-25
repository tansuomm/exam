package org.yohta.action;

import org.yohta.service.IClerkKscjService;
import org.yohta.vo.ClerkGdksTm;
import org.yohta.vo.ClerkKscj;

public class ClerkKscjAction extends SuperAction<ClerkKscj> {
	
	public String list()throws Exception{
		//已考试科目列表，时间
		return kscjService.findHasTkClByEtime();	
	}
	public String tkclList()throws Exception{
		//查找本次考试所有人
		return kscjService.findByTkclId(model.getTkClId());
	}
	public String markPre()throws Exception{		
		return kscjService.markPre(clerkGdksTm.getClerkKscjId(),model.getTkClId());
	}
	public String mark()throws Exception{
		System.out.println(model.getClerkKscjId()+"dd"+gdsjIdarr+"cc"+tmWddfarr);
		return tkclList();
	}
	public String analysePre()throws Exception{
		return "analysePre";
	}
	public String analyse()throws Exception{
		return null;
	}
	//具体答题情况的题目id
	private int[] gdsjIdarr;
	//具体答题情况得分
	private float[] tmWddfarr;
	
	public int[] getGdsjIdarr() {
		return gdsjIdarr;
	}
	public void setGdsjIdarr(int[] gdsjIdarr) {
		this.gdsjIdarr = gdsjIdarr;
	}
	public float[] getTmWddfarr() {
		return tmWddfarr;
	}
	public void setTmWddfarr(float[] tmWddfarr) {
		this.tmWddfarr = tmWddfarr;
	}
	private ClerkGdksTm clerkGdksTm;
	private IClerkKscjService kscjService;
	public void setKscjService(IClerkKscjService kscjService) {
		this.kscjService = kscjService;
	}
	public ClerkGdksTm getClerkGdksTm() {
		return clerkGdksTm;
	}
	public void setClerkGdksTm(ClerkGdksTm clerkGdksTm) {
		this.clerkGdksTm = clerkGdksTm;
	}
	
	
}
