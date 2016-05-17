package org.yohta.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.yohta.dao.IUserRightDao;
import org.yohta.vo.UserRight;

public class UserRightDaoImpl extends HibernateDaoSupport implements IUserRightDao {
	/**
	 * 查找所有
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<UserRight> findAll() {
		List<UserRight> list = new ArrayList<UserRight>();
		list = (List<UserRight>) this.getHibernateTemplate().find("From UserRight ");
		return list;
		
	}
	
	/**
	 * 增加用户所拥有的权限，更新则会全部更新
	 */
	@Override
	public boolean update(UserRight userRight) {
		Session session = this.getSessionFactory().openSession();
		Transaction tk = session.beginTransaction();
		session.save(userRight);
		tk.commit();
		
		session.flush();
		session.clear();
		
		/*this.getHibernateTemplate().save(userRight);
		this.getHibernateTemplate().flush();*/
		return true;
	}

	@Override
	public List<UserRight> findBigRightId(int userId) {
		Query query = this.getSessionFactory().getCurrentSession().createQuery("From UserRight ur where ur.right.parentId = 0 and ur.user.userId = "+userId);
		
		List<UserRight> list = query.list();
		return list;
	}
	/**
	 * 收回权限
	 */
	@Override
	public boolean delete(int userRightId) {
		UserRight ur = new UserRight();
		ur.setUserRightId(userRightId);
		this.getHibernateTemplate().delete(ur);
		return true;
	}

}
