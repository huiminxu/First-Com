package net.yozo.services.front.TopicTemplate.dao.impl;
import net.yozo.core.dao.BaseDao;

import net.yozo.core.dao.page.PagerModel;
import net.yozo.services.front.TopicTemplate.bean.TopicTemplate;
import net.yozo.services.front.TopicTemplate.dao.TopicTemplateDao;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;


/**
 * 专题模板
 * Created by emily.lee on 2018/1/10.
 */
@Repository
public class TopicTemplateDaoImpl  implements TopicTemplateDao {
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
    public int insert(TopicTemplate e){
        return dao.insert("front.topicTemplate.insert", e);
    }

    /**
     * 删除
     *
     * @param e
     * @return
     */
    public int delete(TopicTemplate e){
        return dao.delete("front.topicTemplate.delete",e);
    }

    /**
     * 修改
     *
     * @param e
     * @return
     */
    public int update(TopicTemplate e){
        return dao.update("front.topicTemplate.update",e);
    }

    /**
     * 查询一条记录
     *
     * @param e
     * @return
     */
    public TopicTemplate selectOne(TopicTemplate e){
        return (TopicTemplate)dao.selectList("front.topicTemplate.selectOne",e);
    }

    /**
     * 分页查询
     *
     * @param e
     * @return
     */
    public PagerModel selectPageList(TopicTemplate e){
        return dao.selectPageList("front.topicTemplate.selectPageList",
                "front.topicTemplate.selectPageCount",e);
    }

    /**
     * 根据条件查询所有
     * @return
     */
    public List<TopicTemplate> selectList(TopicTemplate e){
        return dao.selectList("front.topicTemplate.TopicTemplate", e);
    }


    /**
     * 根据ID查询一条记录
     * @param id
     * @return
     */
    public TopicTemplate selectById(String id){
        return  (TopicTemplate) dao.selectOne("front.topicTemplate.selectById", id);
    }

    /**
     * 根据ID来删除一条记录
     * @param id
     */
    public int deleteById(int id){
        return dao.delete("front.topicTemplate.deleteById",id);
    }

}
