package net.yozo.services.common;

import net.yozo.core.dao.QueryModel;

import java.io.Serializable;

/**
 * 定制订单的用户评价
 * Created by Vicks on 2017/12/4.
 */
public class CustomizeComment extends QueryModel implements Serializable {
    private String id;
    private int orderId;
    private String content;
    private int qualityScore;
    private int efficiencyScore;
    private int serviceScore;
    private String createdTime;
    private int creator;
    private int positive;
    private int moderate;
    private int negative;
    private int isDelete;
    private int designerId;

    private String nickname;

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }
    public int getDesignerId() {
        return designerId;
    }

    public void setDesignerId(int designerId) {
        this.designerId = designerId;
    }

    @Override
    public String getId() {
        return id;
    }

    @Override
    public void setId(String id) {
        this.id = id;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getQualityScore() {
        return qualityScore;
    }

    public void setQualityScore(int qualityScore) {
        this.qualityScore = qualityScore;
    }

    public int getEfficiencyScore() {
        return efficiencyScore;
    }

    public void setEfficiencyScore(int efficiencyScore) {
        this.efficiencyScore = efficiencyScore;
    }

    public int getServiceScore() {
        return serviceScore;
    }

    public void setServiceScore(int serviceScore) {
        this.serviceScore = serviceScore;
    }

    public String getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(String createdTime) {
        this.createdTime = createdTime;
    }

    public int getCreator() {
        return creator;
    }

    public void setCreator(int creator) {
        this.creator = creator;
    }

    public int getPositive() {
        return positive;
    }

    public void setPositive(int positive) {
        this.positive = positive;
    }

    public int getNegative() {
        return negative;
    }

    public void setNegative(int negative) {
        this.negative = negative;
    }

    public int getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(int isDelete) {
        this.isDelete = isDelete;
    }
    public int getModerate() {
        return moderate;
    }

    public void setModerate(int moderate) {
        this.moderate = moderate;
    }
}
