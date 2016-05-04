package org.yohta.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.yohta.dao.IClerkClDao;
import org.yohta.dao.ITkclDao;
import org.yohta.service.ITkclService;
import org.yohta.vo.ClerkCl;
import org.yohta.vo.TkCl;

public class TkclServiceImpl implements ITkclService {
	/**
	 * 根据考生的id查看考生能考试的试卷
	 */
	@Override
	public List<TkCl> findTkClByClerkId(int clerkId) {
		List<ClerkCl>  clist= clerkClDao.findClerkClByClerkId(clerkId);
		List<TkCl> tkclList = new ArrayList<TkCl>();
		for(ClerkCl clerkCl : clist){
			//遍历所能考试的试卷Id
			int tkclID = clerkCl.getTkClId();
			TkCl tkcl = tkclDao.findTkClByClerkId(tkclID);
			tkclList.add(tkcl);
		}
		return tkclList;
	}
	private ITkclDao tkclDao;
	private IClerkClDao clerkClDao;
	public void setClerkClDao(IClerkClDao clerkClDao) {
		this.clerkClDao = clerkClDao;
	}

	public void setTkclDao(ITkclDao tkclDao) {
		this.tkclDao = tkclDao;
	}
	
}
