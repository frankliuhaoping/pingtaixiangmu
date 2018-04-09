package com.htcf.system.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageInfo;
import com.google.common.base.Joiner;
import com.google.common.base.Splitter;
import com.htcf.frame.base.util.JsonUtil;
import com.htcf.frame.core.dbRelevant.QueryParam;
import com.htcf.system.dao.PubAppDao;
import com.htcf.system.exception.ServiceSystemException;
import com.htcf.system.init.ServiceSystemConstants;
import com.htcf.system.model.po.PubApp;
import com.htcf.system.model.po.PubAuth;
import com.htcf.system.model.po.PubRole;
import com.htcf.system.service.PubAppService;
import com.htcf.system.service.PubAuthService;
import com.htcf.system.service.PubResService;
import com.htcf.system.service.PubRoleService;

/**
 * 
 * ClassName: PubAppServiceImpl <br/>
 * Function: 应用 ServiceImpl <br/>
 * Reason: ADD REASON(可选). <br/>
 * date: 2016年12月23日 下午1:03:54 <br/>
 * 
 * @author zhangyingzi
 */
@Service("pubAppService")
public class PubAppServiceImpl implements PubAppService {

	/**
	 * pubAppDao:应用数据
	 */
	@Autowired
	private PubAppDao pubAppDao;

	/**
	 * pubResService:资源服务
	 */
	@Autowired
	private PubResService pubResService;

	/**
	 * pubAuthService:授权服务
	 */
	@Autowired
	private PubAuthService pubAuthService;

	@Autowired
	private PubRoleService pubRoleService;

	private static final Logger logger = LogManager.getLogger(PubAppServiceImpl.class);

	/**
	 * 添加应用
	 * 
	 * @param pubApp 应用
	 * @return PubApp 应用
	 * @throws Exception
	 * @see com.htcf.system.service.PubAppService#addApp(com.htcf.system.model.po.PubApp)
	 */
	@Override
	@Transactional(rollbackFor = Exception.class)
	public PubApp addApp(PubApp pubApp) throws Exception {
		logger.entry("!!!!!!!!!!新增App", JsonUtil.toJsonNonNull(pubApp));
		pubApp.setYyid(pubAppDao.getSeq());
		pubApp.setYyaqm(UUID.randomUUID().toString());
		// 状态标记
		pubAppDao.add(pubApp);

		// TODO 逻辑需完善
		PubRole pubRole = new PubRole();
		pubRole.setYyid(pubApp.getYyid());
		pubRole.setJsmc(pubApp.getYymc() + "管理员");
		pubRole.setSybz("Y");
		pubRole.setCjsj(new Date(System.currentTimeMillis()));
		pubRole.setGxsj(new Date(System.currentTimeMillis()));
		pubRole.setCjrxm(pubApp.getCjrxm());
		pubRoleService.addRole(pubRole);

		PubAuth pubAuth = new PubAuth();
		pubAuth.setYhbh(ServiceSystemConstants.SADMIN_YHBH);
		pubAuth.setYyid(pubApp.getYyid());
		pubAuth.setJsid(pubRole.getJsid());
		pubAuth.setCjsj(new Date(System.currentTimeMillis()));
		pubAuth.setCjrxm(pubApp.getCjrxm());
		pubAuth.setGxsj(new Date(System.currentTimeMillis()));
		pubAuthService.addAuth(pubAuth);
		return pubApp;
	}

	/**
	 * 修改应用
	 * 
	 * @param pubApp 应用
	 * @return PubApp 应用
	 * @throws Exception
	 * @see com.htcf.system.service.PubAppService#updateApp(com.htcf.system.model.po.PubApp)
	 */
	@Override
	public PubApp updateApp(PubApp pubApp) throws Exception {
		logger.entry("!!!!!!!!!!修改App", JsonUtil.toJsonNonNull(pubApp));

		getAppByYyid(pubApp.getYyid());

		pubAppDao.update(pubApp, "yyid");
		return pubApp;
	}

	/**
	 * 根据Id获取应用
	 * 
	 * @param yyid 应用Id
	 * @return PubApp 应用
	 * @throws Exception
	 * @see com.htcf.system.service.PubAppService#getAppByYyid(long)
	 */
	@Override
	public PubApp getAppByYyid(long yyid) throws Exception {

		logger.entry("!!!!!!!!!!根据ID获取App", yyid);
		QueryParam queryParam = new QueryParam();
		queryParam.put("yyid", yyid);
		PubApp pubApp = pubAppDao.getOne(queryParam);
		if (null == pubApp) {
			throw ServiceSystemException.PUBAPP_NOT_EXIST.newInstance("应用不存在,yyid{%s}", yyid);
		}
		return pubApp;
	}

	/**
	 * delelteApp 删除应用
	 * 
	 * @param yyid 应用Id
	 * @return int
	 * @throws Exception int
	 */
	private int delelteApp(long yyid) throws Exception {
		logger.entry("@@@@@@@@@@@@@删除App", yyid);
		int zyCount = checkZyCount(yyid);
		if (zyCount > 0) {
			throw ServiceSystemException.PUBAPP_EXIST.newInstance("应用不可删除存在资源引用,应用Id:{%s}", yyid);
		}
		getAppByYyid(yyid);
		Integer deletAppCount = pubAppDao.delete(yyid);
		if (deletAppCount > 0) {

			// 删除应用关联角色
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("yyid", yyid);
			map.put("offset", "0");
			map.put("limit", "10");
			// TODO 删除逻辑不对，需要重新处理
			PageInfo<PubRole> pubInfo = pubRoleService.getListPage(map);
			if (pubInfo != null && pubInfo.getList() != null && pubInfo.getList().size() > 0) {
				Long jsid = pubInfo.getList().get(0).getJsid();
				Integer deleteRolesCount = pubRoleService.delelteRoles(jsid);

				if (deleteRolesCount > 0) {
					// 删除授权
					map = new HashMap<String, Object>();
					map.put("yyid", yyid);
					map.put("jsid", jsid);
					List<PubAuth> pubAuths = pubAuthService.getAuthList(map);
					if (pubAuths != null && pubAuths.size() > 0) {
						pubAuthService.deleteAuth(pubAuths.get(0).getSqid());
					}
				}

			}
		}
		return deletAppCount;
	}

	/**
	 * 根据查询条件获取分页列表
	 * 
	 * @param map 查询条件
	 * @return PageInfo<PubApp> 分页列表
	 * @throws Exception
	 * @see com.htcf.system.service.PubAppService#getListPage(java.util.Map)
	 */
	@Override
	public PageInfo<PubApp> getListPage(Map<String, Object> map) throws Exception {
		logger.entry("!!!!!!!!!!根据条件获取分页后的APP列表", map);

		if (map != null && !map.containsKey("sort")) {
			map.put("sort", "pxdm");
			map.put("order", "asc");
		}

		QueryParam queryParam = new QueryParam(map);

		// 应用名称
		String yymc = null != map.get("yymc") ? map.get("yymc").toString() : null;
		if (StringUtils.isNotEmpty(yymc)) {
			queryParam.addCondition("yymc", "like", "%" + yymc + "%");
		}

		// 应用代码
		String yydm = null != map.get("yydm") ? map.get("yydm").toString() : null;
		if (StringUtils.isNotEmpty(yydm)) {
			queryParam.addCondition("yydm", "like", "%" + yydm + "%");
		}

		// 应用安全码
		String yyaqm = null != map.get("yyaqm") ? map.get("yyaqm").toString() : null;
		if (StringUtils.isNotEmpty(yyaqm)) {
			queryParam.addCondition("yyaqm", "like", "%" + yyaqm + "%");
		}
		// 应用标志
		String sybz = null != map.get("sybz") ? map.get("sybz").toString() : null;
		if (StringUtils.isNotEmpty(sybz)) {
			queryParam.addCondition("sybz", "like", "%" + sybz + "%");
		}

		PageInfo<PubApp> pageInfo = pubAppDao.getListPage("get", queryParam);

		return pageInfo;
	}

	/**
	 * 根据应用代码获取应用
	 * 
	 * @param yydm 应用代码
	 * @return PubApp 应用
	 * @throws Exception
	 * @see com.htcf.system.service.PubAppService#getAppByYydm(java.lang.String)
	 */
	@Override
	public PubApp getAppByYydm(String yydm) throws Exception {
		logger.entry("!!!!!!!!!!根据应用代码获取应用", "应用代码：" + yydm);

		QueryParam queryParam = new QueryParam();
		queryParam.put("yydm", yydm);
		PubApp pubApp = pubAppDao.getOne(queryParam);
		if (null == pubApp) {
			throw ServiceSystemException.PUBAPP_NOT_EXIST.newInstance("应用代码不存在,yydm{%s}", yydm);
		}
		return pubApp;
	}

	/**
	 * 
	 * getAppByYymc 根据应用名称获取应用
	 * 
	 * @param yymc 应用名称
	 * @return PubApp 应用
	 * @throws Exception PubApp
	 */
	@Override
	public PubApp getAppByYymc(String yymc) throws Exception {
		logger.entry("!!!!!!!!!!根据应用名称获取应用", "应用名称：" + yymc);
		
		QueryParam queryParam = new QueryParam();
		queryParam.put("yymc", yymc);
		PubApp pubApp = pubAppDao.getOne(queryParam);
		return pubApp;
	}

	/**
	 * 根据应用Id删除应用
	 * 
	 * @param long... yyids 应用ID
	 * @return int
	 * @throws Exception
	 * @see com.htcf.system.service.PubAppService#delelteApp(long[])
	 */
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int delelteApp(long... yyids) throws Exception {
		logger.entry("!!!!!!!!!!根据应用编号删除应用");

		int deleteCount = 0;
		for (int i = 0; i < yyids.length; i++) {
			deleteCount += delelteApp(yyids[i]);
		}
		return deleteCount;
	}

	/**
	 * checkZyCount 检测是否存在资源引用
	 * 
	 * @param yyid 应用ID
	 * @return int 引用数量
	 * @throws Exception int
	 */
	private int checkZyCount(long yyid) throws Exception {
		Map<String, Object> param = new ConcurrentHashMap<String, Object>();
		param.put("yyid", yyid);
		return pubResService.getResList(param).size();
	}

	/**
	 * 根据查询条件获取关联授权表分组后的应用
	 * 
	 * @param map 查询条件
	 * @return List<PubApp> 应用列表
	 * @throws Exception
	 * @see com.htcf.system.service.PubAppService#getAppJoinAuthGroupList(java.util.Map)
	 */
	@Override
	public List<PubApp> getAppJoinAuthGroupList(Map<String, Object> map) throws Exception {
		logger.entry("!!!!!!!!!!根据查询条件获取关联授权表分组后的应用", map);
		QueryParam queryParam = new QueryParam();

		// 用户编号
		String yhbh = null != map.get("yhbh") ? map.get("yhbh").toString() : null;
		if (StringUtils.isNotEmpty(yhbh)) {
			queryParam.put("a.yhbh", map.get("yhbh"));

			String system = null != map.get("system") ? map.get("system").toString() : null;

			if (StringUtils.isEmpty(system)) {
				// 不需要显示system的数据
				// 但需特殊排除平台管理员，平台管理员肯定可以看system的数据
				if (!yhbh.equals(ServiceSystemConstants.SADMIN_YHBH)) {
					queryParam.addCondition("t.yydm", "!=", "system");
				}
			}
		}

		// 应用类型
		String yylx = null != map.get("yylx") ? map.get("yylx").toString() : null;
		if (StringUtils.isNotEmpty(yylx)) {
			queryParam.put("t.yylx", yylx);
		}

		// 使用标志
		queryParam.put("t.sybz", "Y");

		return pubAppDao.getAppJoinAuthGroupList(queryParam);
	}

	/**
	 * 根据查询条件查询应用列表
	 * 
	 * @param map 查询条件
	 * @return List<PubApp> 应用列表
	 * @throws Exception
	 * @see com.htcf.system.service.PubAppService#getAppList(java.util.Map)
	 */
	@Override
	public List<PubApp> getAppList(Map<String, Object> map) throws Exception {
		logger.entry("!!!!!!!!!!根据查询条件查询应用列表", map);
		QueryParam param = new QueryParam();

		if (map.get("yhbh") == null) {
			throw ServiceSystemException.PUBROLE_NOT_EXIST.newInstance("用户编号不能为空,用户编号:{%s}", map.get("yhbh"));
		}

		// 根据用户编号检测角色id
		Object[] yyids = checkYyids(map);
		if (null != yyids && yyids.length > 0) {
			param.addCondition("yyid", QueryParam.IN, yyids);
		}

		return pubAppDao.getAppJoinAuthGroupList(param);
	}

	private Object[] checkYyids(Map<String, Object> map) throws Exception {
		logger.entry("@@@@@@@@@检测用户编号获取yyid", map.get("yhbh"));

		Map<String, Object> authMap = new ConcurrentHashMap<String, Object>();
		authMap.put("yhbh", map.get("yhbh"));
		List<PubAuth> authList = pubAuthService.getAuthList(authMap);

		Set<String> set = new LinkedHashSet<String>();
		if (null == map.get("yyid")) {
			for (int i = 0; i < authList.size(); i++) {
				set.add(authList.get(i).getYyid().toString());
			}
		} else {
			set.add(map.get("yyid").toString());
		}
		// 根据set值得到一个字符串 如：1,2,3
		String str = Joiner.on(",").join(set);
		// 根据','去掉空值得到list集合
		List<String> strList = Splitter.on(",").trimResults().splitToList(str);
		return strList.toArray();
	}

}
