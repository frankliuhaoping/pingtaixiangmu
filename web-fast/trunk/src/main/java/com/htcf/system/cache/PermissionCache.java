package com.htcf.system.cache;

import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Repository;

import com.htcf.frame.core.cache.BaseCache;

/**
 * ClassName: PermissionCache <br/>
 * Function: key = yyid + "_" + pubUser.getYhbh() date: 2017年1月5日 上午11:18:41 <br/>
 * 
 * @author chenshizhe
 */
@Repository
public class PermissionCache extends BaseCache<Set<String>> {

	/**
	 * 删除已yyid开头的一批缓存对象，在修改了权限的时候会被调用
	 * 
	 * @param yyid void
	 */
	public void removeByYyid(long yyid) {

		List<?> keys = ehCache.getKeys();
		for (Object key : keys) {
			if (key.toString().startsWith(yyid + "_")) {
				remove(key);
			}
		}
	}
}
