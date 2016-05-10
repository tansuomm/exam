package org.yohta.utils;

import java.util.List;

public class PageResult {
	//当前页
	private int currentPage = 1;
	//数据总数
	private int totalNum = 0;
	//每页条数
	private int pageSize =10;
	//共多少页
	private int pageCount=1;
	//每页显示数据
	private List list;
	public int getTotalNum() {
		return totalNum;
	}
	public void setTotalNum(int totalNum) {
		this.totalNum = totalNum;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public List getList() {
		return list;
	}
	public void setList(List list) {
		this.list = list;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	/**
	 * 当前第几页
	 * @return
	 */
	public int getCurrentPage(){
		if(this.currentPage<=0){
			this.currentPage=1;
		}
		if(this.currentPage>=this.getPageCount()){
			this.currentPage=this.getPageCount();
		}
		return this.currentPage;
	}
	/**
	 * 得到页面总数
	 * @return
	 */
	public int getPageCount() {
		//this.pageCount=(totalNum%pageSize==0) ? totalNum/pageSize : (totalNum/pageSize+1);
		if(this.totalNum>0){
			if(this.totalNum%this.pageSize>0){
				this.pageCount=this.totalNum/this.pageSize+1;
			}else{
				this.pageCount=this.totalNum/this.pageSize;
			}
		}
		return this.pageCount;
	}
	
	
}
