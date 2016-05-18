package org.yohta.dao;

import java.util.List;

import org.yohta.vo.ClerkCl;
import org.yohta.vo.Organ;

public interface IClerkClDao {
	//通过班级id查找
	public List<ClerkCl> findClerkClByOrganId(int organId);
	//通过试卷id查找
	public List<ClerkCl> findClerkClByTkclId(int tkclId);
	public boolean save(ClerkCl clerkCl);
}
