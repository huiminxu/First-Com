package net.yozo.services.common;

import net.yozo.core.dao.QueryModel;

import java.io.Serializable;

/**
 * 专题模板
 * Created by emily.lee on 2018/1/9.
 */
public class TopicTemplate extends QueryModel implements Serializable {
    private String id;

    private Integer topicId;

    private Integer templateId;

    private Integer sort;

    private static final long serialVersionUID = 1L;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Integer getTopicId() {
        return topicId;
    }

    public void setTopicId(Integer topicId) {
        this.topicId = topicId;
    }

    public Integer getTemplateId() {
        return templateId;
    }

    public void setTemplateId(Integer templateId) {
        this.templateId = templateId;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public void clear() {
        super.clear();
        id = null;
        topicId = null;
        templateId = null;
        sort = null;
    }
}
