package org.yohta.action;

import org.yohta.service.IExamTkService;
import org.yohta.vo.Tk;

public class TkAction extends SuperAction<Tk> {
	public String findTkByTkjId()throws Exception{
		//System.out.println(tkjId);
		return tkService.findTkByTkjId(tkjId);
	}
	/**
	 * 所有的tk
	 * @return
	 * @throws Exception
	 */
	public String list() throws Exception{
		return tkService.findAllTk();
	}
	/**
	 * 添加前
	 * @return
	 */
	public String addPre()throws Exception{
		return tkService.addPre();
	}
	/**
	 * 添加题库
	 * @return
	 */
	public String add() throws Exception{
		//model反射后就是tk
		return tkService.add(model);
	}
	/**
	 * 题库更新前
	 * @return
	 * @throws Exception
	 */
	public String updatePre() throws Exception{
		return tkService.updatePre(model.getTkId());
	}
	/**
	 * 更新题库
	 * @return
	 */
	public String update()throws Exception{
		return tkService.update(model);
	}
	/**
	 * 删除题库
	 * @return
	 */
	public String delete() throws Exception{
		return tkService.delete(model.getTkId());
	}
	
	public int getTkjId() {
		return tkjId;
	}
	public void setTkjId(int tkjId) {
		this.tkjId = tkjId;
	}
	private int tkjId;
	private IExamTkService tkService;
	public void setTkService(IExamTkService tkService) {
		this.tkService = tkService;
	}
}
