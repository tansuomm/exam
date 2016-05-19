package org.yohta.service.impl;

import java.util.List;

import org.yohta.dao.IClerkDao;
import org.yohta.service.IClerkService;
import org.yohta.vo.Clerk;

public class ClerkServiceImpl implements IClerkService {

	@Override
	public List<Clerk> list() {
		return clerkDao.findAll();
	}
	public void setClerkDao(IClerkDao clerkDao) {
		this.clerkDao = clerkDao;
	}
	private IClerkDao clerkDao;
	@Override
	public String delete(int clerkId) {
		String str = "input";
		if(clerkDao.delete(clerkId)){
			str="delete";
		}
		return str;
	}
	@Override
	public String add(Clerk clerk) {
		String str="input";
		if(clerkDao.add(clerk)){
			str ="add";
		}
		return str;
	}
	@Override
	public String modify(Clerk clerk) {
		String str = "input";
		if(clerkDao.update(clerk)){
			str = "update";
		}
		return str;
	}
	
}
