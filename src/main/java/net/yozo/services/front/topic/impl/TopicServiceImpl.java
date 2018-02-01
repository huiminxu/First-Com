package net.yozo.services.front.topic.impl;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.yozo.core.ServersManager;
import net.yozo.services.front.favorite.FavoriteService;
import net.yozo.services.front.favorite.bean.Favorite;
import net.yozo.services.front.favorite.dao.FavoriteDao;
import net.yozo.services.front.topic.TopicService;
import net.yozo.services.front.topic.bean.Topic;
import net.yozo.services.front.topic.dao.TopicDao;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.*;

/**
 * 专题
 * Created by emily.lee on 2018/1/10.
 */
@Repository
public class TopicServiceImpl extends ServersManager<Topic, TopicDao> implements TopicService {
    private static final Logger logger = LoggerFactory.getLogger(TopicServiceImpl.class);
    @Autowired
    private TopicDao topicDao;
    @Autowired
    private FavoriteDao favoriteDao;
    @Override
    @Autowired
    public void setDao(TopicDao templateDao) {
        this.dao = topicDao;
    }

    /**
     * 查询所有专题
     * @param e
     * @return
     */
    public JSONObject selectAllList(Topic e,String accId){
        JSONObject result = new JSONObject();
       int pageCounts =dao.getTopicCounts(e);
        if (pageCounts >0){
            int pagerSize = pageCounts/9;
            if (pageCounts%9 >0){
                pagerSize =pageCounts/9+1;
            }
            if (!(e.getCurrentPage() >pagerSize)){
                e.setStart((e.getCurrentPage()-1)*9);
                e.setOffset(9);
                List<Topic> list = dao.selectList(e);
                JSONArray arr = new JSONArray();
                if (list != null && list.size() >0){
                    List<Favorite> favorites = new ArrayList<Favorite>();
                    if (StringUtils.isNotEmpty(accId) ){
                        Favorite favorite = new Favorite();
                        favorite.setAccount(accId);
                        favorites = favoriteDao.selectList(favorite);
                    }
                    for (Topic topic :list){
                        JSONObject obj = new JSONObject();
                        obj.put("id",topic.getId());
                        obj.put("topicName",topic.getTopicName());
                        obj.put("topicImage",topic.getTopicImage());
                        if (topic.getPeriod()<10){
                            obj.put("topicPeriod",topic.getYear()+"年 ·0"+topic.getPeriod()+"期");
                        }else{
                            obj.put("topicPeriod",topic.getYear()+"年 ·"+topic.getPeriod()+"期");
                        }
                        obj.put("pageView",topic.getPageView());
                        obj.put("collect",topic.getCollect());
                        obj.put("isCollect","n");
                        if (favorites != null && favorites.size()>0){
                            for (Favorite favorite:favorites){
                                if (favorite.getTopicId() != null && (favorite.getTopicId()+"").equals(topic.getId())){
                                    obj.put("isCollect","y");
                                }
                            }
                        }
                        arr.add(obj);
                    }
                }
                result.put("list", arr);
                result.put("total",pageCounts);//总记录数
                result.put("pagerSize",pagerSize); //总页数
                return result;
            }
        }
        return null;
    }

    /**
     * 往期推荐（最新3个）
     * @return
     */
    public List<Topic> topThreeTopic(){
        Topic e = new Topic();
        e.setStart(0);
        e.setOffset(3);
        List<Topic> topicList = dao.selectList(e);
        for (Topic topic :topicList){
            if (topic.getPeriod()<10){
                topic.setTopicPeriod(topic.getYear() + "年 ·0" + topic.getPeriod() + "期");
            }else{
                topic.setTopicPeriod(topic.getYear()+"年 ·"+topic.getPeriod()+"期");
            }
        }
        return topicList;

    }
}
