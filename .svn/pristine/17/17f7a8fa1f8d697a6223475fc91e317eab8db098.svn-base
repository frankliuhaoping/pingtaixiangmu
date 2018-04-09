/** 
 * Project Name:common-web 
 * File Name:MenuItem.java 
 * Package Name:com.htcf.frame.web.model.vo 
 * Date:2016-12-27 13:01:20 
 * Copyright (c) 2016, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.demo.web.model.vo;

import java.io.Serializable;
import java.util.List;

/**
 * 
 * ClassName: MenuItem <br/>
 * Function: 目录菜单. <br/>
 * date: 2016-12-27 13:01:20 <br/>
 *
 * @author lizhuo
 */
public class MenuItem implements Comparable<MenuItem>, Serializable {

	/**
	 * serialVersionUID.
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 目录 id.
	 */
	private String id;

	/**
	 * 目录url.
	 */
	private String url;

	/**
	 * 目录标题.
	 */
	private String title;

	/**
	 * 目录图标class.
	 */
	private String iconClass;

	/**
	 * 是否激活.
	 */
	private boolean active;

	/**
	 * 排序.
	 */
	private int order;

	/**
	 * 上级目录.
	 */
	private String parent;

	/**
	 * 下级目录列表.
	 */
	private List<MenuItem> children;

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
	 * @param id the new id
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * Gets the url.
	 *
	 * @return the url
	 */
	public String getUrl() {
		return url;
	}

	/**
	 * Sets the url.
	 *
	 * @param url the new url
	 */
	public void setUrl(String url) {
		this.url = url;
	}

	/**
	 * Gets the title.
	 *
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * Sets the title.
	 *
	 * @param title the new title
	 */
	public void setTitle(String title) {
		this.title = title;
	}

	/**
	 * Gets the iconClass.
	 *
	 * @return the iconClass
	 */
	public String getIconClass() {
		return iconClass;
	}

	/**
	 * Sets the iconClass.
	 *
	 * @param iconClass the new iconClass
	 */
	public void setIconClass(String iconClass) {
		this.iconClass = iconClass;
	}

	/**
	 * Gets the active.
	 *
	 * @return the active
	 */
	public boolean getActive() {
		return active;
	}

	/**
	 * Sets the active.
	 *
	 * @param active the new active
	 */
	public void setActive(boolean active) {
		this.active = active;
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
	 * @param order the new order
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
	 * @param parent the new parent
	 */
	public void setParent(String parent) {
		this.parent = parent;
	}

	/**
	 * Gets the children.
	 *
	 * @return the children
	 */
	public List<MenuItem> getChildren() {
		return children;
	}

	/**
	 * Sets the children.
	 *
	 * @param children the new children
	 */
	public void setChildren(List<MenuItem> children) {
		this.children = children;
	}

	/**
	 * 重写compareTo方法，根据order进行排序
	 * 
	 * @param o
	 * @return int
	 * @see java.lang.Comparable#compareTo(java.lang.Object)
	 */
	public int compareTo(MenuItem o) {
		int order1 = this.order;
		int order2 = o.getOrder();
		if (order1 > order2) {
			return 1;
		} else if (order1 < order2) {
			return -1;
		} else {
			return 0;
		}
	}

}
