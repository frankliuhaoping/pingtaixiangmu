/** 
 * Project Name:facade-system 
 * File Name:PubResBo.java 
 * Package Name:com.htcf.system.model.bo 
 * Date:2016年12月1日 下午1:39:08
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.model.bo;

import java.util.ArrayList;
import java.util.List;

import com.htcf.system.model.po.PubRes;

/**
 * ClassName: PubResBo <br/>
 * Function: 资源BO <br/>
 * date: 2016年12月1日 下午1:39:08 <br/>
 *
 * @author zhangyingzi
 */
public class PubResBo extends PubRes {

	/**
	 * 当前处于树的第几层
	 */
	private Integer level;

	/**
	 * 是否为叶子节点.
	 */
	private Boolean isLeaf;

	/**
	 * 子节点列表.
	 */
	private List<PubResBo> children = new ArrayList<PubResBo>();

	/**
	 * Gets the level.
	 *
	 * @return the level
	 */
	public Integer getLevel() {
		return level;
	}

	/**
	 * Sets the level.
	 *
	 * @param level the new level
	 */
	public void setLevel(Integer level) {
		this.level = level;
	}

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
	public List<PubResBo> getChildren() {
		return children;
	}

	/**
	 * Sets the children.
	 *
	 * @param children the new children
	 */
	public void setChildren(List<PubResBo> children) {
		this.children = children;
	}

}
