package org.yohta.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.yohta.dao.ITkClNdZsdDao;
import org.yohta.vo.TkClNdzsd;

public class TkClNdZsdDaoImpl extends HibernateDaoSupport implements ITkClNdZsdDao {
	/**
	 * 增加出题策略
	 */
	@Override
	public int addTkClNdzsd(TkClNdzsd tkClNdzsd) {
		this.getHibernateTemplate().save(tkClNdzsd);		
		return tkClNdzsd.getClId();
	}
	/**
	 * 根据考试id查找出题针对此次考试的出题策略
	 */
	@Override
	public List<TkClNdzsd> findTkClNdzsdsByTkclId(int tkclId) {
		List<TkClNdzsd> list = (List<TkClNdzsd>) this.getHibernateTemplate().find("From TkClNdzsd where tkClId = ? ",new Object[]{tkclId});
		return list;
	}

}
