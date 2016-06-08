package org.yohta.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.yohta.dao.IClerkKscjDao;
import org.yohta.vo.Clerk;
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
	@Override
	public int updateKscj(ClerkKscj clerkKscj) {
		this.getHibernateTemplate().update(clerkKscj);
		int id = clerkKscj.getClerkKscjId();
		return id;
	}
	@Override
	public List<ClerkKscj> findClerkKscjsByTkclIdAndClerkId(int tkclId, int clerkId) {
		String hql ="from ClerkKscj where tkClId = "+tkclId+" and clerk.clerkId = "+clerkId;
		List<ClerkKscj> list = (List<ClerkKscj>) this.getHibernateTemplate().find(hql);
		//String sql = "select * from clerk_kscj where tk_cl_id = "+tkclId+" and clerk_id = "+clerkId;
		//Query query = this.getSessionFactory().getCurrentSession().createSQLQuery(sql);
		//List<ClerkKscj> list = query.list();
		
		return list;
	}
	
}

