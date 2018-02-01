package net.yozo.core.ipaynow;

import net.sf.json.JSONObject;
import net.yozo.services.front.account.bean.Account;
import net.yozo.services.front.order.bean.Order;
import net.yozo.web.util.FormDateReportConvertor;
import net.yozo.web.util.LoginUserHolder;
import net.yozo.web.util.MD5Facade;
import org.apache.commons.lang.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.*;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

/**
 * Created by Vicks on 2017/9/29.
 */
public class WeixinPay {
    //获取微信二维码

    public   String weixinpay(Order order) {

        if(order == null) {
            throw new NullPointerException("根据订单号查询不到订单信息！");
        }

        InputStream propertiesInput = Thread.currentThread().getContextClassLoader().getResourceAsStream("ipaynow.properties");
        Properties properties = new Properties();
        try {
            properties.load(propertiesInput);
        } catch (IOException e) {
            e.printStackTrace();
        }
        Map<String, String> dataMap = new HashMap<String, String>();
        dataMap.put("appId", properties.getProperty("appId").trim());
        dataMap.put("deviceType", properties.getProperty("deviceType").trim());
        dataMap.put("funcode",properties.getProperty("funcode").trim());
        //定制订单不加特殊字符
        if (order.getOrderNum().startsWith("CU")){
            dataMap.put("mhtOrderNo", order.getOrderNum());//加上随机数后的特殊订单号
        }else {
            dataMap.put("mhtOrderNo", order.getOrderNum()+order.getRemark());//加上随机数后的特殊订单号
        }

        dataMap.put("mhtOrderName", order.getTemplateName());
        dataMap.put("version", properties.getProperty("version").trim());
        dataMap.put("mhtCurrencyType", properties.getProperty("mhtCurrencyType").trim());

        String amount=""+(int)(100*Double.valueOf(order.getAmount()));
        dataMap.put("mhtOrderAmt",amount);
        dataMap.put("mhtOrderDetail", "订单详情");
        dataMap.put("mhtOrderType", properties.getProperty("mhtOrderType").trim());

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        String mhtOrderStartTime = dateFormat.format(new Date());
        dataMap.put("mhtOrderStartTime", mhtOrderStartTime);
        //dataMap.put("mhtOrderStartTime", "20171013102222");

        dataMap.put("notifyUrl", properties.getProperty("notifyUrl").trim());
        //dataMap.put("frontNotifyUrl", properties.getProperty("notifyUrl").trim());
        dataMap.put("mhtCharset", properties.getProperty("mhtCharset").trim());
        dataMap.put("outputType", properties.getProperty("outputType").trim());
        dataMap.put("payChannelType", "13");//微信
        dataMap.put("mhtSignType", properties.getProperty("mhtSignType").trim());

        //商户保留域， 可以不用填。 如果商户有需要对每笔交易记录一些自己的东西，可以放在这个里面
        dataMap.put("mhtReserved", "");
        String appKey=properties.getProperty("md5Key").trim();

        String mhtSignatureFORweixin = MD5Facade.getFormDataParamMD5(dataMap, appKey, "UTF-8");
        String  sendMSGFORweixin= FormDateReportConvertor.postFormLinkReportWithURLEncode(dataMap,"UTF-8");

        /*dataMap.put("payChannelType", "12");//支付宝
        dataMap.put("mhtOrderNo", order.getOrderNum()+"zfb");*/

        //dataMap.put("mhtOrderStartTime", dateFormat.format(new Date().getTime()+1000));
       /* String mhtSignatureFORzfb = MD5Facade.getFormDataParamMD5(dataMap, appKey, "UTF-8");
        String  sendMSGFORzfb= FormDateReportConvertor.postFormLinkReportWithURLEncode(dataMap,"UTF-8");*/


        sendMSGFORweixin+="&mhtSignature="+mhtSignatureFORweixin;
      /*  sendMSGFORzfb+="&mhtSignature="+mhtSignatureFORzfb;*/

        String resFORweixin=sendMSGforQR(sendMSGFORweixin);
        /*String resFORzfb=sendMSGforQR(sendMSGFORzfb);*/
        System.out.println("--------------------返回信息："+resFORweixin+"-----------------------");
        String QRFORweixin= URLDecoder.decode(resFORweixin.substring(resFORweixin.indexOf("data"),resFORweixin.indexOf("&appId")));
       /* String QRFORzfb=URLDecoder.decode(resFORzfb.substring(resFORzfb.indexOf("data"),resFORzfb.indexOf("&appId")));*/


        return QRFORweixin;
    }

    public  String sendMSGforQR(String sendMSG){
        PrintWriter out = null;
        BufferedReader in = null;
        String res = "";
        String sendurl="https://pay.ipaynow.cn";
        try {
            URL url=new URL(sendurl);
            URLConnection conn=url.openConnection();
            conn.setRequestProperty("accept", "*/*");
            conn.setRequestProperty("connection", "Keep-Alive");
            conn.setRequestProperty("user-agent",
                    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            conn.setDoOutput(true);
            conn.setDoInput(true);

            out = new PrintWriter(conn.getOutputStream());
            // 发送请求参数
            out.print(sendMSG);
            // flush输出流的缓冲
            out.flush();
            // 定义BufferedReader输入流来读取URL的响应
            in = new BufferedReader(
                    new InputStreamReader(conn.getInputStream()));
            String line;
            while ((line = in.readLine()) != null) {
                res += line;
            }
        } catch (Exception e) {
            System.out.println("发送 POST 请求出现异常！"+e);
            e.printStackTrace();
        }
        //使用finally块来关闭输出流、输入流
        finally{
            try{
                if(out!=null){
                    out.close();
                }
                if(in!=null){
                    in.close();
                }
            }
            catch(IOException ex){
                ex.printStackTrace();
            }
        }
        return res;
    }
}
