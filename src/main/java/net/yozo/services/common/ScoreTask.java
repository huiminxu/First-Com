package net.yozo.services.common;

import net.yozo.core.dao.QueryModel;

import java.io.Serializable;

/**
 * Created by yozo on 2017-10-16.
 */
public class ScoreTask extends QueryModel implements Serializable  {
    private String id;
    private String name;//任务名称
    private int score;//任务可获得积分
    private int times;//完成次数上限
    private int type;//类型：1:每日任务，2成长任务（只限一次），3日常任务（每日多次）
    private String flag;//标识，（一般为任务名的首字母组成）
    private String url;//任务的连接路径
    private String urlName1;//链接名称（未完成）
    private String urlName2;//链接名称（已完成）
    private String description;//任务描述
    private int queue;//顺序

    /*** 类型*/
    public static final int scoreTask_daily = 1;//每日任务
    public static final int scoreTask_once=2;//成长任务（一次）
    public static final int scoreTask_times=3;//成长任务（多次）

    public void clear() {
        super.clear();
        id = null;
        name=null;
        score = 0;
        times=0;
        type=0;
        flag=null;
        url=null;
        urlName1=null;
        urlName2=null;
        description=null;
        queue=0;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public int getTimes() {
        return times;
    }

    public void setTimes(int times) {
        this.times = times;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getUrlName1() {
        return urlName1;
    }

    public void setUrlName1(String urlName1) {
        this.urlName1 = urlName1;
    }

    public String getUrlName2() {
        return urlName2;
    }

    public void setUrlName2(String urlName2) {
        this.urlName2 = urlName2;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getQueue() {
        return queue;
    }

    public void setQueue(int queue) {
        this.queue = queue;
    }
}
