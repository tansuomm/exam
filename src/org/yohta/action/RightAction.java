package org.yohta.action;

import org.yohta.service.IRightService;
import org.yohta.vo.Right;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class RightAction extends ActionSupport implements ModelDriven<Right>{

	private static final long serialVersionUID = 1L;
	public String list() throws Exception{
		return rightService.findAllRight();
	}
	//添加前跳转到添加页面
	public String addPre()throws Exception{
		return "addPre";
	}
	/**
	 * 添加权限
	 * @return 
	 * @throws Exception
	 */
	public String add() throws Exception{
		return rightService.add(right);
	}
	/**
	 * 删除权限
	 */
	public String delete() throws Exception{
		return rightService.remove(right.getRightId());
	}
	/**
	 * 修改权限前
	 * @return
	 * @throws Exception
	 */
	public String updatePre()throws Exception{
		return rightService.updatePre(right.getRightId());
	}
	/**
	 * 修改权限
	 */
	public String update()throws Exception{
		return rightService.update(right);
	}
	//注入
	private IRightService rightService;
	public void setRightService(IRightService rightService) {
		this.rightService = rightService;
	}
	//modelDriven
	private Right right = new Right();
	@Override
	public Right getModel() {
		return right;
	}
	public Right getRight() {
		return right;
	}
	public void setRight(Right right) {
		this.right = right;
	}	
}
