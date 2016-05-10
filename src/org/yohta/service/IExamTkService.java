package org.yohta.service;

import org.yohta.vo.Tk;

public interface IExamTkService {
	public String findAllTk();
	public String findTkByTkjId(int tkjId);
	//添加前ajax找题库集
	public String addPre();
	public String add(Tk tk);
	//更新前回显tk数据
	public String updatePre(int tkId);
	public String update(Tk tk);
	public String delete(int tkId);

}
