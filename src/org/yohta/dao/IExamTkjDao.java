package org.yohta.dao;

import java.util.List;

import org.yohta.vo.Tkj;

public interface IExamTkjDao {
	public Tkj findById(int tkjId);
	public List<Tkj> findAll();
	//添加题库集
	public boolean add(Tkj tkj);
	//删除题库集
	public boolean delete(int tkjId);
	//修改题库集
	public boolean update(Tkj tkj);
}
