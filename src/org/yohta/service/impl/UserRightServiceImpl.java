package org.yohta.service.impl;

import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.yohta.dao.IRightDao;
import org.yohta.dao.IUserDao;
import org.yohta.dao.IUserRightDao;
import org.yohta.service.IUserRightService;
import org.yohta.vo.Right;
import org.yohta.vo.User;
import org.yohta.vo.UserRight;

public class UserRightServiceImpl implements IUserRightService {

	@Override
	public String findAllUserRight() {
		String status = "input";
		List<UserRight> list = userRightDao.findAll();
		ServletActionContext.getRequest().setAttribute("userRightList", list);
		status = "list";
		return status;
	}
	//授权前查找所有用户
	@Override
	public String updatePre() {
		List<User> userList = userDao.findAll();
		ServletActionContext.getRequest().setAttribute("userList", userList);
		List<Right> rightList = rightDao.findAll();
		ServletActionContext.getRequest().setAttribute("rightList", rightList);
		return "updatePre";
	}
	/**
	 * 增加用户权限。。(可能重复)
	 */
	@Override
	public String update(UserRight userRight) {
		String str ="input";
		if(userRightDao.update(userRight)){
			str ="update";
		}
		return str;
	}
	/**
	 * 收回权限
	 */
	@Override
	public String delete(int userRightId) {
		String str = "input";
		if(userRightDao.delete(userRightId)){
			str = "delete";
		}
		return str;
	}
	IUserRightDao userRightDao;
	IUserDao userDao;
	IRightDao rightDao;
	public void setUserRightDao(IUserRightDao userRightDao) {
		this.userRightDao = userRightDao;
	}

	public void setUserDao(IUserDao userDao) {
		this.userDao = userDao;
	}

	public void setRightDao(IRightDao rightDao) {
		this.rightDao = rightDao;
	}
	
	
	
}
