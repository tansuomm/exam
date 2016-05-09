package org.yohta.action;

import org.yohta.utils.PageResult;

import com.opensymphony.xwork2.ActionSupport;

public class PageResultAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	protected PageResult pageResult = new PageResult();

	public PageResult getPageResult() {
		return pageResult;
	}

	public void setPageResult(PageResult pageResult) {
		this.pageResult = pageResult;
	}
}
