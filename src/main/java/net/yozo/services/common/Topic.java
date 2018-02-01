package net.yozo.services.common;

import net.yozo.core.dao.QueryModel;

import java.io.Serializable;
import java.util.Date;

/**
 * 专题
 * Created by emily.lee on 2018/1/9.
 */
public class Topic extends QueryModel implements Serializable {
    private String id;

    private String topicImage;

    private String topicName;

    private String topicDesc;

    private Integer pageView;

    private Integer collect;

    private Integer status;

    private Date publishTime;

    private Integer creator;

    private Date createdTime;

    private Byte deleted;

    private String topicPeriod;

    private static final long serialVersionUID = 1L;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTopicImage() {
        return topicImage;
    }

    public void setTopicImage(String topicImage) {
        this.topicImage = topicImage;
    }

    public String getTopicName() {
        return topicName;
    }

    public void setTopicName(String topicName) {
        this.topicName = topicName;
    }

    public String getTopicDesc() {
        return topicDesc;
    }

    public void setTopicDesc(String topicDesc) {
        this.topicDesc = topicDesc;
    }

    public Integer getPageView() {
        return pageView;
    }

    public void setPageView(Integer pageView) {
        this.pageView = pageView;
    }

    public Integer getCollect() {
        return collect;
    }

    public void setCollect(Integer collect) {
        this.collect = collect;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(Date publishTime) {
        this.publishTime = publishTime;
    }

    public Integer getCreator() {
        return creator;
    }

    public void setCreator(Integer creator) {
        this.creator = creator;
    }

    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    public Byte getDeleted() {
        return deleted;
    }

    public void setDeleted(Byte deleted) {
        this.deleted = deleted;
    }

    public String getTopicPeriod() {
        return topicPeriod;
    }

    public void setTopicPeriod(String topicPeriod) {
        this.topicPeriod = topicPeriod;
    }

    public void clear() {
        super.clear();
        id = null;
        topicImage = null;
        topicName = null;
        topicDesc = null;
        pageView = null;
        collect = null;
        status = null;
        publishTime = null;
        creator = null;
        createdTime = null;
        deleted = null;
        topicPeriod = null;
    }

}
