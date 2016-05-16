package org.yohta.action;

import java.util.ArrayList;
import java.util.List;

import org.yohta.service.IExamTkjService;
import org.yohta.service.ITkclService;
import org.yohta.utils.PrintString;
import org.yohta.vo.TkCl;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import net.sf.json.JSONArray;

public class TkclAction extends ActionSupport implements ModelDriven<TkCl> {
	private static final long serialVersionUID = 1L;

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
		//tkclService.addTkcl(tkcl,tm_num_1,tm_num_2,tm_num_3,tm_num_4,tm_num_5,clTkjId,clTkId);
		//list();
		return "add";
	}
	
	/**
	 * 考试列表
	 * @return
	 * @throws Exception
	 */
	public String list() throws Exception {
	
		List<TkCl> list = new ArrayList<TkCl>();
		//获取考卷详细信息通过考生id
		
		list = (List<TkCl>) tkclService.findTkClByClerkId(clerkId);
		if (list != null) {
			JSONArray json = JSONArray.fromObject(list);
			PrintString.printStr(json.toString());
		}
		
		return null;
	}
	
	/**
	 * 根据试卷Id得到题目
	 * @return
	 * @throws Exception
	 */
	public String getTmByTkclId() throws Exception{		
		return tkclService.getTmByTkclId(tkcl.getTkClId());
	}
	
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
