package org.yohta.dao;

import java.util.List;
import java.util.Map;

import org.yohta.utils.PageResult;
import org.yohta.vo.TMTX;
import org.yohta.vo.TkClNdzsd;
import org.yohta.vo.Tm;

public interface IExamTmDao {
	//增加题目
	public boolean addTm(Tm tm);
	//删除题目
	public boolean deleteTm(int tmId);
	//修改题目
	public boolean updateTm(Tm tm);
	//查找单个byid
	public Tm findByTmId(int tmId);
	//查找所有题目
	//public List<Tm> list();
	//分页查找,模糊查询
	public void queryByPage(PageResult pageResult,String hql,Object[] values);
	/**
	 * 根据出题策略抽取题目
	 * @param cl 出题策略的实体类 
	 * @return
	 */
	public List<Tm> findTmsByTkclNdzsd(TkClNdzsd cl);
	
	/**
	 * 根据题库Id在题目表里找到知识点
	 * @param tkId
	 * @return
	 */
	public List<String> findZsdByTkId(int tkjId,int tkId);
	
	/**
	 * 根据题库集Id题库Id知识点题目题型抽题
	 * @return
	 * @throws Exception
	 */
	public List<TMTX> findTmByTkjIdTkIdZsd(Map<String, Object> map);
}
