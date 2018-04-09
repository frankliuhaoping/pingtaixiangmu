/** 
 * Project Name:facade-system 
 * File Name:PubUser.java 
 * Package Name:com.htcf.system.model.po 
 * Date:2016年12月23日 上午11:37:42 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.demo.web.model.po;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * ClassName: PubUser <br/>
 * Function: 用户 <br/>
 * Reason: ADD REASON(可选). <br/>
 * date: 2016年12月23日 上午11:37:42 <br/>
 * 
 * @author zhangyingzi
 */
public class PubUser implements Serializable {

	/**
	 * 用户编号.
	 */
	private String yhbh;

	/**
	 * 用户账号.
	 */
	private String yhzh;

	/**
	 * 用户密码.
	 */
	private String yhmm;

	/**
	 * 用户名称.
	 */
	private String yhmc;

	/**
	 * PKIID.
	 */
	private String pkiid;

	/**
	 * 联系电话.
	 */
	private String lxdh;

	/**
	 * 行政区划.
	 */
	private String xzqh;

	/**
	 * 所属单位代码.
	 */
	private String ssdwdm;

	/**
	 * 所属单位名称.
	 */
	private String ssdwmc;

	/**
	 * 代理单位代码.
	 */
	private String dldwdm;

	/**
	 * 代理单位名称.
	 */
	private String dldwmc;

	/**
	 * 注册IP.
	 */
	private String zcip;

	/**
	 * 使用标志(Y,启动 N,禁用).
	 */
	private String sybz;

	/**
	 * 排序代码.
	 */
	private String pxdm;

	/**
	 * 创建人姓名.
	 */
	private String cjrxm;

	/**
	 * 创建时间.
	 */
	private Date cjsj;

	/**
	 * 更新人姓名.
	 */
	private String gxrxm;

	/**
	 * 更新时间.
	 */
	private Date gxsj;

	/**
	 * 数据版本.
	 */
	private Long sjbb;

	/**
	 * 用户编号.
	 *
	 * @param yhbh the new yhbh
	 */
	public void setYhbh(String yhbh) {
		this.yhbh = yhbh;
	}

	/**
	 * 用户编号.
	 *
	 * @return the yhbh
	 */
	public String getYhbh() {
		return yhbh;
	}

	/**
	 * 用户账号.
	 *
	 * @param yhzh the new yhzh
	 */
	public void setYhzh(String yhzh) {
		this.yhzh = yhzh;
	}

	/**
	 * 用户账号.
	 *
	 * @return the yhzh
	 */
	public String getYhzh() {
		return yhzh;
	}

	/**
	 * 用户密码.
	 *
	 * @param yhmm the new yhmm
	 */
	public void setYhmm(String yhmm) {
		this.yhmm = yhmm;
	}

	/**
	 * 用户密码.
	 *
	 * @return the yhmm
	 */
	public String getYhmm() {
		return yhmm;
	}

	/**
	 * 用户名称.
	 *
	 * @param yhmc the new yhmc
	 */
	public void setYhmc(String yhmc) {
		this.yhmc = yhmc;
	}

	/**
	 * 用户名称.
	 *
	 * @return the yhmc
	 */
	public String getYhmc() {
		return yhmc;
	}

	/**
	 * PKIID.
	 *
	 * @param pkiid the new pkiid
	 */
	public void setPkiid(String pkiid) {
		this.pkiid = pkiid;
	}

	/**
	 * PKIID.
	 *
	 * @return the pkiid
	 */
	public String getPkiid() {
		return pkiid;
	}

	/**
	 * 联系电话.
	 *
	 * @param lxdh the new lxdh
	 */
	public void setLxdh(String lxdh) {
		this.lxdh = lxdh;
	}

	/**
	 * 联系电话.
	 *
	 * @return the lxdh
	 */
	public String getLxdh() {
		return lxdh;
	}

	/**
	 * 行政区划.
	 *
	 * @param xzqh the new xzqh
	 */
	public void setXzqh(String xzqh) {
		this.xzqh = xzqh;
	}

	/**
	 * 行政区划.
	 *
	 * @return the xzqh
	 */
	public String getXzqh() {
		return xzqh;
	}

	/**
	 * 所属单位代码.
	 *
	 * @param ssdwdm the new ssdwdm
	 */
	public void setSsdwdm(String ssdwdm) {
		this.ssdwdm = ssdwdm;
	}

	/**
	 * 所属单位代码.
	 *
	 * @return the ssdwdm
	 */
	public String getSsdwdm() {
		return ssdwdm;
	}

	/**
	 * 所属单位名称.
	 *
	 * @param ssdwmc the new ssdwmc
	 */
	public void setSsdwmc(String ssdwmc) {
		this.ssdwmc = ssdwmc;
	}

	/**
	 * 所属单位名称.
	 *
	 * @return the ssdwmc
	 */
	public String getSsdwmc() {
		return ssdwmc;
	}

	/**
	 * 代理单位代码.
	 *
	 * @param dldwdm the new dldwdm
	 */
	public void setDldwdm(String dldwdm) {
		this.dldwdm = dldwdm;
	}

	/**
	 * 代理单位代码.
	 *
	 * @return the dldwdm
	 */
	public String getDldwdm() {
		return dldwdm;
	}

	/**
	 * 代理单位名称.
	 *
	 * @param dldwmc the new dldwmc
	 */
	public void setDldwmc(String dldwmc) {
		this.dldwmc = dldwmc;
	}

	/**
	 * 代理单位名称.
	 *
	 * @return the dldwmc
	 */
	public String getDldwmc() {
		return dldwmc;
	}

	/**
	 * 注册IP.
	 *
	 * @param zcip the new zcip
	 */
	public void setZcip(String zcip) {
		this.zcip = zcip;
	}

	/**
	 * 注册IP.
	 *
	 * @return the zcip
	 */
	public String getZcip() {
		return zcip;
	}

	/**
	 * 使用标志.
	 *
	 * @param sybz the new sybz
	 */
	public void setSybz(String sybz) {
		this.sybz = sybz;
	}

	/**
	 * 使用标志.
	 *
	 * @return the sybz
	 */
	public String getSybz() {
		return sybz;
	}

	/**
	 * 排序代码.
	 *
	 * @param pxdm the new pxdm
	 */
	public void setPxdm(String pxdm) {
		this.pxdm = pxdm;
	}

	/**
	 * 排序代码.
	 *
	 * @return the pxdm
	 */
	public String getPxdm() {
		return pxdm;
	}

	/**
	 * 创建人姓名.
	 *
	 * @param cjrxm the new cjrxm
	 */
	public void setCjrxm(String cjrxm) {
		this.cjrxm = cjrxm;
	}

	/**
	 * 创建人姓名.
	 *
	 * @return the cjrxm
	 */
	public String getCjrxm() {
		return cjrxm;
	}

	/**
	 * 创建时间.
	 *
	 * @param cjsj the new cjsj
	 */
	public void setCjsj(Date cjsj) {
		this.cjsj = cjsj;
	}

	/**
	 * 创建时间.
	 *
	 * @return the cjsj
	 */
	public Date getCjsj() {
		return cjsj;
	}

	/**
	 * 更新人姓名.
	 *
	 * @param gxrxm the new gxrxm
	 */
	public void setGxrxm(String gxrxm) {
		this.gxrxm = gxrxm;
	}

	/**
	 * 更新人姓名.
	 *
	 * @return the gxrxm
	 */
	public String getGxrxm() {
		return gxrxm;
	}

	/**
	 * 更新时间.
	 *
	 * @param gxsj the new gxsj
	 */
	public void setGxsj(Date gxsj) {
		this.gxsj = gxsj;
	}

	/**
	 * 更新时间.
	 *
	 * @return the gxsj
	 */
	public Date getGxsj() {
		return gxsj;
	}

	/**
	 * 数据版本.
	 *
	 * @param sjbb the new sjbb
	 */
	public void setSjbb(Long sjbb) {
		this.sjbb = sjbb;
	}

	/**
	 * 数据版本.
	 *
	 * @return the sjbb
	 */
	public Long getSjbb() {
		return sjbb;
	}
}
