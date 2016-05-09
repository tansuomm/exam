package org.yohta.service;

import org.yohta.utils.PageResult;
import org.yohta.vo.Tm;

public interface IExamTmService {
	/**
	 * 添加题目前
	 * @return
	 */
	public String addTmPre();
	/**
	 * 添加题目
	 * @param tm
	 * @return
	 */
	public String addTm(Tm tm);
	/**
	 * 删除题目
	 * @param id
	 * @return
	 */
	public String delete(int tmId);
	/**
	 * 修改题目前
	 * @return
	 */
	public String updateTmPre(int tmId);
	/**
	 * 修改题目
	 * @param tm
	 * @return
	 */
	public String update(Tm tm);
	/**
	 * 所有题目列表
	 * @return
	 */
	//public String list();
	/**
	 * 分页
	 * @param pageResult
	 * @return
	 */
	public String queryByPage(PageResult pageResult);
}
