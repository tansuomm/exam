package org.yohta.dao.impl;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.yohta.dao.IClerkKscjDao;
import org.yohta.vo.ClerkKscj;

public class ClerkKscjDaoImpl extends HibernateDaoSupport implements IClerkKscjDao {
	/**
	 * 交卷提交成绩表
	 */
	@Override
	public int insert(ClerkKscj clerkKscj) {
		this.getHibernateTemplate().save(clerkKscj);
		int id = clerkKscj.getClerkKscjId();
		return id;
	}
	
}
