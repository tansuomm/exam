package org.yohta.service.impl;

import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.yohta.dao.IOrganDao;
import org.yohta.service.IOrganService;
import org.yohta.vo.Organ;

public class OrganServiceImpl implements IOrganService {

	@Override
	public String list() {
		List<Organ> list = organDao.findAll();
		ServletActionContext.getRequest().setAttribute("organList", list);
		return "list";
	}

	@Override
	public String add(Organ organ) {
		String str = "input";
		if(organDao.add(organ)){
			str = "add";
		}
		return str;
	}

	@Override
	public String delete(int organId) {
		String str = "input";
		if(organDao.delete(organId)){
			str = "delete";
		}
		return str;
	}

	@Override
	public String updatePre(int organId) {
		Organ organ = organDao.findById(organId);
		ServletActionContext.getRequest().setAttribute("organ", organ);
		return "updatePre";
	}

	@Override
	public String update(Organ organ) {
		String str ="input";
		if(organDao.update(organ)){
			str = "update";
		}
		return str;
	}

	

	private IOrganDao organDao;
	public void setOrganDao(IOrganDao organDao) {
		this.organDao = organDao;
	}

}
