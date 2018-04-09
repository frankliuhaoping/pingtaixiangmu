/** 
 * Project Name:facade-system 
 * File Name:PubJqxzdm.java 
 * Package Name:com.htcf.system.model.po 
 * Date:2017-3-15 14:07:28 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.model.po;

import java.io.Serializable;
import java.util.Date;

/**
 *  
 * ClassName: PubJqxzdm <br/> 
 * Function: ADD FUNCTION. <br/> 
 * Reason: ADD REASON(可选). <br/> 
 * date: 2017-3-15 14:07:28 <br/> 
 *
 * @author lizhuo
 */
public class PubJqxzdm implements Serializable{
	
	/**
	 * 警情性质编号(默认与标准警情性质编号一样).
	 */
	private String jqxzbh;
	
	/**
	 * 警情性质简称
	 */
	private String jqxzjc;
	
	/**
	 * 警情性质简称拼音码.
	 */
	private String jqxzjcpym;
	
	/**
	 * 警情性质全称.
	 */
	private String jqxzqc;
	
	/**
	 * 标准警情性质编号.
	 */
	private String bzjqxzbh;
	
	/**
	 * 标准警情性质父编号
	 */
	private String bzjqxzfbh;
	
	/**
	 * @return the bzjqxzfbh
	 */
	public String getBzjqxzfbh() {
		return bzjqxzfbh;
	}

	/**
	 * @param bzjqxzfbh the bzjqxzfbh to set
	 */
	public void setBzjqxzfbh(String bzjqxzfbh) {
		this.bzjqxzfbh = bzjqxzfbh;
	}

	/**
	 * 标准警情性质名称.
	 */
	private String bzjqxzmc;
	
	/**
	 * 用户使用标志('Y':表示使用,'N':表示未使用).
	 */
	private String yhsybz110;

	/**
	 * 用户使用标志('Y':表示使用,'N':表示未使用).
	 */
	private String yhsybz122;
	
	/**
	 * 用户使用标志('Y':表示使用,'N':表示未使用).
	 */
	private String yhsybz120;
	
	/**
	 * 用户使用标志('Y':表示使用,'N':表示未使用).
	 */
	private String yhsybz119;
	
	/**
	 * 用户使用标志('Y':表示使用,'N':表示未使用).
	 */
	private String qtyhsybz;
	
	/**
	 * 警情性质预案地址.
	 */
	private String jqxzyaurl;
	
	/**
	 * The jjqxzdm.
	 */
	private String jjqxzdm;
	
	/**
	 * The jjqxzmc.
	 */
	private String jjqxzmc;
	
	/**
	 * The sjlydm.
	 */
	private String sjlydm;
	
	/**
	 * 1:省厅标准 2:地市标准.
	 */
	private String sjlyms;
	
	/**
	 * 排序代码.
	 */
	private Long pxdm;
	
	/**
	 * The sjbb.
	 */
	private Long sjbb;
	
	/**
	 * 使用标志('Y':表示使用,'N':表示未使用).
	 */
	private String sybz;
	
	/**
	 * The cjr.
	 */
	private String cjr;
	
	/**
	 * The cjsj.
	 */
	private Date cjsj;
	
	/**
	 * The gxr.
	 */
	private String gxr;
	
	/**
	 * The gxsj.
	 */
	private Date gxsj;

	/**
	 *  警情性质编号(默认与标准警情性质编号一样).
	 *
	 * @param jqxzbh the new jqxzbh
	 */
	public void setJqxzbh(String jqxzbh) {
		this.jqxzbh = jqxzbh;
	}
	
	/**
	 *  警情性质编号(默认与标准警情性质编号一样).
	 *
	 * @return the jqxzbh
	 */
	public String getJqxzbh() {
		return jqxzbh;
	}
	
	/**
	 *  警情性质简称.
	 *
	 * @param jqxzjc the new jqxzjc
	 */
	public void setJqxzjc(String jqxzjc) {
		this.jqxzjc = jqxzjc;
	}
	
	/**
	 *  警情性质简称.
	 *
	 * @return the jqxzjc
	 */
	public String getJqxzjc() {
		return jqxzjc;
	}
	
	/**
	 *  警情性质简称拼音码.
	 *
	 * @param jqxzjcpym the new jqxzjcpym
	 */
	public void setJqxzjcpym(String jqxzjcpym) {
		this.jqxzjcpym = jqxzjcpym;
	}
	
	/**
	 *  警情性质简称拼音码.
	 *
	 * @return the jqxzjcpym
	 */
	public String getJqxzjcpym() {
		return jqxzjcpym;
	}
	
	/**
	 *  警情性质全称.
	 *
	 * @param jqxzqc the new jqxzqc
	 */
	public void setJqxzqc(String jqxzqc) {
		this.jqxzqc = jqxzqc;
	}
	
	/**
	 *  警情性质全称.
	 *
	 * @return the jqxzqc
	 */
	public String getJqxzqc() {
		return jqxzqc;
	}
	
	/**
	 *  标准警情性质编号.
	 *
	 * @param bzjqxzbh the new bzjqxzbh
	 */
	public void setBzjqxzbh(String bzjqxzbh) {
		this.bzjqxzbh = bzjqxzbh;
	}
	
	/**
	 *  标准警情性质编号.
	 *
	 * @return the bzjqxzbh
	 */
	public String getBzjqxzbh() {
		return bzjqxzbh;
	}
	
	/**
	 *  标准警情性质名称.
	 *
	 * @param bzjqxzmc the new bzjqxzmc
	 */
	public void setBzjqxzmc(String bzjqxzmc) {
		this.bzjqxzmc = bzjqxzmc;
	}
	
	/**
	 *  标准警情性质名称.
	 *
	 * @return the bzjqxzmc
	 */
	public String getBzjqxzmc() {
		return bzjqxzmc;
	}
	
	/**
	 *  用户使用标志('Y':表示使用,'N':表示未使用).
	 *
	 * @param yhsybz110 the new yhsybz 110
	 */
	public void setYhsybz110(String yhsybz110) {
		this.yhsybz110 = yhsybz110;
	}
	
	/**
	 *  用户使用标志('Y':表示使用,'N':表示未使用).
	 *
	 * @return the yhsybz 110
	 */
	public String getYhsybz110() {
		return yhsybz110;
	}
	
	/**
	 *  用户使用标志('Y':表示使用,'N':表示未使用).
	 *
	 * @param yhsybz122 the new yhsybz 122
	 */
	public void setYhsybz122(String yhsybz122) {
		this.yhsybz122 = yhsybz122;
	}
	
	/**
	 *  用户使用标志('Y':表示使用,'N':表示未使用).
	 *
	 * @return the yhsybz 122
	 */
	public String getYhsybz122() {
		return yhsybz122;
	}
	
	/**
	 *  用户使用标志('Y':表示使用,'N':表示未使用).
	 *
	 * @param yhsybz120 the new yhsybz 120
	 */
	public void setYhsybz120(String yhsybz120) {
		this.yhsybz120 = yhsybz120;
	}
	
	/**
	 *  用户使用标志('Y':表示使用,'N':表示未使用).
	 *
	 * @return the yhsybz 120
	 */
	public String getYhsybz120() {
		return yhsybz120;
	}
	
	/**
	 *  用户使用标志('Y':表示使用,'N':表示未使用).
	 *
	 * @param yhsybz119 the new yhsybz 119
	 */
	public void setYhsybz119(String yhsybz119) {
		this.yhsybz119 = yhsybz119;
	}
	
	/**
	 *  用户使用标志('Y':表示使用,'N':表示未使用).
	 *
	 * @return the yhsybz 119
	 */
	public String getYhsybz119() {
		return yhsybz119;
	}
	
	/**
	 *  用户使用标志('Y':表示使用,'N':表示未使用).
	 *
	 * @param qtyhsybz the new qtyhsybz
	 */
	public void setQtyhsybz(String qtyhsybz) {
		this.qtyhsybz = qtyhsybz;
	}
	
	/**
	 *  用户使用标志('Y':表示使用,'N':表示未使用).
	 *
	 * @return the qtyhsybz
	 */
	public String getQtyhsybz() {
		return qtyhsybz;
	}
	
	/**
	 *  警情性质预案地址.
	 *
	 * @param jqxzyaurl the new jqxzyaurl
	 */
	public void setJqxzyaurl(String jqxzyaurl) {
		this.jqxzyaurl = jqxzyaurl;
	}
	
	/**
	 *  警情性质预案地址.
	 *
	 * @return the jqxzyaurl
	 */
	public String getJqxzyaurl() {
		return jqxzyaurl;
	}
	
	/**
	 * Sets the jjqxzdm.
	 *
	 * @param jjqxzdm the new jjqxzdm
	 */
	public void setJjqxzdm(String jjqxzdm) {
		this.jjqxzdm = jjqxzdm;
	}
	
	/**
	 * Gets the jjqxzdm.
	 *
	 * @return the jjqxzdm
	 */
	public String getJjqxzdm() {
		return jjqxzdm;
	}
	
	/**
	 * Sets the jjqxzmc.
	 *
	 * @param jjqxzmc the new jjqxzmc
	 */
	public void setJjqxzmc(String jjqxzmc) {
		this.jjqxzmc = jjqxzmc;
	}
	
	/**
	 * Gets the jjqxzmc.
	 *
	 * @return the jjqxzmc
	 */
	public String getJjqxzmc() {
		return jjqxzmc;
	}
	
	/**
	 * Sets the sjlydm.
	 *
	 * @param sjlydm the new sjlydm
	 */
	public void setSjlydm(String sjlydm) {
		this.sjlydm = sjlydm;
	}
	
	/**
	 * Gets the sjlydm.
	 *
	 * @return the sjlydm
	 */
	public String getSjlydm() {
		return sjlydm;
	}
	
	/**
	 *  1:省厅标准
	 * 2:地市标准.
	 *
	 * @param sjlyms the new sjlyms
	 */
	public void setSjlyms(String sjlyms) {
		this.sjlyms = sjlyms;
	}
	
	/**
	 *  1:省厅标准
	 * 2:地市标准.
	 *
	 * @return the sjlyms
	 */
	public String getSjlyms() {
		return sjlyms;
	}
	
	/**
	 *  排序代码.
	 *
	 * @param pxdm the new pxdm
	 */
	public void setPxdm(Long pxdm) {
		this.pxdm = pxdm;
	}
	
	/**
	 *  排序代码.
	 *
	 * @return the pxdm
	 */
	public Long getPxdm() {
		return pxdm;
	}
	
	/**
	 * Sets the sjbb.
	 *
	 * @param sjbb the new sjbb
	 */
	public void setSjbb(Long sjbb) {
		this.sjbb = sjbb;
	}
	
	/**
	 * Gets the sjbb.
	 *
	 * @return the sjbb
	 */
	public Long getSjbb() {
		return sjbb;
	}
	
	/**
	 *  使用标志('Y':表示使用,'N':表示未使用).
	 *
	 * @param sybz the new sybz
	 */
	public void setSybz(String sybz) {
		this.sybz = sybz;
	}
	
	/**
	 *  使用标志('Y':表示使用,'N':表示未使用).
	 *
	 * @return the sybz
	 */
	public String getSybz() {
		return sybz;
	}
	
	/**
	 * Sets the cjr.
	 *
	 * @param cjr the new cjr
	 */
	public void setCjr(String cjr) {
		this.cjr = cjr;
	}
	
	/**
	 * Gets the cjr.
	 *
	 * @return the cjr
	 */
	public String getCjr() {
		return cjr;
	}
	
	/**
	 * Sets the cjsj.
	 *
	 * @param cjsj the new cjsj
	 */
	public void setCjsj(Date cjsj) {
		this.cjsj = cjsj;
	}
	
	/**
	 * Gets the cjsj.
	 *
	 * @return the cjsj
	 */
	public Date getCjsj() {
		return cjsj;
	}
	
	/**
	 * Sets the gxr.
	 *
	 * @param gxr the new gxr
	 */
	public void setGxr(String gxr) {
		this.gxr = gxr;
	}
	
	/**
	 * Gets the gxr.
	 *
	 * @return the gxr
	 */
	public String getGxr() {
		return gxr;
	}
	
	/**
	 * Sets the gxsj.
	 *
	 * @param gxsj the new gxsj
	 */
	public void setGxsj(Date gxsj) {
		this.gxsj = gxsj;
	}
	
	/**
	 * Gets the gxsj.
	 *
	 * @return the gxsj
	 */
	public Date getGxsj() {
		return gxsj;
	}
}
