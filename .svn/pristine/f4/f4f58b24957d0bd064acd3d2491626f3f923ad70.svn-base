package com.htcf.system.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
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

import com.github.pagehelper.PageInfo;
import com.github.pagehelper.StringUtil;
import com.htcf.frame.base.util.DateUtil;
import com.htcf.frame.core.dbRelevant.QueryParam;
import com.htcf.system.cache.PubZzjgCache;
import com.htcf.system.dao.PubZzjgDao;
import com.htcf.system.exception.ServiceSystemException;
import com.htcf.system.model.bo.PubZzjgBo;
import com.htcf.system.model.po.PubZzjg;
import com.htcf.system.service.PubZzjgService;

/**
 * 
 * ClassName: PubZzjgServiceImpl <br/>
 * Function:  ADD FUNCTION. <br/>
 * Reason:  ADD REASON(可选). <br/>
 * date: 2016年12月20日 下午5:21:20 <br/>
 * 
 * @author admin
 */
@Service("pubZzjgService")
public class PubZzjgServiceImpl implements PubZzjgService {

	private static final Logger logger = LogManager.getLogger(PubZzjgServiceImpl.class);

	@Autowired
	private PubZzjgDao pubZzjgDao;
	
	@Autowired
	private PubZzjgCache pubZzjgCache;
	
	/**
	 * 缓存子节点列表组织机构树key前缀
	 */
	private static final String CACHE_SUB_ORG_LIST_TREE_KEY_PREFIX = "p_";
	
	/**
	 * 缓存当前组织基本信息 key前缀
	 */
	private static final String CACHE_SELF_ORG_KEY_PREFIX = "s_";

	/**
	 * (新增组织机构)
	 * 
	 * @param pubZzjg
	 * @return
	 * @throws Exception
	 * @see com.htcf.system.service.PubZzjgService#addPubZzjg(com.htcf.system.model.po.PubZzjg)
	 */
	@Override
	public PubZzjg addPubZzjg(PubZzjg pubZzjg) throws Exception {
		logger.entry("!!!!!!!!!!新增组织机构");
		pubZzjgDao.add(pubZzjg);
		
		String gxdwdm = pubZzjg.getGxdwdm();
		String subOrgListCacheKey = CACHE_SUB_ORG_LIST_TREE_KEY_PREFIX + String.valueOf(gxdwdm);
		Object subOrgList = pubZzjgCache.get(subOrgListCacheKey);
		if(subOrgList != null){
			List<PubZzjg> list = (List<PubZzjg>) subOrgList;
			list.add(pubZzjg);
			pubZzjgCache.put(subOrgListCacheKey, list);
		}
		return pubZzjg;
	}

	/**
	 * (修改组织机构)
	 * 
	 * @param pubZzjg
	 * @return
	 * @throws Exception
	 * @see com.htcf.system.service.PubZzjgService#updatePubZzjg(com.htcf.system.model.po.PubZzjg)
	 */
	@Override
	public PubZzjg updatePubZzjg(PubZzjg pubZzjg) throws Exception {
		logger.entry("!!!!!!!!!!修改组织机构");
		//修改db
		pubZzjgDao.update(pubZzjg, "dwdm");
		//修改组织代码对应缓存的组织信息
		pubZzjgCache.put(CACHE_SELF_ORG_KEY_PREFIX + pubZzjg.getDwdm(), pubZzjg);
		//删除该组织下所缓存的子节点信息
		PubZzjg dto = this.viewPubZzjgByDwdm(pubZzjg.getDwdm());
		if(dto != null){
			String subOrgListCacheKey = CACHE_SUB_ORG_LIST_TREE_KEY_PREFIX + String.valueOf(dto.getGxdwdm());
			pubZzjgCache.remove(subOrgListCacheKey);
		}
		return pubZzjg;
	}

	/**
	 * (查看组织机构)
	 * 
	 * @param dwdm
	 * @return
	 * @throws Exception
	 * @see com.htcf.system.service.PubZzjgService#viewPubZzjgByDwdm(long)
	 */
	@Override
	public PubZzjg viewPubZzjgByDwdm(String dwdm) throws Exception {
		return getPubZzjgByDwdm(dwdm);
	}

	/**
	 * (根据单位代码获取组织机构)
	 * 
	 * @param dwdm
	 * @return
	 * @throws Exception
	 * @see com.htcf.system.service.PubZzjgService#getPubZzjgByDwdm(long)
	 */
	@Override
	public PubZzjg getPubZzjgByDwdm(String dwdm) throws Exception {

		logger.entry("!!!!!!!!!!根据单位代码获取组织机构");
		if(StringUtils.isBlank(dwdm)){
			return null;
		}
		String cacheKey = CACHE_SELF_ORG_KEY_PREFIX + dwdm;
		Object cacheValue = pubZzjgCache.get(cacheKey);
		if(cacheValue != null){
			return (PubZzjg) cacheValue;
		}
		
		QueryParam queryParam = new QueryParam();
		queryParam.put("dwdm", dwdm);
		PubZzjg pubZzjg = pubZzjgDao.getOne(queryParam);
		if (null == pubZzjg) {
			throw ServiceSystemException.PUBAPP_NOT_EXIST.newInstance("单位代码不存在,dwdm{%s}", dwdm);
		}
		pubZzjgCache.put(cacheKey, pubZzjg);
		return pubZzjg;
	}

	/**
	 * (根据多个单位代码删除组织机构)
	 * 
	 * @param dwdms
	 * @return
	 * @throws Exception
	 * @see com.htcf.system.service.PubZzjgService#deleltePubZzjg(long[])
	 */
	@Override
	public int deleltePubZzjg(String... dwdms) throws Exception {
		logger.entry("!!!!!!!!!!批量删除组织机构");

		int deleteCount = 0;
		for (String dwdm : dwdms) {
			// 删除授权
			deleteCount += deleltePubZzjg(dwdm);
		}
		return deleteCount;
	}

	/**
	 * 
	 * (根据单位代码删除组织机构)
	 * 
	 * @param dwdm
	 * @return
	 * @throws Exception int
	 */
	private int deleltePubZzjg(String dwdm) throws Exception {
		logger.entry("!!!!!!!!!!删除组织机构");
		PubZzjg dto = this.viewPubZzjgByDwdm(dwdm);
		if(dto != null){
			String subOrgListCacheKey = CACHE_SUB_ORG_LIST_TREE_KEY_PREFIX + String.valueOf(dto.getGxdwdm());
			pubZzjgCache.remove(subOrgListCacheKey);
		}
		pubZzjgCache.remove(CACHE_SELF_ORG_KEY_PREFIX + dwdm);
		return pubZzjgDao.delete(dwdm);
	}

	/**
	 * (根据条件获取分页后的组织机构列表)
	 * 
	 * @param map
	 * @return
	 * @throws Exception
	 * @see com.htcf.system.service.PubZzjgService#getListPage(java.util.Map)
	 */
	@Override
	public PageInfo<PubZzjg> getListPage(Map<String, Object> map) throws Exception {

		logger.entry("!!!!!!!!!!根据条件获取分页后的组织机构列表");
		QueryParam queryParam = new QueryParam(map);
		String dwmc = null;
		if (map != null && map.get("dwmc") != null) {
			dwmc = (String) map.get("dwmc");
		}

		if (StringUtil.isNotEmpty(dwmc)) {
			queryParam.addCondition("dwmc", "like", "%" + dwmc + "%");
		}

		String dwdm = null != map.get("dwdm") ? map.get("dwdm").toString() : null;
		if (StringUtil.isNotEmpty(dwdm)) {
			queryParam.addCondition("dwdm", "like", "%" + dwdm + "%");
		}

		String dhhm = null != map.get("dhhm") ? map.get("dhhm").toString() : null;
		if (StringUtil.isNotEmpty(dhhm)) {
			queryParam.addCondition("dhhm", "like", "%" + dhhm + "%");
		}

		/*
		String starttime = null != map.get("starttime") ? map.get("starttime").toString() : null;
		String endtime = null != map.get("endtime") ? map.get("endtime").toString() : null;

		if (StringUtil.isNotEmpty(starttime)) {   // 大于开始时间记录
			queryParam.addCondition("cjsj", ">=", DateUtil.getDateTimeFormat(starttime));
		}
		if (StringUtil.isNotEmpty(endtime)) {  // 小于结束时间记录
			queryParam.addCondition("cjsj", "<=", DateUtil.getDateTimeFormat(endtime));
		}*/

		PageInfo<PubZzjg> pageInfo = pubZzjgDao.getListPage("get", queryParam);
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
	 * 
	 * (获取树形结构 组织机构数据)
	 * 
	 * @param len
	 * @param dwdm
	 * @param: deepType 
	 *         0:不加载孙子节点 
	 *         1：递归加载所有孙子节点（按树型数据结构返回）
	 *         2：递归加载所有孙子节点（按并列数据结构返回）
	 * @return
	 * @see com.htcf.system.service.PubZzjgService#getTreeZzjg(java.lang.String)
	 */
	@Override
	public List<PubZzjgBo> getNodesZzjgByDwdm(String dwdm, Integer deepType) {

		List<PubZzjgBo> pubZzjgBos = new ArrayList<PubZzjgBo>();

		// 获取所有子节点
		List<PubZzjg> pubZzjgs = getListByGxdwdm(dwdm);

		if (pubZzjgs != null && pubZzjgs.size() > 0) {

			for (PubZzjg pubZzjg : pubZzjgs) {
				PubZzjgBo pubZzjgBo = new PubZzjgBo();
				Mapper mapper = new DozerBeanMapper();
				mapper.map(pubZzjg, pubZzjgBo);

				// 判断当前组织机构 根节点 是否存在子节点
				int total = getCountByGxdwdm(pubZzjg.getDwdm());
				if (total > 0) {
					pubZzjgBo.setIsLeaf(false);
					if (deepType == 1) {
						List<PubZzjgBo> childPubZzjgBos = getNodesZzjgByDwdm(pubZzjg.getDwdm(), deepType);
						pubZzjgBo.setChildren(childPubZzjgBos);
					} else if (deepType == 2) {
						List<PubZzjgBo> childPubZzjgBos = getNodesZzjgByDwdm(pubZzjg.getDwdm(), deepType);
						pubZzjgBos.addAll(childPubZzjgBos);
					}

				} else {
					pubZzjgBo.setIsLeaf(true);
				}

				pubZzjgBos.add(pubZzjgBo);

			}
		}

		return pubZzjgBos;
	}

	/**
	 * 根据管辖单位代码获取组织机构
	 * 
	 * @param gxdwdm
	 * @return List<PubZzjg>
	 */
	private List<PubZzjg> getListByGxdwdm(String gxdwdm) {
		logger.entry("@@@@@@@@@@根据管辖单位代码获取组织机构列表", gxdwdm);
		QueryParam queryParam = new QueryParam();
		if (gxdwdm == "" || gxdwdm == null) {
			queryParam.addCondition("gxdwdm", QueryParam.IS, QueryParam.NULL);
		} else {
			queryParam.put("gxdwdm", gxdwdm);
		}
		String cacheKey = CACHE_SUB_ORG_LIST_TREE_KEY_PREFIX+String.valueOf(gxdwdm);
		Object cacheValue = pubZzjgCache.get(cacheKey);
		if(cacheValue != null){
			return (List<PubZzjg>) cacheValue;
		}
		List<PubZzjg> pubZzjgs = pubZzjgDao.getList(queryParam);
		pubZzjgCache.put(cacheKey, pubZzjgs);
		return pubZzjgs;
	}

	/**
	 * 根据管辖单位代码组织机构数量
	 * 
	 * @param gxdwdm
	 * @return int
	 */
	private int getCountByGxdwdm(String gxdwdm) {
		logger.entry("@@@@@@@@@@根据管辖单位代码组织机构数量", gxdwdm);
		List<PubZzjg> pubZzjgs = getListByGxdwdm(gxdwdm);
		return pubZzjgs.size();
	}
	
	
	/**
	 * 
	 * getNodesZzjgByDwdm
	 * 递归加载所有孙子节点单位代码
	 * @param dwdm 单位代码
	 * @return Set<String> 单位代码
	 */
	@Override
	public Set<String> getNodesZzjgByDwdm(String dwdm) {
		List<PubZzjgBo> pubZzjgBos = getNodesZzjgByDwdm(dwdm, 2);
		Set<String> set = new HashSet<String>();
		for (PubZzjg pubZzjg : pubZzjgBos) {
			set.add(pubZzjg.getDwdm());
		}
		return set;
	}
	

}
