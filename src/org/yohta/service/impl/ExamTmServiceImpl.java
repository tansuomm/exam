package org.yohta.service.impl;

import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.yohta.dao.IExamTkDao;
import org.yohta.dao.IExamTkjDao;
import org.yohta.dao.IExamTmDao;
import org.yohta.service.IExamTmService;
import org.yohta.utils.PageResult;
import org.yohta.vo.Tk;
import org.yohta.vo.Tkj;
import org.yohta.vo.Tm;

public class ExamTmServiceImpl implements IExamTmService {
	/**
	 * 添加题目前查找对应的题库和题库集
	 */
	@Override
	public String addTmPre() {
		String status = "input";
		try {
			
			List<Tk> list1 = tkDao.findAllTk();
			List<Tkj> list = tkjDao.findAll();
			ServletActionContext.getRequest().setAttribute("tkjList", list);;
			ServletActionContext.getRequest().setAttribute("tkList", list1);
		} catch (Exception e) {
			e.printStackTrace();
		}

		status = "addPre";
		return status;
	}

	@Override
	public String addTm(Tm tm) {
		String resultStr = "input";
		if (tmDao.addTm(tm)) {
			resultStr = "add";
		}

		return resultStr;
	}

	/**
	 * 删除题目
	 */
	@Override
	public String delete(int tmId) {
		String resultStr = "input";
		if (tmDao.deleteTm(tmId)) {
			resultStr = "delete";
		}
		return resultStr;
	}

	/**
	 * 修改题目前
	 */
	@Override
	public String updateTmPre(int tmId) {
		Tm tm = new Tm();
		tm = tmDao.findByTmId(tmId);
		ServletActionContext.getRequest().setAttribute("tm", tm);
		// 回写到修改题目表单里面。。。
		List<Tkj> list = tkjDao.findAll();
		ServletActionContext.getRequest().setAttribute("tkjList", list);
		int tkjId = tm.getTk().getTkj().getTkjId();
		List<Tk> list1 = tkDao.findTkByTkjId(tkjId);
		ServletActionContext.getRequest().setAttribute("tkList", list1);

		return "updatePre";
	}

	/**
	 * 修改题目
	 */
	@Override
	public String update(Tm tm) {
		String resultStr = "input";
		if (tmDao.updateTm(tm)) {
			resultStr = "update";
		}
		return resultStr;
	}

	/**
	 * 查出所有题目列表
	 */
/*	@Override
	public String list() {
		List<Tm> list = tmDao.list();
		ServletActionContext.getRequest().setAttribute("list", list);
		return "list";
	}*/
	/**
	 * 分页查询
	 */
	@Override
	public String queryByPage(PageResult pageResult) {
		String hql = "From Tm";
		tmDao.queryByPage(pageResult, hql);
		//ServletActionContext.getRequest().setAttribute("list", list);
		return "list";
	}
	private IExamTkjDao tkjDao;
	private IExamTkDao tkDao;
	private IExamTmDao tmDao;

	public void setTmDao(IExamTmDao tmDao) {
		this.tmDao = tmDao;
	}

	public void setTkjDao(IExamTkjDao tkjDao) {
		this.tkjDao = tkjDao;
	}

	public void setTkDao(IExamTkDao tkDao) {
		this.tkDao = tkDao;
	}


}
