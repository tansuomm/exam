package org.yohta.action;

import org.yohta.service.IClerkKscjService;
import org.yohta.utils.PrintString;
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
		//System.out.println(marktkclId+"dd"+gdsjIdarr+"cc"+tmWddfarr);
		//判每个人的答卷
		kscjService.mark(model.getClerkKscjId(), gdsjIdarr, tmWddfarr);
		return kscjService.findByTkclId(marktkclId);
	}
	//判断是否所有考生被判卷完成
	public String ifhasnomark()throws Exception{
		String str = kscjService.ifhasnomark(model.getTkClId());
		PrintString.printStr(str);
		return null;
	}
	//分析前查找及格分和本次考试相关人员
	public String analysePre()throws Exception{
		kscjService.findByTkclId(model.getTkClId());
		return "analysePre";
	}
	//统计分析
	public String analyse()throws Exception{
		return kscjService.analyse(model.getTkClId(), passFs);
	}
	//分析的及格分数
	private int passFs;
	//判分完毕后刷新列表
	private int marktkclId;
	//具体答题情况的题目id
	private int[] gdsjIdarr;
	//具体答题情况得分
	private float[] tmWddfarr;
	public int getMarktkclId() {
		return marktkclId;
	}
	public void setMarktkclId(int marktkclId) {
		this.marktkclId = marktkclId;
	}

	
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
	public int getPassFs() {
		return passFs;
	}
	public void setPassFs(int passFs) {
		this.passFs = passFs;
	}
	
	
}
