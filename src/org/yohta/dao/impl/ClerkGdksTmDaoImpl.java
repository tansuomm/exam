package org.yohta.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.yohta.dao.IClerkGdksTmDao;
import org.yohta.vo.ClerkGdksTm;

public class ClerkGdksTmDaoImpl extends HibernateDaoSupport implements IClerkGdksTmDao {

	@Override
	public boolean add(ClerkGdksTm clerkGdksTm) {
		this.getHibernateTemplate().save(clerkGdksTm);
		return true;
	}
	/**
	 * 根据考试成绩id查看答题情况
	 */
	@Override
	public List<ClerkGdksTm> findListByClerkKscjId(int clerkKscjId) {
		List<ClerkGdksTm> list = (List<ClerkGdksTm>) this.getHibernateTemplate().find("From ClerkGdksTm where clerkKscjId = "+clerkKscjId);
		return list;
	}
	@Override
	public boolean update(int clerkKscjId, int gdsjId, float tmWddf) {
		String hql = "update ClerkGdksTm set tmWddf = "+tmWddf+" where clerkKscjId = "+clerkKscjId+" and gdsjId = "+gdsjId;
		Query query = this.getSessionFactory().getCurrentSession().createQuery(hql);
		query.executeUpdate();
		return true;
	}

}
