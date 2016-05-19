package org.yohta.dao.impl;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.yohta.dao.IClerkGdksTmDao;
import org.yohta.vo.ClerkGdksTm;

abstract class ClerkGdksTmDaoImpl extends HibernateDaoSupport implements IClerkGdksTmDao {

	@Override
	public boolean add(ClerkGdksTm clerkGdksTm) {
		this.getHibernateTemplate().save(clerkGdksTm);
		return true;
	}

}
