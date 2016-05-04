package org.yohta.dao;

import java.util.List;

import org.yohta.vo.Tm;

public interface IExamTmDao {
	//增加题目
	public boolean addTm(Tm tm);
	//删除题目
	public boolean deleteTm(int tmId);
	//修改题目
	public boolean updateTm(Tm tm);
	//查找单个byid
	public Tm findByTmId(int tmId);
	//查找所有题目
	public List<Tm> list();
}
