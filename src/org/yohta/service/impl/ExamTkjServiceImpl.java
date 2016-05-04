package org.yohta.service.impl;

import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.yohta.dao.IExamTkjDao;
import org.yohta.service.IExamTkjService;
import org.yohta.vo.Tkj;

public class ExamTkjServiceImpl implements IExamTkjService {

	@Override
	public String findAllTkj() {
		String status = "input";
		List<Tkj> list = tkjDao.findAll();
		ServletActionContext.getRequest().setAttribute("tkjList", list);
		status = "list";
		return status;
	}

	
	private IExamTkjDao tkjDao;
	public void setTkjDao(IExamTkjDao tkjDao) {
		this.tkjDao = tkjDao;
	}
}
