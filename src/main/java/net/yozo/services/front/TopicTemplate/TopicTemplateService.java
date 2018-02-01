package net.yozo.services.front.TopicTemplate;

import net.yozo.core.Services;
import net.yozo.core.dao.page.PagerModel;
import net.yozo.services.front.TopicTemplate.bean.TopicTemplate;
import net.yozo.services.front.account.bean.Account;

/**
 * Created by t on 2018/1/10.
 */
public interface TopicTemplateService extends Services<TopicTemplate> {
    PagerModel selectTopicTemplate(int topicId,Account account);
}
