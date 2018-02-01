package net.yozo.services.front.topic.bean;

import java.io.Serializable;

/**
 * Created by t on 2018/1/10.
 */
public class Topic extends net.yozo.services.common.Topic implements Serializable {
    private int year;
    private int period;
    private int start;
    private int currentPage;
    private String isCollect="n";

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getStart() {
        return start;
    }

    public void setStart(int start) {
        this.start = start;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getPeriod() {
        return period;
    }

    public void setPeriod(int period) {
        this.period = period;
    }

    public String getIsCollect() {
        return isCollect;
    }

    public void setIsCollect(String isCollect) {
        this.isCollect = isCollect;
    }
}
