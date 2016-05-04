package org.yohta.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.yohta.dao.IExamTkjDao;
import org.yohta.vo.Tkj;

public class ExamTkjDaoImpl extends HibernateDaoSupport implements IExamTkjDao {

	@Override
	public List<Tkj> findAll() {
		List<Tkj> list = new ArrayList<Tkj>();
		list = (List<Tkj>) this.getHibernateTemplate().find("From Tkj");
		//System.out.println(list.get(0).getTkjNme());
		return list;
		
	}

}
