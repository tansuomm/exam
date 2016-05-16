package org.yohta.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.yohta.dao.IClerkClDao;
import org.yohta.dao.IExamTmDao;
import org.yohta.dao.IGdsjDao;
import org.yohta.dao.ITkClNdZsdDao;
import org.yohta.dao.ITkclDao;
import org.yohta.service.ITkclService;
import org.yohta.utils.PrintString;
import org.yohta.vo.ClerkCl;
import org.yohta.vo.Gdsj;
import org.yohta.vo.TkCl;
import org.yohta.vo.TkClNdzsd;
import org.yohta.vo.Tm;

import net.sf.json.JSONArray;

public class TkclServiceImpl implements ITkclService {
	/**
	 * 根据考生的id查看考生能考试的试卷
	 */
	@Override
	public List<TkCl> findTkClByClerkId(int clerkId) {
		List<ClerkCl>  clist= clerkClDao.findClerkClByClerkId(clerkId);
		List<TkCl> tkclList = new ArrayList<TkCl>();
		for(ClerkCl clerkCl : clist){
			//遍历所能考试的试卷Id
			int tkclID = clerkCl.getTkClId();
			TkCl tkcl = tkclDao.findTkClByClerkId(tkclID);
			tkclList.add(tkcl);
		}
		return tkclList;
	}
	

	@Override
	public void addTkcl(TkCl tkcl, int[] tm_num_1, int[] tm_num_2, int[] tm_num_3, int[] tm_num_4, int[] tm_num_5,
			int[] clTkjId, int[] clTkId) {
		int tkclId = 0; 
		//id为空存不了，一个默认值，存完按数据库id自增
		//tkcl.setTkClId(0);
		//1、添加考试
		tkclId = tkclDao.addTkCl(tkcl);
		//System.out.println(tkcl.getTkClId());
		//tkclId = tkcl.getTkClId();
		//System.out.println(tkclId);
		//2、添加策略
		//单选
		if(tm_num_1 != null){
			if(tm_num_1.length > 0){
				addTkclNdzsd(tm_num_1, 1, tkcl.getTkClId(), clTkjId, clTkId);
			}
		}
		
		//填空
		if(tm_num_2 != null){
			if(tm_num_2.length > 0){
				addTkclNdzsd(tm_num_2, 2, tkcl.getTkClId(), clTkjId, clTkId);
			}
		}
		
		//多选
		if(tm_num_3 != null){
			if(tm_num_3.length > 0){
				addTkclNdzsd(tm_num_3, 3, tkcl.getTkClId(), clTkjId, clTkId);
			}
		}
		
		//判断
		if(tm_num_4 != null){
			if(tm_num_4.length > 0){
				addTkclNdzsd(tm_num_4, 4, tkcl.getTkClId(), clTkjId, clTkId);
			}
		}
		
		//问答
		if(tm_num_5 != null){
			if(tm_num_5.length > 0){
				addTkclNdzsd(tm_num_5, 5, tkcl.getTkClId(), clTkjId, clTkId);
			}
		}
		//3、循环策略
		//4、抽题
		//5、插入固定试卷(gdsj)表
		
		//假设1、2已经完成
		//知道了试卷的Id
		//根据试卷Id得到出题策略
		List<TkClNdzsd> list = new ArrayList<TkClNdzsd>();
		list = tkClNdZsdDao.findTkClNdzsdsByTkclId(tkcl.getTkClId());
//		//循环策略
		for(TkClNdzsd cl : list){
			//System.out.println("题库集Id：" + cl.getTkTkjId());
			//System.out.println("题库Id：" + cl.getTkLxId());
			//System.out.println("题型Id：" + cl.getTmTxId());
			//System.out.println("数量：" + cl.getTmNum());
			//根据出题策略抽题
			//和tm表有关
			List<Tm> listTm = new ArrayList<Tm>();
			listTm = tmDao.findTmsByTkclNdzsd(cl);
			for(Tm tm : listTm){
				//System.out.println(tm.getTmName());
				//根据试卷Id以及题目  把题目插入固定试卷表 Gdsj
				Gdsj gdsj = new Gdsj();
				gdsj.setTkClId(tkcl.getTkClId());
				gdsj.setTkTkjId(cl.getTkTkjId());
				gdsj.setTkLxId(cl.getTkLxId());
				gdsj.setTmId(tm.getTmId());
				//题型
				gdsj.setTmTxId(tm.getTmType());
				//题目内容
				gdsj.setTmNr(tm.getTmName());
				//题目分数
				gdsj.setTmFs(tm.getTmScore());
				gdsj.setTmNd(tm.getTmNd());
				gdsj.setTmZsd(tm.getTmZsd());
				gdsj.setTmXuanxiang(tm.getTmXuanxiang());
				gdsj.setTmXuanxiangnum(tm.getTmXuanxiangNum());
				gdsj.setTmDa(tm.getTmDa());
				gdsjDao.addGdsj(gdsj);
			}
		}
	}
	
	/**
	 * 添加出题策略
	 * @param tmNumArr  题目出题数量数组
	 * @param tmType 题目 类型  1 单选
	 * @param tkclId 试卷Id
	 * @param tkjId 题库集Id
	 * @param tkId 题库Id
	 */
	private void addTkclNdzsd(int[] tmNumArr, int tmType, int tkclId, int[] clTkjId,int[] clTkId){
		if(tmNumArr != null){
			if(tmNumArr.length > 0){
				for(int i=0; i<tmNumArr.length; i++){
					//出题数量大于0
					if(tmNumArr[i] > 0){
						//System.out.println(tm_num_2[i]);
						//单选题出题个数
						//tm_num_2[i]
						//单选题对应的题库集		
						//clTkjId[i]
						//clTkId
						//单选题对应的题库
						//实体类  出题策略
						TkClNdzsd tkClNdzsd = new TkClNdzsd();
						//试卷Id
						tkClNdzsd.setTkClId(tkclId);
						tkClNdzsd.setTkTkjId(clTkjId[i]);
						tkClNdzsd.setTkLxId(clTkId[i]);
						tkClNdzsd.setTmTxId(tmType);
						tkClNdzsd.setTmNum(tmNumArr[i]);
						
						//出题策略插入数据库
						tkClNdZsdDao.addTkClNdzsd(tkClNdzsd);
					}
				}
			}
		}
	}
	/**
	 * 根据试卷Id得到题目
	 * @return
	 * @throws Exception
	 */
	@Override
	public String getTmByTkclId(int tkclId) {
		List<Gdsj> list = new ArrayList<Gdsj>();
		list = gdsjDao.getTmByTkclId(tkclId);
		
		JSONArray json = JSONArray.fromObject(list);
		PrintString.printStr(json.toString());
		
		return null;
	}
	
	private ITkclDao tkclDao;
	private IClerkClDao clerkClDao;
	private ITkClNdZsdDao tkClNdZsdDao;
	private IGdsjDao gdsjDao;
	private IExamTmDao tmDao;
	public void setGdsjDao(IGdsjDao gdsjDao) {
		this.gdsjDao = gdsjDao;
	}	
	public void setTmDao(IExamTmDao tmDao) {
		this.tmDao = tmDao;
	}
	public void setTkClNdZsdDao(ITkClNdZsdDao tkClNdZsdDao) {
		this.tkClNdZsdDao = tkClNdZsdDao;
	}
	public void setClerkClDao(IClerkClDao clerkClDao) {
		this.clerkClDao = clerkClDao;
	}
	public void setTkclDao(ITkclDao tkclDao) {
		this.tkclDao = tkclDao;
	}

/**
 * 考试列表
 */
	@Override
	public List<TkCl> findAllTkcl() {
		return tkclDao.findAllTkcl();
	}
}
