package org.yohta.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.yohta.dao.IUserDao;
import org.yohta.vo.User;

public class UserDaoImpl extends HibernateDaoSupport implements IUserDao {

	@Override
	public boolean findUserByNameAndPwd(String name, String pwd) {
		@SuppressWarnings("unchecked")
		List<User> list= (List<User>) this.getHibernateTemplate().find("From User where userName=? and userPwd = ?", new Object[]{name,pwd});
		if(list.size()>0){
			return true;
		}else{
			return false;
		}
		
	}
}
