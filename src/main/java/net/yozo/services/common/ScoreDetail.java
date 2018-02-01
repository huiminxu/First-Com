package net.yozo.services.common;

import net.yozo.core.dao.QueryModel;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by yozo on 2017-10-16.
 */
public class ScoreDetail extends QueryModel implements Serializable  {
    private String id;
    private String account;//用户id
    private String taskid;//积分任务id
    private int score;//积分数额
    private Date date;//类型：1:每日任务，2成长任务（只限一次），3日常任务（每日多次）
    private String orderid;


    public void clear() {
        super.clear();
        id = null;
        account=null;
        taskid=null;
        score = 0;
        date=null;
        orderid=null;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getTaskid() {
        return taskid;
    }

    public void setTaskid(String taskid) {
        this.taskid = taskid;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getOrderid() {
        return orderid;
    }

    public void setOrderid(String orderid) {
        this.orderid = orderid;
    }
}
