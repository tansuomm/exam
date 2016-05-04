package org.yohta.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.yohta.dao.IExamTmDao;
import org.yohta.vo.Tm;

public class ExamTmDaoImpl extends HibernateDaoSupport implements IExamTmDao {
	/**
	 * 添加题目
	 */
	@Override
	public boolean addTm(Tm tm) {
		//System.out.println(tm.toString());
		this.getHibernateTemplate().save(tm);
		return true;
	}
	/**
	 * 删除题目
	 */
	@Override
	public boolean deleteTm(int tmId) {
		Tm tm = new Tm();
		tm.setTmId(tmId);
		this.getHibernateTemplate().delete(tm);
		return true;
	}
	/**
	 * 修改题目
	 */
	@Override
	public boolean updateTm(Tm tm) {
		this.getHibernateTemplate().update(tm);
		return true;
	}
	/**
	 * 根据id查到题目
	 */
	@Override
	public Tm findByTmId(int tmId) {
		Tm tm = this.getHibernateTemplate().load(Tm.class, tmId);
		return tm;
	}
	/**
	 * 查找所有题目
	 */
	@Override
	public List<Tm> list() {
		@SuppressWarnings("unchecked")
		List<Tm> list = (List<Tm>) this.getHibernateTemplate().find("From Tm");
		return list;
	}

}
