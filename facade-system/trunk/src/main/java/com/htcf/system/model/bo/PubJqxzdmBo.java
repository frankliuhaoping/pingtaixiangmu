/** 
 * Project Name:facade-system 
 * File Name:PubJqxzdmBo.java 
 * Package Name:com.htcf.system.model.bo 
 * Date:2016年12月6日 上午10:49:09 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.model.bo;

import java.util.ArrayList;
import java.util.List;

import com.htcf.system.model.po.PubJqxzdm;

/**
 * ClassName: PubJqxzdmBo <br/>
 * Function: 警情性质业务类. <br/>
 * date: 2016年12月6日 上午10:49:09 <br/>
 * 
 * @author chenshizhe
 */
public class PubJqxzdmBo extends PubJqxzdm {


	/**
	 * 是否为叶子节点.
	 */
	private Boolean isLeaf;
	
	
	private Integer level;

	/**
	 * 子节点列表.
	 */
	private List<PubJqxzdmBo> children = new ArrayList<PubJqxzdmBo>();


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
	public List<PubJqxzdmBo> getChildren() {
		return children;
	}

	/**
	 * Sets the children.
	 *
	 * @param children the new children
	 */
	public void setChildren(List<PubJqxzdmBo> children) {
		this.children = children;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

}
