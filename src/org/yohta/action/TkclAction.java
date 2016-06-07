package org.yohta.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.yohta.service.IExamTkjService;
import org.yohta.service.ITkclService;
import org.yohta.utils.PrintString;
import org.yohta.vo.TkCl;

import com.alibaba.fastjson.JSON;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;



public class TkclAction extends ActionSupport implements ModelDriven<TkCl> {

	/**
	 * 添加试卷前
	 * @return
	 * @throws Exception
	 */
	public String addPre() throws Exception{
		tkjService.findAllTkj();
		return "addPre";
	}
	
	/**
	 * 添加试卷
	 * @return
	 * @throws Exception
	 */
	public String add() throws Exception{
		//接收到试卷的信息
		//接收到出题策略的信息
		//把以上信息传递到 service层
		System.out.println(tkcl.toString());
//		//单选
//		if(tm_num_1 != null){
//			if(tm_num_1.length > 0){
//				for(int i=0; i<tm_num_1.length; i++){
//					//System.out.println(tm_num_1[i]);
//				}
//			}
// 	 }
//		//填空
//		if(tm_num_2 != null){
//			if(tm_num_2.length > 0){
//				for(int i=0; i<tm_num_2.length; i++){
//					System.out.println(tm_num_2[i]);
//				}
//			}
//		}
//
//		//多选
//		if(tm_num_3 != null){
//			if(tm_num_3 != null){
//				if(tm_num_3.length > 0){
//					for(int i=0; i<tm_num_3.length; i++){
//						System.out.println(tm_num_3[i]);
//					}
//				}
//			}
//		}
//		//判断
//		if(tm_num_4 != null){
//			if(tm_num_4.length > 0){
//				for(int i=0; i<tm_num_4.length; i++){
//					System.out.println(tm_num_4[i]);
//				}
//			}
//		}
//		//问答
//		if(tm_num_5 != null){
//			if(tm_num_5.length > 0){
//				for(int i=0; i<tm_num_5.length; i++){
//					System.out.println(tm_num_5[i]);
//				}
//			}
//		}
		tkclService.addTkcl(tkcl,tm_num_1,tm_num_2,tm_num_3,tm_num_4,tm_num_5,clTkjId,clTkId);
		
		return "add";
	}
	/**
	 * 删除考试
	 * @return
	 * @throws Exception
	 */

	public String delete()throws Exception{
		//System.out.println("考试id------"+tkcl.getTkClId());
		return  tkclService.delete(tkcl.getTkClId());
		
	}
	/**
	 * 考试列表
	 * @return
	 * @throws Exception
	 */
	public String list()throws Exception{
		 List<TkCl> list = tkclService.findAllTkcl();
		 ServletActionContext.getRequest().setAttribute("tkclList", list);
		 
		 return "list";
	}
	/**
	 * 考试列表android客户端访问
	 * @return
	 * @throws Exception
	 */
	public String applist() throws Exception {
	
		List<TkCl> list = new ArrayList<TkCl>();
		//获取考卷详细信息通过考生id
		//System.out.println(clerkId);
		list = (List<TkCl>) tkclService.findTkClByClerkId(clerkId);
		if (list != null) {
			//JSONArray json = JSONArray.fromObject(list);
			String json = JSON.toJSONString(list);
			PrintString.printStr(json);
		}
		
		return null;
	}
	
	/**
	 * android根据试卷Id和题型id得到题目
	 * @return
	 * @throws Exception
	 */
	public String getTmByTkclId() throws Exception{		
		return tkclService.getTmByTkclId(tkcl.getTkClId(),tmTxId);
	}
	public String findClerkKscjsByTkclIdAndClerkId()throws Exception{
		return tkclService.findClerkKscjsByTkclIdAndClerkId(tkcl.getTkClId(),clerkId);
	}
	/**
	 * android提交考试答卷保存
	 * @return
	 * @throws Exception
	 */
	public String saveSjPre()throws Exception{
		System.out.println(1111);
		return "saveSjPre";
	}
	public String saveSj()throws Exception{
		//
		String str ="";
		Map<String,String> map = new HashMap<String,String>();
		//System.out.println(222222+sjInfo);
		if(sjInfo!=null&&sjInfo!=""){
			str = tkclService.saveSj(sjInfo);
		}
		if("saveSj".equals(str)){
			//str="交卷成功";
			map.put("resultCode","0000");
			map.put("resultMsg", "保存成功");
		}else{
			//str="交卷失败";
			map.put("resultCode","0001");
			map.put("resultMsg", "保存失败");
		}
		String json = JSON.toJSONString(map);
		PrintString.printStr(json);
		return null;
	}
	public String getSjInfo() {
		return sjInfo;
	}

	public void setSjInfo(String sjInfo) {
		this.sjInfo = sjInfo;
	}
	private String sjInfo;//android提交答卷情况
	private int tmTxId;//android刷题参数
	private int clerkId;
	private TkCl tkcl = new TkCl();
	private ITkclService tkclService;
	private IExamTkjService tkjService;
	
	//*****
	//单选
	private int[] tm_num_1;
	//填空
	private int[] tm_num_2;
	//多选
	private int[] tm_num_3;
	//判断
	private int[] tm_num_4;
	//问答
	private int[] tm_num_5;
	
	//题库集Id
	private int[] clTkjId;
	//题库Id
	private int[] clTkId;
	public int getClerkId() {
		return clerkId;
	}

	public void setClerkId(int clerkId) {
		this.clerkId = clerkId;
	}	
	public TkCl getTkcl() {
		return tkcl;
	}

	public void setTkcl(TkCl tkcl) {
		this.tkcl = tkcl;
	}
	
	public int getTmTxId() {
		return tmTxId;
	}

	public void setTmTxId(int tmTxId) {
		this.tmTxId = tmTxId;
	}
	@Override
	public TkCl getModel() {
		return this.tkcl;
	}

	public void setTkclService(ITkclService tkclService) {
		this.tkclService = tkclService;
	}

	public void setTkjService(IExamTkjService tkjService) {
		this.tkjService = tkjService;
	}

	public int[] getTm_num_1() {
		return tm_num_1;
	}

	public void setTm_num_1(int[] tm_num_1) {
		this.tm_num_1 = tm_num_1;
	}

	public int[] getTm_num_2() {
		return tm_num_2;
	}

	public void setTm_num_2(int[] tm_num_2) {
		this.tm_num_2 = tm_num_2;
	}

	public int[] getTm_num_3() {
		return tm_num_3;
	}

	public void setTm_num_3(int[] tm_num_3) {
		this.tm_num_3 = tm_num_3;
	}

	public int[] getTm_num_4() {
		return tm_num_4;
	}

	public void setTm_num_4(int[] tm_num_4) {
		this.tm_num_4 = tm_num_4;
	}

	public int[] getTm_num_5() {
		return tm_num_5;
	}

	public void setTm_num_5(int[] tm_num_5) {
		this.tm_num_5 = tm_num_5;
	}

	public int[] getClTkjId() {
		return clTkjId;
	}

	public void setClTkjId(int[] clTkjId) {
		this.clTkjId = clTkjId;
	}

	public int[] getClTkId() {
		return clTkId;
	}

	public void setClTkId(int[] clTkId) {
		this.clTkId = clTkId;
	}
}
