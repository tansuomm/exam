package org.yohta.service.impl;

import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.yohta.dao.ITkclDao;
import org.yohta.service.IClerkKscjService;
import org.yohta.vo.TkCl;

public class ClerkKscjServiceImpl implements IClerkKscjService {
	/**
	 * 以考试科目
	 */
	@Override
	public String findHasTkClByEtime() {
		List<TkCl> list = tkclDao.findHasTkClByEtime();
		ServletActionContext.getRequest().setAttribute("hasTkcl", list);
		return "list";
	}
	
	private ITkclDao tkclDao;
	public void setTkclDao(ITkclDao tkclDao) {
		this.tkclDao = tkclDao;
	}
	
}
