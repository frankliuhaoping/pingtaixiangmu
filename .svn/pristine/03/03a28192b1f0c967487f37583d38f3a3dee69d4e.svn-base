/** 
 * Project Name:web-system 
 * File Name:PubUserController.java 
 * Package Name:com.htcf.system.web.controller
 * Date:2016年12月19日 上午10:27:12
 * Copyright (c) 2016, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.web.controller;

import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.dozer.DozerBeanMapper;
import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import com.github.pagehelper.PageInfo;
import com.htcf.frame.base.model.ExcelCellModel;
import com.htcf.frame.base.util.DateUtil;
import com.htcf.frame.base.util.ExcelUtil;
import com.htcf.frame.base.util.JsonUtil;
import com.htcf.frame.web.init.CommonWebConstans;
import com.htcf.frame.web.model.vo.ActionResult;
import com.htcf.frame.web.model.vo.PageResult;
import com.htcf.system.model.bo.PubUserBo;
import com.htcf.system.model.po.PubApp;
import com.htcf.system.model.po.PubAuth;
import com.htcf.system.model.po.PubRole;
import com.htcf.system.model.po.PubUser;
import com.htcf.system.service.PubAppService;
import com.htcf.system.service.PubAuthService;
import com.htcf.system.service.PubLogService;
import com.htcf.system.service.PubRoleService;
import com.htcf.system.service.PubUserService;
import com.htcf.system.web.init.WebSystemConstans;

/**
 * 
 * ClassName: PubUserController <br/>
 * Function: 用户 Controller <br/>
 * Reason: ADD REASON(可选). <br/>
 * date: 2016年12月19日 上午10:27:16 <br/>
 * 
 * @author zhangyingzi
 */
@Controller
@RequestMapping("/pubUser")
public class PubUserController {

	/** The Constant logger. */
	private static final Logger logger = LogManager.getLogger(PubUserController.class);

	/**
	 * pubUserService: 获取资源权限服务.
	 */
	@Autowired
	private PubUserService pubUserService;

	/**
	 * pubAuthService: 获取资源授权服务
	 */
	@Autowired
	private PubAuthService pubAuthService;

	/**
	 * pubAppService: 获取资源应用服务
	 */
	@Autowired
	private PubAppService pubAppService;

	/**
	 * pubRoleService: 获取角色应用服务
	 */
	@Autowired
	private PubRoleService pubRoleService;

	/**
	 * pubLogService: 日志服务.
	 */
	@Autowired
	private PubLogService pubLogService;

	/**
	 * index 返回用户index页面.
	 * 
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value = "/index")
	public String index() throws Exception {
		logger.entry("-------返回用户index页面");
		return "/pubUser/pubUser_index";
	}

	/**
	 * getDataByPageBo 角色授权中需要BO对象 获取分页数据生成json格式传回
	 * 
	 * @param request
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value = "/getDataByPageBo")
	@ResponseBody
	public String getDataByPageBo(HttpServletRequest request) throws Exception {
		logger.entry("-------获取分页数据生成json格式传回");
		Map<String, Object> map = WebUtils.getParametersStartingWith(request, null);
		PageInfo<PubUserBo> pageInfo = pubUserService.getListPageBo(map);
		PageResult<PubUserBo> recordBeanPageResult = new PageResult<PubUserBo>(pageInfo.getList(),
				(int) pageInfo.getTotal());
		return JsonUtil.toJsonNonNull(recordBeanPageResult);
	}

	/**
	 * getDataByPage 获取分页数据生成json格式传回
	 * 
	 * @param request
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value = "/getDataByPage")
	@ResponseBody
	public String getDataByPage(HttpServletRequest request) throws Exception {
		logger.entry("-------获取分页数据生成json格式传回");
		Map<String, Object> map = WebUtils.getParametersStartingWith(request, null);
		PageInfo<PubUser> pageInfo = pubUserService.getListPage(map);
		PageResult<PubUser> recordBeanPageResult = new PageResult<PubUser>(pageInfo.getList(),
				(int) pageInfo.getTotal());
		return JsonUtil.toJsonNonNull(recordBeanPageResult);
	}

	/**
	 * add 新增用户
	 * 
	 * @return String
	 */
	@RequiresPermissions("sys:pubRes:add")
	@RequestMapping(value = "/add")
	public String add(HttpServletRequest request) {
		logger.entry("-------新增用户");
		// 设置需要的单位代码数到前端
		request.setAttribute(WebSystemConstans.XZQH_ROOT_NUMBER, WebSystemConstans.XZQH_ROOT_NUMBER_VALUE);
		request.setAttribute(WebSystemConstans.XZQH_OTHER_NUMBER, WebSystemConstans.XZQH_OTHER_NUMBER_VALUE);
		return "pubUser/pubUser_add";
	}

	/**
	 * saveAdd 保存新增用户
	 * 
	 * @param pubUser
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value = "/saveAdd")
	@ResponseBody
	public String saveAdd(PubUser pubUser, HttpServletRequest request) throws Exception {
		logger.entry("-------保存新增用户");
		ActionResult ar = ActionResult.success().build();

		PubUser pUser = (PubUser) request.getAttribute(CommonWebConstans.CURRENT_USER);
		pubUser.setCjrxm(pUser.getYhmc());
		pubUser.setCjsj(new Date(System.currentTimeMillis()));
		pubUser.setGxsj(new Date(System.currentTimeMillis()));

		pubUserService.addUser(pubUser);
		return JsonUtil.toJsonNonNull(ar);
	}

	/**
	 * edit 修改用户
	 * 
	 * @param id
	 * @param request
	 * @return String
	 * @throws Exception
	 */
	@RequiresPermissions("sys:pubRes:edit")
	@RequestMapping(value = "/edit/{id}")
	public String edit(@PathVariable String id, HttpServletRequest request) throws Exception {
		logger.entry("-------修改用户");
		PubUser pubUser = pubUserService.getUserByYhbh(id);
		request.setAttribute("pubUser", JsonUtil.toJsonNonNull(pubUser));
		request.setAttribute("pubUserBean", pubUser);
		// 设置需要的单位代码数到前端
		request.setAttribute(WebSystemConstans.XZQH_ROOT_NUMBER, WebSystemConstans.XZQH_ROOT_NUMBER_VALUE);
		request.setAttribute(WebSystemConstans.XZQH_OTHER_NUMBER, WebSystemConstans.XZQH_OTHER_NUMBER_VALUE);
		return "pubUser/pubUser_edit";
	}

	/**
	 * saveEdit 更新用户
	 * 
	 * @param pubUser
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value = "/saveEdit")
	@ResponseBody
	public String saveEdit(PubUser pubUser, HttpServletRequest request) throws Exception {
		logger.entry("-------更新用户");
		ActionResult ar = ActionResult.success().build();

		PubUser pUser = (PubUser) request.getAttribute(CommonWebConstans.CURRENT_USER);
		pubUser.setGxrxm(pUser.getYhmc());
		pubUser.setGxsj(new Date(System.currentTimeMillis()));

		pubUserService.updateUser(pubUser);
		return JsonUtil.toJsonNonNull(ar);
	}

	/**
	 * delete 删除单条用户
	 * 
	 * @param id
	 * @return String
	 * @throws Exception
	 */
	@RequiresPermissions("sys:pubUser:delete")
	@RequestMapping(value = "/delete/{id}")
	@ResponseBody
	public String delete(@PathVariable String id) throws Exception {
		logger.entry("-------删除单条用户");
		ActionResult ar = ActionResult.success().build();
		pubUserService.delelteUser(id);
		return JsonUtil.toJsonNonNull(ar);
	}

	/**
	 * deleteBatch 批量删除用户
	 * 
	 * @param request
	 * @return String
	 * @throws Exception
	 */
	@RequiresPermissions("sys:pubUser:delete")
	@RequestMapping("/deleteBatch")
	@ResponseBody
	public String deleteBatch(HttpServletRequest request) throws Exception {
		logger.entry("-------批量删除用户");
		ActionResult ar = ActionResult.success().build();
		String[] ids = request.getParameterValues("id[]");
		if (null != ids && ids.length > 0) {
			String[] lids = new String[ids.length];
			for (int i = 0; i < ids.length; i++) {
				lids[i] = ids[i];
			}
			pubUserService.delelteUser(lids);
		}
		return JsonUtil.toJsonNonNull(ar);
	}

	/**
	 * validateYhzh 验证用户账号
	 * 
	 * @param request
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping("/validateYhzh")
	@ResponseBody
	public String validateYhzh(HttpServletRequest request, String yhzh) throws Exception {
		logger.entry("-------验证用户账号");
		PubUser pubUser = pubUserService.getUserByYhzh(yhzh);
		String flag = "true";
		if (pubUser != null) {
			flag = "false";
		}
		return flag;
	}

	/**
	 * role 设置角色
	 * 
	 * @return String
	 * @throws Exception
	 */
	@RequiresPermissions("sys:pubUser:auth")
	@RequestMapping(value = "/auth")
	public String auth(HttpServletRequest request, String id) throws Exception {
		logger.entry("-------授权");

		// 根据当前登陆用户查询应用ID
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		PubUser pubUser = (PubUser) request.getAttribute(CommonWebConstans.CURRENT_USER);
		map.put("yhbh", pubUser.getYhbh());
		List<PubApp> pubAppList = pubAppService.getAppJoinAuthGroupList(map);
		request.setAttribute("pubAppList", pubAppList);

		// 根据登陆用户的应用获取对应角色ID
		Map<String, Object> authMap = new ConcurrentHashMap<String, Object>();
		authMap.put("yhbh", id);
		List<PubAuth> authList = pubAuthService.getAuthList(authMap);
		Set<String> jsid = new LinkedHashSet<String>();
		if (null != pubAppList && pubAppList.size() > 0 && null != authList && authList.size() > 0) {
			for (PubAuth pubAuth : authList) {
				for (PubApp pubApp : pubAppList) {
					if (pubAuth.getYyid().equals(pubApp.getYyid())) {
						jsid.add(pubAuth.getJsid());
						break;
					}
				}
			}
		}

		request.setAttribute("jsid", JsonUtil.toJsonNonNull(jsid));
		request.setAttribute("yhbh", id);
		return "pubUser/pubUser_role";
	}

	/**
	 * saveRole 更新角色
	 * 
	 * @param pubUser
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value = "/saveAuth")
	@ResponseBody
	public String saveAuth(HttpServletRequest request) throws Exception {

		logger.entry("-------更新授权");
		ActionResult ar = ActionResult.success().build();

		String[] nJsids = request.getParameterValues("id[]");
		String[] oJsids = request.getParameterValues("jsid[]");
		String yhbh = request.getParameter("yhbh");
		PubUser pubUser = (PubUser) request.getAttribute(CommonWebConstans.CURRENT_USER);
		pubAuthService.saveUserAuth(nJsids, oJsids, yhbh, pubUser);

		return JsonUtil.toJsonNonNull(ar);
	}

	/**
	 * resetpwd 重置密码
	 * 
	 * @param id
	 * @return String
	 * @throws Exception
	 */
	@RequiresPermissions("sys:pubUser:resetPwd")
	@RequestMapping(value = "/resetPwd/{id}")
	@ResponseBody
	public String resetPwd(@PathVariable String id) throws Exception {
		logger.entry("-------重置密码");
		ActionResult ar = ActionResult.success().build();
		PubUser pubUser = pubUserService.resetPwd(id);
		ar.setData(pubUser);
		return JsonUtil.toJsonNonNull(ar);
	}

	/**
	 * 
	 * view 用户详情
	 * 
	 * @param id 主键
	 * @param request
	 * @return String 详情页面
	 * @throws Exception
	 */
	@RequiresPermissions("sys:pubRes:view")
	@RequestMapping(value = "/view/{id}")
	public String view(@PathVariable String id, HttpServletRequest request) throws Exception {
		logger.entry("-------用户详情");
		PubUser pubUser = pubUserService.getUserByYhbh(id);
		request.setAttribute("pubUser", JsonUtil.toJsonNonNull(pubUser));
		request.setAttribute("pubUserBean", pubUser);
		return "pubUser/pubUser_view";
	}

	@RequestMapping(value = "/exportReportData")
	protected void exportReportData(HttpServletRequest request, HttpServletResponse response) {
		OutputStream fOut = null;
		try {
			logger.entry("-------导出Excel");
			String fileName = "fileName";
			response.setHeader("content-disposition", "attachment;filename=" + fileName + ".xls");
			List<PubUser> pubUsers = pubUserService.getAll();
			List<PubUserBo> pubUserBos = new ArrayList<PubUserBo>();
			for (PubUser pubUser : pubUsers) {
				PubUserBo pubUserBo = new PubUserBo();
				Mapper mapper = new DozerBeanMapper();
				mapper.map(pubUser, pubUserBo);
				pubUserBos.add(pubUserBo);
			}

			Map<String, String> basicHeadMap = new LinkedHashMap<String, String>();
			basicHeadMap.put("yhbh", "用户编号");
			basicHeadMap.put("yhzh", "用户账号");
			basicHeadMap.put("yhmc", "用户名称");
			basicHeadMap.put("pkiid", "PKIID");
			basicHeadMap.put("lxdh", "联系电话");
			basicHeadMap.put("ssdwmc", "所属单位名称");
			basicHeadMap.put("cjsj", "创建时间");

			String titleName = "titleName";
			Workbook wb = ExcelUtil.createBasicXlsExcel(titleName, basicHeadMap,
					ExcelUtil.createBasicData(pubUserBos, basicHeadMap));
			fOut = response.getOutputStream();
			wb.write(fOut);
			wb.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				fOut.flush();
				fOut.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	@RequestMapping(value = "/exportReportDataXlsx")
	protected void exportReportDataXlsx(HttpServletRequest request, HttpServletResponse response) {
		OutputStream fOut = null;
		try {
			logger.entry("-------导出Excel");
			String fileName = "fileName";
			response.setHeader("content-disposition", "attachment;filename=" + fileName + ".xlsx");
			List<PubUser> pubUsers = pubUserService.getAll();
			List<PubUserBo> pubUserBos = new ArrayList<PubUserBo>();
			for (PubUser pubUser : pubUsers) {
				PubUserBo pubUserBo = new PubUserBo();
				Mapper mapper = new DozerBeanMapper();
				mapper.map(pubUser, pubUserBo);
				pubUserBos.add(pubUserBo);
			}

			Map<String, String> basicHeadMap = new LinkedHashMap<String, String>();
			basicHeadMap.put("yhbh", "用户编号");
			basicHeadMap.put("yhzh", "用户账号");
			basicHeadMap.put("yhmc", "用户名称");
			basicHeadMap.put("pkiid", "PKIID");
			basicHeadMap.put("lxdh", "联系电话");
			basicHeadMap.put("ssdwmc", "所属单位名称");
			basicHeadMap.put("cjsj", "创建时间");

			String titleName = "titleName";
			Workbook wb = ExcelUtil.createBasicXlsxExcel(titleName, basicHeadMap,
					ExcelUtil.createBasicData(pubUserBos, basicHeadMap));
			fOut = response.getOutputStream();
			wb.write(fOut);
			wb.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				fOut.flush();
				fOut.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	@RequestMapping(value = "/exportReportData1")
	protected void exportReportData1(HttpServletRequest request, HttpServletResponse response) {
		OutputStream fOut = null;
		try {
			logger.entry("-------导出Excel");
			String fileName = "fileName1";
			response.setHeader("content-disposition", "attachment;filename=" + fileName + ".xlsx");
			List<PubUser> pubUsers = pubUserService.getAll();

			// 构建Workbook，样式都是基于Workbook
			Workbook wb = new XSSFWorkbook();
			// 构建CellStyle例子
			CellStyle headCellStyle = wb.createCellStyle();
			Font textFont = wb.createFont();
			textFont.setColor(IndexedColors.RED.getIndex());
			headCellStyle.setFont(textFont);
			Map<String, ExcelCellModel> headMap = new LinkedHashMap<String, ExcelCellModel>();
			headMap.put("yhbh", new ExcelCellModel("用户编号", headCellStyle, 20, null));
			headMap.put("yhzh", new ExcelCellModel("用户账号", null, 20, null));
			headMap.put("yhmc", new ExcelCellModel("用户名称", null, 20, null));
			headMap.put("pkiid", new ExcelCellModel("PKIID", null, 20, null));
			headMap.put("lxdh", new ExcelCellModel("联系电话", null, 20, null));
			headMap.put("ssdwmc", new ExcelCellModel("所属单位名称", null, 20, null));
			headMap.put("cjsj", new ExcelCellModel("创建时间", null, 20, new SimpleDateFormat(
					DateUtil.DATETIME_DEFAULT_FORMAT)));

			String sheetName = "sheetName";
			ExcelUtil.createExcel(wb, sheetName, headMap, ExcelUtil.createData(pubUsers, headMap));
			fOut = response.getOutputStream();
			wb.write(fOut);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				fOut.flush();
				fOut.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * powerIndex(跳转到用户权限查看页面)
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/powerIndex")
	public String index(HttpServletRequest request, String yyid) throws Exception {
		logger.entry("-------返回权限index页面");
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		PubUser pubUser = (PubUser) request.getAttribute(CommonWebConstans.CURRENT_USER);
		map.put("yhbh", pubUser.getYhbh());
		if(yyid != null){
			map.put("yyid", yyid);
		}
		List<PubApp> pubAppList = pubAppService.getAppJoinAuthGroupList(map);
		request.setAttribute("pubAppList", pubAppList);
		
		return "/pubPower/pubPower_index";
	}

	/**
	 * getPowerData(获取用户权限分页数据)
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getPowerData")
	@ResponseBody
	public String getPowerData(HttpServletRequest request) throws Exception {
		logger.entry("-------获取用户权限分页数据生成json格式传回");
		Map<String, Object> map = WebUtils.getParametersStartingWith(request, null);
		PageInfo<PubUserBo> pageInfo = pubUserService.getUserAndRolePageInfo(map);
		PageResult<PubUserBo> recordBeanPageResult = new PageResult<PubUserBo>(pageInfo.getList(),
				(int) pageInfo.getTotal());
		return JsonUtil.toJsonNonNull(recordBeanPageResult);
	}

	/**
	 * powerAuth(授权)
	 * 
	 * @param request
	 * @param id
	 * @param yyid
	 * @return
	 * @throws Exception
	 */
	@RequiresPermissions("sys:pubUser:auth")
	@RequestMapping(value = "/powerAuth")
	public String powerAuth(HttpServletRequest request, String id, String yyid) throws Exception {
		logger.entry("-------授权");

		// 根据当前登陆用户查询应用ID
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		
		request.setAttribute("yyid",JsonUtil.toJsonNonNull(yyid));
		
		PubUser pubUser = (PubUser) request.getAttribute(CommonWebConstans.CURRENT_USER);
		map.put("yhbh", pubUser.getYhbh());
		List<PubApp> pubAppList = pubAppService.getAppJoinAuthGroupList(map);
		request.setAttribute("pubAppList", pubAppList);

		// 根据登陆用户的应用获取对应角色ID
		Map<String, Object> authMap = new ConcurrentHashMap<String, Object>();
		authMap.put("yhbh", id);
		List<PubAuth> authList = pubAuthService.getAuthList(authMap);
		//Set<Long> jsid = new LinkedHashSet<Long>();
		Set<String> jsid = new LinkedHashSet<String>();
		if (null != pubAppList && pubAppList.size() > 0 && null != authList && authList.size() > 0) {
			for (PubAuth pubAuth : authList) {
				for (PubApp pubApp : pubAppList) {
					if (pubAuth.getYyid().equals(pubApp.getYyid())) {
						jsid.add(pubAuth.getJsid());
						break;
					}
				}
			}
		}
		request.setAttribute("jsid", JsonUtil.toJsonNonNull(jsid));
		request.setAttribute("yhbh", id);		
		return "/pubPower/pubPower_role";
	}
	
	
	/**
	 * 
	 * orization 角色赋权跳转
	 * 
	 * @param id 角色ID
	 * @param request
	 * @return
	 * @throws Exception String
	 */
	@RequiresPermissions("sys:pubRole:orization")
	@RequestMapping(value = "/powerOrization")
	public String orization(String id, String yyid, HttpServletRequest request) throws Exception {
		logger.entry("-------角色赋权跳转");
		// 根据当前登陆用户查询应用ID
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		
		PubUser pubUser = (PubUser) request.getAttribute(CommonWebConstans.CURRENT_USER);
		map.put("yhbh", pubUser.getYhbh());
		List<PubApp> pubAppList = pubAppService.getAppJoinAuthGroupList(map);
		request.setAttribute("pubAppList", pubAppList);

		// 根据登陆用户的应用获取对应角色ID
		Map<String, Object> authMap = new ConcurrentHashMap<String, Object>();
		authMap.put("yhbh", id);
		authMap.put("yyid", yyid);
		List<PubAuth> authList = pubAuthService.getAuthList(authMap);
		Set<String> jsid = new LinkedHashSet<String>();
		if (null != pubAppList && pubAppList.size() > 0 && null != authList && authList.size() > 0) {
			for (PubAuth pubAuth : authList) {
				for (PubApp pubApp : pubAppList) {
					if (pubAuth.getYyid().equals(pubApp.getYyid())) {
						jsid.add(pubAuth.getJsid());
						break;
					}
				}
			}
		}
		
		// 根据角色ID 集合 获取资源ID 集合
	//	String zyids = pubRoleService.getZyidByJsids(jsid);	
	//	zyids = zyids.substring(1);
		PubRole pubRole = new PubRole();
	//	pubRole.setZyids(zyids);
		pubRole.setYyid(yyid);	
		request.setAttribute("pubRole", JsonUtil.toJsonNonNull(pubRole));
		
		return "pubPower/pubPower_orization";
	}
	

}