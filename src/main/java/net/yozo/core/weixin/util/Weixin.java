package net.yozo.core.weixin.util;

import com.qq.connect.QQConnectException;
import com.qq.connect.javabeans.AccessToken;
import com.qq.connect.utils.QQConnectConfig;
import com.qq.connect.utils.RandomStatusGenerator;
import com.qq.connect.utils.http.HttpClient;
import com.qq.connect.utils.http.PostParameter;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


/**
 * Created by Vicks on 2017/9/13.
 */
public class Weixin {
    protected HttpClient client = new HttpClient();
    public String getCode(HttpServletRequest request){
        String state = RandomStatusGenerator.getUniqueState();
        request.getSession().setAttribute("weixin_connect_state", state);
        String sendTo=WeixinConfig.getValue("authorizeURL").trim() + "?appid="
                + WeixinConfig.getValue("appid").trim() + "&redirect_uri="
                + WeixinConfig.getValue("redirect_URI").trim()
                + "&response_type=code&scope=snsapi_login&state="+state+"#wechat_redirect";
        return sendTo;
    }
    public WeixinAccessToken getAccessTokenByRequest(ServletRequest request) throws QQConnectException {
        String queryString = ((HttpServletRequest)request).getQueryString();
        if(queryString == null) {
            return new WeixinAccessToken();
        } else {
            String state = (String)((HttpServletRequest)request).getSession().getAttribute("weixin_connect_state");
            if(state != null && !state.equals("")) {
                String[] authCodeAndState = this.extractionAuthCodeFromUrl(queryString);
                String returnState = authCodeAndState[1];
                String returnAuthCode = authCodeAndState[0];
                WeixinAccessToken accessTokenObj = null;
                if(!returnState.equals("") && !returnAuthCode.equals("")) {
                    if(!state.equals(returnState)) {
                        accessTokenObj = new WeixinAccessToken();
                    } else {
                        accessTokenObj = new WeixinAccessToken(this.client.post(WeixinConfig.getValue("accessTokenURL"), new PostParameter[]{new PostParameter("appid", WeixinConfig.getValue("appid")), new PostParameter("secret", WeixinConfig.getValue("secret").trim()), new PostParameter("grant_type", "authorization_code"), new PostParameter("code", returnAuthCode)}, Boolean.valueOf(false)));
                    }
                } else {
                    accessTokenObj = new WeixinAccessToken();
                }

                return accessTokenObj;
            } else {
                return new WeixinAccessToken();
            }
        }
    }
    private String[] extractionAuthCodeFromUrl(String url) throws QQConnectException {
        if(url == null) {
            throw new QQConnectException("you pass a null String object");
        } else {
            Matcher m = Pattern.compile("code=(\\w+)&state=(\\w+)&?").matcher(url);
            String authCode = "";
            String state = "";
            if(m.find()) {
                authCode = m.group(1);
                state = m.group(2);
            }

            return new String[]{authCode, state};
        }
    }
}
