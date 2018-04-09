/** 
 * Project Name:web-test 
 * File Name:PubResGrid.java 
 * Package Name:com.htcf.frame.web.bean 
 * Date:2016年12月6日下午3:40:38 
 * Copyright (c) 2016, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.model.vo;

import com.htcf.system.model.bo.PubZzjgBo;

/**
 * 
 * ClassName: PubZzjgGrid <br/> 
 * Function: 组织机构表格对象. <br/> 
 * Reason: TODO ADD REASON(可选). <br/> 
 * date: 2016年12月26日 下午5:53:51 <br/> 
 * 
 * @author cs
 */
public class PubZzjgGrid extends PubZzjgBo implements Comparable <PubZzjgGrid> {
	
	private static final long serialVersionUID = 1L;
	private String id;
	private String parent;
    private boolean expanded;
    private int order;
    
	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}
	/**
	 * @return the parent
	 */
	public String getParent() {
		return parent;
	}
	/**
	 * @param parent the parent to set
	 */
	public void setParent(String parent) {
		this.parent = parent;
	}
	/**
	 * @return the expanded
	 */
	public boolean isExpanded() {
		return expanded;
	}
	/**
	 * @param expanded the expanded to set
	 */
	public void setExpanded(boolean expanded) {
		this.expanded = expanded;
	}
	/**
	 * @return the order
	 */
	public int getOrder() {
		return order;
	}
	/**
	 * @param order the order to set
	 */
	public void setOrder(int order) {
		this.order = order;
	}
	/**
	 * @return the serialversionuid
	 */
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	/**
	 * 重写排序
	 * @param o
	 * @return int
	 * @see java.lang.Comparable#compareTo(java.lang.Object)
	 */
	@Override
	public int compareTo(PubZzjgGrid o) {
		int level1 = this.getLevel();
		int level2 = o.getLevel();
		long order1 = this.getOrder();
		long order2 = o.getOrder();
		if (level1 == level2) {
			if (order1 > order2) {
				return 1;
			} else if (order1 < order2) {
				return -1;
			} else {
				// 比较同级别的数据，通过dwdm进行比较
				String dwdm1 = this.getDwdm();
				String dwdm2 = o.getDwdm();
				return dwdm1.compareTo(dwdm2);
			}
		} else if (level1 > level2) {
			return 1;
		} else if (level1 < level2) {
			return -1;
		}
		return 0;
	}
    

}

