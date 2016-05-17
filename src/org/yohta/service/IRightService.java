package org.yohta.service;

import org.yohta.vo.Right;

public interface IRightService {
	public String findAllRight();
	
	public String add(Right right);
	//更新操作前先根据id找到权限
	public String updatePre(int rightId);
	public String update(Right right);
	public String remove(int rightId);

}
