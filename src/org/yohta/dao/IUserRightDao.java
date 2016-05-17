package org.yohta.dao;

import java.util.List;

import org.yohta.vo.UserRight;

public interface IUserRightDao {
	
	public List<UserRight> findAll();
	
	//修改
	public boolean update(UserRight userRight);
	//查询用户所拥有的大类权限
	public List<UserRight> findBigRightId(int userId);
	//回收权限
	public boolean delete(int userRightId);
}
