package net.yozo.core.cache;

import org.apache.commons.lang.StringUtils;
import org.springframework.dao.DataAccessException;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.core.RedisCallback;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.data.redis.support.atomic.RedisAtomicLong;

import javax.annotation.Resource;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.concurrent.TimeUnit;

/**
 * redis cache provider
 * @author joey
 */
public class RedisCacheProvider implements CacheProvider {
    @Resource
    private RedisTemplate<String, Serializable> redisTemplate;

    @Resource(name="redisTemplate")
    private RedisTemplate<String,String> redisStringTemplate;


    /**
     * 生成编号（格式：编码+yyyyMMddhhmmss+编号）
     * 编码=code,"T"代表单个模板订单、"Y"代表柚点充值、"H"代表会员充值、"E"代表提现操作
     *
     * @return
     */
    public String numberGenerator(String code) {
        int orderNum = 0;
        ValueOperations<String, String> msgCache = redisStringTemplate.opsForValue();
        String dateKey = new SimpleDateFormat("yyyyMMdd").format(new Date());
        String num = msgCache.get(code + dateKey);
        if (num != null && StringUtils.isNotEmpty(num)) {
            orderNum += Integer.valueOf(num);;
        }
        String date = new SimpleDateFormat("yyyyMMddhhmmss").format(new Date());
        //long currentNumber = Long.parseLong((date)) * 10000 + orderNum + 1;
        String orderNum6=String.format("%5d",orderNum+1).replace(" ","0");//每日订单号后6位递增，不足补0
        String currentNumber = date+orderNum6;
        // 验证码有效期为24小时
        msgCache.set(code+dateKey, orderNum + 1 + "", 24, TimeUnit.HOURS);

        return code + currentNumber;
    }

    /**
     * 存放数据，并设定该数据第二天凌晨失效
     *
     * @return
     */
    public String put24(String key, String value) throws Exception{
        ValueOperations<String, String> msgCache = redisStringTemplate.opsForValue();
        SimpleDateFormat s1 = new SimpleDateFormat("yyyy-MM-dd 23:59:59");
        SimpleDateFormat s2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date now=new Date();
        String fromDate = s1.format(now);
        String toDate = s2.format(now);
        long from = s1.parse(fromDate).getTime();
        long to = s2.parse(toDate).getTime();
        int second = (int) ((to - from)/(1000));
        msgCache.set(key, value , second, TimeUnit.SECONDS);

        return null;
    }

    public RedisTemplate<String, Serializable> getRedisTemplate() {
        return redisTemplate;
    }

    public void setRedisTemplate(RedisTemplate<String, Serializable> redisTemplate) {
        this.redisTemplate = redisTemplate;
    }

    /**
     * 获取redis中相同字符串打头的关键字的set集合
     * @param key 关键字中相同部分打头的内容
     */
    public Set<String> getKeys(String key) {
        Set<String> keys = redisTemplate.keys(key+"*");
        return keys;
    }

    @Override
    public void put(final String key, final Serializable cacheObject) {
        redisTemplate.execute(new RedisCallback<Serializable>() {
            @Override
            public Serializable doInRedis(RedisConnection connection) throws DataAccessException {
                RedisSerializer<Serializable> value = (RedisSerializer<Serializable>) redisTemplate.getValueSerializer();
                connection.set(redisTemplate.getStringSerializer().serialize(key), value.serialize(cacheObject));
                return null;
            }
        });
    }

    @Override
    public Serializable get(final String key) {
        return redisTemplate.execute(new RedisCallback<Serializable>() {
            @Override
            public Serializable doInRedis(RedisConnection connection)
                    throws DataAccessException {
                byte[] redisKey = redisTemplate.getStringSerializer().serialize(key);
                if (connection.exists(redisKey)) {
                    byte[] value = connection.get(redisKey);
                    Serializable valueSerial = (Serializable)redisTemplate.getValueSerializer()
                            .deserialize(value);
                    return valueSerial;
                }
                return null;
            }
        });
    }

    @Override
    public void remove(String key) {
        redisTemplate.delete(key);
    }

    @Override
    public void clear() {

    }
    public void put(final String key){

    }
}
