package net.yozo.web.util;

import net.yozo.services.common.Result;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ControlUtils {

	public static JSONObject ResultToJson(Result result) {
		JSONObject jsonObject = new JSONObject();
		if (result.getCode() == Result.SUCCESS) {
			jsonObject.accumulate("sta", FinalConstant.STA_SUCCESS);
			jsonObject.accumulate("msg", FinalConstant.MSG_SUCCESS);
			jsonObject.accumulate("data", result.getObj());
		} else {
			jsonObject.accumulate("sta", FinalConstant.STA_FAIL);
			jsonObject.accumulate("msg", FinalConstant.MSG_FAIL);
		}
		return jsonObject;
	}
	
	public static JSONObject JsonToResult(JSONObject json) {
		JSONObject jsonObject = new JSONObject();
		try {
			jsonObject.accumulate("sta", FinalConstant.STA_SUCCESS);
			jsonObject.accumulate("msg", FinalConstant.MSG_SUCCESS);
			jsonObject.accumulate("data", json.toString());
		} catch (Exception e) {
			jsonObject.accumulate("sta", FinalConstant.STA_FAIL);
			jsonObject.accumulate("msg", FinalConstant.MSG_FAIL);
		}
		return jsonObject;
	}
	
	
/*	public static void generateErrorJson(Exception e,org.json.JSONObject jsonObject) {
		jsonObject.accumulate("sta", 0);
		jsonObject.accumulate("msg",e.getMessage());
		logger.error(e.getMessage(),e);
	}*/
	
	public static void generateErrorJson(Exception e,JSONObject jsonObject) {
		jsonObject.accumulate("sta", 0);
		jsonObject.accumulate("msg", "fail reason:"+e.getMessage());
	}
	
	
	
	public static JSONObject generateErrorJson(Exception e) {
		JSONObject jsonObject = new JSONObject();
		e.printStackTrace();
		jsonObject.accumulate("sta", 0);
		jsonObject.accumulate("msg", e.getMessage());
		return jsonObject;
	}
	
	public static JSONObject generateErrorJsonNo(Exception e) {
		JSONObject jsonObject = new JSONObject();
		jsonObject.accumulate("sta", 0);
		jsonObject.accumulate("msg", e.getMessage());
		return jsonObject;
	}
	
	 public static Map<String, Object> parseJSON2Map(String jsonStr){  
	        Map<String, Object> map = new HashMap<String, Object>();  
	        //最外层解析  
	        JSONObject json = JSONObject.fromObject(jsonStr);  
	        for(Object k : json.keySet()){  
	            Object v = json.get(k);   
	            //如果内层还是数组的话，继续解析  
	            if(v instanceof JSONArray){  
	                List<String> list = new ArrayList<String>();  
	                Iterator<String> it = ((JSONArray)v).iterator();  
	                StringBuilder sb = new StringBuilder();
	                while(it.hasNext()){  
	                    String next = (String) it.next();  
	                    sb.append(next).append(",");  
	                }  
//System.out.println(sb.substring(0, sb.length()-1));
	                map.put(k.toString(), sb.substring(0, sb.length()-1));  
	            } else {  
	            	if(v instanceof String&&((String)v).length()>20){
	            		map.put(k.toString(),((String)v).substring(0, 20));
	            	}else{
	            		map.put(k.toString(), v); 
	            	}
	            }  
	        }  
	        return map;  
	    } 
	 
	 public static Result handleException(HttpServletResponse response,int code) throws IOException {
			Result result = Result.errorResult();
			switch(code){
			case 1:
				result.setMsg("no token,拒绝服务！");
				break;
			case 2:
				result.setMsg("签名失败, 认证不匹配！");
				break;
			case 3:
				result.setMsg("签名失败, 时间戳有误！");
				break;
			case 4:
				result.setMsg("操作已超时,请重新登录！");
				break;
			case 5:
				result.setMsg("账号密码可能被修改,请重新登录！");
				break;
			case 6:
				result.setMsg("签名或时间戳为空！");
				break;
			case 7:
				result.setMsg("签名参数格式有误！");
				break;
			}
			result.setCode(2);
			response.setContentType("application/json;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.write(result.toJson().toString());
			out.flush();
			out.close();
			return result;
		}
	 
		/**
		 * 亦可如下实现:
		 * 
		 * <pre>
		 * 		<br/>String relativePath = request.getPathInfo();
		 *		<br/>relativePath = relativePath == null ? request.getServletPath() : relativePath;
		 *		<br/>relativePath = request.getMethod() + relativePath;
		 * </pre>
		 * 
		 * @param request
		 * @return
		 */
		public static  String getRelativePath(HttpServletRequest request,String dispatcherCharacter) {
			String act = "";
			String uri = request.getRequestURI()!=null?request.getRequestURI():"";
			uri = dispatcherCharacter == null ? uri : uri.replace(dispatcherCharacter, "/");
			String regEx = "(?<=" + request.getContextPath() + "/)[^/]+(/[^/]+)+|$";
			Pattern pattern = Pattern.compile(regEx);
			Matcher matcher = pattern.matcher(uri);
			if (matcher.find())
				act = matcher.group();
			String authorityValue = request.getMethod() + "/" + act;
			return authorityValue;
		}

}
