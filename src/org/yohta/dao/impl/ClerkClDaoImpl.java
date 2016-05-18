package org.yohta.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.yohta.dao.IClerkClDao;
import org.yohta.vo.ClerkCl;
import org.yohta.vo.Organ;

public class ClerkClDaoImpl extends HibernateDaoSupport implements IClerkClDao {
	/**
	 * 查看班级所能考试的试卷
	 */
	@Override
	public List<ClerkCl> findClerkClByOrganId(int organId) {
		List<ClerkCl> list = (List<ClerkCl>) this.getHibernateTemplate().find("From ClerkCl clerkCl where clerkCl.organId = ?",new Object[]{organId} );
		return list;
	}

	/**
	 * 查看本次试卷的所有考生考试列表
	 */
	@Override
	public List<ClerkCl> findClerkClByTkclId(int tkclId) {
		List<ClerkCl> list = (List<ClerkCl>) this.getHibernateTemplate().find("From ClerkCl clerkCl where clerkCl.tkClId = ? ", new Object[]{tkclId});
		return list;
	}

	@Override
	public boolean save(ClerkCl clerkCl) {
		this.getHibernateTemplate().save(clerkCl);
		return true;
	}

	
}
	