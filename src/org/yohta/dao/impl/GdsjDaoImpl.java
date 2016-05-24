package org.yohta.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.yohta.dao.IGdsjDao;
import org.yohta.vo.Gdsj;

public class GdsjDaoImpl extends HibernateDaoSupport implements IGdsjDao {
	/**
	 * 增加试卷返回id
	 */
	@Override
	public int addGdsj(Gdsj gdsj) {
		int id = (int) this.getHibernateTemplate().save(gdsj);
		return id;
	}
	/**
	 * 根据试卷id得到题目(android)
	 */
	@Override
	public List<Gdsj> getTmByTkclId(int tkclId,int tmTxId) {
		List<Gdsj> list = (List<Gdsj>) this.getHibernateTemplate().find("From Gdsj where tkClId = ? and tmTxId = ? order by gdsjId asc",new Object[]{tkclId,tmTxId});
		return list;
	}
	/**
	 * 根据试卷id得到题目
	 */
	@Override
	public List<Gdsj> findByTkclId(int tkClId) {
		List<Gdsj> list = (List<Gdsj>) this.getHibernateTemplate().find("From Gdsj where tkClId = "+tkClId);
		return list;
	}
}
