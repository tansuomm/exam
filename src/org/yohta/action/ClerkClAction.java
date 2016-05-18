package org.yohta.action;

import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.yohta.dao.IOrganDao;
import org.yohta.service.IClerkClService;
import org.yohta.service.ITkclService;
import org.yohta.vo.ClerkCl;
import org.yohta.vo.Organ;

import com.opensymphony.xwork2.ActionSupport;

public class ClerkClAction extends ActionSupport {
	//0 允许所有班级，1允许部分班级
	private int tkClId;
	private int isAllow=5;
	private int organId;
	public int getIsAllow() {
		return isAllow;
	}
	public void setIsAllow(int isAllow) {
		this.isAllow = isAllow;
	}
	public int getTkClId() {
		return tkClId;
	}
	public void setTkClId(int tkClId) {
		this.tkClId = tkClId;
	}
	public String addPre()throws Exception{
		//找到tkcl里所有未被赋予考试权限的班级
		
		return clerkClService.addPre(tkClId, isAllow);
	}
	
	public String add()throws Exception{
		//已经拥有所有班级列表
		String str = "input";
		if(isAllow==0){	
			str="add";
		}else{
			//添加班级organID 和 clerkId 
			ClerkCl clerkCl = new ClerkCl();
			clerkCl.setOrganId(organId);
			clerkCl.setTkClId(tkClId);
			str = clerkClService.add(clerkCl);
		}
		//添加返回add会重定向，传递请求数据，所以返回list。如果返回字符串还需手动刷新。
		return list();
	}
	public String delete()throws Exception{
		if(isAllow==0){
			//中间表没数据，所以要增加中间表（除了输入的班级id）
			List<Organ> organlist = organDao.findAll();
			for(Organ organ:organlist){
				if(organ.getOrganId()!=organId){
					ClerkCl cl = new ClerkCl();
					cl.setOrganId(organ.getOrganId());
					cl.setTkClId(tkClId);
					clerkClService.add(cl);
				}
			}
			//修改tkcl的 isAllow
			isAllow = 1;
			tkclService.update(tkClId, isAllow);
		}else if(isAllow == 1){
			ClerkCl cl = new ClerkCl();
			cl.setOrganId(organId);
			cl.setTkClId(tkClId);
			clerkClService.delete(cl);
		}
		return list();
	} 
	/**
	 * 试卷分配给班级参加考试
	 * @return
	 * @throws Exception
	 */
	public String list()throws Exception{
	//允许参加考试的班级通过域发送。
		if(isAllow==0){
			List<Organ> list = organDao.findAll();
			ServletActionContext.getRequest().setAttribute("organList", list);
		}else{
			//查找clerk_cl试卷id为clerkId的所有班级
			List<Organ> list = clerkClService.findOrgansByTkclId(tkClId);
			ServletActionContext.getRequest().setAttribute("organList", list);
		}
		
		return "list";
	}
	private IOrganDao organDao;
	private IClerkClService clerkClService;
	private ITkclService tkclService;
	
	public void setTkclService(ITkclService tkclService) {
		this.tkclService = tkclService;
	}
	public void setOrganDao(IOrganDao organDao) {
		this.organDao = organDao;
	}
	
	public void setClerkClService(IClerkClService clerkClService) {
		this.clerkClService = clerkClService;
	}
	
	public void setOrganId(int organId) {
		this.organId = organId;
	}
	
	
}
