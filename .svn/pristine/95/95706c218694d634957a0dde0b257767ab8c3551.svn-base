package com.htcf.system.dao;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.htcf.frame.core.dao.impl.AbstractBaseDao;
import com.htcf.frame.core.dbRelevant.QueryParam;
import com.htcf.system.model.bo.PubRoleBo;
import com.htcf.system.model.po.PubRole;

/**
 * ClassName: PubRoleBo <br/>
 * Function: 角色DAO <br/>
 * Reason: ADD REASON(可选). <br/>
 * date: 2016年11月16日 下午2:37:53 <br/>
 * 
 * @author ZhangGuihua
 */
@Repository
public class PubRoleDao extends AbstractBaseDao<PubRole> {

	/**
	 * getJoinAuthList 根据查询条件获取关联授权角色
	 * 
	 * @param param 查询条件
	 * @return List<PubRole> 角色列表
	 * @throws Exception List<PubRole>
	 */
	public List<PubRole> getJoinAuthList(QueryParam param) throws Exception {

		return this.sessionTemplate.selectList(getStatement("getJoinAuth"), param);
	}

	/**
	 * getListPageBo 根据查询条件、sqlId获取分页角色列表
	 * 
	 * @param sqlId sqlId 用户xml配置文件sql id名称
	 * @param param 根据查询条件
	 * @return PageInfo<PubRoleBo> 分页角色列表
	 * @throws Exception PageInfo<PubRoleBo>
	 */
	public PageInfo<PubRoleBo> getListPageBo(String sqlId, QueryParam param) throws Exception {
		if (param == null || StringUtils.isBlank(sqlId)) {
			// TODO 异常类型不正确
			throw new RuntimeException("查询参数为空");
		}

		PageHelper.startPage(param.getPageNum(), param.getPageSize());
		if (StringUtils.isNotBlank(param.getOrder())) {
			// 有排序条件，自动拼接新的SQL
			PageHelper.orderBy(param.getOrder());
		}

		List<PubRoleBo> list = sessionTemplate.selectList(getStatement(sqlId), param);

		// 用PageInfo对结果进行包装
		PageInfo<PubRoleBo> page = new PageInfo<PubRoleBo>(list);
		return page;
	}

	/**
	 * 
	 * 把角色 数据插入到角色-资源表
	 * 
	 * @param map
	 * @return 成功插入的行数
	 */
	public int addPubRoleRes(Map<String, String> map) throws Exception {
		return sessionTemplate.insert(getStatement("addPubRoleRes"), map);
	}
	/**
	 * 查询所有角色
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<PubRole> getAll() throws Exception{
		return sessionTemplate.selectList(getStatement("getAll"));
	}

	/**
	 * TODO(这里用一句话描述这个方法的作用)
	 * 
	 * @param queryParam
	 * @return
	 */
	public List<PubRole> getPubRoleList(QueryParam queryParam) {
		return sessionTemplate.selectList(getStatement("getPubRoleList"), queryParam);
	}

	/**
	 * TODO(这里用一句话描述这个方法的作用)
	 * 
	 * @param jsid
	 * @return 
	 */
	public int deleteRoleRes(String jsid) {
		return sessionTemplate.delete(getStatement("deleteRoleRes"), jsid);

	}

}
