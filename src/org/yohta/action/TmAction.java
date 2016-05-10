package org.yohta.action;




import org.apache.struts2.ServletActionContext;
import org.yohta.service.IExamTmService;
import org.yohta.vo.Tm;
import org.yohta.vo.User;

@SuppressWarnings("serial")
public class TmAction extends PageResultAction {
	private Tm tm;
	private IExamTmService tmService;
	public void setTmService(IExamTmService tmService) {
		this.tmService = tmService;
	}
	/**
	 * 题目添加前
	 * @return
	 * @throws Exception
	 */
	public String addPre() throws Exception{

		return tmService.addTmPre();
	}
	/**
	 * 题目添加
	 * @return
	 * @throws Exception
	 */
	public String add() throws Exception{
		String xuanxiang = tm.getTmXuanxiang();
		int xuanLength = 0;
		if(xuanxiang.contains(";")){
			String[] xuanArr = xuanxiang.split(";");
			xuanLength = xuanArr.length;	
		}

		tm.setTmXuanxiangNum(xuanLength );
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		tm.setTmCreateName(user.getUserName());
		return tmService.addTm(tm);
	}
	/**
	 * 题目删除(Byid)
	 * @return
	 * @throws Exception
	 */
	public String delete()throws Exception{
		return tmService.delete(tm.getTmId());
	}
	/**
	 * 题目修改前(回传数据)
	 * @return
	 * @throws Exception
	 */
	public String updatePre() throws Exception{
		return tmService.updateTmPre(tm.getTmId());
	}
	/**
	 * 题目修改
	 * @return
	 * @throws Exception
	 */
	public String update() throws Exception{
		String xuanxiang = tm.getTmXuanxiang();
		int xuanLength = 0;
		if(xuanxiang.contains(";")){
			String[] xuanArr = xuanxiang.split(";");
			xuanLength = xuanArr.length;	
		}

		tm.setTmXuanxiangNum(xuanLength );
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		tm.setTmCreateName(user.getUserName());
		return tmService.update(tm);
	}
	/**
	 * 题目列表
	 * @return
	 * @throws Exception
	 */
/*	public String list() throws Exception{
		return tmService.list();
	}*/
	/**
	 * 分页列表，pageResult优化为父action并继承可省略此类中的setter和getter。
	 * @return
	 * @throws Exception
	 */
	public String list() throws Exception{
		return tmService.queryByPage(pageResult);
	}
	public Tm getTm() {
		return tm;
	}
	public void setTm(Tm tm) {
		this.tm = tm;
	}
	
}
