package net.yozo.core.weixin.util.jssdk;

import net.sf.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * JS-SDK Configure
 * Created by emily.lee on 2018/1/8.
 */
public class JsapiTicketUtil {
    private static String appid = "wx71772fdcb6eb9825";
    private static String appSecret = "a6d1281d4b66c73ae28210c43c031264";
    /***
     * 模拟get请求
     * @param url
     * @param charset
     * @param timeout
     * @return
     */
    public static String sendGet(String url, String charset, int timeout)
    {
        String result = "";
        try
        {
            URL u = new URL(url);
            try
            {
                URLConnection conn = u.openConnection();
                conn.connect();
                conn.setConnectTimeout(timeout);
                BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), charset));
                String line="";
                while ((line = in.readLine()) != null)
                {

                    result = result + line;
                }
                in.close();
            } catch (IOException e) {
                return result;
            }
        }
        catch (MalformedURLException e)
        {
            return result;
        }

        return result;
    }
    /***
     * 获取acess_token
     * 来源www.vxzsk.com
     * @return
     */
    public static String getAccessToken(){
        String url ="https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid="+ appid+"&secret="+appSecret+"";
        String backData=JsapiTicketUtil.sendGet(url, "utf-8", 10000);
        String accessToken = (String) JSONObject.fromObject(backData).get("access_token");
        return accessToken;
    }
    /***
     * 获取jsapiTicket
     * 来源 www.vxzsk.com
     * @return
     */
    public static String getJSApiTicket(){
        //获取token
        String acess_token= JsapiTicketUtil.getAccessToken();
        String urlStr = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token="+acess_token+"&type=jsapi";
        String backData=JsapiTicketUtil.sendGet(urlStr, "utf-8", 10000);
        System.out.println(backData);
        String ticket = (String) JSONObject.fromObject(backData).get("ticket");
        return  ticket;

    }

    /**
     * SHA1加密
     * @param decript
     * @return
     */
    public static String SHA1(String decript) {
        try {
            MessageDigest digest = java.security.MessageDigest.getInstance("SHA-1");
            digest.update(decript.getBytes());
            byte messageDigest[] = digest.digest();
            // Create Hex String
            StringBuffer hexString = new StringBuffer();
            // 字节数组转换为 十六进制 数
            for (int i = 0; i < messageDigest.length; i++) {
                String shaHex = Integer.toHexString(messageDigest[i] & 0xFF);
                if (shaHex.length() < 2) {
                    hexString.append(0);
                }
                hexString.append(shaHex);
            }
            return hexString.toString();

        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return "";
    }
    public static void main(String[] args) {
//        String jsapiTicket = JsapiTicketUtil.getJSApiTicket();
//        System.out.println("调用微信jsapi的凭证票为："+jsapiTicket);
        System.out.println(SHA1("kgt8ON7yVITDhtdwci0qeWmmpxFQazJ5R9qLoPVfEZOH4WQ4rahE8qXhGEGsc6b5MaWbXxEEVjr8NxN3EyPEhg"));
    }
}
