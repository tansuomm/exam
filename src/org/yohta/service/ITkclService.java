package org.yohta.service;

import java.util.List;

import org.yohta.vo.TkCl;

public interface ITkclService {
	/**
	 * 根据考生id查看该考生所能的考试
	 * @param clerkId
	 * @return
	 */
	public List<TkCl> findTkClByClerkId(int clerkId);
	/**
	 * 添加试卷
	 * 有参数 试卷信息、出题策略信息
	 */
	public void addTkcl(TkCl tkcl, int[] tm_num_1, int[] tm_num_2, int[] tm_num_3, int[] tm_num_4, int[] tm_num_5,
			int[] clTkjId, int[] clTkId);

	/**
	 * 根据试卷Id得到题目 
	 * @return
	 * @throws Exception
	 */
	public String getTmByTkclId(int tkclId);
	/**
	 * 查询考试列表
	 * @return
	 */
	public List<TkCl> findAllTkcl();
	/**
	 * 删除试卷
	 * @param tmId
	 * @return
	 */
	public String delete(int tkclId);
	public String update(int tkclId,int isAllow);
}
