package net.yozo.services.front.TopicTemplate.dao;

import net.yozo.core.DaoManager;
import net.yozo.core.dao.page.PagerModel;
import net.yozo.services.front.TopicTemplate.bean.TopicTemplate;

import java.util.List;

/**
 * Created by t on 2018/1/10.
 */
public interface TopicTemplateDao extends DaoManager<TopicTemplate> {
    /**
     * 添加
     *
     * @param e
     * @return
     */
    public int insert(TopicTemplate e);

    /**
     * 删除
     *
     * @param e
     * @return
     */
    public int delete(TopicTemplate e);

    /**
     * 修改
     *
     * @param e
     * @return
     */
    public int update(TopicTemplate e);

    /**
     * 查询一条记录
     *
     * @param e
     * @return
     */
    public TopicTemplate selectOne(TopicTemplate e);

    /**
     * 分页查询
     *
     * @param e
     * @return
     */
    public PagerModel selectPageList(TopicTemplate e);

    public List<TopicTemplate> selectList(TopicTemplate e);
}
