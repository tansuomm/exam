package org.yohta.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.yohta.dao.IExamTkDao;
import org.yohta.dao.IExamTkjDao;
import org.yohta.dao.IExamTmDao;
import org.yohta.service.IExamTmService;
import org.yohta.utils.PageResult;
import org.yohta.utils.PrintString;
import org.yohta.vo.TMTX;
import org.yohta.vo.Tk;
import org.yohta.vo.Tkj;
import org.yohta.vo.Tm;

import com.alibaba.fastjson.JSON;

import net.sf.json.JSONObject;

public class ExamTmServiceImpl implements IExamTmService {
	/**
	 * 添加题目前查找对应的题库和题库集
	 */
	@Override
	public String addTmPre() {
		String status = "input";
		try {
			
			List<Tk> list1 = tkDao.findAllTk();
			List<Tkj> list = tkjDao.findAll();
			ServletActionContext.getRequest().setAttribute("tkjList", list);;
			ServletActionContext.getRequest().setAttribute("tkList", list1);
		} catch (Exception e) {
			e.printStackTrace();
		}

		status = "addPre";
		return status;
	}

	@Override
	public String addTm(Tm tm) {
		String resultStr = "input";
		if (tmDao.addTm(tm)) {
			resultStr = "add";
		}

		return resultStr;
	}

	/**
	 * 删除题目
	 */
	@Override
	public String delete(int tmId) {
		String resultStr = "input";
		if (tmDao.deleteTm(tmId)) {
			resultStr = "delete";
		}
		return resultStr;
	}

	/**
	 * 修改题目前
	 */
	@Override
	public String updateTmPre(int tmId) {
		Tm tm = new Tm();
		tm = tmDao.findByTmId(tmId);
		ServletActionContext.getRequest().setAttribute("tm", tm);
		// 回写到修改题目表单里面。。。
		List<Tkj> list = tkjDao.findAll();
		ServletActionContext.getRequest().setAttribute("tkjList", list);
		int tkjId = tm.getTk().getTkj().getTkjId();
		List<Tk> list1 = tkDao.findTkByTkjId(tkjId);
		ServletActionContext.getRequest().setAttribute("tkList", list1);

		return "updatePre";
	}

	/**
	 * 修改题目
	 */
	@Override
	public String update(Tm tm) {
		String resultStr = "input";
		if (tmDao.updateTm(tm)) {
			resultStr = "update";
		}
		return resultStr;
	}

	/**
	 * 查出所有题目列表
	 */
/*	@Override
	public String list() {
		List<Tm> list = tmDao.list();
		ServletActionContext.getRequest().setAttribute("list", list);
		return "list";
	}*/
	/**
	 * 分页查询,模糊查询
	 */
	@Override
	public String queryByPage(PageResult pageResult,Tm tm) {
		getTkj();
		String hql = "From Tm tm where 1 = 1 ";
		List list = new ArrayList();
		if(tm!=null){
			if(tm.getTmName()!=null &&!"".equals(tm.getTmName())){
				hql += "and tm.tmName like ?";
				list.add("%"+tm.getTmName()+"%");
			}
			if(tm.getTk()!=null){
				if(tm.getTk().getTkj().getTkjId()!=null&&tm.getTk().getTkj().getTkjId()!=0){
					hql+="and tm.tk.tkj.tkjId = ?";
					list.add(tm.getTk().getTkj().getTkjId());
					List<Tk> listTk= new ArrayList<Tk>();
					listTk = tkDao.findTkByTkjId(tm.getTk().getTkj().getTkjId());
					ServletActionContext.getRequest().setAttribute("listTk", listTk);
				}
				if(tm.getTk().getTkId()!=null &&tm.getTk().getTkId()!=0){
					hql +="and tm.tk.tkId = ?";
					list.add(tm.getTk().getTkId());
				}
			}
		}
		tmDao.queryByPage(pageResult, hql,list.toArray());
		//ServletActionContext.getRequest().setAttribute("list", list);
		return "list";
	}
	private IExamTkjDao tkjDao;
	private IExamTkDao tkDao;
	private IExamTmDao tmDao;

	public void setTmDao(IExamTmDao tmDao) {
		this.tmDao = tmDao;
	}

	public void setTkjDao(IExamTkjDao tkjDao) {
		this.tkjDao = tkjDao;
	}

	public void setTkDao(IExamTkDao tkDao) {
		this.tkDao = tkDao;
	}

	@Override
	/**
	 * 根据题库Id在题目表里找到知识点
	 * @param tkId
	 * @return
	 */
	/*public String findZsdByTkId(int tkjid, int tkId) {
		List<String> list = new ArrayList<String>();
		list = tmDao.findZsdByTkId(tkjid, tkId);
		
		StringBuffer sBuffer = new StringBuffer();
		sBuffer.append("<option value='所有'>所有</option>");
		for(String tmZsd : list){
			sBuffer.append("<option value='" + tmZsd + "'>" + tmZsd + "</option>");
		}		
		PrintString.printStr((sBuffer.toString()));		
		return null;
	}
*/
	/**
	 * 根据题库集Id题库Id知识点题目题型抽题
	 * @return
	 * @throws Exception
	 */
	public String findTmByTkjIdTkId(int tkjid, int tkid, String tx1) {
		String[] tx2 = tx1.split(",");
		int tx = 0;
		List<TMTX> list = new ArrayList<TMTX>();
		for(int i = 0;i<tx2.length;i++){
			Map<String, Object> map = new HashMap<String, Object>();
			tx = Integer.parseInt(tx2[i]);
			//System.out.println("bbbbbbbbbbbbbbbb"+tx+"||"+tkjid+"||"+tkid);
			map.put("tkjid", tkjid);
			map.put("tkid", tkid);
			map.put("tx", tx);
			
			int tm_tx_num  = tmDao.findTmByTkjIdTkId(map);
			TMTX tmtx = new TMTX();
			tmtx.setTmTxId(tx);
			tmtx.setTmTxNum(tm_tx_num);
			list.add(tmtx);			
		}
		
		
		
		//通过题库集Id 题库Id 得到 题库集名称 和 题库的名称
		Tkj tkj = new Tkj();
		//System.out.println("aaaaaaaaaaaaaaaaaaa"+tkjid);
		tkj = tkjDao.findById(tkjid);
		
		//{"tkjName":"计算机系","list":[{"tmTxId":1,"tmTxNum":4},{"tmTxId":2,"tmTxNum":1},{"tmTxId":3,"tmTxNum":1}]}
		Map<String, Object> resultMap = new HashMap<String, Object>();
		//题库集名称
		resultMap.put("tkjName", tkj.getTkjName());
		//题目题型的集合
		resultMap.put("list", list);		
		//把集合变成json串
		//JSONObject json = JSONObject.fromObject(resultMap);
		String json = JSON.toJSONString(resultMap);
		//System.out.println(json);
		PrintString.printStr(json);
		
		return null;
	}
	public void getTkj(){
		List<Tkj> list = new ArrayList<Tkj>();
		list = tkjDao.findAll();
		ServletActionContext.getRequest().setAttribute("tkjList", list);
		
	}

}
