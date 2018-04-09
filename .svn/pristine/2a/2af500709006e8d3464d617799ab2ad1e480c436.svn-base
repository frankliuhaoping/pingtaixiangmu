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
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.dozer.DozerBeanMapper;
import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.base.Splitter;
import com.htcf.frame.base.util.JsonUtil;
import com.htcf.frame.core.dbRelevant.QueryParam;
import com.htcf.system.cache.PermissionCache;
import com.htcf.system.cache.PubResCache;
import com.htcf.system.cache.PubResListCache;
import com.htcf.system.dao.PubResDao;
import com.htcf.system.exception.ServiceSystemException;
import com.htcf.system.model.bo.PubResBo;
import com.htcf.system.model.po.PubRes;
import com.htcf.system.model.po.PubRole;
import com.htcf.system.model.po.PubUser;
import com.htcf.system.service.PubResService;
import com.htcf.system.service.PubRoleService;

/**
 * ClassName: PubResServiceImpl <br/>
 * Function: 资源ServiceImpl <br/>
 * Reason: ADD REASON(可选). <br/>
 * date: 2016年12月3日 上午9:39:26 <br/>
 * 
 * @author chenshizhe
 */

@Service("pubResService")
public class PubResServiceImpl implements PubResService {

	private static final Logger logger = LogManager.getLogger(PubResServiceImpl.class);

	/**
	 * pubResDao:资源数据
	 */
	@Autowired
	private PubResDao pubResDao;

	/**
	 * pubResDao:资源缓存
	 */
	@Autowired
	private PubResCache pubResCache;

	/**
	 * pubResDao:根据父编号拿到的子List<PubRes>
	 */
	@Autowired
	private PubResListCache pubResListCache;

	/**
	 * pubResDao:权限缓存
	 */
	@Autowired
	private PermissionCache permissionCache;

	/**
	 * pubRoleService:角色服务
	 */
	@Autowired
	private PubRoleService pubRoleService;

	/**
	 * 新增资源
	 * 
	 * @param pubRes 资源
	 * @return PubRes 资源
	 * @throws Exception
	 * @see com.htcf.system.service.PubResService#addRes(com.htcf.system.model.po.PubRes)
	 */
	@Override
	public PubRes addRes(PubRes pubRes) throws Exception {
		logger.entry("!!!!!!!!!!新增资源", JsonUtil.toJsonNonNull(pubRes));
		pubRes.setZyid(pubResDao.getSeq());

		if (pubRes.getZyfid() == null) {
			pubRes.setZyfid(0L);
		} else {
			// 验证父资源是否存在
			checkParentRes(pubRes);
		}

		// 父资源ID字符串，如0/3/5"
		pubRes.setZyfids(getFzyidsStr(pubRes));
		pubResDao.add(pubRes);

				
		// 清空资源List缓存
		pubResListCache.remove(pubRes.getYyid()+"_"+pubRes.getZyfid());
		return pubRes;
	}

	/**
	 * getFzyidsStr 获取父资源ID字符串
	 * 
	 * @param pubRes 资源
	 * @return String 父资源ID字符串
	 * @throws Exception String
	 */
	private String getFzyidsStr(PubRes pubRes) throws Exception {
		logger.entry("@@@@@@@@@@获取父资源ID字符串，如0/3/5", JsonUtil.toJsonNonNull(pubRes));
		if (pubRes == null) {
			throw ServiceSystemException.PUBRES_NOT_EXIST.newInstance("pubRes为空");
		}

		String ids = "";
		while (true) {
			String strZyfid = pubRes.getZyfid() + "/";
			ids = strZyfid + ids;
			if (pubRes.getZyfid() == 0) {
				break;
			} else {
				pubRes = getResByZyid(pubRes.getZyfid());
			}
		}

		logger.debug(ids);
		return ids;
	}

	/**
	 * getResLevel 获取资源级别
	 * 
	 * @param pubRes 资源
	 * @return int 级别
	 */
	private int getResLevel(PubRes pubRes) {
		logger.entry("@@@@@@@@@@获取资源级别，如0/3/5 则代表为第3级，为空代表0级", JsonUtil.toJsonNonNull(pubRes));
		if (pubRes == null) {
			throw ServiceSystemException.PUBRES_NOT_EXIST.newInstance("pubRes为空");
		}

		int level = 0;
		if (pubRes.getZyfid() != 0) {
			String zyfids = pubRes.getZyfids();
			String[] array = zyfids.split("/");
			if (array != null) {
				level = array.length - 1;
			}
		}

		logger.debug("当前资源级别" + level);
		return level;
	}

	/**
	 * 修改资源
	 * 
	 * @param pubRes 资源
	 * @return PubRes 资源
	 * @throws Exception
	 * @see com.htcf.system.service.PubResService#updateRes(com.htcf.system.model.po.PubRes)
	 */
	@Override
	public PubRes updateRes(PubRes pubRes) throws Exception {
		logger.entry("!!!!!!!!!!修改资源", JsonUtil.toJsonNonNull(pubRes));
		
		if(pubRes.getZylx()==1){
			List<PubRes> pubResList = getListByZyfid(pubRes.getYyid(), pubRes.getZyid());

			for (PubRes subPubRes : pubResList) {
				if(subPubRes.getZylx()==1){
					// 同步禁用或开启 子菜单 
					subPubRes.setSybz(pubRes.getSybz());
					updateRes(subPubRes);
				}
			}
		}
		
		pubResDao.update(pubRes, "zyid");
		
		

		// 清空资源缓存
		pubResCache.remove(pubRes.getZyid().longValue());
		
		// 清空资源List缓存  包括自己和父id
		pubResListCache.remove(pubRes.getYyid()+"_"+pubRes.getZyid());
		pubResListCache.remove(pubRes.getYyid()+"_"+pubRes.getZyfid());
		
		permissionCache.removeByYyid(pubRes.getZyid().longValue());

		return pubRes;
	}

	/**
	 * 根据资源id获取资源
	 * 
	 * @param zyid 资源id
	 * @return PubRes
	 * @throws Exception
	 * @see com.htcf.system.service.PubResService#getResByZyid(long)
	 */
	@Override
	public PubRes getResByZyid(long zyid) throws Exception {
		logger.entry("!!!!!!!!!!根据id获取资源", zyid);

		// 从缓存中拿数据
		PubRes pubRes = pubResCache.get(zyid);
		if (pubRes == null) {
			QueryParam queryParam = new QueryParam();
			queryParam.put("zyid", zyid);
			pubRes = pubResDao.getOne(queryParam);
			if (null == pubRes) {
				throw ServiceSystemException.PUBRES_NOT_EXIST.newInstance("资源不存在,zyid{%s}", zyid);
			}
			pubResCache.put(zyid, pubRes);
		}
		return pubRes;
	}

	/**
	 * 删除资源且同时删除对应的子菜单资源
	 * 
	 * @param long... zyid 资源id
	 * @return int
	 * @throws Exception
	 * @see com.htcf.system.service.PubResService#delelteRes(long[])
	 */
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int delelteRes(long... zyid) throws Exception {

		logger.entry("!!!!!!!!!!删除资源", zyid);
		for (long id : zyid) {
			deleteSingle(id);
		}
		return 1;
	}

	/**
	 * deleteSingle 删除资源时并判断是否关联角色
	 * 
	 * @param id 资源id
	 * @throws Exception void
	 */
	private void deleteSingle(long id) throws Exception {

		logger.entry("@@@@@@@@@@单个删除", id);
		PubRes pubRes = getResByZyid(id);

		if (null != pubRes.getYyid()) {
			// 判断是否有角色关联
			List<PubRole> pubRoleList = pubRoleService.getPubRoleList(id, pubRes.getYyid());
			if (null != pubRoleList && pubRoleList.size() > 0) {
				for (PubRole pubRole : pubRoleList) {
					List<String> result = Splitter.on(",").trimResults().splitToList(pubRole.getZyids());
					if (result.contains(String.valueOf(id))) {
						throw ServiceSystemException.PUBRES_EXIST.newInstance("资源已被角色授权,zyid{%s}", id);
					}
				}
				logger.trace("资源ID", id, "资源关联角色", JsonUtil.toJsonNonNull(pubRoleList));
			}
		}

		// 删除子菜单
		List<PubResBo> pubResBoList = getPubResNodesById(pubRes.getYyid(), id, 0);
		logger.debug("父资源ID", id, "子菜单资源", JsonUtil.toJsonNonNull(pubResBoList));

		if (null != pubResBoList && pubResBoList.size() > 0) {
			for (PubResBo pubResBo : pubResBoList) {
				deleteSingle(pubResBo.getZyid());
			}
		}

		pubResDao.delete(id);

		// 清空资源缓存
		pubResCache.remove(id);
		
		// 清空资源List缓存  包括自己和父id
		pubResListCache.remove(pubRes.getYyid()+"_"+id);
		pubResListCache.remove(pubRes.getYyid()+"_"+pubRes.getZyfid());
	}

	/**
	 * getListByZyfid 根据父资源ID获取资源列表
	 * 
	 * @param zyfid 父ID
	 * @return List<PubRes> 资源列表
	 */
	private List<PubRes> getListByZyfid(long yyid, long zyfid) {
		logger.entry("@@@@@@@@@@根据资源父ID获取资源列表", zyfid);

		String key = yyid + "_" +zyfid;
		List<PubRes> pubResList = pubResListCache.get(key);
		if (pubResList == null) {
			QueryParam queryParam = new QueryParam();
			queryParam.put("yyid", yyid);
			queryParam.put("zyfid", zyfid);
			pubResList = pubResDao.getList(queryParam);
			
			pubResListCache.put(key, pubResList);
		}

		return pubResList;
	}

	/**
	 * getCountByZyfid 根据资源父ID获取子资源数量
	 * 
	 * @param zyfid 父ID
	 * @return int 子资源数量
	 */
	private int getCountByZyfid(long yyid, long zyfid) {
		logger.entry("@@@@@@@@@@根据资源父ID获取子资源数量", zyfid);
		List<PubRes> pubRes = getListByZyfid(yyid, zyfid);
		return pubRes.size();
	}

	/**
	 * 根据id获取子节点
	 * 
	 * @param: id 父编号
	 * @param: deepType 0:不加载孙子节点 1：递归加载所有孙子节点（按树型数据结构返回） 2：递归加载所有孙子节点（按并列数据结构返回）
	 * @return: List<PubResBo> 资源列表
	 * @throws Exception
	 * @see com.htcf.system.service.PubResService#getPubResNodesById(long, int)
	 */
	// @Override
	public List<PubResBo> getPubResNodesById(long yyid, long zyid, int deepType) throws Exception {
		logger.entry("!!!!!!!!!!根据id获取子节点", yyid, zyid, deepType);

		List<PubResBo> pubResNodes = new ArrayList<PubResBo>();
		// 根据父资源ID获取资源列表
		List<PubRes> pubResList = getListByZyfid(yyid, zyid);

		for (PubRes pubRes : pubResList) {
			PubResBo pubResNode = new PubResBo();

			// 属性复制
			Mapper mapper = new DozerBeanMapper();
			mapper.map(pubRes, pubResNode);

			// 节点在整棵树所在的级别
			pubResNode.setLevel(getResLevel(pubRes));

			if (getCountByZyfid(yyid, pubRes.getZyid()) == 0) {
				// 当前节点已经是叶子节点
				pubResNode.setIsLeaf(true);
			} else {
				pubResNode.setIsLeaf(false);
				if (deepType == 1) {
					// 递归调用，生成树型结构
					List<PubResBo> childrenList = getPubResNodesById(yyid, pubRes.getZyid(), 1);
					pubResNode.setChildren(childrenList);
				} else if (deepType == 2) {
					// 递归调用，生成并列结构
					List<PubResBo> childrenList = getPubResNodesById(yyid, pubRes.getZyid(), 2);
					pubResNodes.addAll(childrenList);
				}
			}
			pubResNodes.add(pubResNode);
		}
		return pubResNodes;
	}

	/**
	 * checkParentRes 验证父资源是否存在
	 * 
	 * @param pubRes 资源
	 * @throws Exception void
	 */
	private void checkParentRes(PubRes pubRes) throws Exception {
		logger.entry("@@@@@@@@@@验证父资源是否存在", JsonUtil.toJsonNonNull(pubRes));
		if (pubRes.getZyfid() != null) {
			// 验证父Id
			PubRes parentRes = getResByZyid(pubRes.getZyfid());
			if (parentRes == null) {
				throw ServiceSystemException.PUBRES_NOT_EXIST.newInstance("父资源不存在,zyfid{%s}", pubRes.getZyfid());
			}
		}
	}

	/**
	 * 
	 * 根据用户、应用ID查询资源菜单列表
	 * 
	 * @param pubUser 资源
	 * @param yyid 应用ID
	 * @return List<PubRes> 菜单资源列表
	 * @throws Exception
	 * @see com.htcf.system.service.PubResService#getResListByUserAndYyid(com.htcf.system.model.po.PubUser, long)
	 */
	@Override
	public List<PubRes> getResListByUserAndYyid(PubUser pubUser, long yyid) throws Exception {

		logger.entry("!!!!!!!!!!根据用户、应用ID查询菜单列表", JsonUtil.toJsonNonNull(pubUser), yyid);

		// 获取资源ID
		Set<String> set = getZyids(pubUser, yyid);

		// 获取资源
		List<PubRes> pubResList = new ArrayList<PubRes>();
		for (String zyid : set) {
			PubRes pubRes = getResByZyid(Long.parseLong(zyid));
			if (pubRes.getZylx() == 1) {// 1.菜单 2.按钮
				pubResList.add(pubRes);
			}
		}
		return pubResList;
	}

	/**
	 * getZyids 根据用户、应用ID查询资源ID
	 * 
	 * @param pubUser 资源
	 * @param yyid 应用ID
	 * @return Set<String> 资源ID
	 * @throws Exception Set<String>
	 */
	private Set<String> getZyids(PubUser pubUser, long yyid) throws Exception {

		logger.entry("@@@@@@@@@@根据用户、应用ID查询资源ID", JsonUtil.toJsonNonNull(pubUser), yyid);

		// 获取角色列表
		List<PubRole> pubRoleList = pubRoleService.getRoleListByUserAndYyid(pubUser, yyid);
		if (null == pubRoleList || pubRoleList.size() == 0) {
			throw ServiceSystemException.PUBROLE_NOT_EXIST.newInstance("用户在应用中未设置角色,用户ID:yhbh{%s},应用ID:yyid{%s}",
					pubUser.getYhbh(), yyid);
		}

		// 根据角色列表获取资源ID
		Set<String> set = new LinkedHashSet<String>();
		for (PubRole pubRole : pubRoleList) {
			if (StringUtils.isNotBlank(pubRole.getZyids())) {
				List<String> result = Splitter.on(",").trimResults().splitToList(pubRole.getZyids());
				set.addAll(result);
			}
		}

		if (null == set || set.size() == 0) {
			throw ServiceSystemException.PUBRES_NOT_EXIST.newInstance("角色授权的资源不存在,用户ID:yhbh{%s},应用ID:yyid{%s}",
					pubUser.getYhbh(), yyid);
		}
		return set;
	}

	/**
	 * 根据条件查询资源列表
	 * 
	 * @param map 查询条件
	 * @return List<PubRes> 资源列表
	 * @throws Exception
	 * @see com.htcf.system.service.PubResService#getResList(java.util.Map)
	 */
	@Override
	public List<PubRes> getResList(Map<String, Object> map) throws Exception {
		logger.entry("!!!!!!!!!!!!!获取资源列表", map);
		QueryParam param = new QueryParam();
		for (String key : map.keySet()) {
			param.put(key, map.get(key));
		}
		List<PubRes> resultlist = new ArrayList<PubRes>();
		List<PubRes> list = pubResDao.getList(param);
		if (null != list) {
			resultlist.addAll(list);
		}
		return resultlist;
	}

	/**
	 * 根据用户、应用ID查询权限资源
	 * 
	 * @param pubUser 资源
	 * @param yyid 应用ID
	 * @return Set<String> 权限资源
	 * @throws Exception
	 * @see com.htcf.system.service.PubResService#getResPermissions(com.htcf.system.model.po.PubUser, long)
	 */
	@Override
	public Set<String> getResPermissions(PubUser pubUser, long yyid) throws Exception {
		logger.entry("!!!!!!!!!!根据用户、应用ID查询权限列表", JsonUtil.toJsonNonNull(pubUser), yyid);

		String key = yyid + "_" + pubUser.getYhbh();
		Set<String> qxdmSet = permissionCache.get(key);

		if (qxdmSet == null) {
			// 获取资源ID
			Set<String> set = getZyids(pubUser, yyid);

			qxdmSet = new LinkedHashSet<String>();
			for (String zyid : set) {
				PubRes pubRes = getResByZyid(Long.parseLong(zyid));
				if (pubRes.getZylx() == 2) {// 1.菜单 2.按钮
					qxdmSet.add(pubRes.getQxdm());
				}
			}
			permissionCache.put(key, qxdmSet);
		}

		return qxdmSet;
	}

}
