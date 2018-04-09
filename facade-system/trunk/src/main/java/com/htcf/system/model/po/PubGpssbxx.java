package com.htcf.system.model.po;

import java.io.Serializable;
import java.util.Date;

/**  */
public class PubGpssbxx implements Serializable{
	private String sbbh; //设备编号
	private String sbmc; //设备名称
	private String zzjgdm; //组织机构代码
	private String zzjgmc; //组织机构名称
	private String sblx; //设备类型
	private String sbzt; //设备状态
	private Date sbztgxsj; //设备状态更新时间
	private String lxdh; //联系电话
	private String bdrybh; //绑定人员编号
	private String bdrymc; //绑定人员名称
	private String szthz; //所在通话组
	private Date szthzgxsj; //所在通话组更新时间
	private String gzzt; //工作状态30，31，32  对应设备按了0，1，2键
	private String gzztsm; //工作状态说明
	private Date gzztgxsj; //工作状态更新时间
	private String stglzt; //手台管理状态遥晕，遥毙，正常
	private String stglztsm; //手台管理状态说明
	private Date stglztgxsj; //手台管理状态更新时间
	private String cjr; //创建人
	private Date cjsj; //创建时间
	private String gxr; //更新人
	private Date gxsj; //更新时间
	private String sybz; //使用标志

	/** 设备编号 */
	public void setSbbh(String sbbh) {
		this.sbbh = sbbh;
	}
	/** 设备编号 */
	public String getSbbh() {
		return sbbh;
	}
	/** 设备名称 */
	public void setSbmc(String sbmc) {
		this.sbmc = sbmc;
	}
	/** 设备名称 */
	public String getSbmc() {
		return sbmc;
	}
	/** 组织机构代码 */
	public void setZzjgdm(String zzjgdm) {
		this.zzjgdm = zzjgdm;
	}
	/** 组织机构代码 */
	public String getZzjgdm() {
		return zzjgdm;
	}
	/** 组织机构名称 */
	public void setZzjgmc(String zzjgmc) {
		this.zzjgmc = zzjgmc;
	}
	/** 组织机构名称 */
	public String getZzjgmc() {
		return zzjgmc;
	}
	/** 设备类型 */
	public void setSblx(String sblx) {
		this.sblx = sblx;
	}
	/** 设备类型 */
	public String getSblx() {
		return sblx;
	}
	/** 设备状态 */
	public void setSbzt(String sbzt) {
		this.sbzt = sbzt;
	}
	/** 设备状态 */
	public String getSbzt() {
		return sbzt;
	}
	/** 设备状态更新时间 */
	public void setSbztgxsj(Date sbztgxsj) {
		this.sbztgxsj = sbztgxsj;
	}
	/** 设备状态更新时间 */
	public Date getSbztgxsj() {
		return sbztgxsj;
	}
	/** 联系电话 */
	public void setLxdh(String lxdh) {
		this.lxdh = lxdh;
	}
	/** 联系电话 */
	public String getLxdh() {
		return lxdh;
	}
	/** 绑定人员编号 */
	public void setBdrybh(String bdrybh) {
		this.bdrybh = bdrybh;
	}
	/** 绑定人员编号 */
	public String getBdrybh() {
		return bdrybh;
	}
	/** 绑定人员名称 */
	public void setBdrymc(String bdrymc) {
		this.bdrymc = bdrymc;
	}
	/** 绑定人员名称 */
	public String getBdrymc() {
		return bdrymc;
	}
	/** 所在通话组 */
	public void setSzthz(String szthz) {
		this.szthz = szthz;
	}
	/** 所在通话组 */
	public String getSzthz() {
		return szthz;
	}
	/** 所在通话组更新时间 */
	public void setSzthzgxsj(Date szthzgxsj) {
		this.szthzgxsj = szthzgxsj;
	}
	/** 所在通话组更新时间 */
	public Date getSzthzgxsj() {
		return szthzgxsj;
	}
	/** 工作状态30，31，32
对应设备按了0，1，2键 */
	public void setGzzt(String gzzt) {
		this.gzzt = gzzt;
	}
	/** 工作状态30，31，32
对应设备按了0，1，2键 */
	public String getGzzt() {
		return gzzt;
	}
	/** 工作状态说明 */
	public void setGzztsm(String gzztsm) {
		this.gzztsm = gzztsm;
	}
	/** 工作状态说明 */
	public String getGzztsm() {
		return gzztsm;
	}
	/** 工作状态更新时间 */
	public void setGzztgxsj(Date gzztgxsj) {
		this.gzztgxsj = gzztgxsj;
	}
	/** 工作状态更新时间 */
	public Date getGzztgxsj() {
		return gzztgxsj;
	}
	/** 手台管理状态遥晕，遥毙，正常 */
	public void setStglzt(String stglzt) {
		this.stglzt = stglzt;
	}
	/** 手台管理状态遥晕，遥毙，正常 */
	public String getStglzt() {
		return stglzt;
	}
	/** 手台管理状态说明 */
	public void setStglztsm(String stglztsm) {
		this.stglztsm = stglztsm;
	}
	/** 手台管理状态说明 */
	public String getStglztsm() {
		return stglztsm;
	}
	/** 手台管理状态更新时间 */
	public void setStglztgxsj(Date stglztgxsj) {
		this.stglztgxsj = stglztgxsj;
	}
	/** 手台管理状态更新时间 */
	public Date getStglztgxsj() {
		return stglztgxsj;
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
	/** 更新人 */
	public void setGxr(String gxr) {
		this.gxr = gxr;
	}
	/** 更新人 */
	public String getGxr() {
		return gxr;
	}
	/** 更新时间 */
	public void setGxsj(Date gxsj) {
		this.gxsj = gxsj;
	}
	/** 更新时间 */
	public Date getGxsj() {
		return gxsj;
	}
	/** 使用标志 */
	public void setSybz(String sybz) {
		this.sybz = sybz;
	}
	/** 使用标志 */
	public String getSybz() {
		return sybz;
	}
}
