package org.yohta.action;

import org.yohta.service.IOrganService;
import org.yohta.vo.Organ;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class OrganAction extends ActionSupport implements ModelDriven<Organ>{
	private Organ organ = new Organ();
	
	public Organ getOrgan() {
		return organ;
	}

	public void setOrgan(Organ organ) {
		this.organ = organ;
	}

	@Override
	public Organ getModel() {
		return organ;
	}
	//列表
	public String list()throws Exception{
		return organService.list();	
	}
	//添加
	public String addPre()throws Exception{
		return "addPre";
	}
	public String add()throws Exception{
		return organService.add(organ);
	}
	//删除
	public String delete()throws Exception{
		return organService.delete(organ.getOrganId());
	}
	//修改
	public String updatePre()throws Exception{
		return organService.updatePre(organ.getOrganId());
	}
	public String update()throws Exception{
		return organService.update(organ);
	}
	//注入
	private IOrganService organService;
	

	public void setOrganService(IOrganService organService) {
		this.organService = organService;
	}

}
