package org.yohta.dao;

import java.util.List;

import org.yohta.vo.ClerkKscj;

public interface IClerkKscjDao {
	public int insert(ClerkKscj clerkKscj);
	public List<ClerkKscj> findByTkclId(int tkclId);
	public boolean update(int status,float wddf,String clerkPj,int clerkKscjId);
	public int updateKscj(ClerkKscj clerkKscj);
	public List<ClerkKscj> findClerkKscjsByTkclIdAndClerkId(int tkclId,int clerkId);
}
