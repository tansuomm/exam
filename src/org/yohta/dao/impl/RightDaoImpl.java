package org.yohta.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.yohta.dao.IRightDao;
import org.yohta.vo.Right;

public class RightDaoImpl extends HibernateDaoSupport implements IRightDao {
	/**
	 * 查找所有的权限
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Right> findAll() {
		List<Right> list = new ArrayList<Right>();
		list = (List<Right>) this.getHibernateTemplate().find("From Right");
		//System.out.println(list.get(0).getRightNme());
		return list;
		
	}
	/**
	 * 查找权限根据id
	 */
	@Override
	public Right findById(int rightId) {
		Right Right = new Right();
		Right = this.getHibernateTemplate().load(Right.class, rightId);
		return Right;
	}
	/**
	 * 添加权限
	 */
	@Override
	public boolean add(Right right) {
		this.getHibernateTemplate().save(right);
		return true;
	}
	/**
	 * 删除权限
	 */
	@Override
	public boolean delete(int rightId) {
		Right right = new Right();
		right.setRightId(rightId);
		this.getHibernateTemplate().delete(right);
		return true;
	}
	/**
	 * 更新权限
	 */
	@Override
	public boolean update(Right right) {
		this.getHibernateTemplate().update(right);
		return true;
	}

}
