/** 
 * Project Name:facade-system 
 * File Name:PubXtzdGrid.java 
 * Package Name:com.htcf.system.model.vo 
 * Date:2017年3月10日 下午4:03:00
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.model.vo;

import com.htcf.system.model.bo.PubXtzdBo;

/**
 * ClassName: PubXtzdGrid <br/>
 * Function: 系统字典表格对象. <br/>
 * date: 2017年3月10日 下午4:03:00 <br/>
 * 
 * @author wuwei
 */
public class PubXtzdGrid extends PubXtzdBo implements Comparable<PubXtzdGrid> {

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
	private long order;
	
	/**
	 * 当前处于树的第几层
	 */
	private Integer level;

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
	public long getOrder() {
		return order;
	}

	/**
	 * Sets the order.
	 *
	 * @param order the order to set
	 */
	public void setOrder(long order) {
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
	 * @return the level
	 */
	public Integer getLevel() {
		return level;
	}

	/**
	 * @param level the level to set
	 */
	public void setLevel(Integer level) {
		this.level = level;
	}

	/**
	 * 重写compareTo方法，用于排序
	 * 
	 * @param o
	 * @return int
	 * @see java.lang.Comparable#compareTo(java.lang.Object)
	 */
	@Override
	public int compareTo(PubXtzdGrid o) {
		int level1 = this.getLevel();
		int level2 = o.getLevel();
		long order1 = this.getOrder();
		long order2 = o.getOrder();
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
