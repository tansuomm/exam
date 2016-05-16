package org.yohta.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.yohta.dao.IExamTkjDao;
import org.yohta.vo.Tkj;

public class ExamTkjDaoImpl extends HibernateDaoSupport implements IExamTkjDao {
	/**
	 * 查找所有的题库集
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Tkj> findAll() {
		List<Tkj> list = new ArrayList<Tkj>();
		list = (List<Tkj>) this.getHibernateTemplate().find("From Tkj");
		//System.out.println(list.get(0).getTkjNme());
		return list;
		
	}
	/**
	 * 查找题库集根据id
	 */
	@Override
	public Tkj findById(int tkjId) {
		Tkj tkj = new Tkj();
		List<Tkj> list = (List<Tkj>) this.getHibernateTemplate().find("From Tkj where tkjId = ?", new Object[]{tkjId});
		tkj = list.get(0);
		return tkj;
	}
	/**
	 * 添加题库集
	 */
	@Override
	public boolean add(Tkj tkj) {
		this.getHibernateTemplate().save(tkj);
		return true;
	}
	/**
	 * 删除题库集
	 */
	@Override
	public boolean delete(int tkjId) {
		Tkj tkj = new Tkj();
		tkj.setTkjId(tkjId);
		this.getHibernateTemplate().delete(tkj);
		return true;
	}
	/**
	 * 更新题库集
	 */
	@Override
	public boolean update(Tkj tkj) {
		this.getHibernateTemplate().update(tkj);
		return true;
	}

}
