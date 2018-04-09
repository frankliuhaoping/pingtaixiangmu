/** 
 * Project Name:facade-system 
 * File Name:PubResGrid.java 
 * Package Name:com.htcf.system.model.vo 
 * Date:2017-2-7 16:39:33 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.model.vo;

import com.htcf.system.model.bo.PubResBo;

/**
 * ClassName: PubResGrid <br/>
 * Function: 权限资源表格对象. <br/>
 * date: 2016年12月6日 下午3:40:38 <br/>
 * 
 * @author lizhuo
 */
public class PubResGrid extends PubResBo implements Comparable<PubResGrid> {

	/**
	 * serialVersionUID.
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 资源ID.
	 */
	private String id;

	/**
	 * 父级资源.
	 */
	private String parent;

	/**
	 * 是否展开.
	 */
	private boolean expanded;

	/**
	 * 排序.
	 */
	private int order;

	/**
	 * Gets the id.
	 *
	 * @return the id
	 */
	public String getId() {
		return id;
	}

	/**
	 * Sets the id.
	 *
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * Gets the order.
	 *
	 * @return the order
	 */
	public int getOrder() {
		return order;
	}

	/**
	 * Sets the order.
	 *
	 * @param order the order to set
	 */
	public void setOrder(int order) {
		this.order = order;
	}

	/**
	 * Gets the parent.
	 *
	 * @return the parent
	 */
	public String getParent() {
		return parent;
	}

	/**
	 * Sets the parent.
	 *
	 * @param parent the parent to set
	 */
	public void setParent(String parent) {
		this.parent = parent;
	}

	/**
	 * Checks if is expanded.
	 *
	 * @return the expanded
	 */
	public boolean isExpanded() {
		return expanded;
	}

	/**
	 * Sets the expanded.
	 *
	 * @param expanded the expanded to set
	 */
	public void setExpanded(boolean expanded) {
		this.expanded = expanded;
	}

	/**
	 * 重写compareTo方法，用于排序
	 * 
	 * @param o
	 * @return int
	 * @see java.lang.Comparable#compareTo(java.lang.Object)
	 */
	@Override
	public int compareTo(PubResGrid o) {
		int level1 = this.getLevel();
		int level2 = o.getLevel();
		int order1 = this.getOrder();
		int order2 = o.getOrder();
		if (level1 == level2) {
			if (order1 > order2) {
				return 1;
			} else if (order1 < order2) {
				return -1;
			}
		} else if (level1 > level2) {
			return 1;
		} else if (level1 < level2) {
			return -1;
		}
		return 0;
	}
}
