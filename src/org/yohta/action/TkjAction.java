package org.yohta.action;

import org.yohta.service.IExamTkjService;
import org.yohta.vo.Tkj;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class TkjAction extends ActionSupport implements ModelDriven<Tkj>{

	private static final long serialVersionUID = 1L;
	public String list() throws Exception{
		return tkjService.findAllTkj();
	}
	//添加前跳转到添加页面
	public String addPre()throws Exception{
		return "addPre";
	}
	/**
	 * 添加题库集
	 * @return 
	 * @throws Exception
	 */
	public String add() throws Exception{
		return tkjService.add(tkj);
	}
	/**
	 * 删除题库集
	 */
	public String delete() throws Exception{
		return tkjService.remove(tkj.getTkjId());
	}
	/**
	 * 修改题库集前
	 * @return
	 * @throws Exception
	 */
	public String updatePre()throws Exception{
		return tkjService.updatePre(tkj.getTkjId());
	}
	/**
	 * 修改题库集
	 */
	public String update()throws Exception{
		return tkjService.update(tkj);
	}
	//注入
	private IExamTkjService tkjService;
	public void setTkjService(IExamTkjService tkjService) {
		this.tkjService = tkjService;
	}
	//modelDriven
	private Tkj tkj = new Tkj();
	@Override
	public Tkj getModel() {
		return tkj;
	}
	public Tkj getTkj() {
		return tkj;
	}
	public void setTkj(Tkj tkj) {
		this.tkj = tkj;
	}	
}
