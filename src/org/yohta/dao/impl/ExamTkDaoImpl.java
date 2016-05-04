package org.yohta.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.yohta.dao.IExamTkDao;
import org.yohta.vo.Tk;

public class ExamTkDaoImpl extends HibernateDaoSupport implements IExamTkDao {
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Tk> findAllTk() {
		List<Tk> list = new ArrayList<Tk>();
		list = (List<Tk>) this.getHibernateTemplate().find("From Tk");
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Tk> findTkByTkjId(int tkjId) {
		List<Tk> list = new ArrayList<Tk>();
		list = (List<Tk>) this.getHibernateTemplate().find("Select tk from Tk tk where tk.tkj.tkjId=?", new Object[]{tkjId});
		System.out.println(list);
		return list;
	}

}
