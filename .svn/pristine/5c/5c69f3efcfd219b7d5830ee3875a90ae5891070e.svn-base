package com.htcf.system.service.impl;

import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.core.ChannelAwareMessageListener;

import com.rabbitmq.client.Channel;

public class MessageConsumer implements ChannelAwareMessageListener  {

	
	@Override
	public void onMessage(Message message, Channel channel) throws Exception {
		System.out.println(message);
		// TODO Auto-generated method stub
	}

}