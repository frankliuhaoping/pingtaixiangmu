/** 
 * Project Name:facade-system 
 * File Name:SysUser.java 
 * Package Name:com.htcf.system.model.bo 
 * Date:2017年9月11日 下午4:45:21 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.model.bo;

import com.htcf.system.model.po.PubUser;

/** 
 * ClassName: SysUser
 * Function: TODO ADD FUNCTION. 
 * Reason: TODO ADD REASON(可选).
 * date: 2017年9月11日 下午4:45:21
 * 
 * @author liuhuan 
 */
public class SysUser extends PubUser {
	
	

	/**
	 * 
	 */
	private String userId;
	/**
	 * 
	 */
	private String email;
	/**
	 * 
	 */
	private String face;
	/**
	 * 
	 */
	private String gmsfhm;
	/**
	 * 
	 */
	private String loginAuthOrIties;
	
	private String tbbs;
	
	/**
	 * @return the tbbs
	 */
	public String getTbbs() {
		return tbbs;
	}
	/**
	 * @param tbbs the tbbs to set
	 */
	public void setTbbs(String tbbs) {
		this.tbbs = tbbs;
	}
	/**
	 * @return the userId
	 */
	public String getUserId() {
		return userId;
	}
	/**
	 * @param userId the userId to set
	 */
	public void setUserId(String userId) {
		this.userId = userId;
	}
	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}
	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	/**
	 * @return the face
	 */
	public String getFace() {
		return face;
	}
	/**
	 * @param face the face to set
	 */
	public void setFace(String face) {
		this.face = face;
	}
	/**
	 * @return the gmsfhm
	 */
	public String getGmsfhm() {
		return gmsfhm;
	}
	/**
	 * @param gmsfhm the gmsfhm to set
	 */
	public void setGmsfhm(String gmsfhm) {
		this.gmsfhm = gmsfhm;
	}
	/**
	 * @return the loginAuthOrIties
	 */
	public String getLoginAuthOrIties() {
		return loginAuthOrIties;
	}
	/**
	 * @param loginAuthOrIties the loginAuthOrIties to set
	 */
	public void setLoginAuthOrIties(String loginAuthOrIties) {
		this.loginAuthOrIties = loginAuthOrIties;
	}
	
	
	
}
