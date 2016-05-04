package org.yohta.dao;

import org.yohta.vo.TkCl;

public interface ITkclDao {
	/**
	 * 添加试卷
	 * @param tkcl
	 * @return
	 */
	public int addTkCl(TkCl tkcl);
	/**
	 * 根据id查看试卷信息
	 * @param tkclId
	 * @return
	 */
	public TkCl findTkClByClerkId(int tkclId);
}
