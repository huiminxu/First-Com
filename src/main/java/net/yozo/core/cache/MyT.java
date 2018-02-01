package net.yozo.core.cache;


import org.springframework.data.redis.core.RedisTemplate;

import java.io.Serializable;

/**
 * Created by Vicks on 2017/8/14.
 */
public class MyT {
    public static void main(String[] args) {

        //tt.put("vks",222);
        vksTest();

    }

    public static void vksTest(){
        RedisCacheProvider tt=new RedisCacheProvider();
        final RedisTemplate<String, Serializable> tttt = tt.getRedisTemplate();
        System.out.println(tttt);
        tttt.opsForValue().set("vks",111);
        System.out.println( tttt.opsForValue().get("vks"));
    }
}
