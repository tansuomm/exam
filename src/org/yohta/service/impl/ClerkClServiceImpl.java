package org.yohta.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.yohta.dao.IClerkClDao;
import org.yohta.dao.IOrganDao;
import org.yohta.service.IClerkClService;
import org.yohta.vo.ClerkCl;
import org.yohta.vo.Organ;

public class ClerkClServiceImpl implements IClerkClService {
	/**
	 * 更具试卷id查找班级集合对象
	 */
	@Override
	public List<Organ> findOrgansByTkclId(int tkclId) {
		//先查到中间表集合
		//再查到条件为id的Organ集合
		List<ClerkCl> list = clerkClDao.findClerkClByTkclId(tkclId);
		List<Organ> organList = new ArrayList<Organ>();
		for(ClerkCl cl :list){
			Organ organ = organDao.findById(cl.getOrganId());
			organList.add(organ);
		}
		
		return organList;
	}
	
	private IClerkClDao clerkClDao;
	private IOrganDao organDao;
	
	public void setOrganDao(IOrganDao organDao) {
		this.organDao = organDao;
	}

	public void setClerkClDao(IClerkClDao clerkClDao) {
		this.clerkClDao = clerkClDao;
	}

	@Override
	public String addPre(int tkclId, int isAllow) {
		String str = "addPre";
		List<Organ> list = new ArrayList<Organ>();
		if(isAllow ==1){
			//找中间表organId
			List<ClerkCl> cllist = clerkClDao.findClerkClByTkclId(tkclId);
			List<Integer> noOrganId = new ArrayList<Integer>();
			for(ClerkCl cl :cllist){
				//organ中找id不等于cl.getOrganId()的集合
				noOrganId.add(cl.getOrganId());
			}
			list = organDao.findByNoId(noOrganId);
		}
		//发送页面
		ServletActionContext.getRequest().setAttribute("noOrganList", list);
		return str;
	}

	@Override
	public String add(ClerkCl clerkCl) {
		String str = "input";
		if(clerkClDao.save(clerkCl)){
			str = "add";
		}
		return str;
	}

	@Override
	public String delete(ClerkCl clerkCl) {
		String str ="input";
		if(clerkClDao.delete(clerkCl)){
			str ="delete";
		}
		return str;
	}

	
}
