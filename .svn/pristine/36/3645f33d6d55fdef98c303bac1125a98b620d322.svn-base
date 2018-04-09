/** 
 * Project Name:service-system 
 * File Name:PubResServiceImpl.java 
 * Package Name:com.htcf.system.service.impl 
 * Date:2016年12月3日上午9:39:26 
 * Copyright (c) 2016, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.service.impl;

import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageInfo;
import com.github.pagehelper.StringUtil;
import com.google.common.base.Joiner;
import com.google.common.base.Splitter;
import com.htcf.frame.core.dbRelevant.QueryParam;
import com.htcf.system.cache.PermissionCache;
import com.htcf.system.dao.PubRoleDao;
import com.htcf.system.exception.ServiceSystemException;
import com.htcf.system.model.bo.PubRoleBo;
import com.htcf.system.model.po.PubAuth;
import com.htcf.system.model.po.PubRes;
import com.htcf.system.model.po.PubRole;
import com.htcf.system.model.po.PubUser;
import com.htcf.system.service.PubAppService;
import com.htcf.system.service.PubAuthService;
import com.htcf.system.service.PubResService;
import com.htcf.system.service.PubRoleService;
import com.htcf.system.service.PubUserService;


/** 
 * ClassName: PubRoleServiceImpl <br/> 
 * Function: 角色  ServiceImpl <br/> 
 * Reason: ADD REASON(可选). <br/> 
 * date: 2016年12月7日 下午3:18:58 <br/> 
 * 
 * @author chenshizhe 
 */
@Service("pubRoleService")
public class PubRoleServiceImpl implements PubRoleService{
	
	private static final Logger logger = LogManager.getLogger(PubRoleServiceImpl.class);
	
	/**
	 * pubRoleDao:角色数据
	 */
	@Autowired
	private PubRoleDao pubRoleDao;
	
	@Autowired
	private PermissionCache permissionCache;
	
	/**
	 * pubResService:资源服务
	 */
	@Autowired
	private PubResService pubResService;
	
	/**
	 * pubAppService:应用服务
	 */
	@Autowired
	private PubAppService pubAppService;
	
	/**
	 * pubAuthService:授权服务
	 */
	@Autowired
	private PubAuthService pubAuthService;
	
	/**
	 * pubUserService:用户服务
	 */
	@Autowired
	private PubUserService pubUserService;

	/**
	 * 新增角色
	 * @param pubRole 角色
	 * @return PubRole 角色
	 * @throws Exception
	 * @see com.htcf.system.service.PubRoleService#addRole(com.htcf.system.model.po.PubRole)
	 */
	@Override
	public PubRole addRole(PubRole pubRole) throws Exception {
		logger.entry("!!!!!!!!!!新增角色");

		// 验证资源合法性重新赋值
		String yyids = checkZyids(pubRole);
		pubRole.setZyids(yyids);
		pubRole.setJsid(pubRoleDao.getSeq());
		pubRole.setSjbb(1L);
		pubRoleDao.add(pubRole);
		return pubRole;
	}
	
	/**
	 * 
	 * 复制角色
	 * 
	 * @param pubRole
	 * @return
	 * @throws Exception PubRole
	 */
	public PubRole copyRole(PubRole pubRole) throws Exception{
		logger.entry("!!!!!!!!!!复制角色");
		pubRole.setJsid(pubRoleDao.getSeq());
		pubRole.setSjbb(1L);
		pubRoleDao.add(pubRole);
		return pubRole;
		
	}

	/**
	 * 修改角色
	 * @param pubRole 角色
	 * @return PubRole 角色
	 * @throws Exception
	 * @see com.htcf.system.service.PubRoleService#updateRole(com.htcf.system.model.po.PubRole)
	 */
	@Override
	public PubRole updateRole(PubRole pubRole) throws Exception {
		logger.entry("!!!!!!!!!!修改角色");

		// 验证资源合法性重新赋值
		if(StringUtils.isNotBlank(pubRole.getZyids()) ){
			String yyids = checkZyids(pubRole);
			pubRole.setZyids(yyids);
		}

		pubRoleDao.update(pubRole, "jsid");
		
		//清空缓存中的授权
		permissionCache.removeByYyid(pubRole.getYyid());
		
		return pubRole;
	}

	/**
	 * 根据角色ID获取角色
	 * @param jsid 角色ID
	 * @return PubRole 角色
	 * @throws Exception
	 * @see com.htcf.system.service.PubRoleService#getRoleByJsid(long)
	 */
	public PubRole getRoleByJsid(long jsid) throws Exception {
		logger.entry("!!!!!!!!!!根据id获取角色", jsid);
		QueryParam queryParam = new QueryParam();
		queryParam.put("jsid", jsid);
		PubRole pubRole = pubRoleDao.getOne(queryParam);
		
		if(null == pubRole){
			throw ServiceSystemException.PUBROLE_NOT_EXIST.newInstance("角色不存在,角色ID:{%s}", jsid);
		}
		
		return pubRole;
	}

	/**
	 * delelteRole
	 * 根据角色ID删除并判断该是否关联了用户
	 * @param jsid 角色ID
	 * @return int
	 * @throws Exception int
	 */
	private int delelteRole(long jsid) throws Exception {
		logger.entry("!!!!!!!!!!删除角色", jsid);

		//删除角色关联并做用户要做判断
		int pubAuthCount = checkSqCount(jsid);
		if(pubAuthCount>0){
			throw ServiceSystemException.PUBRES_NOT_EXIST.newInstance("角色被授权不可删除,角色ID:{%s}", jsid);
		}
		PubRole pubRole = getRoleByJsid(jsid);
		
		int i = pubRoleDao.delete(jsid);
		
		//清空缓存中的授权
		permissionCache.removeByYyid(pubRole.getYyid());
		return i;
	}
	
	/**
	 * 根据角色ID数组删除
	 * @param jsids 角色ID
	 * @return int
	 * @throws Exception
	 * @see com.htcf.system.service.PubRoleService#delelteRoles(long[])
	 */
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int delelteRoles(long... jsids) throws Exception {
		int deleteCount = 0;
		for (int i = 0; i < jsids.length; i++) {
			deleteCount += delelteRole(jsids[i]);
		}
		return deleteCount;
	}

	/**
	 * 根据查询条件获取分页角色
	 * @param map 查询条件
	 * @return PageInfo<PubRole> 分页角色列表
	 * @throws Exception
	 * @see com.htcf.system.service.PubRoleService#getListPage(java.util.Map)
	 */
	@Override
	public PageInfo<PubRole> getListPage(Map<String, Object> map) throws Exception {
		logger.entry("!!!!!!!!!!获取角色分页信息");
		QueryParam queryParam = new QueryParam(map);

		if (map.get("yyid") == null) {
			throw ServiceSystemException.PUBAPP_NOT_EXIST.newInstance("应用编号不能为空,应用编号:{%s}", map.get("yyid"));
		}

		queryParam.put("yyid", map.get("yyid"));

		PageInfo<PubRole> pageInfo = pubRoleDao.getListPage("get", queryParam);

		return pageInfo;
	}
	
	/**
	 * 根据查询条件关联应用获取分页角色
	 * @param map 查询条件
	 * @return PageInfo<PubRole> 分页角色列表
	 * @throws Exception
	 * @see com.htcf.system.service.PubRoleService#getListPageBo(java.util.Map)
	 */
	@Override
	public PageInfo<PubRoleBo> getListPageBo(Map<String, Object> map) throws Exception {
		logger.entry("!!!!!!!!!!获取角色分页信息",map);
		QueryParam queryParam = new QueryParam(map);

		if (map.get("yhbh") == null) {
			throw ServiceSystemException.PUBROLE_NOT_EXIST.newInstance("用户编号不能为空,用户编号:{%s}", map.get("yhbh"));
		}
		
		if (null == map.get("yyid")) {
			//根据用户ID获取应用产品ID
			Object[] yyids = getYyids(map.get("yhbh").toString());
			if(null != yyids && yyids.length>0){
				queryParam.addCondition("yyid", QueryParam.IN, yyids);
			}
		}else{
			if(map.get("yyid") != null && StringUtils.isNotBlank(map.get("yyid").toString())){
				queryParam.put("yyid", map.get("yyid"));
			}
			
		}
		
		String jsmc = null != map.get("jsmc") ? map.get("jsmc").toString() : null;
		if(StringUtil.isNotEmpty(jsmc)){
			queryParam.addCondition("jsmc", "like", "%"+jsmc+"%");
		}

		PageInfo<PubRoleBo> pageInfo = pubRoleDao.getListPageBo("getListPageBo", queryParam);

		return pageInfo;
	}

	/**
	 * checkZyids
	 * 验证角色授权的资源是否都存在
	 * @param pubRole 角色
	 * @return String 角色授权的资源
	 * @throws Exception String
	 */
	private String checkZyids(PubRole pubRole) throws Exception {
		logger.entry("@@@@@@@@@@验证授权的资源是否都存在", pubRole.getYyid(), pubRole.getZyids());
		Long yyid = pubRole.getYyid();
		String zyids = pubRole.getZyids();

		if (yyid == null) {
			throw new RuntimeException("应用id为空");
		}
		if (StringUtils.isNotBlank(zyids)) {
			// 将 1,3,5 这样的字符串数据转为 set
			List<String> result = Splitter.on(",").trimResults().splitToList(zyids);
			Set<String> set = new LinkedHashSet<String>();
			set.addAll(result);

			for (String string : set) {
				PubRes pubres = pubResService.getResByZyid(Long.valueOf(string));
				if (pubres == null) {
					throw ServiceSystemException.PUBRES_NOT_EXIST.newInstance("授权的资源(pubres)已不存在,资源id:{%s}", string);
				}

				// 数据类型不正确
				if (pubres.getYyid() == null || !yyid.equals(pubres.getYyid())) {
					throw ServiceSystemException.PUBRES_NOT_MATCH_APP.newInstance("授权的资源(pubres)超出子系统,资源id:{%s}" , string);
				}
			}

			// 验证通过，将set还原成 1,3,5
			zyids = Joiner.on(",").join(set);
		}
		logger.debug("授权的资源ID：",zyids);
		return zyids;
	}

	/**
	 * 根据用户、应用ID查询角色列表
	 * @param pubUser 用户
	 * @param yyid 应用ID
	 * @return List<PubRole> 角色列表
	 * @throws Exception
	 * @see com.htcf.system.service.PubRoleService#getRoleListByUserAndYyid(com.htcf.system.model.po.PubUser, long)
	 */
	@Override
	public List<PubRole> getRoleListByUserAndYyid(PubUser pubUser,long yyid) throws Exception {
		
		logger.entry("!!!!!!!!!!根据用户与应用ID获取角色列表","用户ID："+pubUser.getYhbh(),"应用ID："+yyid);
		
		//判断用户ID是否存在
		pubUserService.getUserByYhbh(pubUser.getYhbh());
		
		//判断应用ID是否存在
		pubAppService.getAppByYyid(yyid);
		
		QueryParam param = new QueryParam();
		param.put("a.yhbh", pubUser.getYhbh());
		param.put("a.yyid", yyid);
		param.put("r.sybz", "Y");// 角色启用状态
		
		return pubRoleDao.getJoinAuthList(param);
	}
	
	/**
	 * 根据资源ID与应用ID查询角色列表
	 * @param zyid 源ID
	 * @param yyid 应用ID
	 * @return List<PubRole> 角色列表
	 * @throws Exception
	 * @see com.htcf.system.service.PubRoleService#getPubRoleList(long, long)
	 */
	@Override
	public List<PubRole> getPubRoleList(long zyid,long yyid) throws Exception {
		QueryParam queryParam = new QueryParam();
		queryParam.put("yyid", yyid);
		queryParam.addCondition("zyids", QueryParam.LIKE, "%"+zyid+"%");
		List<PubRole> pubRoleList = pubRoleDao.getList(queryParam);
		return pubRoleList;
	}
	
	/**
	 * checkSqCount
	 * 检测角色被授权数量统计
	 * @param jsid 角色ID
	 * @return int 数量统计
	 * @throws Exception int
	 */
	private int checkSqCount(long jsid) throws Exception{
		logger.entry("@@@@@@@@@检测角色被授权数量统计", jsid);
		Map<String, Object> param = new ConcurrentHashMap<String, Object>();
		param.put("jsid", jsid);
		return pubAuthService.getAuthList(param).size();
	}
	
	/**
	 * getYyids
	 * 用户ID获取应用产品ID
	 * @param yhbh 用户ID
	 * @return Object[] 应用产品ID
	 * @throws Exception Object[]
	 */
	private Object[] getYyids(String yhbh) throws Exception{
		logger.entry("@@@@@@@@@根据用户ID获取应用产品ID", yhbh);
		
		Map<String, Object> authMap = new ConcurrentHashMap<String, Object>();
		authMap.put("yhbh", yhbh);
		List<PubAuth> authList = pubAuthService.getAuthList(authMap);
		
		Set<String> set = new LinkedHashSet<String>();
		for (int i = 0; i < authList.size(); i++) {
			set.add(authList.get(i).getYyid().toString());
		}
		//根据set值得到一个字符串 如：1,2,3
		String str = Joiner.on(",").join(set);
		//根据','去掉空值得到list集合
		List<String> strList = Splitter.on(",").trimResults().splitToList(str);
		logger.debug("应用ID",str);
		return strList.toArray();
	}

}
