package com.htcf.system.service.impl;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.dozer.DozerBeanMapper;
import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageInfo;
import com.htcf.frame.base.util.JsonUtil;
import com.htcf.frame.core.dbRelevant.QueryParam;
import com.htcf.system.cache.PubXtzdListCache;
import com.htcf.system.dao.PubXtzdDao;
import com.htcf.system.exception.ServiceSystemException;
import com.htcf.system.model.bo.PubXtzdBo;
import com.htcf.system.model.po.PubXtzd;
import com.htcf.system.service.PubXtzdService;

/**
 * 
 * ClassName: PubXtzdServiceImpl <br/>
 * Function: 系统字典实现类. <br/>
 * Reason: TODO ADD REASON(可选). <br/>
 * date: 2017年2月9日 下午4:05:47 <br/>
 * 
 * @author cs
 */
@Service("pubXtzdService")
public class PubXtzdServiceImpl implements PubXtzdService {

	private static final Logger logger = LogManager.getLogger(PubXtzdServiceImpl.class);

	@Autowired
	private PubXtzdDao pubXtzdDao;

	@Autowired
	private PubXtzdListCache pubXtzdListCache;

	/**
	 * 新增系统字典
	 * 
	 * @param PubXtzd
	 * @return
	 * @throws Exception
	 * @see com.htcf.system.service.PubXtzdService#addPubXtzd(com.htcf.system.model.po.PubXtzd)
	 */
	@Override
	public PubXtzd addPubXtzd(PubXtzd pubXtzd) throws Exception {
		logger.entry("!!!!!!!!!!新增系统字典", pubXtzd);
		UUID uuid = UUID.randomUUID();
		pubXtzd.setBh(uuid.toString().replace("-", ""));
		pubXtzd.setSjbb(0L);
		pubXtzdDao.add(pubXtzd);
		
		//清空缓存
		pubXtzdListCache.removeAll();
		return pubXtzd;
	}

	/**
	 * 更新系统字典
	 * 
	 * @param pubXtzd
	 * @return
	 * @throws Exception
	 * @see com.htcf.system.service.PubXtzdService#updatePubXtzd(com.htcf.system.model.po.PubXtzd)
	 */
	@Override
	public PubXtzd updatePubXtzd(PubXtzd pubXtzd) throws Exception {
		logger.entry("!!!!!!!!!!更新系统字典", pubXtzd);
		pubXtzdDao.update(pubXtzd, "bh");
		
		//清空缓存
		pubXtzdListCache.removeAll();
		return null;
	}

	/**
	 * 根据类型代码获取系统字典
	 * 
	 * @param bh
	 * @return
	 * @throws Exception
	 * @see com.htcf.system.service.PubXtzdService#getPubXtzdByBh(java.lang.String)
	 */
	@Override
	public PubXtzd getPubXtzdByBh(String bh) throws Exception {
		logger.entry("!!!!!!!!!!根据编号获取系统字典", bh);
		QueryParam queryParam = new QueryParam();
		queryParam.put("bh", bh);
		PubXtzd PubXtzd = pubXtzdDao.getOne(queryParam);
		if (null == PubXtzd) {
			throw ServiceSystemException.PUBAPP_NOT_EXIST.newInstance("系统字典不存在,bh{%s}", bh);
		}
		return PubXtzd;
	}

	/**
	 * 
	 * 根据字典编号获取字典
	 * 
	 * @param zdbh
	 * @return
	 * @throws Exception
	 * @see com.htcf.system.service.PubXtzdService#getPubXtzdByZdbh(java.lang.String)
	 */
	@Override
	public PubXtzd getPubXtzdByZdbh(String zdbh) throws Exception {
		logger.entry("!!!!!!!!!!根据字典编号获取系统字典", zdbh);
		QueryParam queryParam = new QueryParam();
		queryParam.put("zdbh", zdbh);
		PubXtzd PubXtzd = pubXtzdDao.getOne(queryParam);
		if (null == PubXtzd) {
			throw ServiceSystemException.PUBAPP_NOT_EXIST.newInstance("系统字典不存在,zdbh{%s}", zdbh);
		}
		return PubXtzd;
	}

	/**
	 * 获取字典List 如果yyid != null && zdbh != null 获取特定的字典编号(zdbh)下的子字典 
	 * 如果yyid != null && zdbh == null 获取yyid下的所有字典 
	 * 如果yyid == null && zdbh == null 获取全系统所有字典，非特殊业务不建议调用
	 * 
	 * @param yyid
	 * @param zdbh
	 * @return
	 * @throws Exception
	 * @see com.htcf.system.service.PubXtzdService#getPubXtzdListByZdbh(java.lang.Long, java.lang.String)
	 */
	@Override
	public List<PubXtzd> getPubXtzdListByZdbh(Long yyid, String zdbh) throws Exception {
		logger.entry("!!!!!!!!!!获取字典列表", yyid, zdbh);

		String key = yyid + "_" + zdbh;
		List<PubXtzd> list = pubXtzdListCache.get(key);
		if (list == null) {
			if (zdbh != null) {
				// 获取具体字典列表
				PubXtzd pubXtzd = getPubXtzdByZdbh(yyid, zdbh);
				list = getPubXtzdListByZdfbh(yyid, pubXtzd.getBh());
			} else if (yyid != null && zdbh == null) {
				// 只传了yyid,代表要获取yyid下的所有字典
				QueryParam queryParam = new QueryParam();
				queryParam.put("yyid", yyid);
				list = pubXtzdDao.getList(queryParam);
			} else if (yyid == null && zdbh == null) {
				// 都为空，获取所有字典
				QueryParam queryParam = new QueryParam();
				list = pubXtzdDao.getList(queryParam);
			}
			
			if (list == null) {
				throw ServiceSystemException.PUBAPP_NOT_EXIST.newInstance("系统字典不存在,字典编号{%s}", zdbh);
			}
			
			pubXtzdListCache.put(key, list);
		}

		return list;
	}

	/**
	 * 获取字典Map
	 * 
	 * 如果yyid != null && zdbh != null 获取特定的字典编号(zdbh)下的子字典 如果yyid != null && zdbh == null 获取yyid下的所有字典 如果yyid == null &&
	 * zdbh == null 获取全系统所有字典，非特殊业务不建议调用
	 * 
	 * 返回值示例： key = system_zzjgsybz value = 组织机构使用标志
	 * 
	 * @param yyid
	 * @param zdbh
	 * @return
	 * @throws Exception Map<String,String>
	 */
	public Map<String, String> getStringMapByZdbh(Long yyid, String zdbh) throws Exception {
		logger.entry("!!!!!!!!!!获取字典Map<String, String>", yyid, zdbh);

		Map<String, String> map = new LinkedHashMap<String, String>();
		List<PubXtzd> list = getPubXtzdListByZdbh(yyid, zdbh);
		for (PubXtzd pubXtzd : list) {
			map.put(pubXtzd.getZdbh(), pubXtzd.getZdxm());
		}
		return map;
	}

	/**
	 * 获取字典Map
	 * 
	 * 如果yyid != null && zdbh != null 获取特定的字典编号(zdbh)下的子字典 如果yyid != null && zdbh == null 获取yyid下的所有字典 如果yyid == null &&
	 * zdbh == null 获取全系统所有字典，非特殊业务不建议调用
	 * 
	 * 返回值示例： key = system_zzjgsybz value = PubXtzd
	 * 
	 * @param yyid
	 * @param zdbh
	 * @return
	 * @throws Exception Map<String,PubXtzd>
	 */
	public Map<String, PubXtzd> getPubXtzdMapByZdbh(Long yyid, String zdbh) throws Exception {
		logger.entry("!!!!!!!!!!获取字典Map<String, PubXtzd>", yyid, zdbh);

		Map<String, PubXtzd> map = new LinkedHashMap<String, PubXtzd>();
		List<PubXtzd> list = getPubXtzdListByZdbh(yyid, zdbh);
		for (PubXtzd pubXtzd : list) {
			map.put(pubXtzd.getZdbh(), pubXtzd);
		}
		return map;
	}

	/**
	 * 根据字典父编号获取字典列表
	 * 
	 * @param zdfbh 父编号
	 * @return List<PubXtzd>
	 * @throws Exception
	 */
	private List<PubXtzd> getPubXtzdListByZdfbh(Long yyid, String zdfbh) throws Exception {
		logger.entry("!!!!!!!!!!根据字典父编号获取系统字典列表", yyid, zdfbh);

		QueryParam queryParam = new QueryParam();
		if (yyid != null) {
			queryParam.put("yyid", yyid);
		}
		
		if (zdfbh == "" || zdfbh == null) {
			queryParam.addCondition("zdfbh", QueryParam.IS, QueryParam.NULL);
		} else {
			queryParam.put("zdfbh", zdfbh);
		}

		List<PubXtzd> list = pubXtzdDao.getList(queryParam);
		if (null == list) {
			throw ServiceSystemException.PUBAPP_NOT_EXIST.newInstance("系统字典不存在{%s}", zdfbh);
		}
		return list;
	}

	/**
	 * 根据字典编号获取字典
	 * 
	 * @param zdbh
	 * @return
	 * @throws Exception
	 * @see com.htcf.system.service.PubXtzdService#getPubXtzdByZdbh(java.lang.String)
	 */
	@Override
	public PubXtzd getPubXtzdByZdbh(Long yyid, String zdbh) throws Exception {
		logger.entry("!!!!!!!!!!根据字典编号获取系统字典列表", yyid, zdbh);
		QueryParam queryParam = new QueryParam();
		//queryParam.put("yyid", yyid);
		queryParam.put("zdbh", zdbh);
		PubXtzd pubXtzd = pubXtzdDao.getOne(queryParam);
		if (null == pubXtzd) {
			throw ServiceSystemException.PUBAPP_NOT_EXIST.newInstance("系统字典不存在,zdbh{%s}", zdbh);
		}
		return pubXtzd;
	}

	/**
	 * 批量删除系统字典
	 * 
	 * @param bhs
	 * @return
	 * @throws Exception
	 * @see com.htcf.system.service.PubXtzdService#deleltePubXtzdByBh(java.lang.String[])
	 */
	@Override
	public int deleltePubXtzdByBh(String... bhs) throws Exception {
		logger.entry("!!!!!!!!!!批量删除系统字典", bhs);
		int deleteCount = 0;
		for (String bh : bhs) {
			// 删除授权
			deleteCount += deleltePubXtzd(bh);
		}
		return deleteCount;
	}

	/**
	 * 根据编号删除系统字典
	 * 
	 * @param bh
	 * @return
	 * @throws Exception int
	 */
	private int deleltePubXtzd(String bh) throws Exception {
		logger.entry("!!!!!!!!!!删除系统字典", bh);
		PubXtzd pubXtzd = getPubXtzdByBh(bh);
		// 删除子菜单
		List<PubXtzdBo> pubXtzdBoList = getPubXtzdNodesById(pubXtzd.getYyid(), pubXtzd.getZdbh(), 0);
		logger.debug("父资源编号", pubXtzd.getZdbh(), "子菜单字典", JsonUtil.toJsonNonNull(pubXtzdBoList));

		if (null != pubXtzdBoList && pubXtzdBoList.size() > 0) {
			for (PubXtzdBo pubXtzdBo : pubXtzdBoList) {
				deleltePubXtzd(pubXtzdBo.getBh());
			}
		}
		
		//清空缓存
		pubXtzdListCache.removeAll();
		
		return pubXtzdDao.delete(bh);
	}

	/**
	 * 分页获取系统字典
	 * 
	 * @param map
	 * @return
	 * @throws Exception
	 * @see com.htcf.system.service.PubXtzdService#getListPage(java.util.Map)
	 */
	@Override
	public PageInfo<PubXtzd> getListPage(Map<String, Object> map) throws Exception {
		logger.entry("!!!!!!!!!!分页获取系统字典", map);
		QueryParam queryParam = new QueryParam(map);
		PageInfo<PubXtzd> pageInfo = pubXtzdDao.getListPage("get", queryParam);
		return pageInfo;
	}

	/**
	 * 通过条件查询字典类型
	 * 
	 * @param pubXtzd
	 * @return
	 * @throws Exception
	 * @see com.htcf.system.service.PubXtzdService#queryListBySearch(com.htcf.system.model.po.PubXtzd)
	 */
	@Override
	public List<PubXtzd> queryListBySearch(Map<String, Object> map) throws Exception {
		logger.entry("!!!!!!!!!!通过条件查询字典", map);
		QueryParam queryParam = new QueryParam();
		if (map != null && map.get("zdbh") != null) {
			queryParam.addCondition("zdbh", QueryParam.EQUALS, map.get("zdbh"));
		}
		List<PubXtzd> pubXtzds = pubXtzdDao.getList(queryParam);
		return pubXtzds;
	}

	/**
	 * TODO(根据字典项名获取字典编号)
	 * 
	 * @param zdxm
	 * @return
	 * @throws Exception
	 * @see com.htcf.system.service.PubXtzdService#getPubXtzdByZdxm(java.lang.String)
	 */
	@Override
	public PubXtzd getPubXtzdByZdxm(String zdxm) throws Exception {
		logger.entry("!!!!!!!!!!!根据字典项名获取字典编号", zdxm);
		QueryParam queryParam = new QueryParam();
		queryParam.put("zdxm", zdxm);
		PubXtzd pubXtzd = pubXtzdDao.getOne(queryParam);
		if (pubXtzd == null) {
			throw ServiceSystemException.PUBAPP_NOT_EXIST.newInstance("系统字典类型代码不存在,yyid{%s}", zdxm);
		}
		return pubXtzd;

	}

	/**
	 * 根据zdbh获取子节点
	 * 
	 * @param: zdfbh 父编号
	 * @param: deepType 0:不加载孙子节点 1：递归加载所有孙子节点（按树型数据结构返回） 2：递归加载所有孙子节点（按并列数据结构返回）
	 * @return: List<PubXtzdBo> 系统字典列表
	 * @throws Exception
	 * @see com.htcf.system.service.PubXtzdService#getPubXtzdNodesById(Long, int)
	 */
	// @Override
	public List<PubXtzdBo> getPubXtzdNodesById(Long yyid, String zdfbh, int deepType) throws Exception {
		logger.entry("!!!!!!!!!!根据zdfbh获取子节点", yyid, zdfbh, deepType);

		List<PubXtzdBo> pubXtzdNodes = new ArrayList<PubXtzdBo>();
		// 根据父资源ID获取资源列表
		List<PubXtzd> pubXtzdList = getPubXtzdListByZdfbh(yyid, zdfbh);

		for (PubXtzd pubXtzd : pubXtzdList) {
			PubXtzdBo pubXtzdNode = new PubXtzdBo();

			// 属性复制
			Mapper mapper = new DozerBeanMapper();
			mapper.map(pubXtzd, pubXtzdNode);

			// 节点在整棵树所在的级别
			// pubXtzdNode.setLevel(getXtzdLevel(pubXtzd));

			if (getCountByZdfbh(yyid, pubXtzd.getBh()) == 0) {
				// 当前节点已经是叶子节点
				pubXtzdNode.setIsLeaf(true);
			} else {
				pubXtzdNode.setIsLeaf(false);
				if (deepType == 1) {
					// 递归调用，生成树型结构
					List<PubXtzdBo> childrenList = getPubXtzdNodesById(yyid, pubXtzd.getBh(), 1);
					pubXtzdNode.setChildren(childrenList);
				} else if (deepType == 2) {
					// 递归调用，生成并列结构
					List<PubXtzdBo> childrenList = getPubXtzdNodesById(yyid, pubXtzd.getBh(), 2);
					pubXtzdNodes.addAll(childrenList);
				}
			}
			pubXtzdNodes.add(pubXtzdNode);
		}
		return pubXtzdNodes;
	}

	/**
	 * getCountByZdfbh 根据zdfbh获取子资源数量
	 * 
	 * @param zdfbh
	 * @return int 子资源数量
	 * @throws Exception
	 */
	private int getCountByZdfbh(Long yyid, String zdfbh) throws Exception {
		logger.entry("@@@@@@@@@@根据字典父编号获取子字典数量", zdfbh);
		List<PubXtzd> pubXtzd = getPubXtzdListByZdfbh(yyid, zdfbh);
		return pubXtzd.size();
	}

}
