package com.htcf.system.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageInfo;
import com.github.pagehelper.StringUtil;
import com.htcf.frame.base.util.DateUtil;
import com.htcf.frame.base.util.JsonUtil;
import com.htcf.frame.core.dbRelevant.QueryParam;
import com.htcf.system.cache.PubUserCache;
import com.htcf.system.dao.PubUserDao;
import com.htcf.system.exception.ServiceSystemException;
import com.htcf.system.init.ServiceSystemConstants;
import com.htcf.system.model.bo.PubUserBo;
import com.htcf.system.model.po.PubAuth;
import com.htcf.system.model.po.PubUser;
import com.htcf.system.service.PubAppService;
import com.htcf.system.service.PubAuthService;
import com.htcf.system.service.PubResService;
import com.htcf.system.service.PubRoleService;
import com.htcf.system.service.PubUserService;

/**
 * 
 * ClassName: PubUserServiceImpl <br/>
 * Function: 用户 ServiceImpl <br/>
 * Reason: ADD REASON(可选). <br/>
 * date: 2016年12月13日 上午9:30:35 <br/>
 * 
 * @author zhangyingzi
 */
@Service("pubUserService")
public class PubUserServiceImpl implements PubUserService {

	private static final Logger logger = LogManager.getLogger(PubUserServiceImpl.class);

	/**
	 * pubUserDao:用户数据
	 */
	@Autowired
	private PubUserDao pubUserDao;

	/**
	 * pubUserCache:用户缓存
	 */
	@Autowired
	private PubUserCache pubUserCache;

	/**
	 * pubAuthService:授权服务
	 */
	@Autowired
	private PubAuthService pubAuthService;

	/**
	 * pubAppService:应用服务
	 */
	@Autowired
	private PubAppService pubAppService;

	/**
	 * pubRoleService:角色服务
	 */
	@Autowired
	private PubRoleService pubRoleService;

	/**
	 * pubResService:资源服务
	 */
	@Autowired
	private PubResService pubResService;

	/**
	 * 添加用户
	 * 
	 * @param pubUser 用户
	 * @return PubUser 用户
	 * @throws Exception
	 * @see com.htcf.system.service.PubUserService#addUser(com.htcf.system.model.po.PubUser)
	 */
	@Override
	public PubUser addUser(PubUser pubUser) throws Exception {

		logger.entry("!!!!!!!!!!新增用户", JsonUtil.toJsonNonNull(pubUser));

		PubUser oPubUser = getUserByYhzh(pubUser.getYhzh());
		if (null != oPubUser) {
			throw ServiceSystemException.PUBUSER_NOT_EXIST.newInstance("用户账号已存在,yhzh{%s}", pubUser.getYhzh());
		}
		// 设置默认密码
		String password = DigestUtils.md5Hex(ServiceSystemConstants.DEFAULT_PASSWORD.getBytes());
		pubUser.setYhmm(password);

		if (pubUser != null) {
			pubUser.setYhbh(pubUser.getYhzh());
		}
		pubUserDao.add(pubUser);
		return pubUser;
	}

	/**
	 * 修改用户
	 * 
	 * @param pubUser 用户
	 * @return PubUser 用户
	 * @throws Exception
	 * @see com.htcf.system.service.PubUserService#updateUser(com.htcf.system.model.po.PubUser)
	 */
	@Override
	public PubUser updateUser(PubUser pubUser) throws Exception {

		logger.entry("!!!!!!!!!!修改用户", JsonUtil.toJsonNonNull(pubUser));

		// 如果用户传了密码，进行加密处理
		if (pubUser != null && StringUtils.isNotBlank(pubUser.getYhmm())) {
			String password = DigestUtils.md5Hex(pubUser.getYhmm().getBytes());
			pubUser.setYhmm(password);
		}
		pubUserDao.update(pubUser, "yhbh");
		
		//清缓存
		pubUserCache.remove(pubUser.getYhzh());

		return pubUser;
	}

	/**
	 * 根据用户ID获取用户
	 * 
	 * @param yhbh 用户ID
	 * @return PubUser 用户
	 * @throws Exception
	 * @see com.htcf.system.service.PubUserService#getUserByYhbh(java.lang.String)
	 */
	@Override
	public PubUser getUserByYhbh(String yhbh) throws Exception {

		logger.entry("!!!!!!!!!!根据用户ID获取用户", yhbh);

		QueryParam queryParam = new QueryParam();
		queryParam.put("yhbh", yhbh);
		PubUser pubUser = pubUserDao.getOne(queryParam);
		if (null == pubUser) {
			throw ServiceSystemException.PUBUSER_NOT_EXIST.newInstance("用户ID不存在,yhbh{%s}", yhbh);
		}
		return pubUser;
	}

	/**
	 * 根据用户ID删除用户
	 * 
	 * @param String... yhbhs 用户ID
	 * @return int
	 * @throws Exception
	 * @see com.htcf.system.service.PubUserService#delelteUser(java.lang.String[])
	 */
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int delelteUser(String... yhbhs) throws Exception {

		logger.entry("!!!!!!!!!!删除用户", yhbhs);
		for (String yhbh : yhbhs) {

			// 删除授权
			Map<String, Object> authMap = new ConcurrentHashMap<String, Object>();
			authMap.put("yhbh", yhbh);
			List<PubAuth> authList = pubAuthService.getAuthList(authMap);
			if (null != authList && authList.size() > 0) {
				Long[] sqids = new Long[authList.size()];
				for (int i = 0; i < authList.size(); i++) {
					sqids[i] = authList.get(i).getSqid();
				}
				pubAuthService.deleteAuth(sqids);
				logger.trace("删除授权", JsonUtil.toJsonNonNull(authList));
			}
			
			PubUser pubUser = getUserByYhbh(yhbh);
			
			// 删除用户
			pubUserDao.delete(yhbh);
			
			//清缓存
			pubUserCache.remove(pubUser.getYhzh());
		}
		return 1;
	}

	/**
	 * 根据查询条件获取分页用户列表
	 * 
	 * @param map 查询条件
	 * @return PageInfo<PubUser> 分页用户列表
	 * @throws Exception
	 * @see com.htcf.system.service.PubUserService#getListPage(java.util.Map)
	 */
	@Override
	public PageInfo<PubUser> getListPage(Map<String, Object> map) throws Exception {

		logger.entry("!!!!!!!!!!根据条件获取分页后的用户列表", map);

		// 默认用户 按最后更新时间排序
		if (map != null && !map.containsKey("sort")) {
			map.put("order", "desc");
			map.put("sort", "gxsj");
		}

		QueryParam queryParam = new QueryParam(map);
		String yhmc = null != map.get("yhmc") ? map.get("yhmc").toString() : null;
		if (StringUtil.isNotEmpty(yhmc)) {
			queryParam.addCondition("yhmc", "like", "%" + yhmc + "%");
		}

		String yhzh = null != map.get("yhzh") ? map.get("yhzh").toString() : null;
		if (StringUtil.isNotEmpty(yhzh)) {
			queryParam.addCondition("yhzh", "like", "%" + yhzh + "%");
		}

		String lxdh = null != map.get("lxdh") ? map.get("lxdh").toString() : null;
		if (StringUtil.isNotEmpty(lxdh)) {
			queryParam.addCondition("lxdh", "=", lxdh);
		}

		String ssdwdm = null != map.get("ssdwdm") ? map.get("ssdwdm").toString() : null;
		if (StringUtil.isNotEmpty(ssdwdm)) {
			queryParam.addCondition("ssdwdm", "like", ssdwdm + "%");
		}

		String starttime = null != map.get("starttime") ? map.get("starttime").toString() : null;
		String endtime = null != map.get("endtime") ? map.get("endtime").toString() : null;

		if (StringUtil.isNotEmpty(starttime)) {   // 大于开始时间记录
			queryParam.addCondition("cjsj", ">=", DateUtil.getDateTimeFormat(starttime));
		}
		if (StringUtil.isNotEmpty(endtime)) {  // 小于结束时间记录
			queryParam.addCondition("cjsj", "<=", DateUtil.getDateTimeFormat(endtime));
		}

		PageInfo<PubUser> pageInfo = pubUserDao.getListPage("get", queryParam);

		return pageInfo;
	}

	/**
	 * 
	 * 根据日期,获取日期的后一天的日期
	 * 
	 * @param time
	 * @return
	 * @throws ParseException String
	 */
	public String getAfterTime(String time) throws ParseException {

		Date date = (new SimpleDateFormat("yyyy-MM-dd")).parse(time);
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.DATE, 1);
		return new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
	}

	/**
	 * 根据用户账号获取用户
	 * 
	 * @param yhzh 用户账号
	 * @return PubUser 用户
	 * @throws Exception
	 * @see com.htcf.system.service.PubUserService#getUserByYhzh(java.lang.String)
	 */
	@Override
	public PubUser getUserByYhzh(String yhzh) throws Exception {

		logger.entry("!!!!!!!!!!根据用户账号获取用户信息", yhzh);

		// 优先从缓存中取
		PubUser pubUser = pubUserCache.get(yhzh);

		if (pubUser == null && yhzh != null) {
			QueryParam queryParam = new QueryParam();
			queryParam.put("yhzh", yhzh);
			pubUser = pubUserDao.getOne(queryParam);

			// 放入缓存
			if (pubUser != null) {
				pubUserCache.put(pubUser.getYhzh(), pubUser);
			}
		}

		return pubUser;
	}

	/**
	 * 
	 * 根据用户账号、密码获取用户
	 * 
	 * @param yhzh 用户账号
	 * @param yhmm 密码
	 * @return PubUser 用户
	 * @throws Exception
	 * @see com.htcf.system.service.PubUserService#getPubUser(java.lang.String, java.lang.String)
	 */
	@Override
	public PubUser getPubUser(String yhzh, String yhmm) throws Exception {

		logger.entry("!!!!!!!!!!根据用户账号及密码获取用户", yhzh, yhmm);
		PubUser pubUser = getUserByYhzh(yhzh);
		if (null == pubUser) {
			throw ServiceSystemException.PUBUSER_NOT_EXIST.newInstance("用户账号不存在,yhzh{%s}", yhzh);
		}
		if (!"Y".equals(pubUser.getSybz())) {// 禁用
			throw ServiceSystemException.PUBUSER_EXIST.newInstance("用户账号已被禁用,yhzh{%s}", yhzh);
		}

		// TODO 密码解密 判断密码是否正确

		return pubUser;
	}

	/**
	 * 根据用户ID重置密码
	 * 
	 * @param yhbh 用户ID
	 * @return PubUser 用户
	 * @return
	 * @throws Exception
	 * @see com.htcf.system.service.PubUserService#resetPwd(java.lang.String)
	 */
	@Override
	public PubUser resetPwd(String yhbh) throws Exception {

		logger.entry("!!!!!!!!!!重置密码", yhbh);
		PubUser pubUser = getUserByYhbh(yhbh);

		// 设置重置密码的默认密码
		pubUser.setYhmm(ServiceSystemConstants.DEFAULT_PASSWORD);

		updateUser(pubUser);
		
		//清缓存
		pubUserCache.remove(pubUser.getYhzh());

		return pubUser;
	}

	/**
	 * 修改密码
	 * 
	 * @param yhbh 用户编号
	 * @param newPass 新的密码
	 * @return PubUser 用户
	 * @throws Exception
	 * @see com.htcf.system.service.PubUserService#changePwd(java.lang.String, java.lang.String)
	 */
	@Override
	public PubUser changePwd(String yhbh, String newPass) throws Exception {
		logger.entry("!!!!!!!!!!修改密码", yhbh);
		PubUser pubUser = getUserByYhbh(yhbh);

		// 设置新密码
		pubUser.setYhmm(newPass);

		updateUser(pubUser);
		
		//清缓存
		pubUserCache.remove(pubUser.getYhzh());

		return pubUser;
	}

	/**
	 * 根据查询条件获取分页关联授权用户列表
	 * 
	 * @param paramMap 查询条件
	 * @return PageInfo<PubUserBo> 分页用户列表
	 * @throws Exception
	 * @see com.htcf.system.service.PubUserService#getListPageBo(java.util.Map)
	 */
	@Override
	public PageInfo<PubUserBo> getListPageBo(Map<String, Object> paramMap) throws Exception {
		logger.entry("!!!!!!!!!!根据条件获取分页后的用户列表");

		PageInfo<PubUserBo> pageInfo = pubUserDao.getListPageBo("getBo", paramMap);

		return pageInfo;
	}

	/**
	 * TODO(这里用一句话描述这个方法的作用)
	 * @return
	 * @throws Exception
	 * @see com.htcf.system.service.PubUserService#getAll()
	 */
	@Override
	public List<PubUser> getAll() throws Exception {
		QueryParam param = new QueryParam();
		return pubUserDao.getList(param);
	}

}
