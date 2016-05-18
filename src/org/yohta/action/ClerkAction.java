package org.yohta.action;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.yohta.dao.IClerkDao;
import org.yohta.vo.Clerk;

import com.alibaba.fastjson.JSON;

public class ClerkAction extends SuperAction<Clerk>{
	
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
		model = clerkDao.login(model);
		if(model!=null){
			map.put("resultCode", "0000");
			map.put("resultMsg", "登录成功");
			map.put("clerkId", model.getClerkId());
		}else{
			map.put("resultCode", "0001");
			map.put("resultMsg", "登录失败");	
		}
		String json = JSON.toJSONString(map);
		ServletActionContext.getResponse().setContentType("text/html");
		ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		out.print(json);
		out.flush();
		out.close();
		return null;
	}
	
	
	public void setClerkDao(IClerkDao clerkDao) {
		this.clerkDao = clerkDao;
	}
}
