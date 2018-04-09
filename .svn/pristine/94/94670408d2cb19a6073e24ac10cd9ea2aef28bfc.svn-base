package com.htcf.system.service.impl;

import org.springframework.amqp.core.Message;
import org.springframework.amqp.core.MessageProperties;
import org.springframework.amqp.rabbit.core.ChannelAwareMessageListener;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.amqp.rabbit.support.CorrelationData;
import org.springframework.beans.factory.annotation.Autowired;

import com.rabbitmq.client.Channel;

public class RpcService implements ChannelAwareMessageListener  {
	@Autowired
    private RabbitTemplate rabbitTemplate;
	
	@Override
	public void onMessage(Message message, Channel channel) throws Exception {
		System.out.println(message);
		// TODO Auto-generated method stub
		
		String replyTo = message.getMessageProperties().getReplyTo();
		String correlation = new String(message.getMessageProperties().getCorrelationId(), "UTF-8");
		CorrelationData data = new CorrelationData(correlation);

		MessageProperties mp = new MessageProperties();
		mp.setCorrelationId(message.getMessageProperties().getCorrelationId());
		mp.setCorrelationIdString(correlation);
		//mp.setHeader(key, value);
		
		
		String responseJson = "xxxxxx";
		
		Message backMsg = new Message(responseJson.getBytes("UTF-8"), mp);
        
		rabbitTemplate.convertAndSend("", replyTo, backMsg,data);		
	}
	
}
