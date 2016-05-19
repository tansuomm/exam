package org.yohta.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.yohta.dao.IOrganDao;
import org.yohta.vo.Organ;

public class OrganDaoImpl extends HibernateDaoSupport implements IOrganDao {
/**
 * 所有班级
 */
	@Override
	public List<Organ> findAll() {
		List<Organ> list = (List<Organ>) this.getHibernateTemplate().find("From Organ");
		return list;
	}
/**
 * by id
 */
@Override
public Organ findById(int organId) {
	Organ organ = this.getHibernateTemplate().load(Organ.class, organId);
	return organ;
}
/**
 * 没有被分配考试的班级
 */
@Override
public List<Organ> findByNoId(List<Integer> listi) {
	String hql = "From Organ organ where 1 = 1";

	if(listi.size()>0){
		for(int i = 0;i<listi.size();i++){
			hql += "and organ.organId <>"+listi.get(i);
		}
	}
	List<Organ> list = (List<Organ>) this.getHibernateTemplate().find(hql);
	return list;
}
@Override
public boolean add(Organ organ) {
	this.getHibernateTemplate().save(organ);
	return true;
}
@Override
public boolean delete(int organId) {
	Organ organ = new Organ();
	organ.setOrganId(organId);
	this.getHibernateTemplate().delete(organ);
	return true;
}
@Override
public boolean update(Organ organ) {
	this.getHibernateTemplate().update(organ);
	return true;
}

}
