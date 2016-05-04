package org.yohta.action;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.yohta.dao.IClerkDao;
import org.yohta.vo.Clerk;

import com.opensymphony.xwork2.ActionSupport;

public class ClerkAction extends ActionSupport{
	private Clerk clerk;
	private IClerkDao clerkDao;
	public String loginPre() throws Exception{
		return "loginPre";
	}
	/**
	 * 客户端登录
	 * @return 向Android端发送json
	 * @throws Exception
	 */
	public String login() throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		clerk = clerkDao.login(clerk);
		if(clerk!=null){
			map.put("resultCode", "0000");
			map.put("resultMsg", "登录成功");
			map.put("clerkId", clerk.getClerkId());
		}else{
			map.put("resultCode", "0001");
			map.put("resultMsg", "登录失败");	
		}
		JSONObject json = JSONObject.fromObject(map);
		ServletActionContext.getResponse().setContentType("text/html");
		ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		out.print(json.toString());
		out.flush();
		out.close();
		return null;
	}
	public Clerk getClerk() {
		return clerk;
	}
	public void setClerk(Clerk clerk) {
		this.clerk = clerk;
	}
	public void setClerkDao(IClerkDao clerkDao) {
		this.clerkDao = clerkDao;
	}
}
