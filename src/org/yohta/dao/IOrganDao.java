package org.yohta.dao;

import java.util.List;

import org.yohta.vo.Organ;

public interface IOrganDao {
	//所有班级
	public List<Organ> findAll();
	//by id
	public Organ findById(int organId);
	//不等于传来的id
	public List<Organ> findByNoId(List<Integer> list);
	//增加班级
	public boolean add(Organ organ);
	//删
	public boolean delete(int organId);
	//改
	public boolean update(Organ organ);
}
