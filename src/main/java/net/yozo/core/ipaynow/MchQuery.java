package net.yozo.core.ipaynow;



import net.yozo.core.ipaynow.util.FormDateReportConvertor;
import net.yozo.core.ipaynow.util.HttpClientUtil;
import net.yozo.core.ipaynow.util.MD5Facade;
import net.yozo.services.front.order.bean.Order;

import java.io.InputStream;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

/**
 * 现在支付-商户支付订单查询
 * User: NowPay
 * Date: 14-8-19
 * Time: 下午2:39
 * To change this template use File | Settings | File Templates.
 */
public class MchQuery {

    private String orderQuery(Order order) throws Exception {
        HashMap<String, String> req=new HashMap<String, String>();
        req.put("funcode","MQ002");

        InputStream propertiesInput = Thread.currentThread().getContextClassLoader().getResourceAsStream("ipaynow.properties");
        Properties properties = new Properties();
        properties.load(propertiesInput);
       // String appId = (String) properties.get("appId");
        //String securityKey = (String) properties.get("md5Key");
        	
        req.put("appId", properties.getProperty("appId").trim());
        req.put("version", properties.getProperty("version").trim());
        req.put("deviceType", properties.getProperty("deviceType").trim());
        req.put("mhtOrderNo", order.getOrderNum()+order.getRemark());//前台传入
        req.put("mhtCharset", properties.getProperty("mhtCharset").trim());
        req.put("mhtSignType", properties.getProperty("mhtSignType").trim());
        req.put("mhtSignature", MD5Facade.getFormDataParamMD5(req, properties.getProperty("md5Key").trim(), "UTF-8"));

        Map<String,String> queryResultMap = doQuery(req);

        String signature = queryResultMap.remove("signature");

        boolean isValidSignature = MD5Facade.validateFormDataParamMD5(queryResultMap,properties.getProperty("md5Key").trim(),signature);

        System.out.println("验签结果："+isValidSignature);

        if(isValidSignature) {
            //System.out.println(queryResultMap.size());
            String transStatus=queryResultMap.get("transStatus");
            System.out.println("订单号："+queryResultMap.get("mhtOrderNo")+"订单状态："+transStatus);
            return transStatus;
        }else {
            System.out.println("验签失败");
            return "验签失败";
        }
    }

    private Map<String,String> doQuery(HashMap<String, String> req) throws Exception {
        String message=buildReq(req);
        //System.out.println("插件->接口:"+message);

        InputStream propertiesInput = Thread.currentThread().getContextClassLoader().getResourceAsStream("ipaynow.properties");
        Properties properties = new Properties();
        properties.load(propertiesInput);
        String NOWPAY_SERVER_URL = (String) properties.get("nowPayServer.url");
        String response= HttpClientUtil.sendHttp(NOWPAY_SERVER_URL, message, "UTF-8");
        //System.out.println("现在支付服务器->插件:"+ URLDecoder.decode(response, "UTF-8"));

        return FormDateReportConvertor.parseFormDataPatternReportWithDecode(response,"UTF-8","UTF-8");
    }

    private String buildReq(HashMap<String, String> req){
        return FormDateReportConvertor.postFormLinkReportWithURLEncode(req, "UTF-8");
    }

    public  String getQueryRes(Order order) throws Exception {
        return orderQuery(order);
    }
}