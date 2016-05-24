package org.yohta.dao;

import java.util.List;

import org.yohta.vo.ClerkKscj;

public interface IClerkKscjDao {
	public int insert(ClerkKscj clerkKscj);
	public List<ClerkKscj> findByTkclId(int tkclId);
}
