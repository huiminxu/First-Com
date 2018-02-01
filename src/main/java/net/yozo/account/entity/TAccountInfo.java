package net.yozo.account.entity;

import java.io.Serializable;

public class TAccountInfo implements Serializable {
    private Integer id;

    private Integer accountId;

    private Integer growthValue;

    private Integer score;

    private Integer avaterChange;

    private Integer nicknameChange;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getAccountId() {
        return accountId;
    }

    public void setAccountId(Integer accountId) {
        this.accountId = accountId;
    }

    public Integer getGrowthValue() {
        return growthValue;
    }

    public void setGrowthValue(Integer growthValue) {
        this.growthValue = growthValue;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public Integer getAvaterChange() {
        return avaterChange;
    }

    public void setAvaterChange(Integer avaterChange) {
        this.avaterChange = avaterChange;
    }

    public Integer getNicknameChange() {
        return nicknameChange;
    }

    public void setNicknameChange(Integer nicknameChange) {
        this.nicknameChange = nicknameChange;
    }

    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (that == null) {
            return false;
        }
        if (getClass() != that.getClass()) {
            return false;
        }
        TAccountInfo other = (TAccountInfo) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getAccountId() == null ? other.getAccountId() == null : this.getAccountId().equals(other.getAccountId()))
            && (this.getGrowthValue() == null ? other.getGrowthValue() == null : this.getGrowthValue().equals(other.getGrowthValue()))
            && (this.getScore() == null ? other.getScore() == null : this.getScore().equals(other.getScore()))
            && (this.getAvaterChange() == null ? other.getAvaterChange() == null : this.getAvaterChange().equals(other.getAvaterChange()))
            && (this.getNicknameChange() == null ? other.getNicknameChange() == null : this.getNicknameChange().equals(other.getNicknameChange()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getAccountId() == null) ? 0 : getAccountId().hashCode());
        result = prime * result + ((getGrowthValue() == null) ? 0 : getGrowthValue().hashCode());
        result = prime * result + ((getScore() == null) ? 0 : getScore().hashCode());
        result = prime * result + ((getAvaterChange() == null) ? 0 : getAvaterChange().hashCode());
        result = prime * result + ((getNicknameChange() == null) ? 0 : getNicknameChange().hashCode());
        return result;
    }
}