/** 
 * Project Name:web-system 
 * File Name:PubGpssbxxController.java 
 * Package Name:com.htcf.system.web.controller 
 * Date:2017年6月5日 下午2:05:13 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
package com.htcf.system.web.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.github.pagehelper.PageInfo;
import com.htcf.frame.base.util.DateUtil;
import com.htcf.frame.base.util.JsonUtil;
import com.htcf.frame.web.init.CommonWebConstans;
import com.htcf.frame.web.model.vo.ActionResult;
import com.htcf.frame.web.model.vo.PageResult;
import com.htcf.system.model.po.PubGpssbxx;
import com.htcf.system.model.po.PubUser;
import com.htcf.system.service.PubGpssbxxService;

/**
 * ClassName: PubGpssbxxController<br/>
 * Function: gbs设备信息控制类 <br/>
 * date: 2017年6月5日 下午2:05:13
 * 
 * @author yiqiang
 */
@Controller
@RequestMapping("/pubGpssbxx")
public class PubGpssbxxController {

	private static final Logger logger = LogManager.getLogger(PubGpssbxxController.class);

	@Autowired
	private PubGpssbxxService pubGpssbxxService;

	@RequestMapping("/index")
	public String index() {
		return "/pubGpssbxx/pubGpssbxx_index";
	}

	/**
	 * 
	 * 获取分页数据并生成json格式返回
	 * 
	 * @param request
	 * @return
	 * @throws Exception String
	 */
	@RequestMapping(value = "/getDataByPage")
	@ResponseBody
	public String getDataByPage(HttpServletRequest request) throws Exception {
		logger.entry("-------获取分页数据生成json格式传回");
		Map<String, Object> map = WebUtils.getParametersStartingWith(request, null);
		PageInfo<PubGpssbxx> pageInfo = pubGpssbxxService.getListPage(map);
		PageResult<PubGpssbxx> recordBeanPageResult = new PageResult<PubGpssbxx>(pageInfo.getList(),
				(int) pageInfo.getTotal());
		return JsonUtil.toJsonNonNull(recordBeanPageResult);
	}

	/**
	 * 
	 * 新增设备信息
	 * 
	 * @return String
	 */
	@RequiresPermissions("sys:pubGpssbxx:add")
	@RequestMapping("/add")
	public String add() {
		logger.entry("-------新增设备信息");
		return "/pubGpssbxx/pubGpssbxx__add";
	}

	/**
	 * 
	 * 保存新增设备信息
	 * 
	 * @param pubJqxzdm
	 * @param request
	 * @return
	 * @throws Exception String
	 */
	@RequestMapping(value = "/saveAdd")
	@ResponseBody
	public String saveAdd(PubGpssbxx pubGpssbxx, HttpServletRequest request) throws Exception {
		logger.entry("-------保存新增设备信息");
		ActionResult ar = ActionResult.success().build();
		PubUser pubUser = (PubUser) request.getAttribute(CommonWebConstans.CURRENT_USER);
		pubGpssbxx.setCjr(pubUser.getYhmc());
		pubGpssbxx.setCjsj(new Date(System.currentTimeMillis()));
		pubGpssbxx.setGxsj(new Date(System.currentTimeMillis()));
		pubGpssbxxService.addPubGpssbxx(pubGpssbxx);
		return JsonUtil.toJsonNonNull(ar);
	}

	/**
	 * 查看设备具体信息
	 * 
	 * @param id 日志id
	 * @param request
	 * @return String
	 * @throws Exception
	 */
	// @RequiresPermissions("sys:pubGpssbxx:view")
	@RequestMapping(value = "/view/{sbbh}")
	public ModelAndView view(@PathVariable String sbbh) throws Exception {
		logger.entry("-------查看设备具体信息");
		PubGpssbxx pubGpssbxx = pubGpssbxxService.getPubGpssbxxBySbbh(sbbh);
		ModelAndView mav = new ModelAndView("pubGpssbxx/pubGpssbxx_view");
		mav.addObject("pubGpssbxx", JsonUtil.toJsonNonNull(pubGpssbxx));
		return mav;
	}

	/**
	 * 
	 * 修改设备信息
	 * 
	 * @param sbbh
	 * @param request
	 * @return
	 * @throws Exception String
	 */
	// @RequiresPermissions("sys:pubGpssbxx:edit")
	@RequestMapping(value = "/edit/{sbbh}")
	public ModelAndView edit(@PathVariable String sbbh) throws Exception {
		logger.entry("-------修改设备信息");
		PubGpssbxx gpssbxx = pubGpssbxxService.getPubGpssbxxBySbbh(sbbh);
		ModelAndView mav = new ModelAndView("pubGpssbxx/pubGpssbxx_edit");
		mav.addObject("pubGpssbxx", JsonUtil.toJsonNonNull(gpssbxx));
		return mav;
	}

	/**
	 * 更新gps设备信息
	 * 
	 * @param pubXtzd
	 * @param request
	 * @return
	 * @throws Exception String
	 */
	@RequestMapping(value = "/saveEdit")
	@ResponseBody
	public String saveEdit(PubGpssbxx pubGpssbxx, HttpServletRequest request) throws Exception {
		logger.entry("-------更新gps设备信息");
		ActionResult ar = ActionResult.success().build();
		if (StringUtils.isNotEmpty(request.getParameter("sbztgxsjs"))) {
			pubGpssbxx.setSbztgxsj(DateUtil.getDateFormat(request.getParameter("sbztgxsjs")));
		}
		if (StringUtils.isNotEmpty(request.getParameter("szthzgxsjs"))) {
			pubGpssbxx.setSzthzgxsj(DateUtil.getDateFormat(request.getParameter("szthzgxsjs")));
		}
		if (StringUtils.isNotEmpty(request.getParameter("gzztgxsjs"))) {
			pubGpssbxx.setGzztgxsj(DateUtil.getDateFormat(request.getParameter("gzztgxsjs")));
		}
		if (StringUtils.isNotEmpty(request.getParameter("gzztgxsjs"))) {
			pubGpssbxx.setGzztgxsj(DateUtil.getDateFormat(request.getParameter("gzztgxsjs")));
		}
		// 更新时间
		pubGpssbxx.setGxsj(new Date(System.currentTimeMillis()));
		// 获取到更新人的姓名
		PubUser pubUser = (PubUser) request.getAttribute(CommonWebConstans.CURRENT_USER);
		if (pubUser != null) {
			pubGpssbxx.setGxr(pubUser.getYhmc());
		}
		pubGpssbxxService.updatePubGpssbxx(pubGpssbxx);
		return JsonUtil.toJsonNonNull(ar);
	}

	/**
	 * 删除设备信息.
	 *
	 * @param id the id
	 * @return String
	 * @throws Exception the exception
	 */
	@RequiresPermissions("sys:pubGpssbxx:delete")
	@RequestMapping(value = "/delete/{sbbh}")
	@ResponseBody
	public String delete(@PathVariable String sbbh, HttpServletRequest request) throws Exception {
		logger.entry("-------删除设备信息");
		ActionResult ar = ActionResult.success().build();
		pubGpssbxxService.deleltePubGpssbxx(sbbh);
		return JsonUtil.toJsonNonNull(ar);
	}

	/**
	 * 批量删除设备信息.
	 *
	 * @param request the request
	 * @return String
	 * @throws Exception
	 */
	@RequiresPermissions("sys:pubGpssbxx:delete")
	@RequestMapping("/deleteBatch")
	@ResponseBody
	public String deleteBatch(HttpServletRequest request) throws Exception {
		logger.entry("-------批量删除设备信息");
		ActionResult ar = ActionResult.success().build();
		String[] sbbhs = request.getParameterValues("id[]");
		if (null != sbbhs && sbbhs.length > 0) {
			pubGpssbxxService.deleltePubGpssbxx(sbbhs);
		}
		return JsonUtil.toJsonNonNull(ar);
	}

	/**
	 * 上传文件导入设备信息
	 * 
	 * @param file
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/importView")
	public String importView() throws Exception {
		return "/pubGpssbxx/pubGpssbxx__import";
	}

	@RequestMapping(value = "/upload")
	@ResponseBody
	public String upload(HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.entry("-------上传文件");
		ActionResult ar = ActionResult.success().build();
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		// 设置上传文件的头为UTF-8，用于处理中文乱码
		upload.setHeaderEncoding("UTF-8");
		// 生成FileItem列表
		List<FileItem> items = (List<FileItem>) upload.parseRequest(request);
		FileItem item = items.get(0);
		InputStream input = item.getInputStream();
		List<PubGpssbxx> list = readExcel(input);
		if (list != null) {
			PubUser pubUser = (PubUser) request.getAttribute(CommonWebConstans.CURRENT_USER);
			for (PubGpssbxx sbxx : list) {
				sbxx.setCjr(pubUser.getYhmc());
				pubGpssbxxService.addPubGpssbxx(sbxx);
			}
		}
		return JsonUtil.toJsonNonNull(ar);
	}

	public List<PubGpssbxx> readExcel(InputStream is) throws Exception {
		POIFSFileSystem fs = new POIFSFileSystem(is);
		HSSFWorkbook wb = new HSSFWorkbook(fs);
		HSSFSheet sheet = wb.getSheetAt(0);
		int rowNum = sheet.getLastRowNum();// 行数
		HSSFRow row = sheet.getRow(0);
		int colNum = row.getPhysicalNumberOfCells();// 列数
		List<PubGpssbxx> list = new ArrayList<PubGpssbxx>();
		// 正文内容应该从第二行开始,第一行为表头的标题
		for (int k = 1; k < rowNum; k++) {// 行
			row = sheet.getRow(k);
			for (int i = 0; i < colNum; i++) {// 列
				PubGpssbxx gpssbxx = new PubGpssbxx();
				String sbbh = row.getCell(i).getStringCellValue().trim();// 设备编号
				gpssbxx.setSbbh(sbbh);
				String sbmc = row.getCell(i++).getStringCellValue().trim();// 设备名称
				gpssbxx.setSbmc(sbmc);
				String zzjgdm = row.getCell(i++).getStringCellValue().trim();// 组织机构名称
				gpssbxx.setZzjgdm(zzjgdm);
				String zzjgmc = row.getCell(i++).getStringCellValue().trim();// 组织机构代码
				gpssbxx.setZzjgmc(zzjgmc);
				String sblx = row.getCell(i++).getStringCellValue().trim();// 设备类型
				gpssbxx.setSblx(sblx);
				String lxdh = row.getCell(i++).getStringCellValue().trim();// 联系人电话
				gpssbxx.setLxdh(lxdh);
				String bdrybh = row.getCell(i++).getStringCellValue().trim();// 绑定人员编号
				gpssbxx.setBdrybh(bdrybh);
				String bdrymc = row.getCell(i++).getStringCellValue().trim();// 绑定人员名称
				gpssbxx.setBdrymc(bdrymc);
				gpssbxx.setCjsj(new Date(System.currentTimeMillis()));
				gpssbxx.setGxsj(new Date(System.currentTimeMillis()));
				list.add(gpssbxx);
			}
		}
		return list;
	}

}
