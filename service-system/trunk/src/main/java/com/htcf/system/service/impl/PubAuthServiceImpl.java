/** 
 * Project Name:service-system 
 * File Name:PubResServiceImpl.java 
 * Package Name:com.htcf.system.service.impl 
 * Date:2016年12月3日上午9:39:26 
 * Copyright (c) 2016, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.dubbo.common.utils.StringUtils;
import com.htcf.frame.base.util.JsonUtil;
import com.htcf.frame.core.dbRelevant.QueryParam;
import com.htcf.system.cache.PermissionCache;
import com.htcf.system.dao.PubAuthDao;
import com.htcf.system.exception.ServiceSystemException;
import com.htcf.system.model.po.PubAuth;
import com.htcf.system.model.po.PubRole;
import com.htcf.system.model.po.PubUser;
import com.htcf.system.service.PubAppService;
import com.htcf.system.service.PubAuthService;
import com.htcf.system.service.PubRoleService;
import com.htcf.system.service.PubUserService;


/**
 * 
 * ClassName: PubAuthServiceImpl <br/> 
 * Function: 授权ServiceImpl <br/> 
 * Reason: ADD REASON(可选). <br/> 
 * date: 2016年12月12日 上午9:37:31 <br/> 
 * 
 * @author zhangyingzi 
 */
@Service("pubAuthService")
public class PubAuthServiceImpl implements PubAuthService {
	
	private static final Logger logger = LogManager.getLogger(PubAuthServiceImpl.class);
	
	/**
	 * pubAuthDao:授权数据
	 */
	@Autowired
	private PubAuthDao pubAuthDao;
	
	@Autowired
	private PermissionCache permissionCache;
	
	/**
	 * pubUserService:用户服务
	 */
	@Autowired
	private PubUserService pubUserService;
	
	/**
	 * pubRoleService:角色服务
	 */
	@Autowired
	private PubRoleService pubRoleService;
	
	/**
	 * pubAppService:应用服务
	 */
	@Autowired
	private PubAppService pubAppService;
	
	/**
	 * 添加授权
	 * @param pubAuth 授权
	 * @return PubAuth 授权
	 * @throws Exception
	 * @see com.htcf.system.service.PubAuthService#addAuth(com.htcf.system.model.po.PubAuth)
	 */
	@Override
	public PubAuth addAuth(PubAuth pubAuth) throws Exception {
		
		logger.entry("!!!!!!!!!!新增授权",JsonUtil.toJsonNonNull(pubAuth));
		
		//判断用户ID是否存在
		pubUserService.getUserByYhbh(pubAuth.getYhbh());
		
		//判断角色ID是否存在
		pubRoleService.getRoleByJsid(pubAuth.getJsid());
		
		//判断该用户是否授权
		QueryParam param = new QueryParam();
		param.put("yhbh", pubAuth.getYhbh());
		param.put("yyid", pubAuth.getYyid());
		param.put("jsid", pubAuth.getJsid());
		PubAuth oPubAuth = pubAuthDao.getOne(param);
		if(null != oPubAuth){
			throw ServiceSystemException.PUBAUTH_EXIST.newInstance("用户已授权,用户ID:yhbh{%s},应用ID:yyid{%s},角色ID:jsid{%s}", pubAuth.getYhbh(),pubAuth.getYyid(),pubAuth.getJsid());
		}
		
		//获取序列
		/*Long sqid =pubAuthDao.getSeq();
		pubAuth.setSqid(sqid.toString());*/
		//id uuid生成
		pubAuth.setSqid(UUID.randomUUID().toString().replaceAll("-", ""));
		pubAuthDao.add(pubAuth);
		
		//清空缓存中的授权
		permissionCache.removeByYyid(pubAuth.getYyid());
		return pubAuth;
	}
	
	/**
	 * getAuthBySqid
	 * 根据授权ID获取
	 * @param sqid 授权ID
	 * @return PubAuth 授权
	 * @throws Exception
	 * @see com.htcf.system.service.PubAuthService#getAuthBySqid(long)
	 */
	@Override
	public PubAuth getAuthBySqid(String sqid) throws Exception {
		
		logger.entry("!!!!!!!!!!根据授权ID获取授权",sqid);
		QueryParam param = new QueryParam();
		param.put("sqid", sqid);
		PubAuth pubAuth = pubAuthDao.getOne(param);
		if(null == pubAuth){
			throw ServiceSystemException.PUBAUTH_NOT_EXIST.newInstance("授权ID不存在,sqid{%s}", sqid);
		}
		return pubAuth;
	}
	
	/**
	 * 根据授权ID删除
	 * @param Long... sqid 授权ID
	 * @return int
	 * @throws Exception
	 * @see com.htcf.system.service.PubAuthService#deleteAuth(java.lang.Long[])
	 */
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int deleteAuth(String... sqids) throws Exception {
		
		logger.entry("!!!!!!!!!!根据授权ID删除授权",sqids);
		for (String sqid : sqids) {
			PubAuth pubAuth = getAuthBySqid(sqid);
			
			pubAuthDao.delete(sqid);
			
			//清空缓存中的授权
			permissionCache.removeByYyid(pubAuth.getYyid());
		}
		return 1;
	}
	
	/**
	 * getAuthList
	 * 根据查询条件获取授权列表
	 * @param param 查询条件
	 * @return List<PubAuth> 授权列表
	 * @throws Exception List<PubAuth>
	 */
	private List<PubAuth> getAuthList(QueryParam param) throws Exception{
		logger.entry("@@@@@@@@@@获取授权",param);
		List<PubAuth> resultlist = new ArrayList<PubAuth>();
		List<PubAuth> list = pubAuthDao.getList(param);
		if(null != list){
			resultlist.addAll(list);
		}
		return resultlist;
	}


	/**
	 * 根据查询条件获取授权列表
	 * @param map 查询条件
	 * @return List<PubAuth> 授权列表
	 * @throws Exception
	 * @see com.htcf.system.service.PubAuthService#getAuthList(java.util.Map)
	 */
	@Override
	public List<PubAuth> getAuthList(Map<String, Object> map) throws Exception {
		logger.entry("!!!!!!!!!!获取授权列表",map);
		QueryParam param = new QueryParam();
		for (String key : map.keySet()) {
			param.put(key, map.get(key));
		}
		return this.getAuthList(param);
	}
	
	/**
	 * 批量给用户授权
	 * @param pubAuthList 授权列表
	 * @return void
	 * @throws Exception
	 * @see com.htcf.system.service.PubAuthService#addAuthList(java.util.List)
	 */
	@Override
	@Transactional(rollbackFor = Exception.class)
	public void addAuthList(List<PubAuth> pubAuthList) throws Exception {
		logger.entry("!!!!!!!!!!批量添加授权",JsonUtil.toJsonNonNull(pubAuthList));
		if(null != pubAuthList && pubAuthList.size() > 0){
			for (int i = 0; i < pubAuthList.size(); i++) {
				addAuth(pubAuthList.get(i));
			}
		}
	}

	/**
	 * 批量删除授权
	 * @param sqids 授权ID
	 * @return int
	 * @throws Exception
	 * @see com.htcf.system.service.PubAuthService#deleteAuthBySet(java.util.Set)
	 */
	@Override
	public int deleteAuthBySet(Set<String> sqids) throws Exception {
		
		logger.entry("!!!!!!!!!!批量删除授权",sqids);
		if(null != sqids && sqids.size() > 0){
			for (String sqid : sqids) {
				deleteAuth(sqid);
			}
		}
		return 1;
	}

	/**
	 * 根据传递授权集合删除后,添加授权集合信息
	 * @param sqidList 授权
	 * @param pubAuthList 授权列表
	 * @return void
	 * @throws Exception
	 * @see com.htcf.system.service.PubAuthService#delSqidAndAddAuth(java.util.Set, java.util.List)
	 */
	@Override
	public void delSqidAndAddAuth(Set<String> sqidList, List<PubAuth> pubAuthList) throws Exception {
		
		logger.entry("!!!!!!!!!!根据传递授权集合删除后,添加授权集合信息",sqidList,JsonUtil.toJsonNonNull(pubAuthList));
		//批量删除授权
		deleteAuthBySet(sqidList);
		//批量添加授权
		addAuthList(pubAuthList);
		
		logger.debug("删除授权ID",JsonUtil.toJsonNonNull(sqidList),"添加授权",JsonUtil.toJsonNonNull(pubAuthList));
	}

	/**
	 * getAuthList
	 * 根据多个角色、单个用户获取授权
	 * @param jsids 角色
	 * @param yhbh 用户ID
	 * @return List<PubAuth> 授权列表
	 * @throws Exception List<PubAuth>
	 */
	private List<PubAuth> getAuthList(List<String> jsids, String yhbh) throws Exception {
		
		if(null == jsids || jsids.size() == 0 || StringUtils.isEmpty(yhbh)) 
			return null;
		
		QueryParam param = new QueryParam();
		param.put("yhbh", yhbh);
		param.addCondition("jsid", QueryParam.IN, jsids);
		return getAuthList(param);
	}
	
	/**
	 * saveAndDelAuth
	 * 角色管理授权(根据角色ID,删除在新用户中不存在的原用户授权,新增在原用户中不存在的新用户授权)
	 * @param jsid 角色Id
	 * @param oyhbhs 原用户编号
	 * @param yhbhs_new 新用户编号
	 * @param pubUser 登陆用户
	 * @return void
	 * @see com.htcf.system.service.PubAuthService#saveAndDelAuth(java.lang.Long, java.util.List, java.util.List, com.htcf.system.model.po.PubUser)
	 */
	public void saveAndDelAuth(String jsid, List<String> oyhbhs, List<String> yhbhs_new, PubUser pubUser) throws Exception{
		logger.entry("@@@@@@@@@@@@@角色授权用户","角色编号:"+jsid+",原用户编号:"+oyhbhs+",新用户编号:"+yhbhs_new);
		
		//得到需要删除授权的用户编号
		List<String> delYhbhs = new ArrayList<String>();
		if(null != oyhbhs && oyhbhs.size()>0){
			delYhbhs.addAll(oyhbhs);
			if(null != yhbhs_new && yhbhs_new.size()>0){
				delYhbhs.removeAll(yhbhs_new);
			}
		}
		
		//得到需要授权的用户编号
		List<String> addYhbhs = new ArrayList<String>();
		if(null != yhbhs_new && yhbhs_new.size()>0){
			addYhbhs.addAll(yhbhs_new);
			if(null !=oyhbhs  && oyhbhs.size()>0){
				addYhbhs.removeAll(oyhbhs);
			}
		}
		
		//授权的用户编号生成授权对象
		List<PubAuth> addPubAuths = new ArrayList<PubAuth>();
		if(null != addYhbhs && addYhbhs.size()>0){
			for (int i = 0; i < addYhbhs.size(); i++) {
				addPubAuths.add(newPubAuth(pubUser, addYhbhs.get(i), jsid));
			}
		}
		
		//得到需要删除的授权
		List<PubAuth> delPubAuths = new ArrayList<PubAuth>();
		if(null != delYhbhs && delYhbhs.size()>0){
			List<PubAuth> delPubAuthsTemp = this.getAuthList(jsid,delYhbhs.toArray(new String[delYhbhs.size()]));
			if(null != delPubAuthsTemp && delPubAuthsTemp.size()>0){
				delPubAuths.addAll(delPubAuthsTemp);
			}
		}
		
		//根据授权列表返回pk列表
		Set<String> sqidSet = getSqids(delPubAuths);
		
		//删除取消授权的用户授权新增授权的用户授权
		delSqidAndAddAuth(sqidSet, addPubAuths);
		
	}
	
	/**
	 * getAuthList
	 * 根据角色ID和用户ID得到授权列表
	 * @param jsid 角色ID
	 * @param  String... yhbhs 用户ID
	 * @return List<PubAuth> 授权列表
	 * @throws Exception List<PubAuth>
	 */
	private List<PubAuth> getAuthList(String jsid, String... yhbhs) throws Exception {
		logger.entry("@@@@@@@@@@@@@根据角色编号和用户编号得到授权列表","角色编号:"+jsid+",用户编号:"+yhbhs);
		QueryParam param = new QueryParam();
		param.put("jsid", jsid);
		param.addCondition("yhbh", QueryParam.IN, yhbhs);
		return this.getAuthList(param);
	}
	
	/**
	 * 生成一个授权对象
	 * @param pubUser 登陆用户
	 * @param yhbh 用户ID
	 * @param jsid 角色ID
	 * @return PubAuth 授权
	 * @throws Exception PubAuth
	 */
	private PubAuth newPubAuth(PubUser pubUser, String yhbh, String jsid) throws Exception{
		logger.entry("@@@@@@@@@@@@@根据用户编号和角色编号生成授权对象","角色编号:"+jsid+",用户编号:"+yhbh);
		PubAuth pubAuth = new PubAuth();
		PubRole pubRole = pubRoleService.getRoleByJsid(jsid);
		pubAuth.setYyid(pubRole.getYyid());
		pubAuth.setJsid(jsid);
		pubAuth.setYhbh(yhbh);
		pubAuth.setCjrxm(pubUser.getYhmc());
		pubAuth.setCjsj(new Date(System.currentTimeMillis()));
		pubAuth.setSjbb(1L);
		return pubAuth;
	}
	
	/**
	 * getSqids
	 * 根据授权列表获取授权ID
	 * @param authList 授权列表
	 * @return Set<Long> 授权ID
	 * @throws Exception Set<Long>
	 */
	private Set<String> getSqids(List<PubAuth> authList) throws Exception{
		Set<String> set = new LinkedHashSet<String>();
		if(null != authList && authList.size() > 0){
			for (PubAuth auth : authList) {
				set.add(auth.getSqid());
			}
		}
		return set;
	}

	/**
	 * 用户管理授权(根据用户ID,删除在新角色中不存在的原角色授权,新增在原角色中不存在的新角色授权)
	 * @param nJsids 新角色ID
	 * @param oJsids 原角色ID
	 * @param yhbh 用户ID
	 * @param pubUser 登陆用户
	 * @throws Exception
	 * @see com.htcf.system.service.PubAuthService#saveUserAuth(java.lang.String[], java.lang.String[], java.lang.String, com.htcf.system.model.po.PubUser)
	 */
	@Override
	public void saveUserAuth(String[] nJsids, String[] oJsids, String yhbh, PubUser pubUser) throws Exception {
		
		//获取原有角色ID
		List<String> oList = new ArrayList<String>();
		if(null != oJsids && oJsids.length > 0){
			oList = Arrays.asList(oJsids);
		}
		
		//删除页面取消角色
		List<String> delJsid = new ArrayList<String>();
		delJsid.addAll(oList);
		
		//新增授权
		List<PubAuth> pubAuthList = new ArrayList<PubAuth>();
		if(null != nJsids && nJsids.length > 0){
			for (String jsid : nJsids) {
				//判断页面是否保留角色
				if(oList.contains(jsid)) continue;
				//新增新角色授权
				PubAuth pubAuth = newPubAuth(pubUser, yhbh, jsid);
				pubAuthList.add(pubAuth);
			}
			
			//移除页面保留角色
			delJsid.removeAll(Arrays.asList(nJsids));
		}
		
		//根据多个角色与用户获取授权
		List<PubAuth> authList = getAuthList(delJsid,yhbh);
		//获取角色ID
		Set<String> sqids = getSqids(authList);
		
		delSqidAndAddAuth(sqids, pubAuthList);
		
		logger.debug("添加授权列表",JsonUtil.toJsonNonNull(pubAuthList),"删除授权ID",sqids);
		
	}
	
}
