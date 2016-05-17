package org.yohta.dao;

import java.util.List;

import org.yohta.vo.Right;

public interface IRightDao {
	public Right findById(int RightId);
	public List<Right> findAll();
	//添加
	public boolean add(Right Right);
	//删除
	public boolean delete(int RightId);
	//修改
	public boolean update(Right Right);
}
