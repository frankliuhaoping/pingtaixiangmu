/** 
 * Project Name:facade-system 
 * File Name:PubUserBo.java 
 * Package Name:com.htcf.system.model.bo 
 * Date:2016年12月1日 上午11:39:25 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.model.bo;

import java.util.List;

import com.htcf.system.model.po.PubRes;
import com.htcf.system.model.po.PubRole;
import com.htcf.system.model.po.PubUser;

/**
 * 
 * ClassName: PubUserBo <br/>
 * Function: 用户Bo <br/>
 * Reason: ADD REASON(可选). <br/>
 * date: 2016年12月1日 上午11:39:25 <br/>
 * 
 * @author ZhangGuihua
 */
public class PubUserBo extends PubUser {

	/**
	 * 角色.
	 */
	private List<PubRole> pubRoleList;

	/**
	 * 资源.
	 */
	private List<PubRes> pubResList;

	/**
	 * 角色使用标记*.
	 */
	private String jsid;

	/**
	 * jsmc:TODO(角色名称集合).
	 */
	private String jsmcs;
	
	
	private String jsmc;

	/**
	 * @return the jsmc
	 */
	public String getJsmc() {
		return jsmc;
	}

	/**
	 * @param jsmc the jsmc to set
	 */
	public void setJsmc(String jsmc) {
		this.jsmc = jsmc;
	}

	/**
	 * @return the jsmcs
	 */
	public String getJsmcs() {
		return jsmcs;
	}

	/**
	 * @param jsmcs the jsmcs to set
	 */
	public void setJsmcs(String jsmcs) {
		this.jsmcs = jsmcs;
	}

	/**
	 * getPubRoleList
	 *
	 * @return List<PubRole>
	 */
	public List<PubRole> getPubRoleList() {
		return pubRoleList;
	}

	/**
	 * setPubRoleList
	 *
	 * @param pubRoleList void
	 */
	public void setPubRoleList(List<PubRole> pubRoleList) {
		this.pubRoleList = pubRoleList;
	}

	/**
	 * getPubResList
	 *
	 * @return List<PubRes>
	 */
	public List<PubRes> getPubResList() {
		return pubResList;
	}

	/**
	 * setPubResList
	 *
	 * @param pubResList void
	 */
	public void setPubResList(List<PubRes> pubResList) {
		this.pubResList = pubResList;
	}

	/**
	 * Gets the jsid.
	 *
	 * @return the jsid
	 */
	public String getJsid() {
		return jsid;
	}

	/**
	 * Sets the jsid.
	 *
	 * @param jsid the jsid to set
	 */
	public void setJsid(String jsid) {
		this.jsid = jsid;
	}

}
