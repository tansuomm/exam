package org.yohta.service.impl;

import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.yohta.dao.IRightDao;
import org.yohta.service.IRightService;
import org.yohta.vo.Right;

public class RightServiceImpl implements IRightService {

	@Override
	public String findAllRight() {
		String status = "input";
		List<Right> list = rightDao.findAll();
		ServletActionContext.getRequest().setAttribute("rightList", list);
		status = "list";
		return status;
	}
	/**
	 * 添加权限
	 */
	@Override
	public String add(Right right) {
		String str = "input";
		if(rightDao.add(right)){
			str = "add";
		}
		return str;
	}

	/**
	 * 更新前先找到对应的Right
	 */
	@Override
	public String updatePre(int rightId) {
		Right right = new Right();
		right = rightDao.findById(rightId);
		ServletActionContext.getRequest().setAttribute("right", right);
		return "updatePre";
	}

	/**
	 * 更新Right
	 */
	@Override
	public String update(Right right) {
		String str = "input";
		if (rightDao.update(right)) {
			str = "update";
		}
		return str;
	}
	/**
	 * 删除权限
	 */
	@Override
	public String remove(int rightId) {
		String str = "input";
		if(rightDao.delete(rightId)){
			str ="delete";
		}
		return str;
	}

	// 注入
	private IRightDao rightDao;

	public void setRightDao(IRightDao rightDao) {
		this.rightDao = rightDao;
	}
}
