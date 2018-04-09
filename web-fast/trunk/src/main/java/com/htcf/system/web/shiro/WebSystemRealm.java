/** 
 * Project Name:web-system 
 * File Name:UserRealm.java 
 * Package Name:com.htcf.system.web.realm 
 * Date:2016-12-813:53:56 
 * Copyright (c) 2016, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.web.shiro;

import org.apache.shiro.authc.AccountException;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.subject.PrincipalCollection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.htcf.frame.web.shiro.client.ClientRealm;
import com.htcf.system.model.po.PubUser;
import com.htcf.system.web.init.WebSystemConstans;

/**
 * ClassName: UserRealm <br/>
 * Function: UserRealm. <br/>
 * date: 2016年12月3日 下午1:03:34 <br/>
 * 
 * @author lizhuo
 */
public class WebSystemRealm extends ClientRealm {

	/** The logger. */
	private static Logger logger = LoggerFactory.getLogger(WebSystemRealm.class);

	/**
	 * 
	 * 用户认证，判断用户是否可以登录系统.
	 *
	 * @param token the token
	 * @return AuthenticationInfo
	 * @throws AuthenticationException the authentication exception
	 * @see org.apache.shiro.realm.AuthenticatingRealm#doGetAuthenticationInfo(org.apache.shiro.authc.AuthenticationToken)
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {

		String username = (String) token.getPrincipal();

		if (username == null) {
			throw new AccountException("用户名不能为空");
		}

		PubUser user = null;
		try {
			// 获取正常的用户
			user = pubUserService.getUserByYhzh(username);// 根据账号查询用户
		} catch (Exception ex) {
			logger.warn("获取用户失败\n" + ex.getMessage());
		}
		if (user == null) {
			throw new UnknownAccountException("用户不存在");
		}

		if(user.getSybz().equals(WebSystemConstans.USE_N)) {
			throw new LockedAccountException(); //帐号锁定
		}

		// 交给AuthenticatingRealm使用CredentialsMatcher进行密码匹配，如果觉得人家的不好可以自定义实现
		SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(user.getYhzh(), // 用户名
				user.getYhmm(), // 密码
				getName()  // realm name
		);
		return authenticationInfo;
	}

	/**
	 * clearCachedAuthorizationInfo.
	 *
	 * @param principals the principals
	 * @see org.apache.shiro.realm.AuthorizingRealm#clearCachedAuthorizationInfo(org.apache.shiro.subject.PrincipalCollection)
	 */
	@Override
	public void clearCachedAuthorizationInfo(PrincipalCollection principals) {
		super.clearCachedAuthorizationInfo(principals);
	}

	/**
	 * clearCachedAuthenticationInfo.
	 *
	 * @param principals the principals
	 * @see org.apache.shiro.realm.AuthenticatingRealm#clearCachedAuthenticationInfo(org.apache.shiro.subject.PrincipalCollection)
	 */
	@Override
	public void clearCachedAuthenticationInfo(PrincipalCollection principals) {
		super.clearCachedAuthenticationInfo(principals);
	}

	/**
	 * clearCache.
	 *
	 * @param principals the principals
	 * @see org.apache.shiro.realm.CachingRealm#clearCache(org.apache.shiro.subject.PrincipalCollection)
	 */
	@Override
	public void clearCache(PrincipalCollection principals) {
		super.clearCache(principals);
	}

	/**
	 * Clear all cached authorization info.
	 */
	public void clearAllCachedAuthorizationInfo() {
		getAuthorizationCache().clear();
	}

	/**
	 * Clear all cached authentication info.
	 */
	public void clearAllCachedAuthenticationInfo() {
		getAuthenticationCache().clear();
	}

	/**
	 * Clear all cache.
	 */
	public void clearAllCache() {
		clearAllCachedAuthenticationInfo();
		clearAllCachedAuthorizationInfo();
	}

}
