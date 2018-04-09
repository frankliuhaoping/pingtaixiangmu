package com.htcf.system.model.po;

import java.io.Serializable;
import java.util.Date;

/**  */
public class PubZzjgsy implements Serializable{
	private String zzjgsyid; //组织结构使用ID
	private String zdbh; //字典编号
	private String dwdm; //单位代码
	private String cjr; //创建人
	private Date cjsj; //创建时间

	/** 组织结构使用ID */
	public void setZzjgsyid(String zzjgsyid) {
		this.zzjgsyid = zzjgsyid;
	}
	/** 组织结构使用ID */
	public String getZzjgsyid() {
		return zzjgsyid;
	}
	/** 字典编号 */
	public void setZdbh(String zdbh) {
		this.zdbh = zdbh;
	}
	/** 字典编号 */
	public String getZdbh() {
		return zdbh;
	}
	/** 单位代码 */
	public void setDwdm(String dwdm) {
		this.dwdm = dwdm;
	}
	/** 单位代码 */
	public String getDwdm() {
		return dwdm;
	}
	/** 创建人 */
	public void setCjr(String cjr) {
		this.cjr = cjr;
	}
	/** 创建人 */
	public String getCjr() {
		return cjr;
	}
	/** 创建时间 */
	public void setCjsj(Date cjsj) {
		this.cjsj = cjsj;
	}
	/** 创建时间 */
	public Date getCjsj() {
		return cjsj;
	}
}
