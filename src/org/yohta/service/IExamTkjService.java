package org.yohta.service;

import org.yohta.vo.Tkj;

public interface IExamTkjService {
	public String findAllTkj();
	
	public String add(Tkj tkj);
	//更新操作前先根据id找到题库集
	public String updatePre(int tkjId);
	public String update(Tkj tkj);
	public String remove(int tkjId);

}
