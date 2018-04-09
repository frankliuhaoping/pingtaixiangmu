/** 
 * Project Name:service-template 
 * File Name:XXXObjectServiceImpl.java 
 * Package Name:com.htcf.template.service.impl 
 * Date:2017-2-24 16:27:06 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.template.service.impl;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.htcf.template.dao.XXXObjectDao;
import com.htcf.template.service.XXXObjectService;

/**
 * 
 * ClassName: XXXObjectServiceImpl <br/>
 * Function: 应用 ServiceImpl <br/>
 * Reason: ADD REASON(可选). <br/>
 * date: 2016年12月23日 下午1:03:54 <br/>
 * 
 * @author zhangyingzi
 * @version
 */
@Service("xXXObjectService")
public class XXXObjectServiceImpl implements XXXObjectService {

	/**
	 * xXXObjectDao
	 */
	@Autowired
	private XXXObjectDao xXXObjectDao;

	private static final Logger logger = LogManager.getLogger(XXXObjectServiceImpl.class);

	/**
	 * 添加XXX
	 * 
	 * @param XXXObject XXX
	 * @return XXXObject XXX
	 * @throws Exception
	 * @see com.htcf.template.service.XXXObjectService#addApp(com.htcf.template.model.po.XXXObject)
	 */
	/*@Override
	@Transactional(rollbackFor = Exception.class)
	public XXXObject addApp(XXXObject XXXObject) throws Exception {
		logger.entry("!!!!!!!!!!新增XXXObject", JsonUtil.toJsonNonNull(XXXObject));
		XXXObject.setYyid(XXXObjectDao.getSeq());
		XXXObject.setYyaqm(UUID.randomUUID().toString());
		// 状态标记
		XXXObjectDao.add(XXXObject);

		// TODO 逻辑需完善
		PubRole pubRole = new PubRole();
		pubRole.setYyid(XXXObject.getYyid());
		pubRole.setJsmc(XXXObject.getYymc() + "管理员");
		pubRole.setSybz("Y");
		pubRole.setCjsj(new Date(xxx.currentTimeMillis()));
		pubRole.setGxsj(new Date(xxx.currentTimeMillis()));
		pubRole.setCjrxm(XXXObject.getCjrxm());
		pubRoleService.addRole(pubRole);

		PubAuth pubAuth = new PubAuth();
		pubAuth.setYhbh(ServicexxxConstans.SADMIN_YHBH);
		pubAuth.setYyid(XXXObject.getYyid());
		pubAuth.setJsid(pubRole.getJsid());
		pubAuth.setCjsj(new Date(xxx.currentTimeMillis()));
		pubAuth.setCjrxm(XXXObject.getCjrxm());
		pubAuth.setGxsj(new Date(xxx.currentTimeMillis()));
		pubAuthService.addAuth(pubAuth);
		return XXXObject;
	}*/

}
