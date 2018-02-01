package net.yozo.services.front.TopicTemplate.impl;

import net.yozo.core.ServersManager;
import net.yozo.core.dao.page.PagerModel;
import net.yozo.services.front.TopicTemplate.TopicTemplateService;
import net.yozo.services.front.TopicTemplate.bean.TopicTemplate;
import net.yozo.services.front.TopicTemplate.dao.TopicTemplateDao;
import net.yozo.services.front.account.bean.Account;
import net.yozo.services.front.favorite.bean.Favorite;
import net.yozo.services.front.favorite.dao.FavoriteDao;
import net.yozo.services.front.template.bean.Template;
import net.yozo.web.util.RequestHolder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by t on 2018/1/11.
 */
@Repository
public class TopicTemplateServiceImpl extends ServersManager<TopicTemplate, TopicTemplateDao> implements TopicTemplateService {
    @Autowired
    private TopicTemplateDao topicTemplateDao;
    @Autowired
    private FavoriteDao favoriteDao;
    @Override
    @Autowired
    public void setDao(TopicTemplateDao topicTemplateDao) {
        this.dao = topicTemplateDao;
    }

    public PagerModel selectTopicTemplate(int topicId,Account account){
        int offset = 0;
        if (RequestHolder.getRequest().getParameter("pager.offset") != null) {
            offset = Integer
                    .parseInt(RequestHolder.getRequest().getParameter("pager.offset"));
        }
        if (offset < 0)
            offset = 0;

        PagerModel pager = new PagerModel();
        TopicTemplate topicTemplate = new TopicTemplate();
        topicTemplate.setTopicId(topicId);
        topicTemplate.setOffset(offset);
        topicTemplate.setPageSize(12);
        pager = topicTemplateDao.selectPageList(topicTemplate);
        if (account != null){
            for(Object templateobj:pager.getList()){
                Template template = (Template)templateobj;
                Favorite favorite = new Favorite();
                favorite.setAccount(account.getId());
                favorite.setProductID(template.getId());
                List<Favorite> list =favoriteDao.selectList(favorite);
                if (list != null && list.size()>0){
                    template.setFavorite("y");
                }
            }
        }

        if(pager==null)pager = new PagerModel();
        // 计算总页数
        pager.setPagerSize((pager.getTotal() + pager.getPageSize() - 1)
                / pager.getPageSize());
        pager.setPagerUrl("/topic/detail/"+topicId);
        pager.setOffset(offset);
        return pager;
    }
}
