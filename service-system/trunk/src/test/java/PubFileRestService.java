/** 
 * Project Name:service-system 
 * File Name:PubFileRestService.java 
 * Package Name: 
 * Date:2017年1月24日 上午9:16:44 
 * Copyright (c) 2017, 航天长峰湖南分公司  All Rights Reserved. 
 * 
 */
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.Charset;

import org.apache.http.Consts;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.mime.HttpMultipartMode;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.junit.Test;


/** 
 * 文件上传下载
 * ClassName: PubFileRestService<br/>
 * Function: 测试pubFile Rest service. <br/>
 * date: 2017年1月24日 上午9:16:44<br/>
 * 
 * @author lizhuo 
 */
public class PubFileRestService {

	@Test
	public void t01TestUploadFile() throws Exception {
		httpPost("http://localhost:8888/service-system/pubFile/uploadFile", "", true);
	}
	
	public void httpPost(String url,String param, boolean noNeedResponse) throws FileNotFoundException{
        //post请求返回结果
		CloseableHttpClient httpClient = HttpClients.createDefault();
		File file = new File ("D:\\work\\doc\\ht以前文档\\【技术服务方案-第二分册】项目实施方案V1.5.docx");
		InputStream in = new FileInputStream(file);
        String result = "";
        try {
            String fileName = "【技术服务方案-第二分册】项目实施方案V1.5.docx";
            HttpPost httpPost = new HttpPost(url);
            MultipartEntityBuilder builder = MultipartEntityBuilder.create();
            //中文乱码问题 http://blog.csdn.net/x931100537/article/details/39295221
            builder.addBinaryBody("file", in, ContentType.create("multipart/form-data", Consts.UTF_8), fileName);// 文件流
            builder.setCharset(Charset.forName("UTF-8"));
            builder.setMode(HttpMultipartMode.BROWSER_COMPATIBLE);  
            //builder.addTextBody("filename", fileName);// 类似浏览器表单提交，对应input的name和value
            HttpEntity entity = builder.build();
            httpPost.setEntity(entity);
            HttpResponse response = httpClient.execute(httpPost);// 执行提交
            HttpEntity responseEntity = response.getEntity();
            if (responseEntity != null) {
                // 将响应内容转换为字符串
                result = EntityUtils.toString(responseEntity, Charset.forName("UTF-8"));
            }
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                httpClient.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        System.out.println(result);
    }
}
