package org.yohta.dao;

public interface IUserDao {
	//更具用户名密码查找用户
	public boolean findUserByNameAndPwd(String name,String pwd);
}
