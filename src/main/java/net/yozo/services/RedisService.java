package net.yozo.services;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * redis操作
 *
 * @author emily.lee
 * @Date 2016-09-11
 */
@Service
public class RedisService {
    @Autowired
    private RedisTemplate<String, String> redisTemplate;

    /**
     * 生成编号（格式：编码+yyyyMMdd+编号）
     *
     * @return
     */
    public String numberGenerator(String code) {
        long orderNum = 0L;
        ValueOperations<String, String> msgCache = redisTemplate.opsForValue();
        String num = msgCache.get(code + "_Number");
        if (num != null && StringUtils.isNotEmpty(num)) {
            orderNum += Integer.valueOf(num);
        }
        String date = new SimpleDateFormat("yyyyMMdd").format(new Date());
        long currentNumber = Long.parseLong((date)) * 10000 + orderNum + 1;
        // 有效期到今天结束
        msgCache.set(code + "_Number", orderNum + 1 + "", this.differenceEndTime(), TimeUnit.MILLISECONDS);
        return "" + currentNumber;
    }

    public String webSimpleCacheGet(String key) {
        ValueOperations<String, String> cache = redisTemplate.opsForValue();
        return cache.get(key);
    }

    public Boolean webSimpleCacheEquals(String key, String chkValue) {
        if (key == null || key.isEmpty()
                || chkValue == null || chkValue.isEmpty()) {
            return false;
        }
        ValueOperations<String, String> cache = redisTemplate.opsForValue();
        String keyValue = cache.get(key);
        if (keyValue == null || keyValue.isEmpty()) {
            return false;
        }
        return keyValue.equals(chkValue);
    }


    public String get(String key) {
        return redisTemplate.opsForValue().get(key);
    }

    public void set(String key, String value) {
        redisTemplate.opsForValue().set(key, value);
    }

    public void expire(String key, Long timeout, TimeUnit timeUnit) {
        redisTemplate.expire(key, timeout, timeUnit);
    }

    public void del(String key) {
        redisTemplate.delete(key);
    }

    public void hset(String h, Object hk, Object hv) {
        redisTemplate.opsForHash().put(h, hk, hv);
    }

    public Object hget(String h, Object hk) {
        return redisTemplate.opsForHash().get(h, hk);
    }

    public void hmset(String h, Map map) {
        redisTemplate.opsForHash().putAll(h, map);
    }


    /**
     * 获得到当天结束的时差
     * @return
     */
    private Long differenceEndTime(){
        Calendar todayEnd = Calendar.getInstance();
        todayEnd.set(Calendar.HOUR, 23);
        todayEnd.set(Calendar.MINUTE, 59);
        todayEnd.set(Calendar.SECOND, 59);
        todayEnd.set(Calendar.MILLISECOND, 999);
        return todayEnd.getTime().getTime() - new Date().getTime();
    }
}
