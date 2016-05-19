package org.yohta.dao;

import java.util.List;

import org.yohta.vo.Gdsj;

public interface IGdsjDao {
	/**
	 * 添加固定试卷
	 * @param gdsj
	 * @return
	 */
	public int addGdsj(Gdsj gdsj);
	
	/**
	 * 根据试卷Id得到题目
	 * @return
	 * @throws Exception
	 */
	public List<Gdsj> getTmByTkclId(int tkclId,int tmTxId);
}
