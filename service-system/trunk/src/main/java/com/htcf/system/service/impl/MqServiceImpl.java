package com.htcf.system.service.impl;

import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//@Service("mqServiceImpl")
public class MqServiceImpl {  
	
	@Autowired
    private RabbitTemplate rabbitTemplate;
  
    public void sendMessage(Integer j) throws InterruptedException {  
        String message = "Hello World wubin " + "#" + j;  
        //Exchange的名称为"hello.topic"，routingkey的名称为"hello.world.q123ueue"  
        for (int i = 0; i < 1; i++) {
        	Thread.sleep(1000);
        	rabbitTemplate.convertAndSend("", "hello1",  
                    message);  
            System.out.println("发送第" + i + "个消息成功！内容为：" + message); 
        }
        
  
//      String messages = "Hello World direct " + "#" + i;  
//      rabbitTemplate.convertAndSend("hello.direct", "hello.world.queue",  
//              messages);  
//      System.out.println("发送第" + i + "个消息成功！内容为：" + messages);  
    }
  
}