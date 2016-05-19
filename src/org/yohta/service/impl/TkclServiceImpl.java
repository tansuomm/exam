package org.yohta.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.dom4j.Attribute;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.yohta.dao.IClerkClDao;
import org.yohta.dao.IClerkDao;
import org.yohta.dao.IClerkGdksTmDao;
import org.yohta.dao.IClerkKscjDao;
import org.yohta.dao.IExamTmDao;
import org.yohta.dao.IGdsjDao;
import org.yohta.dao.ITkClNdZsdDao;
import org.yohta.dao.ITkclDao;
import org.yohta.service.ITkclService;
import org.yohta.utils.PrintString;
import org.yohta.vo.Clerk;
import org.yohta.vo.ClerkCl;
import org.yohta.vo.ClerkGdksTm;
import org.yohta.vo.ClerkKscj;
import org.yohta.vo.Gdsj;
import org.yohta.vo.TkCl;
import org.yohta.vo.TkClNdzsd;
import org.yohta.vo.Tm;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

public class TkclServiceImpl implements ITkclService {
	/**
	 * 根据考生的id查看考生能考试的试卷
	 */
	@Override
	public List<TkCl> findTkClByClerkId(int clerkId) {
		List<TkCl> tkclList = new ArrayList<TkCl>();
		//如果0允许所有人考试，直接返回试卷列表，否则到表clerkcl查找
		List<TkCl> listAll = tkclDao.findAllTkcl();
		for(TkCl tkcl :listAll){
			//这个试卷允许所有人参加
			if(tkcl.getIsAllow()==0){
				tkclList.add(tkcl);
			}
		}
		Clerk c =clerkDao.findById(clerkId);
		//考生能考试列表有班级决定
		List<ClerkCl> clist = clerkClDao.findClerkClByOrganId(c.getOrgan().getOrganId());		
		for (ClerkCl clerkCl : clist) {
			// 遍历所能考试的试卷Id
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
		// id为空存不了，一个默认值，存完按数据库id自增
		// tkcl.setTkClId(0);
		// 1、添加考试
		tkclId = tkclDao.addTkCl(tkcl);
		// System.out.println(tkcl.getTkClId());
		// tkclId = tkcl.getTkClId();
		// System.out.println(tkclId);
		// 2、添加策略
		// 单选
		if (tm_num_1 != null) {
			if (tm_num_1.length > 0) {
				addTkclNdzsd(tm_num_1, 1, tkcl.getTkClId(), clTkjId, clTkId);
			}
		}

		// 填空
		if (tm_num_2 != null) {
			if (tm_num_2.length > 0) {
				addTkclNdzsd(tm_num_2, 2, tkcl.getTkClId(), clTkjId, clTkId);
			}
		}

		// 多选
		if (tm_num_3 != null) {
			if (tm_num_3.length > 0) {
				addTkclNdzsd(tm_num_3, 3, tkcl.getTkClId(), clTkjId, clTkId);
			}
		}

		// 判断
		if (tm_num_4 != null) {
			if (tm_num_4.length > 0) {
				addTkclNdzsd(tm_num_4, 4, tkcl.getTkClId(), clTkjId, clTkId);
			}
		}

		// 问答
		if (tm_num_5 != null) {
			if (tm_num_5.length > 0) {
				addTkclNdzsd(tm_num_5, 5, tkcl.getTkClId(), clTkjId, clTkId);
			}
		}
		// 3、循环策略
		// 4、抽题
		// 5、插入固定试卷(gdsj)表

		// 假设1、2已经完成
		// 知道了试卷的Id
		// 根据试卷Id得到出题策略
		List<TkClNdzsd> list = new ArrayList<TkClNdzsd>();
		list = tkClNdZsdDao.findTkClNdzsdsByTkclId(tkcl.getTkClId());
		// //循环策略
		for (TkClNdzsd cl : list) {
			// System.out.println("题库集Id：" + cl.getTkTkjId());
			// System.out.println("题库Id：" + cl.getTkLxId());
			// System.out.println("题型Id：" + cl.getTmTxId());
			// System.out.println("数量：" + cl.getTmNum());
			// 根据出题策略抽题
			// 和tm表有关
			List<Tm> listTm = new ArrayList<Tm>();
			listTm = tmDao.findTmsByTkclNdzsd(cl);
			for (Tm tm : listTm) {
				// System.out.println(tm.getTmName());
				// 根据试卷Id以及题目 把题目插入固定试卷表 Gdsj
				Gdsj gdsj = new Gdsj();
				gdsj.setTkClId(tkcl.getTkClId());
				gdsj.setTkTkjId(cl.getTkTkjId());
				gdsj.setTkLxId(cl.getTkLxId());
				gdsj.setTmId(tm.getTmId());
				// 题型
				gdsj.setTmTxId(tm.getTmType());
				// 题目内容
				gdsj.setTmNr(tm.getTmName());
				// 题目分数
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
	 * 
	 * @param tmNumArr
	 *            题目出题数量数组
	 * @param tmType
	 *            题目 类型 1 单选
	 * @param tkclId
	 *            试卷Id
	 * @param tkjId
	 *            题库集Id
	 * @param tkId
	 *            题库Id
	 */
	private void addTkclNdzsd(int[] tmNumArr, int tmType, int tkclId, int[] clTkjId, int[] clTkId) {
		if (tmNumArr != null) {
			if (tmNumArr.length > 0) {
				for (int i = 0; i < tmNumArr.length; i++) {
					// 出题数量大于0
					if (tmNumArr[i] > 0) {
						// System.out.println(tm_num_2[i]);
						// 单选题出题个数
						// tm_num_2[i]
						// 单选题对应的题库集
						// clTkjId[i]
						// clTkId
						// 单选题对应的题库
						// 实体类 出题策略
						TkClNdzsd tkClNdzsd = new TkClNdzsd();
						// 试卷Id
						tkClNdzsd.setTkClId(tkclId);
						tkClNdzsd.setTkTkjId(clTkjId[i]);
						tkClNdzsd.setTkLxId(clTkId[i]);
						tkClNdzsd.setTmTxId(tmType);
						tkClNdzsd.setTmNum(tmNumArr[i]);

						// 出题策略插入数据库
						tkClNdZsdDao.addTkClNdzsd(tkClNdzsd);
					}
				}
			}
		}
	}

	/**
	 * 根据试卷Id得到题目
	 * 
	 * @return
	 * @throws Exception
	 */
	@Override
	public String getTmByTkclId(int tkclId,int tmTxId) {
		List<Gdsj> list = new ArrayList<Gdsj>();
		list = gdsjDao.getTmByTkclId(tkclId,tmTxId);
		String json = JSON.toJSONString(list);
		//JSONArray json = JSONArray.fromObject(list);
		PrintString.printStr(json);

		return null;
	}

	private ITkclDao tkclDao;
	private IClerkClDao clerkClDao;
	private ITkClNdZsdDao tkClNdZsdDao;
	private IGdsjDao gdsjDao;
	private IExamTmDao tmDao;
	private IClerkDao clerkDao;
	private IClerkKscjDao clerkKscjDao;
	private IClerkGdksTmDao clerkGdksTmDao;
	public void setClerkGdksTmDao(IClerkGdksTmDao clerkGdksTmDao) {
		this.clerkGdksTmDao = clerkGdksTmDao;
	}

	public void setClerkKscjDao(IClerkKscjDao clerkKscjDao) {
		this.clerkKscjDao = clerkKscjDao;
	}

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
	/**
	 * 删除试卷
	 */
	@Override
	public String delete(int tkclId) {
		String resultStr = "input";
		if (tkclDao.delete(tkclId)) {
			resultStr = "delete";
		}
		return resultStr;
	}

	public IClerkDao getClerkDao() {
		return clerkDao;
	}

	public void setClerkDao(IClerkDao clerkDao) {
		this.clerkDao = clerkDao;
	}

	@Override
	public String update(int tkclId, int isAllow) {
		String str ="input";
		if(tkclDao.update(tkclId, isAllow)){
			str="update"; 
		 } 
		return str;
	}
	/**
	 * 答卷保存到两张表。判分时update
	 */
	@Override
	public String saveSj(String sjInfo) {
		String str = "input";
		//*题目Id(xml中的数字254)需要被传过来存到clerk_gdsj_tm。。
		/*{"clerkId":1,"tkClId":2,"clerkKsStatus":1,
			"clerkKsBtime":1463564430000,"clerkKsEtime":1463564430000,
			"cj":60,"clerkXzdf":60,"clerkWddf":0,"ksTime":60,
			"clerk_pj":"null","answerGather":"<ROOTSTUB global="true" prefix_259="6" mark_259="0" prefix_260="6"
				mark_260="0" prefix_251="b" mark_251="0" prefix_252="a" mark_252="0"
				prefix_257="ac" mark_257="0" prefix_258="b" mark_258="0" prefix_253="0"
				mark_253="0" prefix_254="0" mark_254="0" prefix_255="66" mark_255="0"
				prefix_256="66" mark_256="0"/>"}
*/		
		//试卷状态：0空的成绩表(出卷时添加，未添加此处不做)1交卷2已判分
		//问答判分：试卷表的是否手工判卷
		//判卷人：null,判卷时候再添加
		//xml字符串：解析出问答和得分(0),存入两张表。dom4j解析。
		JSONObject obj = JSON.parseObject(sjInfo);
		ClerkKscj clerkKscj = new ClerkKscj();
		clerkKscj.setClerkId(obj.getInteger("clerkId"));
		clerkKscj.setTkClId(obj.getInteger("tkClId"));
		clerkKscj.setClerkKsStatus(obj.getInteger("clerkKsStatus"));
		clerkKscj.setClerkKsBtime(obj.getTimestamp("clerkKsBTime"));
		clerkKscj.setClerkKsEtime(obj.getTimestamp("clerkKsEtime"));
		clerkKscj.setCj(obj.getFloat("cj"));
		clerkKscj.setClerkXzdf(obj.getFloat("clerkXzdf"));
		clerkKscj.setClerkWddf(obj.getFloat("clerkWddf"));
		clerkKscj.setKsTime(obj.getInteger("ksTime"));
		clerkKscj.setAnswerGather(obj.getString("answerGather"));
		//提交到考试成绩表
		int clerkKscjId = clerkKscjDao.insert(clerkKscj);
		
		//解析,如果是看到的多行字符串需要转移“;
		String xml = obj.getString("answerGather");
		if(xml!=null&&xml!=""){//试卷有问答
		try {
			Document document = DocumentHelper.parseText(xml);
			Element root = document.getRootElement();
			//遍历根节点的所有属性名值
			int contorl = 0;
			String prefix = "";
			Float mark = 0f;
			Map<Integer,Map<String,Float>> outmap = (Map<Integer, Map<String, Float>>) new HashMap<Integer,Map<String,Float>>();
			for (Iterator i = root.attributeIterator(); i.hasNext();) {
				Attribute attribute = (Attribute) i.next();
				//System.out.println(attribute.getName()+"::"+attribute.getValue());
				 if(contorl==0){
					   contorl = 1;
					   continue;
				   }
				   if(contorl%2==0){
					   Map<String,Float> innermap = (Map<String, Float>) new HashMap<String,Float>();
					   mark = Float.parseFloat(attribute.getValue());
					   Integer key = Integer.parseInt(attribute.getName().split("_")[1]);
					   innermap.put(prefix, mark);
					   outmap.put(key, innermap);
				   }else{
					    prefix= attribute.getValue(); //b
				   }
				   contorl +=1;
				//需要tmId(gdsj表里的tmId就能表示每一道题)和考试成绩Id(先增加考试成绩表返回id)	
			}
			//录入考生针对某个题的问答情况(成绩id对应每个考生)
			for(Map.Entry<Integer,Map<String,Float>> entry:outmap.entrySet()){
				ClerkGdksTm clerkGdksTm = new ClerkGdksTm();
				clerkGdksTm.setClerkKscjId(clerkKscjId);
				clerkGdksTm.setGdsjId(entry.getKey());
				Map<String,Float> inmap = entry.getValue();
				for(Map.Entry<String, Float> inentry :inmap.entrySet()){
					clerkGdksTm.setClerkTmDa(inentry.getKey());
					clerkGdksTm.setTmWddf(inentry.getValue());
				}
				if(clerkGdksTmDao.add(clerkGdksTm)){
					str="saveSj";
				}
			}
		} catch (DocumentException e) {
			e.printStackTrace();
			}
		}else{
			str ="saveSj";
		}
		return str;
	}
	
	
}
