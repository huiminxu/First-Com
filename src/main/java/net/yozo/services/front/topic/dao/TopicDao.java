package net.yozo.services.front.topic.dao;

import net.yozo.core.DaoManager;
import net.yozo.core.dao.page.PagerModel;
import net.yozo.services.front.topic.bean.Topic;

import java.util.List;

/**
 * 专题
 * Created by emily.lee on 2018/1/10.
 */
public interface TopicDao extends DaoManager<Topic> {

    /**
     * 获得总记录数
     * @param e
     * @return
     */
    public int getTopicCounts(Topic e);
}
