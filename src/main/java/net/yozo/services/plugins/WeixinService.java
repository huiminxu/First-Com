package net.yozo.services.plugins;

import net.yozo.core.weixin.util.jssdk.JsapiTicketUtil;
import net.yozo.services.plugins.dto.WeixinConfig;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.UUID;

/**
 * Created by t on 2018/1/9.
 */
@Service
public class WeixinService {
    @Autowired
    @Resource(name="redisTemplate")
    private RedisTemplate<String,String> redisStringTemplate;
    private static String appid = "wx71772fdcb6eb9825";
    public WeixinConfig getWeixinConfig(String url){
        WeixinConfig weixinConfig = new WeixinConfig();
        String jsapi_ticket =redisStringTemplate.opsForValue().get("jsapi_ticket");
        if (StringUtils.isEmpty(jsapi_ticket)){
            jsapi_ticket = JsapiTicketUtil.getJSApiTicket();
        }

        //3、时间戳和随机字符串
        String noncestr = UUID.randomUUID().toString().replace("-", "").substring(0, 16);//随机字符串
        weixinConfig.setNonceStr(noncestr);
        String timestamp = String.valueOf(System.currentTimeMillis() / 1000);//时间戳
        weixinConfig.setTimestamp(timestamp);
        String str = "jsapi_ticket="+jsapi_ticket+"&noncestr="+noncestr+"&timestamp="+timestamp+"&url="+url;
        weixinConfig.setSignature(JsapiTicketUtil.SHA1(str));
        weixinConfig.setAppId(appid);
        return  weixinConfig;
    }

}
