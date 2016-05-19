package org.yohta.service;

import java.util.List;

import org.yohta.vo.Clerk;

public interface IClerkService {
	public List<Clerk> list();
	public String delete(int clerkId);
	public String add(Clerk clerk);
	public String modify(Clerk clerk);
}
