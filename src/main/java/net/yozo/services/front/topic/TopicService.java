package net.yozo.services.front.topic;

import net.sf.json.JSONObject;
import net.yozo.core.Services;
import net.yozo.services.front.topic.bean.Topic;

import java.util.List;

/**
 * 主题
 * Created by emily.lee on 2018/1/10.
 */
public interface TopicService  extends Services<Topic>{
    /**
     * 查询所有专题
     * @param e
     * @return
     */
    public JSONObject selectAllList(Topic e,String accId);

    /**
     * 往期推荐（最新3个）
     * @return
     */
    public List<Topic> topThreeTopic();
}
