package org.yohta.service;

import org.yohta.vo.UserRight;

public interface IUserRightService {
	//列表
	public String findAllUserRight();
	
	//更新前查找用户
	public String updatePre();
	public String update(UserRight userRight);
	
	public String delete(int userRightId);
}
