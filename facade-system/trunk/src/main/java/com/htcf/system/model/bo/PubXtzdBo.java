/** 
 * Project Name:mybatis-generator 
 * File Name:PubXtzdBo.java 
 * Package Name:com.htcf.system.model.bo 
 * Date:2017-2-7 16:05:04 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.model.bo;

import java.util.ArrayList;
import java.util.List;

import com.htcf.system.model.po.PubXtzd;

/** 
 * ClassName: PubXtzdBo <br/> 
 * Function: TODO ADD FUNCTION. <br/> 
 * Reason: TODO ADD REASON(可选). <br/> 
 * date: 2016年12月6日 上午10:49:09 <br/> 
 * 
 * @author chenshizhe 
 */
public class PubXtzdBo extends PubXtzd {
	
	

	/**
	 * 是否为叶子节点.
	 */
	private Boolean isLeaf;

	/**
	 * 子节点列表.
	 */
	private List<PubXtzdBo> children = new ArrayList<PubXtzdBo>();


	/**
	 * Gets the checks if is leaf.
	 *
	 * @return the checks if is leaf
	 */
	public Boolean getIsLeaf() {
		return isLeaf;
	}

	/**
	 * Sets the checks if is leaf.
	 *
	 * @param isLeaf the new checks if is leaf
	 */
	public void setIsLeaf(Boolean isLeaf) {
		this.isLeaf = isLeaf;
	}

	/**
	 * Gets the children.
	 *
	 * @return the children
	 */
	public List<PubXtzdBo> getChildren() {
		return children;
	}

	/**
	 * Sets the children.
	 *
	 * @param children the new children
	 */
	public void setChildren(List<PubXtzdBo> children) {
		this.children = children;
	}
	
}
