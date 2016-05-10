package org.yohta.service.impl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.yohta.dao.IExamTkDao;
import org.yohta.dao.IExamTkjDao;
import org.yohta.service.IExamTkService;
import org.yohta.vo.Tk;
import org.yohta.vo.Tkj;

public class ExamTkServiceImpl implements IExamTkService{

	@Override
	public String findAllTk() {
		String status = "input";
		List<Tk> list = new ArrayList<Tk>();
		list = tkDao.findAllTk();
		ServletActionContext.getRequest().setAttribute("tkList", list);
		//查找时和事务没多大关系 能用try catch进行出错检查
		return "list";
	}
	
	/**
	 * 根据题库集找到题库
	 */
	@Override
	public String findTkByTkjId(int tkjId) {
		List<Tk> list = new ArrayList<Tk>();
		list= tkDao.findTkByTkjId(tkjId);
		StringBuffer sb = new StringBuffer();
		for(Tk tk : list){
			sb.append("<option value=\"");
			sb.append(tk.getTkId());
			sb.append("\">");
			sb.append(tk.getTkName());
			sb.append("</option>");
		}
		//System.out.println(sb.toString());
		ServletActionContext.getResponse().setCharacterEncoding("utf-8");
		ServletActionContext.getResponse().setContentType("text/html");
		PrintWriter out =null;
		try {
			out = ServletActionContext.getResponse().getWriter();
			out.println(sb.toString());
		} catch (IOException e) {
			
			e.printStackTrace();
		}finally{
			out.flush();
			out.close();
		}
		
		
		return null;
	}
	/**
	 * tk添加前选择所属的题库集
	 */
	@Override
	public String addPre() {
		getTkj();
		return "addPre";
	}
	/**
	 * tk添加
	 */
	@Override
	public String add(Tk tk) {
		String str ="input";
		if(tkDao.add(tk)){
			str = "add";
		}
		return str;
	}
	/**
	 * tk更新前页面回显tk数据和所属的tkj,因tkj可选，所以要得到所有tkj而非要更新的tk所属的tkj
	 */
	@Override
	public String updatePre(int tkId) {
		Tk tk = tkDao.findById(tkId);
		ServletActionContext.getRequest().setAttribute("tk", tk);
		getTkj();
		return "updatePre";
	}
	/**
	 * 更新题库
	 */
	@Override
	public String update(Tk tk) {
		String str  = "input";
		if(tkDao.update(tk)){
			str = "update";
		}
		return str;
	}
	/**
	 * 删除题库
	 */
	@Override
	public String delete(int tkId) {
		String str  = "input";
		if(tkDao.delete(tkId)){
			str = "delete";
		}
		return str;
	}
	//注入tkDao和tkjDao
	private IExamTkDao tkDao;
	private IExamTkjDao tkjDao;
	public void setTkDao(IExamTkDao tkDao) {
		this.tkDao = tkDao;
	}
	public IExamTkjDao getTkjDao() {
		return tkjDao;
	}

	public void setTkjDao(IExamTkjDao tkjDao) {
		this.tkjDao = tkjDao;
	}
	//返回所有题库集向页面发送
	public void getTkj(){
		List<Tkj> list = new ArrayList<Tkj>();
		list = tkjDao.findAll();
		ServletActionContext.getRequest().setAttribute("tkjList", list);
		
	}
}
