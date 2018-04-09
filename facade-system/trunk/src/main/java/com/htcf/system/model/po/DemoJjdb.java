package com.htcf.system.model.po;

import java.io.Serializable;
import java.util.Date;

public class DemoJjdb implements Serializable{
	/**
	 * id
	 */
	private String jjdbh;
	
	/**
	 * 报警人
	 */
	private String bjr;
	
	/**
	 * 性别
	 */
	private String xb;
	
	/**
	 * 原始性质
	 */
	private String ysxz;
	
	/**
	 * 警情性质
	 */
	private String jqxz;
	
	/**
	 * 警情级别
	 */
	private String jqjb;
	
	/**
	 * 联系电话
	 */
	private String lxdh;
	
	/**
	 * 警情内容
	 */
	private String jqnr;
	
	/**
	 * 创建人姓名.
	 */
	private String cjr;

	/**
	 * 创建时间.
	 */
	private Date cjsj;

	/**
	 * 更新人姓名.
	 */
	private String gxr;

	/**
	 * 更新时间.
	 */
	private Date gxsj;

	/**
	 * 数据版本.
	 */
	private Long sjbb;

	

	public String getJjdbh() {
		return jjdbh;
	}

	public void setJjdbh(String jjdbh) {
		this.jjdbh = jjdbh;
	}

	public String getBjr() {
		return bjr;
	}

	public void setBjr(String bjr) {
		this.bjr = bjr;
	}

	public String getXb() {
		return xb;
	}

	public void setXb(String xb) {
		this.xb = xb;
	}

	public String getYsxz() {
		return ysxz;
	}

	public void setYsxz(String ysxz) {
		this.ysxz = ysxz;
	}

	public String getJqxz() {
		return jqxz;
	}

	public void setJqxz(String jqxz) {
		this.jqxz = jqxz;
	}

	public String getJqjb() {
		return jqjb;
	}

	public void setJqjb(String jqjb) {
		this.jqjb = jqjb;
	}

	public String getLxdh() {
		return lxdh;
	}

	public void setLxdh(String lxdh) {
		this.lxdh = lxdh;
	}

	public String getJqnr() {
		return jqnr;
	}

	public void setJqnr(String jqnr) {
		this.jqnr = jqnr;
	}

	

	public String getCjr() {
		return cjr;
	}

	public void setCjr(String cjr) {
		this.cjr = cjr;
	}

	public Date getCjsj() {
		return cjsj;
	}

	public void setCjsj(Date cjsj) {
		this.cjsj = cjsj;
	}

	public String getGxr() {
		return gxr;
	}

	public void setGxr(String gxr) {
		this.gxr = gxr;
	}

	public Date getGxsj() {
		return gxsj;
	}

	public void setGxsj(Date gxsj) {
		this.gxsj = gxsj;
	}

	public Long getSjbb() {
		return sjbb;
	}

	public void setSjbb(Long sjbb) {
		this.sjbb = sjbb;
	}
	
	
}
