package org.yohta.action;




import org.apache.struts2.ServletActionContext;
import org.yohta.service.IExamTmService;
import org.yohta.vo.Tm;
import org.yohta.vo.User;


public class TmAction extends SuperAction<Tm> {
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
		String xuanxiang = model.getTmXuanxiang();
		int xuanLength = 0;
		if(xuanxiang!=null){
			if(xuanxiang.contains(";")){
				String[] xuanArr = xuanxiang.split(";");
				xuanLength = xuanArr.length;	
			}
		}

		model.setTmXuanxiangNum(xuanLength );
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		model.setTmCreateName(user.getUserName());
		System.out.println("题目添加==》"+model.toString());
		return tmService.addTm(model);
	}
	/**
	 * 题目删除(Byid)
	 * @return
	 * @throws Exception
	 */
	public String delete()throws Exception{
		return tmService.delete(model.getTmId());
	}
	/**
	 * 题目修改前(回传数据)
	 * @return
	 * @throws Exception
	 */
	public String updatePre() throws Exception{
		return tmService.updateTmPre(model.getTmId());
	}
	/**
	 * 题目修改
	 * @return
	 * @throws Exception
	 */
	public String update() throws Exception{
		String xuanxiang = model.getTmXuanxiang();
		int xuanLength = 0;
		if(xuanxiang.contains(";")){
			String[] xuanArr = xuanxiang.split(";");
			xuanLength = xuanArr.length;	
		}

		model.setTmXuanxiangNum(xuanLength );
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		model.setTmCreateName(user.getUserName());
		return tmService.update(model);
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
		//System.out.println(model.getTmName()+"11111");
		return tmService.queryByPage(pageResult,model);
	}
	
	/**
	 * 更具题库id找在tm里找知识点
	 * @return
	 * @throws Exception
	 */

/*	public String findZsdByTkId() throws Exception{
		return tmService.findZsdByTkId(Integer.parseInt(tkjId ),Integer.parseInt(tkId));
		
	}*/
	
	/**
	 * 根据题库集Id题库Id知识点题目题型抽题
	 * @return
	 * @throws Exception
	 */
	public String findTmByTkjIdTkId() throws Exception{
		//System.out.println(tkjId + "||" +tkId + "||" + tx);
		
		return tmService.findTmByTkjIdTkId(Integer.parseInt(tkjId ),Integer.parseInt(tkId),tx);
	
	}
	
	
	private String tkjId;
	private String tkId;
	public String getTkjId() {
		return tkjId;
	}
	public void setTkjId(String tkjId) {
		this.tkjId = tkjId;
	}
	public String getTkId() {
		return tkId;
	}
	public void setTkId(String tkId) {
		this.tkId = tkId;
	}
	private String tx;
	public String getTx() {
		return tx;
	}
	public void setTx(String tx) {
		this.tx = tx;
	}
	
}
