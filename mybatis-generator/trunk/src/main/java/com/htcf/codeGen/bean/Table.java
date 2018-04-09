package com.htcf.codeGen.bean;

import java.util.List;

public class Table {
	private String name;//表名
	private String seqName;//对应的序列名
	private String comments;//注释
	private String clzName;//实体类名
	private String priKey;//主键
	private List<Col> colList;//字段列表
	
	public String getComments() {
		return comments;
	}
	public String getPriKey() {
		return priKey;
	}
	public String getSeqName() {
		return seqName;
	}
	public void setSeqName(String seqName) {
		this.seqName = seqName;
	}
	public void setPriKey(String priKey) {
		this.priKey = priKey;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public List<Col> getColList() {
		return colList;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getClzName() {
		return clzName;
	}
	public void setClzName(String clzName) {
		this.clzName = clzName;
	}
	public void setColList(List<Col> colList) {
		this.colList = colList;
	}
}
