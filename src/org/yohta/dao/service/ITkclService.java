package org.yohta.service;

import java.util.List;

import org.yohta.vo.TkCl;

public interface ITkclService {
	/**
	 * 根据考生id查看该考生所能考试的试卷
	 * @param clerkId
	 * @return
	 */
	 public List<TkCl> findTkClByClerkId(int clerkId);
}
