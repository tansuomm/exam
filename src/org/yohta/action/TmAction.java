package org.yohta.action;

import org.yohta.service.IExamTmService;
import org.yohta.vo.Tm;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class TmAction extends ActionSupport {
	private Tm tm;
	private IExamTmService tmService;
	public void setTmService(IExamTmService tmService) {
		this.tmService = tmService;
	}
	/**
	 * 题目添加前
	 * @return
	 * @throws Exception
	 */
	public String addPre() throws Exception{

		return tmService.addTmPre();
	}
	/**
	 * 题目添加
	 * @return
	 * @throws Exception
	 */
	public String add() throws Exception{
		return tmService.addTm(tm);
	}
	/**
	 * 题目删除(Byid)
	 * @return
	 * @throws Exception
	 */
	public String delete()throws Exception{
		return tmService.delete(tm.getTmId());
	}
	/**
	 * 题目修改前(回传数据)
	 * @return
	 * @throws Exception
	 */
	public String updatePre() throws Exception{
		return tmService.updateTmPre(tm.getTmId());
	}
	/**
	 * 题目修改
	 * @return
	 * @throws Exception
	 */
	public String update() throws Exception{
		return tmService.update(tm);
	}
	/**
	 * 题目列表
	 * @return
	 * @throws Exception
	 */
	public String list() throws Exception{
		return tmService.list();
	}
	
	
	public Tm getTm() {
		return tm;
	}
	public void setTm(Tm tm) {
		this.tm = tm;
	}
}
