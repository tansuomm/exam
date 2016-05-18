package org.yohta.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.yohta.dao.IClerkDao;
import org.yohta.vo.Clerk;

public class ClerkDaoImpl extends HibernateDaoSupport implements IClerkDao {
	/**
	 * 登录
	 */
	@Override
	public Clerk login(Clerk clerk) {
		List<Clerk> list = new ArrayList<Clerk>();
		list =  (List<Clerk>) this.getHibernateTemplate().find("From Clerk c where c.clerkName = ? and c.clerkPwd = ?", new Object[]{clerk.getClerkName(),clerk.getClerkPwd()});
		if(list.size()>0){
			return list.get(0);
		}
		return null;
	}

	@Override
	public Clerk findById(int clerkId) {
		Clerk clerk = this.getHibernateTemplate().load(Clerk.class, clerkId);
		return clerk;
	}

}
