package net.yozo.web.action.front.topic;

import net.sf.json.JSONObject;
import net.yozo.core.dao.page.PagerModel;
import net.yozo.services.front.TopicTemplate.TopicTemplateService;
import net.yozo.services.front.account.bean.Account;
import net.yozo.services.front.favorite.FavoriteService;
import net.yozo.services.front.favorite.bean.Favorite;
import net.yozo.services.front.template.bean.Template;
import net.yozo.services.front.topic.TopicService;
import net.yozo.services.front.topic.bean.Topic;
import net.yozo.services.plugins.WeixinService;
import net.yozo.services.plugins.dto.WeixinConfig;
import net.yozo.web.action.front.FrontBaseController;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 专题Controller
 * Created by t on 2018/1/9.
 */
@Controller("topicAction")
public class TopicAction extends FrontBaseController<Topic> {
    private static final org.apache.logging.log4j.Logger logger = org.apache.logging.log4j.LogManager.getLogger(TopicAction.class);
    @Autowired
    private TopicService topicService;
    @Autowired
    private TopicTemplateService topicTemplateService;
    @Autowired
    private FavoriteService favoriteService;

    @Autowired
    private WeixinService weixinService;
    @Override
    public TopicService getService() {
        return topicService;
    }
    @RequestMapping("/topic/list")
    public String list(){
        return "/topic/topic_list";
    }

    @RequestMapping("/topic/list/{currentPage}")
    @ResponseBody
    public JSONObject pageList(@PathVariable("currentPage")Integer currentPage){
        if (currentPage ==null){
            currentPage = 1;
        }
        Topic topic = new Topic();
        topic.setCurrentPage(currentPage);
        Account acc = getLoginAccount();
        if (acc != null){
            return topicService.selectAllList(topic,acc.getId());
        }else{
            return topicService.selectAllList(topic,null);
        }
    }

    @RequestMapping("/topic/detail/{id}")
    public String detail( @PathVariable("id") String id,ModelMap model){
        Topic topic = new Topic();
        if (StringUtils.isNotEmpty(id)){
            topic = topicService.selectById(id);
            if (topic.getPeriod()<10){
                topic.setTopicPeriod( topic.getYear() + "年 ·0" + topic.getPeriod() + "期");
            }else{
                topic.setTopicPeriod(topic.getYear()+"年 ·"+topic.getPeriod()+"期");
            }
        }
        Account acc = getLoginAccount();
        if (acc != null){
            Favorite favorite = new Favorite();
            favorite.setAccount(acc.getId());
            favorite.setTopicId(Integer.valueOf(topic.getId()));
            if(favoriteService.selectOne(favorite) != null){
                topic.setIsCollect("y");
            }else{
                topic.setIsCollect("n");
            }
        }

        model.put("topic",topic);
        PagerModel pager = topicTemplateService.selectTopicTemplate(Integer.valueOf(topic.getId()),acc);
        List<Topic> tops = topicService.topThreeTopic();

        if (acc != null){
            Favorite favor = new Favorite();
            favor.setAccount(acc.getId());
            List<Favorite> list = favoriteService.selectList(favor);
            if (list != null && list.size() >0){
                for (Topic tc:tops){
                    tc.setIsCollect("n");
                   for (Favorite fav:list){
                       if (fav.getTopicId() != null && (fav.getTopicId()+"").equals(tc.getId())){
                           tc.setIsCollect("y");
                       }
                   }
                }
            }
        }
        model.put("templateList",pager.getList());
        model.addAttribute("pager", pager);
        model.addAttribute("topThreeTopicList", tops);
        //获得JS-SDK configure
        WeixinConfig weixinConfig =weixinService.getWeixinConfig("http://www.yomoer.cn/topic/detail/"+id);
        model.addAttribute("weixinConfig", weixinConfig);
        return "/topic/topic_detail";
    }
}
