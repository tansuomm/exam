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
	/**
	 * 添加题库集
	 */
	@Override
	public String add(Tkj tkj) {
		String str = "input";
		if(tkjDao.add(tkj)){
			str = "add";
		}
		return str;
	}

	/**
	 * 更新前先找到对应的tkj
	 */
	@Override
	public String updatePre(int tkjId) {
		Tkj tkj = new Tkj();
		tkj = tkjDao.findById(tkjId);
		ServletActionContext.getRequest().setAttribute("tkj", tkj);
		return "updatePre";
	}

	/**
	 * 更新tkj
	 */
	@Override
	public String update(Tkj tkj) {
		String str = "input";
		if (tkjDao.update(tkj)) {
			str = "update";
		}
		return str;
	}
	/**
	 * 删除题库集
	 */
	@Override
	public String remove(int tkjId) {
		String str = "input";
		if(tkjDao.delete(tkjId)){
			str ="delete";
		}
		return str;
	}

	// 注入
	private IExamTkjDao tkjDao;

	public void setTkjDao(IExamTkjDao tkjDao) {
		this.tkjDao = tkjDao;
	}
}
