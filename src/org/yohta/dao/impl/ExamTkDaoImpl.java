package org.yohta.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.yohta.dao.IExamTkDao;
import org.yohta.vo.Tk;

public class ExamTkDaoImpl extends HibernateDaoSupport implements IExamTkDao {
	/**
	 * 所有题库列表
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Tk> findAllTk() {
		List<Tk> list = new ArrayList<Tk>();
		list = (List<Tk>) this.getHibernateTemplate().find("From Tk");
		return list;
	}
	/**
	 * 题库集Id找题库
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Tk> findTkByTkjId(int tkjId) {
		List<Tk> list = new ArrayList<Tk>();
		list = (List<Tk>) this.getHibernateTemplate().find("Select tk from Tk tk where tk.tkj.tkjId=?", new Object[]{tkjId});
		//System.out.println(list);
		return list;
	}
	/**
	 * 通过id找tk
	 */
	@Override
	public Tk findById(int tkId) {
		Tk tk = new Tk();
		tk = this.getHibernateTemplate().load(tk.getClass(), tkId);
		return tk;
	}
	/**
	 * 添加题库
	 */
	@Override
	public boolean add(Tk tk) {
		this.getHibernateTemplate().save(tk);
		return true;
	}
	/**
	 * 删除题库
	 */
	@Override
	public boolean delete(int tkId) {
		Tk tk = new Tk();
		tk.setTkId(tkId);
		this.getHibernateTemplate().delete(tk);
		return true;
	}
	/**
	 * 修改题库
	 */
	@Override
	public boolean update(Tk tk) {
		this.getHibernateTemplate().update(tk);
		return true;
	}

}
