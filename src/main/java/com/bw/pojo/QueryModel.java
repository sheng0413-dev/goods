package com.bw.pojo;

public class QueryModel {
	private int pageNum;
	private int pageSize=2;
	private String key;
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public QueryModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
