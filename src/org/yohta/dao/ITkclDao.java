package org.yohta.dao;

import java.util.List;

import org.yohta.vo.TkCl;

public interface ITkclDao {
	/**
	 * 添加考试
	 * @param tkcl
	 * @return
	 */
	public int addTkCl(TkCl tkcl);
	/**
	 * 根据考id查看考试信息
	 * @param clerkId
	 * @return
	 */
	public TkCl findTkClByClerkId(int clerkId);
	/**
	 * 查询所有考试列表
	 * @return
	 */
	public List<TkCl> findAllTkcl();
	
}
