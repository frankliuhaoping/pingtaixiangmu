package com.htcf.system.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.apache.jute.compiler.JString;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.dozer.DozerBeanMapper;
import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageInfo;
import com.github.pagehelper.StringUtil;
import com.htcf.frame.base.util.DateUtil;
import com.htcf.frame.base.util.JsonUtil;
import com.htcf.frame.base.util.TreeUtil;
import com.htcf.frame.core.dbRelevant.QueryParam;
import com.htcf.system.cache.PubZzjgBoCache;
import com.htcf.system.cache.PubZzjgListCache;
import com.htcf.system.dao.PubZzjgDao;
import com.htcf.system.exception.ServiceSystemException;
import com.htcf.system.model.bo.PubJqxzdmBo;
import com.htcf.system.model.bo.PubZzjgBo;
import com.htcf.system.model.bo.SysOrg;
import com.htcf.system.model.po.PubJqxzdm;
import com.htcf.system.model.po.PubZzjg;
import com.htcf.system.service.PubZzjgService;

/**
 * 
 * ClassName: PubZzjgServiceImpl <br>
 * Function: 组织机构接口Impl. <br>
 * date: 2016年12月20日 下午5:21:20 <br>
 * 2017-07-22 修改
 * 
 * @author admin
 */
@Service("pubZzjgService")
public class PubZzjgServiceImpl implements PubZzjgService {
	// 日志
	private static final Logger logger = LogManager.getLogger(PubZzjgServiceImpl.class);

	/**
	 * dao
	 */
	@Autowired
	private PubZzjgDao pubZzjgDao;

	/**
	 * 组织机构单个缓存
	 */
	@Autowired
	private PubZzjgBoCache pubZzjgBoCache;

	/**
	 * 组织机构集合缓存
	 */
	@Autowired
	private PubZzjgListCache pubZzjgListCache;

	/**
	 * (新增组织机构)
	 * 
	 * @param pubZzjg 新增的组织机构
	 * @return 返回组织机构
	 * @throws Exception 抛出可能发生的异常 抛出可能出现的异常
	 * @see com.htcf.system.service.PubZzjgService#addPubZzjg(com.htcf.system.model.po.PubZzjg)
	 */
	@Override
	public PubZzjg addPubZzjg(PubZzjg pubZzjg) throws Exception {
		logger.entry("!!!!!!!!!!新增组织机构", JsonUtil.toJsonNonNull(pubZzjg));
		// 提交到数据库
		pubZzjgDao.add(pubZzjg);
		// 查询全部
		List<PubZzjg> list = getPubZzjg();
		// 创建拷贝对象
		DozerBeanMapper mapper = new DozerBeanMapper();
		PubZzjgBo pubZzjgBo = new PubZzjgBo();
		mapper.map(pubZzjg, pubZzjgBo);

		// 更新单个缓存中的父对象的叶子节点信息
		if (StringUtils.isNotBlank(pubZzjg.getGxdwdm())) {
			PubZzjgBo parentBO = pubZzjgBoCache.get(pubZzjg.getGxdwdm());
			parentBO.setIsLeaf(false);
			pubZzjgBoCache.put(pubZzjg.getGxdwdm(), parentBO);
		}

		// 更新当前对象父节点对应的集合信息
		pubZzjgListCache.put(pubZzjg.getGxdwdm(), getChildren(pubZzjg.getGxdwdm(), list));

		// 判断当前树为节点的第几层
		if (StringUtils.isNotBlank(pubZzjg.getGxdwdm())) {
			pubZzjgBo.setLevel(getLevel(pubZzjg));
		} else {
			pubZzjgBo.setLevel(0);
		}
		// 新增的对象为叶子节点
		pubZzjgBo.setIsLeaf(true);
		// 设置当前的菜单数据也就是自己
		pubZzjgBoCache.put(pubZzjgBo.getDwdm(), pubZzjgBo);
		List<PubZzjgBo> lists = new ArrayList<PubZzjgBo>();
		// 添加自己，对应的是数组，不可变，只能为空的数组，不能为null,为null时加载数据遍历报空指针异常
		pubZzjgListCache.put(pubZzjgBo.getDwdm(), lists);
		logger.exit(JsonUtil.toJsonNonNull(pubZzjg));
		return pubZzjg;
	}

	/**
	 * (修改组织机构)
	 * 
	 * @param pubZzjg 组织机构
	 * @return 返回组织机构
	 * @throws Exception 抛出可能发生的异常 抛出可能出现的异常
	 * @see com.htcf.system.service.PubZzjgService#updatePubZzjg(com.htcf.system.model.po.PubZzjg)
	 */
	@Override
	public PubZzjg updatePubZzjg(PubZzjg pubZzjg) throws Exception {
		logger.entry("!!!!!!!!!!修改组织机构", JsonUtil.toJsonNonNull(pubZzjg));
		// 修改db
		pubZzjgDao.update(pubZzjg, "dwdm");
		// 查询全部
		List<PubZzjg> list = getPubZzjg();
		// 创建拷贝对象
		DozerBeanMapper mapper = new DozerBeanMapper();
		PubZzjgBo pubZzjgBo = new PubZzjgBo();
		mapper.map(pubZzjg, pubZzjgBo);
		// 从缓存中查询之前的父级id
		PubZzjg p = (PubZzjg) pubZzjgBoCache.get(pubZzjg.getDwdm());
		// 更新修改之前的父节点对应的集合信息
		pubZzjgListCache.put(p.getGxdwdm(), getChildren(p.getGxdwdm(), list));
		// 更新修改之后当前对象父节点对应的集合信息
		pubZzjgListCache.put(pubZzjg.getGxdwdm(), getChildren(pubZzjg.getGxdwdm(), list));
		// 判断当前树为节点的第几层
		if (StringUtils.isNotBlank(pubZzjg.getGxdwdm())) {
			pubZzjgBo.setLevel(getLevel(pubZzjg));
		} else {
			pubZzjgBo.setLevel(0);
		}
		// 判断是否为叶子节点
		if (getChildren(pubZzjg.getDwdm(), list).size() == 0) {
			pubZzjgBo.setIsLeaf(true);
		} else {
			pubZzjgBo.setIsLeaf(false);
		}
		// 设置当前的菜单数据也就是自己
		pubZzjgBoCache.put(pubZzjgBo.getDwdm(), pubZzjgBo);
		logger.exit(JsonUtil.toJsonNonNull(pubZzjg));
		return pubZzjg;
	}

	/**
	 * (查看组织机构)
	 * 
	 * @param dwdm 单位代码
	 * @return 返回单个组织机构
	 * @throws Exception 抛出可能发生的异常 抛出肯能出现的异常
	 * @see com.htcf.system.service.PubZzjgService#viewPubZzjgByDwdm(java.lang.String)
	 */
	@Override
	public PubZzjg viewPubZzjgByDwdm(String dwdm) throws Exception {
		return getPubZzjgByDwdm(dwdm);
	}

	/**
	 * (根据单位代码获取组织机构)
	 * 
	 * @param dwdm 单位代码
	 * @return 返回查询的 组织机构对象
	 * @throws Exception 抛出可能发生的异常 抛出可能发生的异常
	 * @see com.htcf.system.service.PubZzjgService#getPubZzjgByDwdm(java.lang.String)
	 */
	@Override
	public PubZzjg getPubZzjgByDwdm(String dwdm) throws Exception {
		logger.entry("!!!!!!!!!!根据单位代码获取组织机构", JsonUtil.toJsonNonNull(dwdm));
		QueryParam queryParam = new QueryParam();
		queryParam.put("dwdm", dwdm);
		PubZzjg pubZzjg = pubZzjgDao.getOne(queryParam);
//		if (null == pubZzjg) {
//			throw ServiceSystemException.PUBAPP_NOT_EXIST.newInstance("单位代码不存在,dwdm{%s}", dwdm);
//		}
//		logger.exit(JsonUtil.toJsonNonNull(pubZzjg));
		return pubZzjg;
	}

	/**
	 * (根据多个单位代码删除组织机构)
	 * 
	 * @param dwdms 单位代码数组
	 * @return 返回数据操作之后的记录
	 * @throws Exception 抛出可能发生的异常 抛出可能出现的异常
	 * @see com.htcf.system.service.PubZzjgService#deleltePubZzjg(java.lang.String[])
	 */
	@Override
	public int deleltePubZzjg(String... dwdms) throws Exception {
		logger.entry("!!!!!!!!!!批量删除组织机构", JsonUtil.toJsonNonNull(dwdms));

		int deleteCount = 0;
		for (String dwdm : dwdms) {
			// 删除授权
			deleteCount += deleltePubZzjg(dwdm);
		}
		logger.exit(deleteCount);
		return deleteCount;
	}

	/**
	 * 
	 * (根据单位代码删除组织机构)
	 * 
	 * @param dwdm
	 * @return
	 * @throws Exception 抛出可能发生的异常 int
	 */
	private int deleltePubZzjg(String dwdm) throws Exception {
		logger.entry("!!!!!!!!!!删除组织机构", JsonUtil.toJsonNonNull(dwdm));
		List<PubZzjgBo> list = null;
		int count = 0;
		// 获取要删除编号的对象
		PubZzjg pubZzjg = getPubZzjgByDwdm(dwdm);

		/*
		 * 1：先判断是否有子菜单， 2:有子菜单提示不允许删除菜单 3:无子菜单则直接删除 4:更新父节点的叶子信息，判断是否有子菜单
		 */
		list = pubZzjgListCache.get(pubZzjg.getDwdm());
		// 判断是否有子菜单
		if (list.size() > 0) {
			throw ServiceSystemException.PUBAPP_NOT_EXIST.newInstance("对不起，该菜单存在子菜单不允许删除！单位代码：{%s}", dwdm);
		} else {
			// 无子类，删除自己
			count = pubZzjgDao.delete(pubZzjg.getDwdm());
			// 删除单个缓存中的自己
			pubZzjgBoCache.remove(pubZzjg.getDwdm());
			// 删除集合中的自己
			pubZzjgListCache.remove(pubZzjg.getDwdm());
		}

		if (pubZzjg.getGxdwdm() == null) {
			pubZzjg.setGxdwdm("");
		}

		// 查询全部
		List<PubZzjg> pubzzjgList = getPubZzjg();
		// 更新删除之后缓存集合的数据
		List<PubZzjgBo> childrenList = getChildren(pubZzjg.getGxdwdm(), pubzzjgList);
		pubZzjgListCache.put(pubZzjg.getGxdwdm(), childrenList);

		// 如果父类下面没有子类了 ，那么它就是叶子节点，级别不变
		if (childrenList.size() < 1) {
			if (StringUtils.isNotBlank(pubZzjg.getGxdwdm())) {
				PubZzjgBo parentBo = pubZzjgBoCache.get(pubZzjg.getGxdwdm());
				parentBo.setIsLeaf(true);
				// 更新单个缓存的父类
				pubZzjgBoCache.put(pubZzjg.getGxdwdm(), parentBo);
			}
		}
		logger.exit(JsonUtil.toJsonNonNull(count));
		return count;
	}

	/**
	 * (根据条件获取分页后的组织机构列表)
	 * 
	 * @param map
	 * @return
	 * @throws Exception 抛出可能发生的异常
	 * @see com.htcf.system.service.PubZzjgService#getListPage(java.util.Map)
	 */
	@Override
	public PageInfo<PubZzjg> getListPage(Map<String, Object> map) throws Exception {

		logger.entry("!!!!!!!!!!根据条件获取分页后的组织机构列表", JsonUtil.toJsonNonNull(map));
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

		String starttime = null != map.get("starttime") ? map.get("starttime").toString() : null;
		String endtime = null != map.get("endtime") ? map.get("endtime").toString() : null;

		if (StringUtil.isNotEmpty(starttime)) {   // 大于开始时间记录
			queryParam.addCondition("cjsj", ">=", DateUtil.getDateTimeFormat(starttime));
		}
		if (StringUtil.isNotEmpty(endtime)) {  // 小于结束时间记录
			queryParam.addCondition("cjsj", "<=", DateUtil.getDateTimeFormat(endtime));
		}

		PageInfo<PubZzjg> pageInfo = pubZzjgDao.getListPage("get", queryParam);
		logger.exit(JsonUtil.toJsonNonNull(pageInfo));
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
	 * @param dwdm 单位代码
	 * @param: deepType 0:不加载孙子节点 1：递归加载所有孙子节点（按树型数据结构返回）
	 *         2：递归加载所有孙子节点（按并列数据结构返回）
	 * @return List&lt;PubZzjgBo>&gt; 返回查询的组织机构数据集合
	 * @throws Exception
	 * @see com.htcf.system.service.PubZzjgService#getTreeZzjg(java.lang.String)
	 */
	@Override
	public List<PubZzjgBo> getNodesZzjgByDwdm(String dwdm, Integer deepType) throws Exception {
		logger.entry("-------根据单位代码获取节点数据", JsonUtil.toJsonNonNull(dwdm), JsonUtil.toJsonNonNull(deepType));
		PubZzjgBo pubZzjgBo = null;
		// 如果编号不为空，那么则从缓存中加载数据
		if (StringUtils.isNotBlank(dwdm)) {
			pubZzjgBo = pubZzjgBoCache.get(dwdm);
		}
		List<PubZzjgBo> list = getPubZzjgByDwdm2(pubZzjgBo, deepType);
		// deepType等于1的是返回树形结构
		if (deepType == 1) {
			TreeUtil<PubZzjgBo> t = new TreeUtil<PubZzjgBo>();
			return t.buildTree(list, "dwdm", "gxdwdm", "children");
		}
		logger.exit(JsonUtil.toJsonNonNull(list));
		return list;
	}

	/**
	 * getLevel TODO(获取当前节点是第几层)
	 * 
	 * @param pubZzjg 组织机构
	 * @return 返回计算之后的层次
	 */
	public int getLevel(PubZzjg pubZzjg) {
		if (StringUtils.isBlank(pubZzjg.getDwdm())) {
			// 业务上应该不允许出现这个逻辑
			return 0;
		}
		int level = pubZzjg.getDwdm().length() / 2 - 1;
		return level;
	}

	/**
	 * 
	 * (获取树形结构 组织机构数据)
	 * 
	 * @param pubZzjgBo 组织机构Bo
	 * @param: deepType 0:不加载孙子节点 1：递归加载所有孙子节点（按树型数据结构返回）
	 *         2：递归加载所有孙子节点（按并列数据结构返回）
	 * @return List&lt;PubZzjgBo&gt; 返回遍历后的数据集合
	 * @see com.htcf.system.service.PubZzjgService#getTreeZzjg(PubZzjgBo,java.lang.Integer)
	 */
	public List<PubZzjgBo> getPubZzjgByDwdm2(PubZzjgBo pubZzjgBo, Integer deepType) {

		List<PubZzjgBo> pubZzjgNodes = new ArrayList<PubZzjgBo>();

		String dwdm = null;
		// 根据父资源编号获取列表
		if (pubZzjgBo != null) {
			dwdm = pubZzjgBo.getDwdm();
		} else {
			dwdm = "";
		}
		// 获取编号对应的菜单数据
		List<PubZzjgBo> pubzzjgList = pubZzjgListCache.get(dwdm);

		for (PubZzjgBo pubZzjgBo2 : pubzzjgList) {
			// 获取编号对应的单个对象
			PubZzjgBo currentBo = pubZzjgBoCache.get(pubZzjgBo2.getDwdm());
			// if (deepType == 1) {
			// // 递归调用，生成树形结构返回
			// List<PubZzjgBo> childrenList = getPubZzjgByDwdm2(currentBo,
			// deepType);
			// if (childrenList.size() != 0) {
			// currentBo.setChildren(childrenList);
			// }
			// } else
			// 递归调用，生成并列结构返回
			if (deepType == 1 || deepType == 2) {
				List<PubZzjgBo> childrenList = getPubZzjgByDwdm2(currentBo, deepType);
				if (childrenList.size() != 0) {
					pubZzjgNodes.addAll(childrenList);
				}
			}
			pubZzjgNodes.add(currentBo);
		}
		return pubZzjgNodes;
	}

	/**
	 * init TODO(初始化组织机构数据加载到缓存中)
	 */
	public void init() {
		// 查询全部
		List<PubZzjg> list = getPubZzjg();
		// 创建复制对象
		DozerBeanMapper mapper = new DozerBeanMapper();
		// 设置空健的一级平级菜单数据
		pubZzjgListCache.put("", getChildren("", list));
		// 循环全部数据处理
		for (PubZzjg pubZzjg : list) {
			PubZzjgBo pubZzjgBo = new PubZzjgBo();
			mapper.map(pubZzjg, pubZzjgBo);

			// 判断当前树为节点的第几层
			if (StringUtils.isNotBlank(pubZzjg.getGxdwdm())) {
				pubZzjgBo.setLevel(getLevel(pubZzjg));
			} else {
				pubZzjgBo.setLevel(0);
			}

			// 设置每个编号对应的菜单数据，没有则为空
			List<PubZzjgBo> childrenList = getChildren(pubZzjgBo.getDwdm(), list);
			pubZzjgListCache.put(pubZzjgBo.getDwdm(), childrenList);

			if (childrenList.size() == 0) {
				pubZzjgBo.setIsLeaf(true);
			} else {
				pubZzjgBo.setIsLeaf(false);
			}

			// 设置当前的菜单数据也就是自己
			pubZzjgBoCache.put(pubZzjgBo.getDwdm(), pubZzjgBo);
		}
	}

	/**
	 * getChildren TODO(根据编号获取子菜单数据列表)
	 * 
	 * @param dwdm 编号
	 * @param all 全部数据的集合
	 * @return List&lt;PubZzjgBo&gt; 返回分解好的数据列表
	 */
	public List<PubZzjgBo> getChildren(String dwdm, List<PubZzjg> all) {
		// LinkedList 保持数据有序
		List<PubZzjgBo> list = new LinkedList<PubZzjgBo>();
		DozerBeanMapper mapper = new DozerBeanMapper();

		for (PubZzjg pubZzjg : all) {
			// 如果父编号为空的则是父类
			if (pubZzjg.getGxdwdm() == null && dwdm.equals("")) {
				PubZzjgBo pubZzjgBo = new PubZzjgBo();
				mapper.map(pubZzjg, pubZzjgBo);
				list.add(pubZzjgBo);
			}
			// 如果父编号不是空的则是子类
			if (pubZzjg.getGxdwdm() != null && pubZzjg.getGxdwdm().equals(dwdm)) {
				PubZzjgBo pubZzjgBo = new PubZzjgBo();
				mapper.map(pubZzjg, pubZzjgBo);
				list.add(pubZzjgBo);
			}
		}
		return list;
	}

	/**
	 * 根据管辖单位代码获取组织机构
	 * 
	 * @param gxdwdm
	 * @return List<PubZzjg>
	 */
	public List<PubZzjg> getListByGxdwdm(String gxdwdm) {
		logger.entry("@@@@@@@@@@根据管辖单位代码获取组织机构列表", gxdwdm);
		QueryParam queryParam = new QueryParam();
		if (gxdwdm == "" || gxdwdm == null) {
			queryParam.addCondition("gxdwdm", QueryParam.IS, QueryParam.NULL);
		} else {
			queryParam.put("gxdwdm", gxdwdm);
		}
		List<PubZzjg> pubZzjgs = pubZzjgDao.getList(queryParam);
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
	 * 这个方法serviceImpl没有用到 getNodesZzjgByDwdm 递归加载所有孙子节点单位代码
	 * 
	 * @param dwdm 单位代码
	 * @return Set&lt;String&gt; 返回根据单位代码查询的数据以set有序的方式返回
	 * @throws Exception
	 */
	@Override
	public Set<String> getNodesZzjgByDwdm(String dwdm) throws Exception {
		List<PubZzjgBo> pubZzjgBos = getNodesZzjgByDwdm(dwdm, 2);
		Set<String> set = new HashSet<String>();
		for (PubZzjg pubZzjg : pubZzjgBos) {
			set.add(pubZzjg.getDwdm());
		}
		return set;
	}

	/**
	 * 根据单位类别查找组织机构
	 * 
	 * @param dwlb 单位类别
	 * @return List&lt;PubZzjg&gt; 返回根据类别查询的集合
	 * @see com.htcf.system.service.PubZzjgService#getPubZzjgByDwlb(java.lang.String)
	 */
	@Override
	public List<PubZzjg> getPubZzjgByDwlb(String dwlb) {
		QueryParam queryParam = new QueryParam();
		queryParam.addCondition("dwlb", "=", dwlb);
		return pubZzjgDao.getList(queryParam);
	}

	/**
	 * getPubZzjg TODO(获取全部组织机构按单位代码排序)
	 * 
	 * @return List&lt;PubZzjg&gt; 返回查询的数据
	 */
	public List<PubZzjg> getPubZzjg() {
		QueryParam param = new QueryParam();
		param.addSqlCondition("1=1 ORDER BY dwdm");
		List<PubZzjg> list = pubZzjgDao.getList(param);
		if (list == null) {
			throw ServiceSystemException.PUBAPP_NOT_EXIST.newInstance("全部组织机构数据获取失败!");
		}
		return list;
	}

	/**
	 * 
	 * TODO(这里用一句话描述这个方法的作用)
	 * 
	 * @param list
	 * @return
	 * @throws Exception
	 * @see com.htcf.system.service.PubZzjgService#insertBatch(java.util.List)
	 */
	@Override
	public int insertBatch(List<SysOrg> list) throws Exception {
		// int size = list.size();
		// int unitNum = 500;
		// int startIndex = 0;
		// int endIndex = 0;
		// while (size > 0){
		// if(size > unitNum){
		// endIndex = startIndex+unitNum;
		// }else {
		// endIndex = startIndex+size;
		// }
		// List<SysOrg> insertData = list.subList(startIndex,endIndex);
		// pubZzjgDao.insertBatch(insertData);
		// size = size - unitNum;
		// startIndex = endIndex;
		// }
		// return size;
		int index = 0;
		if (!list.isEmpty() && list != null) {
			index = pubZzjgDao.insertBatch(list);
		}
		return index;
	}

	/**
	 * TODO(这里用一句话描述这个方法的作用)
	 * 
	 * @param list
	 * @return
	 * @throws Exception
	 * @see com.htcf.system.service.PubZzjgService#updateBatch(java.util.List)
	 */
	@Override
	public int updateBatch(List<SysOrg> list) throws Exception {
		int index = 0;
		if (!list.isEmpty() && list != null) {
			index = pubZzjgDao.updateBatch(list);
		}
		return index;
	}

}
