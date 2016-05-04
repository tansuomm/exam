package org.yohta.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.yohta.dao.IClerkClDao;
import org.yohta.vo.ClerkCl;

public class ClerkClDaoImpl extends HibernateDaoSupport implements IClerkClDao {
	/**
	 * 查看考生所能考试的试卷
	 */
	@Override
	public List<ClerkCl> findClerkClByClerkId(int clerkId) {
		List<ClerkCl> list = (List<ClerkCl>) this.getHibernateTemplate().find("From ClerkCl where clerkId = ?",new Object[]{clerkId} );
		return list;
	}

}
