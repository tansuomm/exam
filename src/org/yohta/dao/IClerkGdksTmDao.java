package org.yohta.dao;

import java.util.List;

import org.yohta.vo.ClerkGdksTm;

public interface IClerkGdksTmDao {
	public boolean add(ClerkGdksTm clerkGdksTm);
	public List<ClerkGdksTm> findListByClerkKscjId(int clerkKscjId);
	public boolean update(int clerkKscjId,int gdsjId,float tmWddf);
}
