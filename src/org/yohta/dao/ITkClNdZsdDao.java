package org.yohta.dao;

import java.util.List;

import org.yohta.vo.TkClNdzsd;

public interface ITkClNdZsdDao {

	/**
	 * 插入出题策略
	 * @param tkClNdzsd
	 * @return
	 */
	public int addTkClNdzsd(TkClNdzsd tkClNdzsd);
	
	/**
	 * 根据考试Id得到出题策略的集合
	 * @param tkclId  考试Id
	 * @return
	 */
	public List<TkClNdzsd> findTkClNdzsdsByTkclId(int tkclId);
}
