package com.htcf.system.model.po;

import java.io.Serializable;
import java.util.Date;

/** 人员信息 */
public class PubRyxx implements Serializable{
	/** 
	 * serialVersionUID
	 */
	private String rybh; //人员编号
	private String ryxm; //人员姓名
	private String ryjh; //人员警号
	private String sfzbh; //身份证编号
	private String ryxb; //人员性别
	private String xbms; //性别描述
	private Date csny; //出生年月
	private String ryzt; //人员状态(1:在职，2：离休等)
	private String ryztms; //人员状态描述
	private String ryzw; //人员职务(1：局长，2：副局长等)
	private String zwms; //职务描述
	private String xzqh; //行政区划
	private String zhzxbh; //指挥中心编号
	private String ssdwdm; //所属单位代码
	private String ssdwmc; //所属单位名称
	private String jwthm; //警务通号码
	private String dhhm; //电话号码（多个用逗号隔开)
	private String dthm; //电台号码（多个用逗号隔开)
	private String yjdz; //邮件地址（多个用逗号隔开)
	private String ryzz; //人员住址
	private Long pxdm; //排序代码
	private Long sjbb; //数据版本
	private String sybz; //使用标志('Y':使用,'N':未使用)
	private String cjr; //创建人
	private Date cjsj; //创建时间
	private String gxr; //更新人
	private Date gxsj; //更新时间

	/** 人员编号 */
	public void setRybh(String rybh) {
		this.rybh = rybh;
	}
	/** 人员编号 */
	public String getRybh() {
		return rybh;
	}
	/** 人员姓名 */
	public void setRyxm(String ryxm) {
		this.ryxm = ryxm;
	}
	/** 人员姓名 */
	public String getRyxm() {
		return ryxm;
	}
	/** 人员警号 */
	public void setRyjh(String ryjh) {
		this.ryjh = ryjh;
	}
	/** 人员警号 */
	public String getRyjh() {
		return ryjh;
	}
	/** 身份证编号 */
	public void setSfzbh(String sfzbh) {
		this.sfzbh = sfzbh;
	}
	/** 身份证编号 */
	public String getSfzbh() {
		return sfzbh;
	}
	/** 人员性别 */
	public void setRyxb(String ryxb) {
		this.ryxb = ryxb;
	}
	/** 人员性别 */
	public String getRyxb() {
		return ryxb;
	}
	/** 性别描述 */
	public void setXbms(String xbms) {
		this.xbms = xbms;
	}
	/** 性别描述 */
	public String getXbms() {
		return xbms;
	}
	/** 出生年月 */
	public void setCsny(Date csny) {
		this.csny = csny;
	}
	/** 出生年月 */
	public Date getCsny() {
		return csny;
	}
	/** 人员状态(1:在职，2：离休等) */
	public void setRyzt(String ryzt) {
		this.ryzt = ryzt;
	}
	/** 人员状态(1:在职，2：离休等) */
	public String getRyzt() {
		return ryzt;
	}
	/** 人员状态描述 */
	public void setRyztms(String ryztms) {
		this.ryztms = ryztms;
	}
	/** 人员状态描述 */
	public String getRyztms() {
		return ryztms;
	}
	/** 人员职务(1：局长，2：副局长等) */
	public void setRyzw(String ryzw) {
		this.ryzw = ryzw;
	}
	/** 人员职务(1：局长，2：副局长等) */
	public String getRyzw() {
		return ryzw;
	}
	/** 职务描述 */
	public void setZwms(String zwms) {
		this.zwms = zwms;
	}
	/** 职务描述 */
	public String getZwms() {
		return zwms;
	}
	/** 行政区划 */
	public void setXzqh(String xzqh) {
		this.xzqh = xzqh;
	}
	/** 行政区划 */
	public String getXzqh() {
		return xzqh;
	}
	/** 指挥中心编号 */
	public void setZhzxbh(String zhzxbh) {
		this.zhzxbh = zhzxbh;
	}
	/** 指挥中心编号 */
	public String getZhzxbh() {
		return zhzxbh;
	}
	/** 所属单位代码 */
	public void setSsdwdm(String ssdwdm) {
		this.ssdwdm = ssdwdm;
	}
	/** 所属单位代码 */
	public String getSsdwdm() {
		return ssdwdm;
	}
	/** 所属单位名称 */
	public void setSsdwmc(String ssdwmc) {
		this.ssdwmc = ssdwmc;
	}
	/** 所属单位名称 */
	public String getSsdwmc() {
		return ssdwmc;
	}
	/** 警务通号码 */
	public void setJwthm(String jwthm) {
		this.jwthm = jwthm;
	}
	/** 警务通号码 */
	public String getJwthm() {
		return jwthm;
	}
	/** 电话号码（多个用逗号隔开) */
	public void setDhhm(String dhhm) {
		this.dhhm = dhhm;
	}
	/** 电话号码（多个用逗号隔开) */
	public String getDhhm() {
		return dhhm;
	}
	/** 电台号码（多个用逗号隔开) */
	public void setDthm(String dthm) {
		this.dthm = dthm;
	}
	/** 电台号码（多个用逗号隔开) */
	public String getDthm() {
		return dthm;
	}
	/** 邮件地址（多个用逗号隔开) */
	public void setYjdz(String yjdz) {
		this.yjdz = yjdz;
	}
	/** 邮件地址（多个用逗号隔开) */
	public String getYjdz() {
		return yjdz;
	}
	/** 人员住址 */
	public void setRyzz(String ryzz) {
		this.ryzz = ryzz;
	}
	/** 人员住址 */
	public String getRyzz() {
		return ryzz;
	}
	/** 排序代码 */
	public void setPxdm(Long pxdm) {
		this.pxdm = pxdm;
	}
	/** 排序代码 */
	public Long getPxdm() {
		return pxdm;
	}
	/** 数据版本 */
	public void setSjbb(Long sjbb) {
		this.sjbb = sjbb;
	}
	/** 数据版本 */
	public Long getSjbb() {
		return sjbb;
	}
	/** 使用标志('Y':使用,'N':未使用) */
	public void setSybz(String sybz) {
		this.sybz = sybz;
	}
	/** 使用标志('Y':使用,'N':未使用) */
	public String getSybz() {
		return sybz;
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
}
