package org.yohta.dao.impl;

import java.util.List;

import org.hibernate.Query;
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
	/**
	 * 考试判卷列表
	 */
	@Override
	public List<ClerkKscj> findByTkclId(int tkclId) {
		List<ClerkKscj> list = (List<ClerkKscj>) this.getHibernateTemplate().find("From ClerkKscj where clerkWdpf = 1 and tkClId = "+tkclId);
		return list;
	}
	@Override
	public boolean update(int status, float wddf, String clerkPj,int clerkKscjId) {
		String hql = "update ClerkKscj set clerkKsStatus = "+status+",cj =clerkXzdf +"+wddf+", clerkWddf = "+wddf+",clerkPj = '"+clerkPj+"' where clerkKscjId = "+clerkKscjId;
		Query query = this.getSessionFactory().getCurrentSession().createQuery(hql);
		query.executeUpdate();
		return true;
	}
	
}

