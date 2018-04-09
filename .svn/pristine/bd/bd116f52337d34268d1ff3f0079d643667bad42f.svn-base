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
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import net.sf.ehcache.CacheOperationOutcomes.RemoveAllOutcome;

import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.naming.java.javaURLContextFactory;
import org.aspectj.weaver.ast.Literal;
import org.dozer.DozerBeanMapper;
import org.dozer.Mapper;
import org.springframework.aop.ThrowsAdvice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageInfo;
import com.htcf.frame.base.util.JsonUtil;
import com.htcf.frame.base.util.TreeUtil;
import com.htcf.frame.core.dbRelevant.QueryParam;
import com.htcf.system.cache.PubJqxzCache;
import com.htcf.system.cache.PubJqxzListCache;
import com.htcf.system.dao.PubJqxzdmDao;
import com.htcf.system.exception.ServiceSystemException;
import com.htcf.system.model.bo.PubJqxzdmBo;
import com.htcf.system.model.po.PubJqxzdm;
import com.htcf.system.model.po.PubZzjg;
import com.htcf.system.service.PubJqxzService;

/**
 * ClassName: PubJqxzServiceImpl <br>
 * Function: 警情性质接口Impl. <br>
 * date: 2016年12月26日 上午11:22:33 <br>
 * 
 * @author chenhao <br>
 */
@Service("pubJqxzService")
public class PubJqxzServiceImpl implements PubJqxzService {
	private static final Logger logger = LogManager.getLogger(PubJqxzServiceImpl.class);

	/**
	 * PubJqxzdmDao 警情性质dao
	 */
	@Autowired
	private PubJqxzdmDao pubjqxzDmdao;

	/**
	 * PubJqxzListCache 警情性质的子集缓存List
	 */
	@Autowired
	private PubJqxzListCache pubJqxzListBoCache;

	/**
	 * PubJqxzCache 警情性质自身单个缓存
	 */
	@Autowired
	private PubJqxzCache pubJqxzBoCache;

	/**
	 * 
	 * 新增警情性质
	 * 
	 * @param pubJqxzdm 参数为警情性质Po
	 * @return PubJqxzdm 返回警情性质Po
	 * @throws Exception 抛出可能发生的异常
	 * @see com.htcf.system.service.PubJqxzService#addJqxz(com.htcf.system.model.po.PubJqxzdm)
	 */
	@Override
	public PubJqxzdm addJqxz(PubJqxzdm pubJqxzdm) throws Exception {
		logger.entry("新增警情...........", JsonUtil.toJsonNonNull(pubJqxzdm));
		pubjqxzDmdao.add(pubJqxzdm);
		// 查询全部
		List<PubJqxzdm> list = getJqxzBybh("");

		// 创建拷贝对象
		DozerBeanMapper mapper = new DozerBeanMapper();
		PubJqxzdmBo pubJqxzdmBo = new PubJqxzdmBo();
		mapper.map(pubJqxzdm, pubJqxzdmBo);

		// 更新单个缓存中的父对象的叶子节点信息
		if (StringUtils.isNotBlank(pubJqxzdm.getBzjqxzfbh())) {
			PubJqxzdmBo parentBO = pubJqxzBoCache.get(pubJqxzdm.getBzjqxzfbh());
			parentBO.setIsLeaf(false);
			pubJqxzBoCache.put(pubJqxzdm.getBzjqxzfbh(), parentBO);
		}

		// 更新当前对象父节点对应的集合信息
		pubJqxzListBoCache.put(pubJqxzdm.getBzjqxzfbh(), getChildren(pubJqxzdm.getBzjqxzfbh(), list));

		// 判断当前树为节点的第几层
		if (StringUtils.isNotBlank(pubJqxzdm.getBzjqxzfbh())) {
			pubJqxzdmBo.setLevel(getLevel(pubJqxzdm));
		} else {
			pubJqxzdmBo.setLevel(0);
		}
		// 新增的对象为叶子节点
		pubJqxzdmBo.setIsLeaf(true);

		// 设置当前的菜单数据也就是自己
		pubJqxzBoCache.put(pubJqxzdmBo.getBzjqxzbh(), pubJqxzdmBo);

		List<PubJqxzdmBo> lists = new ArrayList<PubJqxzdmBo>();
		// 添加自己，对应的是数组，不可变，只能为空的数组，不能为null,为null时加载数据遍历报空指针异常
		pubJqxzListBoCache.put(pubJqxzdm.getBzjqxzbh(), lists);

		logger.exit(JsonUtil.toJsonNonNull(pubJqxzdm));
		return pubJqxzdm;
	}

	/**
	 * 修改警情性质
	 * 
	 * @param pubJqxzdm 警情性质Po
	 * @return PubJqxzdm 返回一个警情性质Po
	 * @throws Exception 抛出可能发生的异常
	 * @see com.htcf.system.service.PubJqxzService#upDateJwxz(com.htcf.system.model.po.PubJqxzdm)
	 */
	@Override
	public PubJqxzdm upDateJqxz(PubJqxzdm pubJqxzdm) throws Exception {
		logger.entry("修改警情...........", JsonUtil.toJsonNonNull(pubJqxzdm));
		// 数据库数据修改
		pubjqxzDmdao.update(pubJqxzdm, "jqxzbh");
		// 查询全部
		List<PubJqxzdm> list = getJqxzBybh("");

		// 创建拷贝对象
		DozerBeanMapper mapper = new DozerBeanMapper();
		PubJqxzdmBo pubJqxzdmBo = new PubJqxzdmBo();
		mapper.map(pubJqxzdm, pubJqxzdmBo);

		// 更新当前对象父节点对应的集合信息
		pubJqxzListBoCache.put(pubJqxzdm.getBzjqxzfbh(), getChildren(pubJqxzdm.getBzjqxzfbh(), list));

		// 判断当前树为节点的第几层
		if (StringUtils.isNotBlank(pubJqxzdm.getBzjqxzfbh())) {
			pubJqxzdmBo.setLevel(getLevel(pubJqxzdm));
		} else {
			pubJqxzdmBo.setLevel(0);
		}
		// 判断是否为叶子节点
		if (getChildren(pubJqxzdm.getBzjqxzbh(), list).size() == 0) {
			pubJqxzdmBo.setIsLeaf(true);
		} else {
			pubJqxzdmBo.setIsLeaf(false);
		}

		// 设置当前的菜单数据也就是自己
		pubJqxzBoCache.put(pubJqxzdm.getBzjqxzbh(), pubJqxzdmBo);

		logger.exit(JsonUtil.toJsonNonNull(pubJqxzdm));
		return pubJqxzdm;
	}

	/**
	 * 根据编号查看警情性质
	 * 
	 * @param jqxzbh 警情性质编号
	 * @return PubJqxzdm 返回一个警情性质Po
	 * @throws Exception 抛出可能发生的异常
	 * @see com.htcf.system.service.PubJqxzService#viewPubJqxzByJqxzbh(java.lang.String)
	 */
	@Override
	public PubJqxzdm viewPubJqxzByJqxzbh(String jqxzbh) throws Exception {
		return getPubJqxzByJqxzbh(jqxzbh);
	}

	/**
	 * 根据警情性质编号获取警情性质
	 * 
	 * @param jqxzbh 警情性质编号
	 * @return PubJqxzdm 返回一个警情性质Po
	 * @throws Exception 抛出可能发生的异常
	 * @see com.htcf.system.service.PubJqxzService#getPubJqxzByJqxzbh(java.lang.String)
	 */
	@Override
	public PubJqxzdm getPubJqxzByJqxzbh(String jqxzbh) throws Exception {
		logger.entry("!!!!!!!!!!根据警情性质编号获取警情性质", JsonUtil.toJsonNonNull(jqxzbh));

		QueryParam queryParam = new QueryParam();
		queryParam.put("jqxzbh", jqxzbh);
		PubJqxzdm pubJqxzdm = pubjqxzDmdao.getOne(queryParam);
		logger.exit(JsonUtil.toJsonNonNull(pubJqxzdm));
		return pubJqxzdm;
	}

	/**
	 * 根据多个警情性质编号删除警情性质
	 * 
	 * @param jqxzbhs 一连串的编号数组
	 * @return int 数据操作之后的记录
	 * @throws Exception 抛出可能发生的异常
	 * @see com.htcf.system.service.PubJqxzService#deleltePubJqxz(java.lang.String[])
	 */
	@Override
	public int deleltePubJqxz(String... jqxzbhs) throws Exception {
		logger.entry("!!!!!!!!!!批量删除", JsonUtil.toJsonNonNull(jqxzbhs));
		int deleteCount = 0;
		for (String jqxzbh : jqxzbhs) {
			// 删除授权
			deleteCount += deleltePubJqxz(jqxzbh);
		}
		logger.exit(JsonUtil.toJsonNonNull(deleteCount));
		return deleteCount;
	}

	/**
	 * 根据警情性质编号删除警情性质
	 * 
	 * @param jqxzbh 编号
	 * @return 数据操作之后的记录
	 * @throws Exception 抛出可能发生的异常
	 */
	private int deleltePubJqxz(String jqxzbh) throws Exception {
		logger.entry("!!!!!!!!!!删除警情性质", JsonUtil.toJsonNonNull(jqxzbh));
		List<PubJqxzdmBo> list = null;
		int count = 0;
		// 获取要删除编号的对象
		PubJqxzdm pubJqxzdm = getPubJqxzByJqxzbh(jqxzbh);

		/*
		 * 1：先判断是否有子菜单， 2:有子菜单提示不允许删除菜单 3:无子菜单则直接删除 4:更新父节点的叶子信息，判断是否有子菜单
		 */
		list = pubJqxzListBoCache.get(pubJqxzdm.getBzjqxzbh());
		// 判断是否有子菜单
		if (list.size() > 0) {
			throw ServiceSystemException.PUBAPP_NOT_EXIST.newInstance("对不起，该菜单存在子菜单不允许删除！警情性质编号：{%s}", jqxzbh);
		} else {
			// 无子类，删除自己
			count = pubjqxzDmdao.delete(pubJqxzdm.getJqxzbh());
			// 删除单个缓存中的自己
			pubJqxzBoCache.remove(pubJqxzdm.getBzjqxzbh());
			// 删除集合中的自己
			pubJqxzListBoCache.remove(pubJqxzdm.getBzjqxzbh());
		}

		if (pubJqxzdm.getBzjqxzfbh() == null) {
			pubJqxzdm.setBzjqxzfbh("");
		}

		// 查询全部
		List<PubJqxzdm> listPubJqxzdm = getJqxzBybh("");
		// 更新删除之后缓存集合的数据
		List<PubJqxzdmBo> childrenList = getChildren(pubJqxzdm.getBzjqxzfbh(), listPubJqxzdm);
		pubJqxzListBoCache.put(pubJqxzdm.getBzjqxzfbh(), childrenList);

		// 如果父类下面没有子类了 ，那么它就是叶子节点，级别不变
		if (childrenList.size() < 1) {
			if (StringUtils.isNotBlank(pubJqxzdm.getBzjqxzfbh())) {
				PubJqxzdmBo parentBo = pubJqxzBoCache.get(pubJqxzdm.getBzjqxzfbh());
				parentBo.setIsLeaf(true);
				// 更新单个缓存的父类
				pubJqxzBoCache.put(pubJqxzdm.getBzjqxzfbh(), parentBo);
			}
		}
		return count;
	}

	/**
	 * 根据条件获取分页后的警情性质列表
	 * 
	 * @param map 参数为map
	 * @return PageInfo&ltPubJqxzdm&gt; 返回数据集合
	 * @throws Exception 抛出可能发生的异常
	 * @see com.htcf.system.service.PubJqxzService#getListPage(java.util.Map)
	 */
	@Override
	public PageInfo<PubJqxzdm> getListPage(Map<String, Object> map) throws Exception {
		logger.entry("!!!!!!!!!!根据条件获取分页后的警情性质列表", JsonUtil.toJsonNonNull(map));

		// 默认 按最后创建时间排序
		if (map != null && !map.containsKey("sort")) {
			map.put("order", "desc");
			map.put("sort", "cjsj");
		}

		QueryParam queryParam = new QueryParam(map);

		// 警情性质简称
		String jqxzjc = null != map.get("jqxzjc") ? map.get("jqxzjc").toString() : null;
		if (StringUtils.isNotEmpty(jqxzjc)) {
			queryParam.addCondition("jqxzjc", "like", "%" + jqxzjc + "%");
		}

		// 警情性质编号
		String jqxzbh = null != map.get("jqxzbh") ? map.get("jqxzbh").toString() : null;
		if (StringUtils.isNotEmpty(jqxzbh)) {
			queryParam.addCondition("jqxzbh", "like", "%" + jqxzbh + "%");
		}

		PageInfo<PubJqxzdm> pageInfo = pubjqxzDmdao.getListPage("get", queryParam);
		logger.exit(JsonUtil.toJsonNonNull(pageInfo));
		return pageInfo;
	}

	/**
	 * 根据bzjqxzbh获取子节点
	 * 
	 * @param: bzjqxzbh 父编号
	 * @param: deepType 0:不加载孙子节点 1：递归加载所有孙子节点（按树型数据结构返回）
	 *         2：递归加载所有孙子节点（按并列数据结构返回）
	 * @return: List&lt;PubJqxzdmBo&gt; 资源列表
	 * @throws Exception 抛出可能发生的异常 抛出可能发生的异常
	 * @see com.htcf.system.service.PubJqxzService#getPubJqxzNodesById(java.lang.String,java.lang.Integer)
	 * 
	 */
	public List<PubJqxzdmBo> getNodesJqxzByJqxzbh(String bzjqxzbh, Integer deepType) throws Exception {
		logger.entry("!!!!!!!!!!根据bzjqxzfbh获取子节点", JsonUtil.toJsonNonNull(bzjqxzbh), JsonUtil.toJsonNonNull(deepType));

		PubJqxzdmBo pubJqxzdmBo = null;
		List<PubJqxzdmBo> pubJqxzNodes = null;
		// 如果编号不为空，那么则从缓存中拿到对应的对象
		if (StringUtils.isNotBlank(bzjqxzbh)) {
			pubJqxzdmBo = pubJqxzBoCache.get(bzjqxzbh);
		}
		try {
			pubJqxzNodes = getPubJqxzNodesById4(pubJqxzdmBo, deepType);
		} catch (Exception e) {
			e.printStackTrace();
			throw ServiceSystemException.PUBAPP_NOT_EXIST.newInstance(e.getMessage());
		}
		logger.exit(JsonUtil.toJsonNonNull(pubJqxzNodes));
		if (deepType == 1) {
			TreeUtil<PubJqxzdmBo> t = new TreeUtil<PubJqxzdmBo>();
			return t.buildTree(pubJqxzNodes, "bzjqxzbh", "bzjqxzfbh", "children");
		}
		return pubJqxzNodes;
	}

	// 计算对象在树的第几层
	public int getLevel(PubJqxzdm pubJqxzdm) {
		if (StringUtils.isBlank(pubJqxzdm.getJqxzbh())) {
			// 业务上应该不允许出现这个逻辑
			return 0;
		}
		int level = pubJqxzdm.getJqxzbh().length() / 2 - 1;
		return level;
	}

	/**
	 * getPubJqxzNodesById4 TODO(根据编号获取数据组合成树的结构返回)
	 * 
	 * @param pubJqxzdmBo 警情性质Bo
	 * @param deepType 需要转化的类型
	 * @return List&lt;PubJqxzdmBo&gt; 返回数据集合
	 */
	public List<PubJqxzdmBo> getPubJqxzNodesById4(PubJqxzdmBo pubJqxzdmBo, int deepType) throws Exception {
		// logger.entry("!!!!!!!!!!根据bzjqxzfbh获取子节点", pubJqxzdmBo, deepType);

		List<PubJqxzdmBo> pubJqxzNodes = new ArrayList<PubJqxzdmBo>();

		String bzjqxzbh = null;
		// 根据父资源ID获取资源列表
		if (pubJqxzdmBo != null) {
			bzjqxzbh = pubJqxzdmBo.getBzjqxzbh();
		} else {
			bzjqxzbh = "";
			// init();
		}
		// 获取编号对应的菜单数据
		List<PubJqxzdmBo> pubJqxzList = pubJqxzListBoCache.get(bzjqxzbh);

		for (PubJqxzdmBo pubJqxzdm : pubJqxzList) {

			// 获取编号对应的单个对象
			PubJqxzdmBo currentBo = pubJqxzBoCache.get(pubJqxzdm.getBzjqxzbh());

			// if (deepType == 1) {
			// // 递归调用，生成树型结构
			// List<PubJqxzdmBo> childrenList = getPubJqxzNodesById4(currentBo,
			// deepType);
			// if (childrenList.size() != 0) {
			// currentBo.setChildren(childrenList);
			// }
			// } else
			// 构建树形结构需要并列结构数据
			if (deepType == 1 || deepType == 2) {
				// 递归调用，生成并列结构
				List<PubJqxzdmBo> childrenList = getPubJqxzNodesById4(currentBo, deepType);
				if (childrenList.size() != 0) {
					pubJqxzNodes.addAll(childrenList);
				}
			}
			pubJqxzNodes.add(currentBo);
		}
		return pubJqxzNodes;
	}

	/**
	 * 根据标准警情性质父编号获取警情性质列表
	 * 
	 * @param bzjqxzfbh 父编号
	 * @return List&lt;PubJqxzdm&gt; 返回数据集合
	 * @throws Exception 抛出可能发生的异常
	 */
	private List<PubJqxzdm> getPubJqxzListBybzjqxzfbh(String bzjqxzfbh) throws Exception {
		logger.entry("!!!!!!!!!!根据标准警情性质父编号获取警情性质列表", JsonUtil.toJsonNonNull(bzjqxzfbh));
		QueryParam queryParam = new QueryParam();

		if (bzjqxzfbh == "" || bzjqxzfbh == null) {
			queryParam.addCondition("bzjqxzfbh", QueryParam.IS, QueryParam.NULL);
		} else {
			queryParam.put("bzjqxzfbh", bzjqxzfbh);
		}

		List<PubJqxzdm> list = pubjqxzDmdao.getList(queryParam);
		if (null == list) {
			throw ServiceSystemException.PUBAPP_NOT_EXIST.newInstance("警情性质不存在{%s}", bzjqxzfbh);
		}
		logger.exit(JsonUtil.toJsonNonNull(list));
		return list;
	}

	/**
	 * 根据标准警情性质父编号获取警情性质列表
	 * 
	 * @param bzjqxzbh 标准警情性质编号
	 * @return PubJqxzdm 返回一个警情性质PO对象
	 * @throws Exception 抛出可能发生的异常
	 */
	public PubJqxzdm getPubJqxzBybzjqxzbh(String bzjqxzbh) {
		logger.entry("!!!!!!!!!!根据标准警情性质父编号获取警情性质列表", JsonUtil.toJsonNonNull(bzjqxzbh));
		QueryParam queryParam = new QueryParam();

		if (StringUtils.isNotBlank(bzjqxzbh)) {
			queryParam.addCondition("bzjqxzbh", QueryParam.EQUALS, bzjqxzbh);
		}

		PubJqxzdm pubJqxzdm = pubjqxzDmdao.getOne(queryParam);
		if (null == pubJqxzdm) {
			throw ServiceSystemException.PUBAPP_NOT_EXIST.newInstance("警情性质不存在{%s}", bzjqxzbh);
		}
		logger.exit(JsonUtil.toJsonNonNull(pubJqxzdm));
		return pubJqxzdm;
	}

	/**
	 * init TODO(初始化警情性质数据加载到缓存中)
	 */
	public void init() {
		// 查询全部
		List<PubJqxzdm> list = getJqxzBybh("");
		// 创建复制对象
		DozerBeanMapper mapper = new DozerBeanMapper();
		// 设置空健的一级平级菜单数据
		pubJqxzListBoCache.put("", getChildren("", list));
		// 循环全部数据处理
		for (PubJqxzdm pubJqxzdm : list) {
			PubJqxzdmBo pubJqxzdmBo = new PubJqxzdmBo();
			mapper.map(pubJqxzdm, pubJqxzdmBo);

			// 判断当前树为节点的第几层
			if (StringUtils.isNotBlank(pubJqxzdm.getBzjqxzfbh())) {
				pubJqxzdmBo.setLevel(getLevel(pubJqxzdm));
			} else {
				pubJqxzdmBo.setLevel(0);
			}

			// 设置每个编号对应的菜单数据，没有则为空
			pubJqxzListBoCache.put(pubJqxzdm.getBzjqxzbh(), getChildren(pubJqxzdm.getBzjqxzbh(), list));

			if (getChildren(pubJqxzdm.getBzjqxzbh(), list).size() == 0) {
				pubJqxzdmBo.setIsLeaf(true);
			} else {
				pubJqxzdmBo.setIsLeaf(false);
			}

			// 设置当前的菜单数据也就是自己
			pubJqxzBoCache.put(pubJqxzdm.getBzjqxzbh(), pubJqxzdmBo);

		}
	}

	/**
	 * getChildren TODO(根据编号获取警情性子菜单质列表)
	 * 
	 * @param bzjqxzfbh编号
	 * @param all 全部数据的集合
	 * @return 返回分解好的列表
	 */
	public List<PubJqxzdmBo> getChildren(String bzjqxzfbh, List<PubJqxzdm> all) {
		// LinkedList 保持数据有序，防止数据乱序，并且新增删除修改较ArrayList而言较快
		List<PubJqxzdmBo> list = new LinkedList<PubJqxzdmBo>();
		DozerBeanMapper mapper = new DozerBeanMapper();

		for (PubJqxzdm pubJqxzdm : all) {
			// 如果父编号为空的则是父类
			if (pubJqxzdm.getBzjqxzfbh() == null && bzjqxzfbh.equals("")) {
				PubJqxzdmBo pubJqxzdmBo = new PubJqxzdmBo();
				mapper.map(pubJqxzdm, pubJqxzdmBo);
				list.add(pubJqxzdmBo);
			}
			// 如果父编号不是空的则是子类
			if (pubJqxzdm.getBzjqxzfbh() != null && pubJqxzdm.getBzjqxzfbh().equals(bzjqxzfbh)) {
				PubJqxzdmBo pubJqxzdmBo = new PubJqxzdmBo();
				mapper.map(pubJqxzdm, pubJqxzdmBo);
				list.add(pubJqxzdmBo);
			}
		}
		return list;
	}

	/**
	 * getStringMap 根据编号获取警情性质Map
	 * 
	 * @param bzjqxzbh 警情性质编号
	 * @return Map&lt;String, PubJqxzdm&gt; 返回查询的数据以map的格式
	 */
	public Map<String, PubJqxzdm> getStringMap(String bzjqxzbh) {
		logger.entry("!!!!!!!!!!获取警情性质Map<String, String>", JsonUtil.toJsonNonNull(bzjqxzbh));

		Map<String, PubJqxzdm> map = new LinkedHashMap<String, PubJqxzdm>();
		List<PubJqxzdm> list = getJqxzBybh(bzjqxzbh);
		for (PubJqxzdm pubJqxzdm : list) {
			map.put(pubJqxzdm.getBzjqxzbh(), pubJqxzdm);
		}
		logger.exit(JsonUtil.toJsonNonNull(map));
		return map;
	}

	/**
	 * getJqxzBybh TODO(根据标准警情性质编号查询对应警情性质集合)
	 * 
	 * @param bzjqxzbh 标准警情性质编号
	 * @return List&lt;PubJqxzdm&gt; 返回查询的数据以List的方式
	 */
	public List<PubJqxzdm> getJqxzBybh(String bzjqxzbh) {
		logger.entry("!!!!!!!!!!获取警情性质", JsonUtil.toJsonNonNull(bzjqxzbh));

		List<PubJqxzdm> list = null;
		if (list == null) {
			if (StringUtils.isNotBlank(bzjqxzbh)) {
				if (list == null) {
					throw ServiceSystemException.PUBAPP_NOT_EXIST.newInstance("警情性质不存在,字典编号{%s}", bzjqxzbh);
				}
			} else {
				// 获取所有警情性质
				QueryParam queryParam = new QueryParam();
				queryParam.addSqlCondition("1=1 order by jqxzbh");
				list = pubjqxzDmdao.getList(queryParam);
			}
		}
		logger.exit(JsonUtil.toJsonNonNull(list));
		return list;
	}

	/**
	 * getCountByBzjqxzbh 把当前的警情性质编号当作父编号查询子类的总数
	 * 
	 * @param bzjqxzbh 标准警情性质编号
	 * @return int 返回查询的总数
	 */
	private int getCountByBzjqxzbh(String bzjqxzbh) throws Exception {
		logger.entry("--------根据警情性质编号查询总数", bzjqxzbh);
		List<PubJqxzdm> PubJqxzdm = getPubJqxzListBybzjqxzfbh(bzjqxzbh);
		return PubJqxzdm.size();
	}

	/**
	 * 根据标准警情性质父编号获取警情性质列表
	 * 
	 * @param bzjqxzbh 标准警情性质编号
	 * @return List&lt;PubJqxzdm&gt; 返回一个警情性质集合
	 * @throws Exception 抛出可能发生的异常
	 */
	public List<PubJqxzdm> getPubJqxzBybzjqxzbh2(String bzjqxzbh) {
		logger.entry("!!!!!!!!!!根据标准警情性质父编号获取警情性质列表", JsonUtil.toJsonNonNull(bzjqxzbh));
		QueryParam queryParam = new QueryParam();

		if (StringUtils.isNotBlank(bzjqxzbh)) {
			queryParam.put("bzjqxzbh", bzjqxzbh);
		} else {
			queryParam.addCondition("bzjqxzbh", QueryParam.IS, QueryParam.NULL);
		}

		List<PubJqxzdm> list = pubjqxzDmdao.getList(queryParam);
		if (null == list) {
			throw ServiceSystemException.PUBAPP_NOT_EXIST.newInstance("警情性质不存在{%s}", bzjqxzbh);
		}
		logger.exit(JsonUtil.toJsonNonNull(list));
		return list;
	}

	/**
	 * getJqxzByBzjqxzbh 根据标准警情性质编号返回对应数据所处等级和数据
	 * 
	 * @param bzjqxzbh 标准警情性质编号
	 * @return Map&lt;String, PubJqxzdmBo&gt;
	 * @throws Exception 抛出可能发生的异常
	 */
	public Map<String, PubJqxzdmBo> getJqxzByBzjqxzbh(String bzjqxzbh) throws Exception {
		logger.entry("------根据标准警情性质编号查询对应的数据", JsonUtil.toJsonNonNull(bzjqxzbh));
		// 为空则抛出异常
		if (StringUtils.isBlank(bzjqxzbh)) {
			throw ServiceSystemException.PUBAPP_NOT_EXIST.newInstance("标准警情性质编号不存在${%s}", bzjqxzbh);
		}
		// 首先从缓存中获取对象
		PubJqxzdmBo pubJqxzdmBo = pubJqxzBoCache.get(bzjqxzbh);
		// 如果缓存中没有，那么去数据库拿
		if (null == pubJqxzdmBo) {
			QueryParam queryParam = new QueryParam();
			queryParam.addCondition("bzjqxzbh", queryParam.EQUALS, bzjqxzbh);
			PubJqxzdm jqxzdm = pubjqxzDmdao.getOne(queryParam);
			// 将查询的对象复制
			pubJqxzdmBo = new PubJqxzdmBo();
			DozerBeanMapper mapper = new DozerBeanMapper();
			mapper.map(jqxzdm, pubJqxzdmBo);

			// 没有对象则抛出提示异常
			if (null == jqxzdm) {
				// 如果缓存和数据库都没有那么抛出异常
				throw ServiceSystemException.PUBAPP_NOT_EXIST.newInstance("标准警情性质编号不存在${%s}", bzjqxzbh);
			}
		}

		Map<String, PubJqxzdmBo> map = new HashMap<String, PubJqxzdmBo>();

		Integer j = 0;
		boolean b = true;
		// 首先死循环
		while (b) {
			// 如果父编号不为空，就一直拿到父对象，直到父对象为空
			if (StringUtils.isNotBlank(pubJqxzdmBo.getBzjqxzfbh())) {
				j++;
				map.put(j.toString(), pubJqxzdmBo);
				pubJqxzdmBo = pubJqxzBoCache.get(pubJqxzdmBo.getBzjqxzfbh());
			} else {
				// 父编号为空那么就是顶级节点,退出循环
				map.put("1", pubJqxzdmBo);
				b = false;
			}
		}
		// 在父等级的节点上+1就是自己
		j++;
		map.put(j.toString(), pubJqxzBoCache.get(bzjqxzbh));
		return map;
	}
}
