package com.htcf.system.init;

import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.LinkedHashSet;

import com.dangdang.ddframe.rdb.sharding.api.ShardingValue;
import com.dangdang.ddframe.rdb.sharding.api.strategy.table.SingleKeyTableShardingAlgorithm;

public class TableShardingAlgorithm implements SingleKeyTableShardingAlgorithm<Integer>{

	@Override
	public String doEqualSharding(Collection<String> availableTargetNames, ShardingValue<Integer> shardingValue) {
		Date  date=new Date();
		SimpleDateFormat formatter=new SimpleDateFormat ("yyyyMMddHHmmss"); 
		String endWith=formatter.format(date).substring(2, 5);
				for(String table:availableTargetNames){
					if(table.endsWith(endWith)){
						return table;
					}
				}
		return null;
	}

	@Override
	public Collection<String> doInSharding(Collection<String> availableTargetNames,
			ShardingValue<Integer> shardingValue) {
		 Collection<String> result = new LinkedHashSet<String>(availableTargetNames.size());
		 Date  date=new Date();
			SimpleDateFormat formatter=new SimpleDateFormat ("yyyyMMddHHmmss"); 
			String endWith=formatter.format(date).substring(2, 5);
					for(String table:availableTargetNames){
						if(table.endsWith(endWith)){
							result.add(table);
						}
					}
					return result;
	}

	@Override
	public Collection<String> doBetweenSharding(Collection<String> availableTargetNames,
			ShardingValue<Integer> shardingValue) {
		 Collection<String> result = new LinkedHashSet<String>(availableTargetNames.size());
		 Date  date=new Date();
			SimpleDateFormat formatter=new SimpleDateFormat ("yyyyMMddHHmmss"); 
			String endWith=formatter.format(date).substring(2, 5);
					for(String table:availableTargetNames){
						if(table.endsWith(endWith)){
							result.add(table);
						}
					}
					return result;
	}

}
