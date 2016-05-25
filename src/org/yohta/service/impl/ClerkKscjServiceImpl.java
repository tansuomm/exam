package org.yohta.service.impl;

import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.yohta.dao.IClerkGdksTmDao;
import org.yohta.dao.IClerkKscjDao;
import org.yohta.dao.IGdsjDao;
import org.yohta.dao.ITkclDao;
import org.yohta.service.IClerkKscjService;
import org.yohta.vo.ClerkGdksTm;
import org.yohta.vo.ClerkKscj;
import org.yohta.vo.Gdsj;
import org.yohta.vo.TkCl;
import org.yohta.vo.User;

public class ClerkKscjServiceImpl implements IClerkKscjService {
	/**
	 * 以考试科目
	 */
	@Override
	public String findHasTkClByEtime() {
		List<TkCl> list = tkclDao.findHasTkClByEtime();
		ServletActionContext.getRequest().setAttribute("hasTkcl", list);
		return "list";
	}
	/**
	 * 考试成绩列表
	 */
	@Override
	public String findByTkclId(int tkclId) {
		
		List<ClerkKscj> list = clerkKscjDao.findByTkclId(tkclId);
		ServletActionContext.getRequest().setAttribute("clerkKscjList", list);
		return "tkclList";
	}
	/**
	 * 根据考试成绩id查看学生答题情况
	 */
	@Override
	public String markPre(int clerkKscjId,int tkClId) {
		List<ClerkGdksTm> list =clerkGdksTmDao.findListByClerkKscjId(clerkKscjId);
		ServletActionContext.getRequest().setAttribute("clerkGdksTmList", list);
		List<Gdsj> list1 = gdsjDao.findByTkclId(tkClId);
		ServletActionContext.getRequest().setAttribute("gdsjList", list1);
		return "markPre";
	}
	/**
	 * 判卷
	 */
	@Override
	public String mark(int clerkKscjId, int[] gdsjIdarr, float[] tmWddfarr) {
		float tmWdScore = 0;
		for(int i =0;i<gdsjIdarr.length;i++){
			clerkGdksTmDao.update(clerkKscjId, gdsjIdarr[i], tmWddfarr[i]);
			tmWdScore += tmWddfarr[i];
		}
		//更新成绩表：判卷状态、总分、问答得分、判卷人
		int status =2;
		User u = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		String clerkPj = u.getUserName();
		clerkKscjDao.update(status, tmWdScore, clerkPj, clerkKscjId);
		return null;
	}	
	private IGdsjDao gdsjDao;
	public void setGdsjDao(IGdsjDao gdsjDao) {
		this.gdsjDao = gdsjDao;
	}
	private IClerkGdksTmDao clerkGdksTmDao;
	public void setClerkGdksTmDao(IClerkGdksTmDao clerkGdksTmDao) {
		this.clerkGdksTmDao = clerkGdksTmDao;
	}
	private ITkclDao tkclDao;
	public void setTkclDao(ITkclDao tkclDao) {
		this.tkclDao = tkclDao;
	}
	private IClerkKscjDao clerkKscjDao;
	public void setClerkKscjDao(IClerkKscjDao clerkKscjDao) {
		this.clerkKscjDao = clerkKscjDao;
	}

}
