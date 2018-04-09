package com.htcf.system.web.websocket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

@Component
@EnableWebSocket
public class WebSocketConfig extends WebMvcConfigurerAdapter implements WebSocketConfigurer {

	@Autowired
	private HtcfWebSocketHandler websocket;

	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(websocket, "/websocket").addInterceptors(new HandShake()).setAllowedOrigins("*");

		registry.addHandler(websocket, "/websocket/sockjs").addInterceptors(new HandShake()).setAllowedOrigins("*").withSockJS();
	}
	
	

}
