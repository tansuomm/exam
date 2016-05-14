package org.yohta.action;




import org.apache.struts2.ServletActionContext;
import org.yohta.service.IExamTmService;
import org.yohta.vo.Tm;
import org.yohta.vo.User;

@SuppressWarnings("serial")
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
		if(xuanxiang.contains(";")){
			String[] xuanArr = xuanxiang.split(";");
			xuanLength = xuanArr.length;	
		}

		model.setTmXuanxiangNum(xuanLength );
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		model.setTmCreateName(user.getUserName());
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
		System.out.println(model.getTmName()+"11111");
		return tmService.queryByPage(pageResult,model);
	}
	
	/**
	 * 更具题库id找在tm里找知识点
	 * @return
	 * @throws Exception
	 */

	public String findZsdByTkId() throws Exception{
		return tmService.findZsdByTkId(tkjId,tkId);
	}
	
	/**
	 * 根据题库集Id题库Id知识点题目题型抽题
	 * @return
	 * @throws Exception
	 */
	public String findTmByTkjIdTkIdZsd() throws Exception{
		//System.out.println(tkjId + "||" +tkId + "||" +zsd + "||" + nd + "||" + tx);
		return tmService.findTmByTkjIdTkIdZsd(tkjId,tkId,zsd,nd,tx);
	}
	private int tkjId;
	private int tkId;
	//知识点
	private String zsd;
	//难度
	private String nd;
	//题型
	private String tx;
	 
	public int gettkjId() {
		return tkjId;
	}
	public void settkjId(int tkjId) {
		this.tkjId = tkjId;
	}
	public int gettkId() {
		return tkId;
	}
	public void settkId(int tkId) {
		this.tkId = tkId;
	}
	public String getZsd() {
		return zsd;
	}
	public void setZsd(String zsd) {
		this.zsd = zsd;
	}
	public String getNd() {
		return nd;
	}
	public void setNd(String nd) {
		this.nd = nd;
	}
	public String getTx() {
		return tx;
	}
	public void setTx(String tx) {
		this.tx = tx;
	}
	
}
