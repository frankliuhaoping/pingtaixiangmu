/** 
 * Project Name:service-system 
 * File Name:PubJqxzServiceImpl.java 
 * Package Name:com.htcf.system.service.impl 
 * Date:2016年12月21日下午4:13:00 
 * Copyright (c) 2016, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.dozer.DozerBeanMapper;
import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageInfo;
import com.github.pagehelper.StringUtil;
import com.htcf.frame.core.dbRelevant.QueryParam;
import com.htcf.system.dao.PubJqxzdmDao;
import com.htcf.system.exception.ServiceSystemException;
import com.htcf.system.model.bo.PubJqxzdmBo;
import com.htcf.system.model.po.PubJqxzdm;
import com.htcf.system.service.PubJqxzService;

/**
 * 
 * ClassName: PubJqxzServiceImpl <br/>
 * Function: TODO ADD FUNCTION. <br/>
 * Reason: TODO ADD REASON(可选). <br/>
 * date: 2016年12月26日 上午11:22:33 <br/>
 * 
 * @author chenhao
 */
@Service("pubJqxzService")
public class PubJqxzServiceImpl implements PubJqxzService {
	private static final Logger logger = LogManager.getLogger(PubJqxzServiceImpl.class);
	private static final Integer ROOTLEN = 2;   // 组织机构根节点长度
	private static final Integer DEFAULTLEN = 2; // 组织机构 父节点跟 子节点的关系 子节点的长度 = 父节点的长度 +2
	@Autowired
	private PubJqxzdmDao pubjqxzDmdao;

	/**
	 * 
	 * 新增警情性质
	 * 
	 * @param pubJqxzdm
	 * @return
	 * @throws Exception
	 * @see com.htcf.system.service.PubJqxzService#addJqxz(com.htcf.system.model.po.PubJqxzdm)
	 */
	@Override
	public PubJqxzdm addJqxz(PubJqxzdm pubJqxzdm) throws Exception {
		// TODO Auto-generated method stub
		logger.entry("新增警情...........");

		pubjqxzDmdao.add(pubJqxzdm);
		return pubJqxzdm;
	}

	/**
	 * TODO(修改警情性质)
	 * 
	 * @param pubJqxzdm
	 * @return
	 * @throws Exception
	 * @see com.htcf.system.service.PubJqxzService#upDateJwxz(com.htcf.system.model.po.PubJqxzdm)
	 */
	@Override
	public PubJqxzdm upDateJqxz(PubJqxzdm pubJqxzdm) throws Exception {
		// TODO Auto-generated method stub
		pubjqxzDmdao.update(pubJqxzdm, "jqxzbh");
		return pubJqxzdm;
	}

	/**
	 * TODO(查看警情性质)
	 * 
	 * @param jqxzbh
	 * @return
	 * @throws Exception
	 * @see com.htcf.system.service.PubJqxzService#viewPubJqxzByJqxzbh(java.lang.String)
	 */
	@Override
	public PubJqxzdm viewPubJqxzByJqxzbh(String jqxzbh) throws Exception {
		// TODO Auto-generated method stub
		return getPubJqxzByJqxzbh(jqxzbh);
	}

	/**
	 * TODO(根据警情性质编号获取警情性质)
	 * 
	 * @param jqxzbh
	 * @return
	 * @throws Exception
	 * @see com.htcf.system.service.PubJqxzService#getPubJqxzByJqxzbh(java.lang.String)
	 */
	@Override
	public PubJqxzdm getPubJqxzByJqxzbh(String jqxzbh) throws Exception {
		// TODO Auto-generated method stub
		logger.entry("!!!!!!!!!!根据警情性质编号获取警情性质");
		QueryParam queryParam = new QueryParam();
		queryParam.put("jqxzbh", jqxzbh);
		PubJqxzdm pubJqxzdm = pubjqxzDmdao.getOne(queryParam);
		if (pubJqxzdm == null) {
			throw ServiceSystemException.PUBAPP_NOT_EXIST.newInstance("警情性质不存在,jqxzbh{%s}", jqxzbh);
		}

		return pubJqxzdm;
	}

	/**
	 * TODO(根据多个警情性质编号删除警情性质)
	 * 
	 * @param jqbhs
	 * @return
	 * @throws Exception
	 * @see com.htcf.system.service.PubJqxzService#deleltePubJqxz(java.lang.String[])
	 */
	@Override
	public int deleltePubJqxz(String... jqxzbhs) throws Exception {
		// TODO Auto-generated method stub
		logger.entry("!!!!!!!!!!批量删除");
		int deleteCount = 0;
		for (String jqxzbh : jqxzbhs) {
			// 删除授权
			deleteCount += deleltePubJqxz(jqxzbh);
		}
		return deleteCount;
	}

	/**
	 * TODO(根据警情性质编号删除警情性质)
	 * 
	 * @param jqxzbh
	 * @return
	 * @throws Exception int
	 */
	private int deleltePubJqxz(String jqxzbh) throws Exception {
		logger.entry("!!!!!!!!!!删除警情性质");
		return pubjqxzDmdao.delete(jqxzbh);
	}

	/**
	 * TODO(根据条件获取分页后的警情性质列表)
	 * 
	 * @param map
	 * @return
	 * @throws Exception
	 * @see com.htcf.system.service.PubJqxzService#getListPage(java.util.Map)
	 */
	@Override
	public PageInfo<PubJqxzdm> getListPage(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		logger.entry("!!!!!!!!!!根据条件获取分页后的警情性质列表");
		QueryParam queryParam = new QueryParam(map);
		
		//警情性质简称
		String jqxzjc = null != map.get("jqxzjc") ? map.get("jqxzjc").toString() : null;
		if (StringUtils.isNotEmpty(jqxzjc)) {
			queryParam.addCondition("jqxzjc", "like", "%" + jqxzjc + "%");
		}
		
		//警情性质编号
		String jqxzbh = null != map.get("jqxzbh") ? map.get("jqxzbh").toString() : null;
		if (StringUtils.isNotEmpty(jqxzbh)) {
			queryParam.addCondition("jqxzbh", "like", "%" + jqxzbh + "%");
		}
		
		PageInfo<PubJqxzdm> pageInfo = pubjqxzDmdao.getListPage("get", queryParam);

		return pageInfo;
	}

	/**
	 * 
	 * TODO(获取树形结构)
	 * 
	 * @param jqxzbh
	 * @param deepType 0:不加载孙子节点 1：递归加载所有孙子节点（按树型数据结构返回） 2：递归加载所有孙子节点（按并列数据结构返回
	 * @return
	 * @see com.htcf.system.service.PubJqxzService#getNodesJqxzByJqxzbh(java.lang.String, java.lang.Integer)
	 */
	@Override
	public List<PubJqxzdmBo> getNodesJqxzByJqxzbh(String jqxzbh, Integer deepType) {
		logger.entry("!!!!!!!!!!警情性质树",jqxzbh,deepType);
		List<PubJqxzdmBo> pubJqxzBos = new ArrayList<PubJqxzdmBo>();
		Integer currentNodelevel = 0;
		List<PubJqxzdm> pubJqxzs = null;

		if (StringUtils.isBlank(jqxzbh)) {
			pubJqxzs = pubjqxzDmdao.getNodesJqxzByJqxzbh(ROOTLEN, null);
		} else {
			Integer len = jqxzbh.length(); // 当前单位代码的长度
			pubJqxzs = pubjqxzDmdao.getNodesJqxzByJqxzbh(len + DEFAULTLEN, jqxzbh);
		}

		if (pubJqxzs != null && pubJqxzs.size() > 0) {

			for (PubJqxzdm pubJqxz : pubJqxzs) {
				PubJqxzdmBo pubJqxzBo = new PubJqxzdmBo();
				Mapper mapper = new DozerBeanMapper();
				mapper.map(pubJqxz, pubJqxzBo);

				String jqxzbhs = pubJqxz.getJqxzbh();
				currentNodelevel = getCurrentNodelevel(ROOTLEN, jqxzbhs.length(), DEFAULTLEN);
				pubJqxzBo.setLevel(currentNodelevel);

				// 判断当前组织机构 根节点 是否存在子节点
				Integer total = isExitsChildJqxz(jqxzbhs.length() + DEFAULTLEN, jqxzbhs);
				if (total > 0) {
					pubJqxzBo.setIsLeaf(false);
					if (deepType == 1) {
						List<PubJqxzdmBo> childPubJqxzBos = getNodesJqxzByJqxzbh(jqxzbhs, deepType);
						pubJqxzBo.setChildren(childPubJqxzBos);
					} else if (deepType == 2) {
						List<PubJqxzdmBo> childPubJqxzBos = getNodesJqxzByJqxzbh(jqxzbhs, deepType);
						pubJqxzBos.addAll(childPubJqxzBos);
					}

				} else {
					pubJqxzBo.setIsLeaf(true);
				}

				pubJqxzBos.add(pubJqxzBo);
			}
		}

		return pubJqxzBos;
	}

	/**
	 * 
	 * TODO(计算当前节点在树中的层级树)
	 * 
	 * @param sourceNodeLevel
	 * @param targetNodeLevel
	 * @param defaultLen
	 * @return Integer
	 */

	public Integer getCurrentNodelevel(Integer sourceNodeLevel, Integer targetNodeLevel, Integer defaultLen) {
		Integer level = 0;
		if (sourceNodeLevel == targetNodeLevel) {
			return level;
		}
		if (targetNodeLevel > sourceNodeLevel) {
			Integer differLen = targetNodeLevel - sourceNodeLevel; // 原节点 与 当前子节点单位代码 长度相差
			level = differLen / defaultLen;
		}
		return level;
	}

	@Override
	public Integer isExitsChildJqxz(Integer len, String jqxzbh) {
		return pubjqxzDmdao.isExitsChildJqxz(len, jqxzbh);
	}

}
