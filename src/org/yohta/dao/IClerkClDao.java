package org.yohta.dao;

import java.util.List;

import org.yohta.vo.ClerkCl;

public interface IClerkClDao {
	public List<ClerkCl> findClerkClByClerkId(int clerkId);
}
