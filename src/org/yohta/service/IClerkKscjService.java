package org.yohta.service;



public interface IClerkKscjService {
	//小于当前时间以考试科目
	public String findHasTkClByEtime();
	//本门课程判卷列表
	public String findByTkclId(int tkclId);
	//判分前取得答卷信息
	public String markPre(int clerkKscjId,int tkClId);
	//判卷
	public String mark(int clerkKscjId,int[] gdsjIdarr,float[] tmWddfarr);
}
