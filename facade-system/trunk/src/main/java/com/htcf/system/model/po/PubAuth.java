/** 
 * Project Name:facade-system 
 * File Name:PubAuth.java 
 * Package Name:com.htcf.system.model.po 
 * Date:2016年12月23日 下午4:16:09 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.model.po;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * ClassName: PubAuth <br/>
 * Function: 授权 <br/>
 * Reason: ADD REASON(可选). <br/>
 * date: 2016年12月23日 下午4:16:09 <br/>
 * 
 * @author zhangyingzi
 */
public class PubAuth implements Serializable {

	/**
	 * 授权ID.
	 */
	private String sqid;

	/**
	 * 关联用户编号.
	 */
	private String yhbh;

	/**
	 * 关联应用产品ID.
	 */
	private String yyid;

	/**
	 * 关联角色ID.
	 */
	private String jsid;

	/**
	 * 排序代码.
	 */
	private Integer pxdm;

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
	 * 授权ID.
	 *
	 * @param sqid the new sqid
	 */
	public void setSqid(String sqid) {
		this.sqid = sqid;
	}

	/**
	 * 授权ID.
	 *
	 * @return the sqid
	 */
	public String getSqid() {
		return sqid;
	}

	/**
	 * 关联用户编号.
	 *
	 * @param yhbh the new yhbh
	 */
	public void setYhbh(String yhbh) {
		this.yhbh = yhbh;
	}

	/**
	 * 关联用户编号.
	 *
	 * @return the yhbh
	 */
	public String getYhbh() {
		return yhbh;
	}

	/**
	 * 关联应用产品ID.
	 *
	 * @param yyid the new yyid
	 */
	public void setYyid(String yyid) {
		this.yyid = yyid;
	}

	/**
	 * 关联应用产品ID.
	 *
	 * @return the yyid
	 */
	public String getYyid() {
		return yyid;
	}

	/**
	 * 关联角色ID.
	 *
	 * @param jsid the new jsid
	 */
	public void setJsid(String jsid) {
		this.jsid = jsid;
	}

	/**
	 * 关联角色ID.
	 *
	 * @return the jsid
	 */
	public String getJsid() {
		return jsid;
	}

	/**
	 * 排序代码.
	 *
	 * @param pxdm the new pxdm
	 */
	public void setPxdm(Integer pxdm) {
		this.pxdm = pxdm;
	}

	/**
	 * 排序代码.
	 *
	 * @return the pxdm
	 */
	public Integer getPxdm() {
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
