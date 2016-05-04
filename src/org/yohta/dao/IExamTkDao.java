package org.yohta.dao;

import java.util.List;

import org.yohta.vo.Tk;

public interface IExamTkDao {
	public List<Tk> findAllTk();
	public List<Tk> findTkByTkjId(int tkjId);
}
