package com.htcf.system.init;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.csource.fastdfs.ClientGlobal;
import org.csource.fastdfs.StorageClient1;
import org.csource.fastdfs.StorageServer;
import org.csource.fastdfs.TrackerClient;
import org.csource.fastdfs.TrackerServer;
import org.dozer.DozerBeanMapper;
import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.htcf.frame.base.model.FastDFSClient;
import com.htcf.frame.bo.TaskBo;
import com.htcf.frame.service.ScheduleService;
import com.htcf.system.model.po.PubSchedule;
import com.htcf.system.service.PubScheduleService;
import com.htcf.system.service.impl.PubJqxzServiceImpl;
import com.htcf.system.service.impl.PubZzjgServiceImpl;

@Service
public class StartServer {
	/** The Constant logger. */
	private static final Logger logger = LogManager.getLogger(StartServer.class);
	
	private static final String CONF_FILENAME = Thread.currentThread().getContextClassLoader().getResource("").getPath() + "fastdfs/fdfs_client.conf";

	@Autowired
	private PubScheduleService pubScheduleService;
	
	@Autowired
	private ScheduleService scheduleService;
	
	@Autowired
	private PubJqxzServiceImpl pubJqxzServiceImpl;
	
	@Autowired
	private PubZzjgServiceImpl  pubZzjgServiceImpl;
	/**
	 * 启动fastdfs客户端
	 * 
	 * @throws Exception
	 */
	@PostConstruct
	private void startFastDFSClient() throws Exception {
		logger.entry("-------FastDFSClient启动");
		try {
			logger.info("=== CONF_FILENAME:" + CONF_FILENAME);
			ClientGlobal.init(CONF_FILENAME);
			TrackerClient trackerClient = new TrackerClient(ClientGlobal.g_tracker_group);
			TrackerServer trackerServer = trackerClient.getConnection();
			if (trackerServer == null) {
				logger.error("getConnection return null");
			}
			StorageServer storageServer = trackerClient.getStoreStorage(trackerServer);
			if (storageServer == null) {
				logger.error("getStoreStorage return null");
			}
			FastDFSClient fastDFSClient = new FastDFSClient();
			fastDFSClient.setStorageClient(new StorageClient1(trackerServer, storageServer));
		} catch (Exception e) {
			logger.error(e);
		}
		logger.info("-------FastDFSClient启动成功");
	}
	
	/**
	 * 加载定时任务
	 * 
	 * @throws Exception void
	 */
	@PostConstruct
	public void startSchehle() throws Exception {
		logger.entry("-------加载定时任务");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("fwdm", ServiceSystemConstants.SERVICE_CODE);
		map.put("sybz", "Y");
		List<PubSchedule> list = pubScheduleService.getPubScheduleList(map);
		
		for (PubSchedule pubSchedule : list) {
			TaskBo taskBo = new TaskBo();
			
			//对象拷贝
			Mapper mapper = new DozerBeanMapper();
			mapper.map(pubSchedule, taskBo);
			
			scheduleService.addSchedule(taskBo);
		}
	}
	
	/**
	 * startPubjqxzInit
	 * TODO(启动时加载警情性质树的缓存)
	 * 
	 * @throws Exception  抛出可能发生的异常
	 */
	@PostConstruct
	public void startPubjqxzInit()throws Exception {
		logger.entry("-----警情性质树缓存启动");
		new Thread(new Runnable() {
			@Override
			public void run() {
				pubJqxzServiceImpl.init();
			}
		}).start();
	}
	
	
	/**
	 * startPubZzjgInit
	 * TODO(启动时加载组织机构树的缓存
	 *   创建一个异步线程，有空闲时间就执行，不必等待执行完毕在进行下一步。)
	 * 
	 * @throws Exception  抛出可能发生的异常
	 */
	@PostConstruct
	public void startPubZzjgInit()throws Exception {
		logger.entry("组织机构树缓存初始化启动");
		new Thread(new Runnable() {
			@Override
			public void run() {
				pubZzjgServiceImpl.init();
			}
		}).start();
	}

}
