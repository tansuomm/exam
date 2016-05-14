package org.yohta.dao;

import java.util.List;

import org.yohta.vo.User;

public interface IUserDao {
	//更具用户名密码查找用户
	public User findUserByNameAndPwd(String name,String pwd);
	//查找用户返用户id
	public List<User> findAll();
}
