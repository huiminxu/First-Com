package net.yozo.web.util;

import net.yozo.services.common.Result;
import net.sf.json.JSONObject;
import org.apache.commons.io.IOUtils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;


public class UploadUtils {
	protected Logger logger = LoggerFactory.getLogger(getClass());

	static int connIdx = 0;

	public static Result uploadFile(MultipartFile multiFile , String fdir, String sdir, String tdir){
		StringBuffer filepath = new StringBuffer();

		filepath.append("http://localhost:8080/storeService/manage/store/");
		//connIdx = 0;
		OutputStream writer = null;
		BufferedReader reader =null;
		URL url = null;
        StringBuilder sb = new StringBuilder("");
        StringBuilder realpath = new StringBuilder();
        HttpURLConnection connection = null;
        String originalFilename = multiFile.getOriginalFilename();
       // String postfix = originalFilename.substring(originalFilename.lastIndexOf('.')+1);
       
        realpath.append(filepath).append(fdir).append("/").append(sdir).append("/").append(tdir).append("/").append(originalFilename);
        try{
			url = new URL(realpath.toString());
			
			connection = (HttpURLConnection)url.openConnection();
			connection.setDoOutput(true);
	        connection.setDoInput(true);	        
			connection.setRequestMethod("POST");			
	        connection.setConnectTimeout(3000);
	        connection.setReadTimeout(3000);
	        connection.setUseCaches(false);
	        connection.setInstanceFollowRedirects(true);
	        connection.setRequestProperty("Content-Type",
	                "application/octet-stream");
			connection.connect();
			writer = connection.getOutputStream();
			IOUtils.copy(multiFile.getInputStream(), writer);		
	        //POST请求                      		 			  
			writer.flush();	
			writer.close();
			if (connection.getResponseCode() == HttpServletResponse.SC_OK) {
			  	//读取响应          	
				reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
				String lines;
			    while ((lines = reader.readLine()) != null) {
			        lines = new String(lines.getBytes(), "utf-8");
			        sb.append(lines);
			    }
			    reader.close();
			    JSONObject myjson = JSONObject.fromObject(sb.toString());
			    if(myjson.getInt("sta") == Result.SUCCESS){
					String urlStr = ((JSONObject)myjson.get("data")).getString("url");
					// 断开连接
					Map<String, String> data = new HashMap<String, String>();
					data.put("url",  urlStr);
					Result result = new Result(Result.SUCCESS, "成功", data);
		            return result;
		         }else{
		          	return Result.errorResult();
		         }	            
			}else{
				return Result.errorResult();
			}
	    }catch(MalformedURLException e){
	    	Result r = Result.errorResult();
	    	r.setMsg("MalformedURLException");
	    	e.printStackTrace();
			return r;
        }catch(ProtocolException e){
        	Result r = Result.errorResult();
	    	r.setMsg("ProtocolException");
			e.printStackTrace();
			return r;
		}catch(IOException e) {

			e.printStackTrace();
			connIdx++;
			if(connIdx < 3){
				return uploadFile(multiFile,fdir,sdir,tdir);
			}else{
				connIdx = 0;
				Result r = Result.errorResult();
		    	r.setMsg("IOException");
				return Result.errorResult();
			}				
		}
	}
}
