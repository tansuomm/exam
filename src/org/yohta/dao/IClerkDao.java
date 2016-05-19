package org.yohta.dao;

import java.util.List;

import org.yohta.vo.Clerk;

public interface IClerkDao {
	public Clerk login(Clerk clerk);
	public Clerk findById(int clerkId);
	public List<Clerk> findAll();
	public boolean delete(int clerkId);
	public boolean add(Clerk clerk);
	public boolean update(Clerk clerk);
}
