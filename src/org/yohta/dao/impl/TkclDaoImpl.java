package org.yohta.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.yohta.dao.ITkclDao;
import org.yohta.vo.ClerkCl;
import org.yohta.vo.TkCl;

public class TkclDaoImpl extends HibernateDaoSupport implements ITkclDao{
	/**
	 * 增加考试，返回试卷id
	 */
	@Override
	public int addTkCl(TkCl tkcl) {
		int id = (int) this.getHibernateTemplate().save(tkcl);
		return id;
	}
	/**
	 * 查看考试试卷根据考试id
	 */
	@Override
	public TkCl findTkClByClerkId(int tkclId) {
		List<TkCl> list = new ArrayList<TkCl>();
		list = (List<TkCl>) this.getHibernateTemplate().find("From TkCl where tkClId = ?", new Object[]{tkclId});
		return list.get(0);
	}
	/**
	 * 查找所有考试
	 */
	@Override
	public List<TkCl> findAllTkcl() {
		List<TkCl> list = (List<TkCl>) this.getHibernateTemplate().find("From TkCl");
		return list;
	}

}
