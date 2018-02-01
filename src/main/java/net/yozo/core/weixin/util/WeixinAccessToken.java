package net.yozo.core.weixin.util;

import com.qq.connect.QQConnectException;

import com.qq.connect.utils.http.Response;
import com.qq.connect.utils.json.JSONException;
import com.qq.connect.utils.json.JSONObject;

import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by Vicks on 2017/9/14.
 */
public class WeixinAccessToken implements Serializable {
    //private static final long serialVersionUID = 1L;
    private String access_token = "";
    private String expires_in = "";
    private String refresh_token = "";
    private String openid;
    private String scope;
    //private String scope;

    public WeixinAccessToken() {
    }

    public WeixinAccessToken(Response res) throws QQConnectException {

        JSONObject json = null;
        String result = "";

        try {
            json = res.asJSONObject();

            try {
                this.access_token = json.getString("access_token");
                this.expires_in = json.getString("expires_in");
                this.refresh_token = json.getString("refresh_token");
                this.openid = json.getString("openid");
                this.scope = json.getString("scope");
            } catch (JSONException var7) {
                throw new QQConnectException(var7.getMessage() + ":" + json.toString(), var7);
            }
        } catch (Exception var8) {
            result = res.asString();
            Matcher m = Pattern.compile("^access_token=(\\w+)&expires_in=(\\w+)&refresh_token=(\\w+)$").matcher(result);
            if(m.find()) {
                this.access_token = m.group(1);
                this.expires_in = m.group(2);
                this.refresh_token = m.group(3);
            } else {
                Matcher m2 = Pattern.compile("^access_token=(\\w+)&expires_in=(\\w+)$").matcher(result);
                if(m2.find()) {
                    this.access_token = m2.group(1);
                    this.expires_in = m2.group(2);
                }
            }
        }

    }

    WeixinAccessToken(String res) throws QQConnectException, JSONException {
        JSONObject json = new JSONObject(res);
        this.access_token = json.getString("access_token");
        this.expires_in = json.getString("expires_in");
        this.refresh_token = json.getString("refresh_token");
        this.openid = json.getString("openid");
        this.scope = json.getString("scope");
    }

    public String getAccessToken() {
        return this.access_token;
    }
    public String getOpenid() {
        return this.openid;
    }
    public long getExpireIn() {
        return Long.valueOf(this.expires_in).longValue();
    }

    public int hashCode() {
        //int prime = true;
        int result = 1;
        result = 31 * result + (this.access_token == null?0:this.access_token.hashCode());
        result = 31 * result + (this.expires_in == null?0:this.expires_in.hashCode());
        result = 31 * result + (this.refresh_token == null?0:this.refresh_token.hashCode());
        return result;
    }

    public boolean equals(Object obj) {
        if(this == obj) {
            return true;
        } else if(obj == null) {
            return false;
        } else if(this.getClass() != obj.getClass()) {
            return false;
        } else {
            WeixinAccessToken other = (WeixinAccessToken)obj;
            if(this.access_token == null) {
                if(other.access_token != null) {
                    return false;
                }
            } else if(!this.access_token.equals(other.access_token)) {
                return false;
            }

            if(this.expires_in == null) {
                if(other.expires_in != null) {
                    return false;
                }
            } else if(!this.expires_in.equals(other.expires_in)) {
                return false;
            }

            if(this.refresh_token == null) {
                if(other.refresh_token != null) {
                    return false;
                }
            } else if(!this.refresh_token.equals(other.refresh_token)) {
                return false;
            }

            return true;
        }
    }

    public String toString() {
        return "AccessToken [accessToken=" + this.access_token + ", expireIn=" + this.expires_in + "]";
    }
    protected static String getString(String name, JSONObject json, boolean decode) {
        String returnValue = null;

        try {
            returnValue = json.getString(name);
            if(decode) {
                try {
                    returnValue = URLDecoder.decode(returnValue, "UTF-8");
                } catch (UnsupportedEncodingException var5) {
                    ;
                }
            }
        } catch (JSONException var6) {
            ;
        }

        return returnValue;
    }

    protected static int getInt(String key, JSONObject json) throws JSONException {
        String str = json.getString(key);
        return null != str && !"".equals(str) && !"null".equals(str)?Integer.parseInt(str):-1;
    }
}
