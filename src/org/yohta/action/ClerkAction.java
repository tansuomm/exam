package org.yohta.action;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.yohta.dao.IClerkDao;
import org.yohta.dao.IOrganDao;
import org.yohta.service.IClerkService;
import org.yohta.vo.Clerk;
import org.yohta.vo.Organ;

import com.alibaba.fastjson.JSON;

public class ClerkAction extends SuperAction<Clerk>{
	
	
	
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
	/**
	 * 学生列表
	 * @return
	 * @throws Exception
	 */
	public String list()throws Exception{
		List<Clerk> list = clerkService.list();
		ServletActionContext.getRequest().setAttribute("clerkList", list);
		return "list";
	}
	public String delete()throws Exception{
		return clerkService.delete(model.getClerkId());
	}
	public String updatePre()throws Exception{
		Clerk clerk = clerkDao.findById(model.getClerkId());	
		ServletActionContext.getRequest().setAttribute("clerk", clerk);
		List<Organ> organ = organDao.findAll();
		ServletActionContext.getRequest().setAttribute("organList", organ);
		return "updatePre";
	}
	public String update()throws Exception{
		return clerkService.modify(model);
	}
	public String addPre()throws Exception{
		List<Organ> list  = organDao.findAll();
		ServletActionContext.getRequest().setAttribute("organList", list);
		return "addPre";
		
	}
	public String add()throws Exception{
		return clerkService.add(model);
	}
	private IClerkDao clerkDao;
	private IClerkService clerkService;
	private IOrganDao organDao;
	
	public void setOrganDao(IOrganDao organDao) {
		this.organDao = organDao;
	}
	public void setClerkDao(IClerkDao clerkDao) {
		this.clerkDao = clerkDao;
	}
	public void setClerkService(IClerkService clerkService) {
		this.clerkService = clerkService;
	}
}
