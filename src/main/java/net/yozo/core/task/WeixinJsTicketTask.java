package net.yozo.core.task;

import net.yozo.core.weixin.util.jssdk.JsapiTicketUtil;
import org.springframework.context.annotation.Lazy;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

/**
 * 获取JS-JDK getticket(7200s获取 一次)
 * Created by emily.lee on 2018/1/9.
 */
@Component
@EnableScheduling
@Lazy(false)
public class WeixinJsTicketTask {
    @Resource(name="redisTemplate")
    private RedisTemplate<String,String> redisStringTemplate;

    /**
     * 每2小时执行一次
     */
    @Scheduled(cron = "0 0 */2 * * ?")
//    @Scheduled(fixedRate = 7200000)
    public void reSetJsTicket() {
        String signature = JsapiTicketUtil.getJSApiTicket();
        System.out.println("----------------获取JS-JDK signature-------------------- :"+signature);
        redisStringTemplate.opsForValue().set("jsapi_ticket",signature);
    }
}
