package org.yohta.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.yohta.dao.ITkclDao;
import org.yohta.vo.ClerkCl;
import org.yohta.vo.TkCl;
import org.yohta.vo.Tm;

public class TkclDaoImpl extends HibernateDaoSupport implements ITkclDao{
	/**
	 * 增加考试，返回试卷id
	 */
	@Override
	public int addTkCl(TkCl tkcl) {
		/*String sql = "insert into tk_cl(tk_cl_name,tk_cl_time,valid_btime,valid_etime,tk_cl_pf,allowSeePaper,isSavePaper,minKsNum,maxKsNum,isOrder,moveOutTimes,tk_cl_type,isAllow,totalScore,passFs) "
				+ "values('"+tkcl.getTkClName()+"','"+tkcl.getTkClTime()+"','"+tkcl.getValidBtime()+"','"+tkcl.getValidEtime()+"','"+tkcl.getTkClPf()+"',"
						+ "'"+tkcl.getAllowSeePaper()+"','"+tkcl.getIsSavePaper()+"','"+tkcl.getMinKsNum()+"','"+tkcl.getMaxKsNum()+"','"+tkcl.getIsOrder()+"',"
								+ "'"+tkcl.getMoveOutTimes()+"','"+tkcl.getTkClType()+"','"+tkcl.getIsAllow()+"','"+tkcl.getTotalScore()+"','"+tkcl.getPassFS()+"')";
				
		
		*/
	    //Object[] values = new Object[]{map.get("tkjid"),map.get("tkid"),map.get("tx")};
	   // Query query = this.getSessionFactory().getCurrentSession().createSQLQuery(sql);
	   //// query.executeUpdate();
	    //查询插入记录的id。。。（bug）
	   // String hql = "select tkClId from TkCl where tkClName= ? and tkClTime = ? and validBtime = ? and validEtime = ?";
	  //  Query queryHql = this.getSessionFactory().getCurrentSession().createQuery(hql);
	  //  queryHql.setParameter(0, tkcl.getTkClName());
	  /*  queryHql.setParameter(1, tkcl.getTkClTime());
	    queryHql.setParameter(2, tkcl.getValidBtime());
	    queryHql.setParameter(3, tkcl.getValidEtime());
	    Long tkclId = (Long) queryHql.uniqueResult();*/
		this.getHibernateTemplate().save(tkcl);
	    //System.out.println("11111111111"+tkcl.getTkClId());
		return tkcl.getTkClId();
	}
	/**
	 * 查看考试试卷根据考试id
	 */
	@Override
	public TkCl findTkClByClerkId(int tkclId) {
		List<TkCl> list = new ArrayList<TkCl>();
		list = (List<TkCl>) this.getHibernateTemplate().find("From TkCl where tkClId = ?", new Object[]{tkclId});
		return list.get(0);
	}
	/**
	 * 查找所有考试
	 */
	@Override
	public List<TkCl> findAllTkcl() {
		List<TkCl> list = (List<TkCl>) this.getHibernateTemplate().find("From TkCl");
		return list;
	}
	@Override
	public boolean delete(int tkclId) {
		TkCl tkcl = new TkCl();
		tkcl.setTkClId(tkclId);
		this.getHibernateTemplate().delete(tkcl);
		return true;
	}
	/**
	 * 修改isAllow
	 */
	@Override
	public boolean update(int tkclId,int isAllow) {
		String hql = "update TkCl set isAllow = "+ isAllow +" where tkClId = "+tkclId; 
		Query query = this.getHibernateTemplate().getSessionFactory().getCurrentSession().createQuery(hql);
		query.executeUpdate();
		return true;
	}

}
