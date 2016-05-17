package org.yohta.action;

import java.util.List;

import org.yohta.service.IUserRightService;
import org.yohta.vo.Right;
import org.yohta.vo.UserRight;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class UserRightAction extends ActionSupport implements ModelDriven<UserRight>{
	
	private static final long serialVersionUID = 1L;
	public String list() throws Exception{
		return userRightService.findAllUserRight();
	}

	/**
	 * 修改前
	 * @return
	 * @throws Exception
	 */
	public String updatePre()throws Exception{
		
		return userRightService.updatePre();
	}

	public String update()throws Exception{
		String str = "input";
		Right right = new Right();
		if(listCheck!=null){
			for(String rightId : listCheck){
				if(rightId!=""){
					right.setRightId(Integer.parseInt(rightId));
				}
				
				userRight.setRight(right);
				if("update".equals(userRightService.update(userRight))){
					str = "update";
				}
				
			}
		}
		
		return str;
	} 
	/**
	 * 取消用户所拥有权限
	 * @return
	 */
	public String delete(){
		return userRightService.delete(userRight.getUserRightId());
	}
	//注入
	private IUserRightService userRightService;
	public void setUserRightService(IUserRightService userRightService) {
		this.userRightService = userRightService;
	}
	//modelDriven
	private UserRight userRight = new UserRight();
	@Override
	public UserRight getModel() {
		return userRight;
	}
	public UserRight getUserRight() {
		return userRight;
	}
	public void setUserRight(UserRight userRight) {
		this.userRight = userRight;
	}
	//listCheck,页面复选框
	private List<String> listCheck;
	public List<String> getListCheck() {
		return listCheck;
	}

	public void setListCheck(List<String> listCheck) {
		this.listCheck = listCheck;
	}
}
