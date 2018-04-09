///** 
// * Project Name:web-system 
// * File Name:MySqlSessionValidationScheduler.java 
// * Package Name:com.htcf.system.web.session 
// * Date:2016-12-813:53:55 
// * Copyright (c) 2016, 航天长峰湖南分公司  All Rights Reserved. 
// * 
// */
//package com.htcf.system.web.session;
//
//import java.util.concurrent.Executors;
//import java.util.concurrent.ScheduledExecutorService;
//import java.util.concurrent.ThreadFactory;
//import java.util.concurrent.TimeUnit;
//
//import org.apache.shiro.session.mgt.DefaultSessionManager;
//import org.apache.shiro.session.mgt.SessionValidationScheduler;
//import org.apache.shiro.session.mgt.ValidatingSessionManager;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//
///**
// * The Class MySqlSessionValidationScheduler.
// */
//public class MySqlSessionValidationScheduler implements SessionValidationScheduler, Runnable {
//
//	/** The user service. */
//	
//    /** Private internal log instance. */
//    private static final Logger log = LoggerFactory.getLogger(MySqlSessionValidationScheduler.class);
//
//    /** The session manager. */
//    ValidatingSessionManager sessionManager;
//    
//    /** The service. */
//    private ScheduledExecutorService service;
//    
//    /** The interval. */
//    private long interval = DefaultSessionManager.DEFAULT_SESSION_VALIDATION_INTERVAL;
//    
//    /** The enabled. */
//    private boolean enabled = false;
//
//    /**
//     * Instantiates a new my sql session validation scheduler.
//     */
//    public MySqlSessionValidationScheduler() {
//        super();
//    }
//
//    /**
//     * Gets the session manager.
//     *
//     * @return the session manager
//     */
//    public ValidatingSessionManager getSessionManager() {
//        return sessionManager;
//    }
//
//    /**
//     * Sets the session manager.
//     *
//     * @param sessionManager the new session manager
//     */
//    public void setSessionManager(ValidatingSessionManager sessionManager) {
//        this.sessionManager = sessionManager;
//    }
//
//    /**
//     * Gets the interval.
//     *
//     * @return the interval
//     */
//    public long getInterval() {
//        return interval;
//    }
//
//    /**
//     * Sets the interval.
//     *
//     * @param interval the new interval
//     */
//    public void setInterval(long interval) {
//        this.interval = interval;
//    }
//
//    /**
//     * TODO(这里用一句话描述这个方法的作用).
//     *
//     * @return true, if is enabled
//     * @see org.apache.shiro.session.mgt.SessionValidationScheduler#isEnabled()
//     */
//    public boolean isEnabled() {
//        return this.enabled;
//    }
//
//    /**
//     * Creates a single thread {@link java.util.concurrent.ScheduledExecutorService} to validate sessions at fixed intervals
//     * and enables this scheduler. The executor is created as a daemon thread to allow JVM to shut down
//     */
//    //TODO Implement an integration test to test for jvm exit as part of the standalone example
//    // (so we don't have to change the unit test execution model for the core module)
//    public void enableSessionValidation() {
//        if (this.interval > 0l) {
//            this.service = Executors.newSingleThreadScheduledExecutor(new ThreadFactory() {
//                public Thread newThread(Runnable r) {
//                    Thread thread = new Thread(r);
//                    thread.setDaemon(true);
//                    return thread;
//                }
//            });
//            this.service.scheduleAtFixedRate(this, interval, interval, TimeUnit.MILLISECONDS);
//            this.enabled = true;
//        }
//    }
//
//    /**
//     * TODO(这里用一句话描述这个方法的作用).
//     *
//     * @see java.lang.Runnable#run()
//     */
//    public void run() {
//        if (log.isDebugEnabled()) {
//            log.debug("Executing session validation...");
//        }
//        long startTime = System.currentTimeMillis();
//
//        //分页获取会话并验证
//        /*Map<String, Object> map = userService.getSession();
//        while(map.size() > 0) {
//            for(Map.Entry<String, Object> entry: map.entrySet()) {
//                try {
//                	if (entry.getValue() != null) {
//                		Session session = SerializableUtils.deserialize(entry.getValue().toString());
//                        Method validateMethod = ReflectionUtils.findMethod(AbstractValidatingSessionManager.class, "validate", Session.class, SessionKey.class);
//                        validateMethod.setAccessible(true);
//                        ReflectionUtils.invokeMethod(validateMethod, sessionManager, session, new DefaultSessionKey(session.getId()));
//                	}
//                } catch (Exception e) {
//                    //ignore
//                }
//            }
//            map = userService.getSession();
//        }*/
//
//        long stopTime = System.currentTimeMillis();
//        if (log.isDebugEnabled()) {
//            log.debug("Session validation completed successfully in " + (stopTime - startTime) + " milliseconds.");
//        }
//    }
//
//    /**
//     * TODO(这里用一句话描述这个方法的作用).
//     *
//     * @see org.apache.shiro.session.mgt.SessionValidationScheduler#disableSessionValidation()
//     */
//    public void disableSessionValidation() {
//        this.service.shutdownNow();
//        this.enabled = false;
//    }
//}
