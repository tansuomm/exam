package org.yohta.service;

import java.util.List;

import org.yohta.vo.ClerkCl;
import org.yohta.vo.Organ;

public interface IClerkClService {
	//业务：根据试卷id从中间表查找班级的对象
	public List<Organ> findOrgansByTkclId(int tkclId);
	////找到tkcl里所有未被赋予考试权限的班级
	public String addPre(int tkclId,int isAllow);
	
	public String add(ClerkCl clerkCl);
	public String delete(ClerkCl clerkCl);
}
