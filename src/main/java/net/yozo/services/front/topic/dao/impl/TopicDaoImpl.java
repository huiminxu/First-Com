package net.yozo.services.front.topic.dao.impl;

import net.yozo.core.dao.BaseDao;
import net.yozo.core.dao.page.PagerModel;
import net.yozo.services.front.topic.bean.Topic;
import net.yozo.services.front.topic.dao.TopicDao;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by t on 2018/1/10.
 */
@Repository
public class TopicDaoImpl implements TopicDao{
    @Resource
    private BaseDao dao;

    public void setDao(BaseDao dao) {
        this.dao = dao;
    }

    /**
     * 添加
     *
     * @param e
     * @return
     */
    public int insert(Topic e){
        return dao.insert("front.topic.insert", e);
    }

    /**
     * 删除
     *
     * @param e
     * @return
     */
    public int delete(Topic e){
        return dao.delete("front.topic.delete", e);
    }

    /**
     * 修改
     *
     * @param e
     * @return
     */
    public int update(Topic e){
        return dao.update("front.topic.update", e);
    }

    /**
     * 查询一条记录
     *
     * @param e
     * @return
     */
    public Topic selectOne(Topic e){
        return (Topic)dao.selectOne("front.topic.selectOne", e);
    }

    /**
     * 分页查询
     *
     * @param e
     * @return
     */
    public PagerModel selectPageList(Topic e){
        return dao.selectPageList("front.topic.selectPageList",
                "front.topic.selectPageCount", e);
    }

    /**
     * 根据条件查询所有
     * @return
     */
    public List<Topic> selectList(Topic e){
        return dao.selectList("front.topic.selectList",e);
    }

    /**
     * 根据ID来删除一条记录
     * @param id
     */
    public int deleteById(int id){
        return dao.delete("front.topic.deleteById",id);
    }

    /**
     * 根据ID查询一条记录
     * @param id
     * @return
     */
    public Topic selectById(String id){
        return  (Topic) dao.selectOne("front.topic.selectById", id);
    }


    /**
     * 获得总记录数
     * @param e
     * @return
     */
    public int getTopicCounts(Topic e){
        return (Integer)dao.selectOne("front.topic.selectCount",e);
    }
}
