package org.yohta.dao;

import java.util.List;

import org.yohta.vo.Tk;

public interface IExamTkDao {
	//题库id查找题库
	public Tk findById(int tkId);
	//查找所有题库
	public List<Tk> findAllTk();
	//根据tkjId ajax联动题库
	public List<Tk> findTkByTkjId(int tkjId);
	//添加
	public boolean add(Tk tk);
	//删除
	public boolean delete(int tkId);
	//修改
	public boolean update(Tk tk);
}
