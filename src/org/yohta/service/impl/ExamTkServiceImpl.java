package org.yohta.service.impl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.yohta.dao.IExamTkDao;
import org.yohta.service.IExamTkService;
import org.yohta.vo.Tk;

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
	private IExamTkDao tkDao;
	public void setTkDao(IExamTkDao tkDao) {
		this.tkDao = tkDao;
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
	

}
