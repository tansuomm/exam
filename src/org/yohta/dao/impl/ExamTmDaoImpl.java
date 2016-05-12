package org.yohta.dao.impl;

import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.yohta.dao.IExamTmDao;
import org.yohta.utils.PageResult;
import org.yohta.vo.TMTX;
import org.yohta.vo.TkClNdzsd;
import org.yohta.vo.Tm;

public class ExamTmDaoImpl extends HibernateDaoSupport implements IExamTmDao {
	/**
	 * 添加题目
	 */
	@Override
	public boolean addTm(Tm tm) {
		//System.out.println(tm.toString());
		this.getHibernateTemplate().save(tm);
		return true;
	}
	/**
	 * 删除题目
	 */
	@Override
	public boolean deleteTm(int tmId) {
		Tm tm = new Tm();
		tm.setTmId(tmId);
		this.getHibernateTemplate().delete(tm);
		return true;
	}
	/**
	 * 修改题目
	 */
	@Override
	public boolean updateTm(Tm tm) {
		this.getHibernateTemplate().update(tm);
		return true;
	}
	/**
	 * 根据id查到题目
	 */
	@Override
	public Tm findByTmId(int tmId) {
		Tm tm = this.getHibernateTemplate().load(Tm.class, tmId);
		return tm;
	}
	/**
	 * 查找所有题目
	 */
/*	@Override
	public List<Tm> list() {
		@SuppressWarnings("unchecked")
		List<Tm> list = (List<Tm>) this.getHibernateTemplate().find("From Tm");
		return list;
	}*/
	/**
	 * 分页查找,模糊查询
	 */
	@Override
	public void queryByPage(PageResult pageResult, String hql,Object[] values) {
		Query query = this.getSessionFactory().getCurrentSession().createQuery(hql);
		
		for(int i =0;i<values.length;i++){
			query.setParameter(i, values[i]);
		}
		//共多少条
		pageResult.setTotalNum(query.list().size());
		//每页多少条1
		query.setMaxResults(pageResult.getPageSize());
		//从多少条开始2
		query.setFirstResult((pageResult.getCurrentPage()-1)*pageResult.getPageSize());
		//需要显示的数据
		pageResult.setList(query.list());
	}
	/**
	 * 更具出题策略随机抽题
	 */
	@Override
	public List<Tm> findTmsByTkclNdzsd(TkClNdzsd cl) {
		String sql = "select * from Tm tm left join Tk tk on tm.tk.tkId = tk.tkId left join Tkj tkj on tk.tkj.tkjId = tkj.tkjId where 1 = 1";
		if(cl.getTkTkjId()!=0){
			sql = sql+"and tkj.tkjId ="+cl.getTkTkjId() ;
		}if(cl.getTkLxId()!=0){
			sql = sql + "tk.tkId="+cl.getTkLxId();
		}
		sql = sql + "and tm.tmType="+ cl.getTmTxId() +"order by RAND() LIMIT 0,"+cl.getTmNum();
		System.out.println("随机抽题sql"+sql);
	    @SuppressWarnings("unchecked")
		List<Tm> list = (List<Tm>) this.getHibernateTemplate().find(sql);
		return list;
	}
	/**
	 * 根据题库Id在题目表里找到知识点
	 */
	@Override
	public List<String> findZsdByTkId(int tkjId, int tkId) {
		Object[] values = new Object[]{tkjId,tkId};
	    List<String> list = (List<String>) this.getHibernateTemplate().find("select DISTINCT(tmZsd)From Tm tm where tm.tk.tkj.tkjId = ?and tm.tk.tkId = ?", values);
		return list;
	}
	/**
	 * 查询题目题型和数量
	 */
	@Override
	public List<TMTX> findTmByTkjIdTkIdZsd(Map<String, Object> map) {
		String hql = " select tm.tm_type as tm_tx_id, count(tm_type) as tm_tx_num from Tm tm left join Tk tk "
				+ "on tm.tk_id = tk.tk_id left join Tkj tkj "
				+ "on tk.tkj_id = tkj.tkj_id "
				+ "where 1=1 and tkj.tkjId=? and tk.tkId =? and tm.tmZsd = ? and tm.tmNd = ? and tm.tmType = ? group by tm.tmType";
	    Object[] values = new Object[]{map.get("tkjid"),map.get("tkid"),map.get("zsd"),map.get("nd"),map.get("tx")};
	    List<TMTX> list = (List<TMTX>) this.getHibernateTemplate().find(hql, values);
		return list;
	}

}
