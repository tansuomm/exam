package org.yohta.service;

import org.yohta.vo.Organ;

public interface IOrganService {
	public String list();
	public String add(Organ organ);
	public String delete(int organId);
	public String updatePre(int organId);
	public String update(Organ organ);
}
