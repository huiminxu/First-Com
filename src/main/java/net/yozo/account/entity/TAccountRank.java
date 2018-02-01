package net.yozo.account.entity;

import java.io.Serializable;

public class TAccountRank implements Serializable {
    private Integer id;

    private String rank;

    private Integer minvalues;

    private Integer maxvalues;

    private String rankImg;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRank() {
        return rank;
    }

    public void setRank(String rank) {
        this.rank = rank;
    }

    public Integer getMinvalues() {
        return minvalues;
    }

    public void setMinvalues(Integer minvalues) {
        this.minvalues = minvalues;
    }

    public Integer getMaxvalues() {
        return maxvalues;
    }

    public void setMaxvalues(Integer maxvalues) {
        this.maxvalues = maxvalues;
    }

    public String getRankImg() {
        return rankImg;
    }

    public void setRankImg(String rankImg) {
        this.rankImg = rankImg;
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
        TAccountRank other = (TAccountRank) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getRank() == null ? other.getRank() == null : this.getRank().equals(other.getRank()))
            && (this.getMinvalues() == null ? other.getMinvalues() == null : this.getMinvalues().equals(other.getMinvalues()))
            && (this.getMaxvalues() == null ? other.getMaxvalues() == null : this.getMaxvalues().equals(other.getMaxvalues()))
            && (this.getRankImg() == null ? other.getRankImg() == null : this.getRankImg().equals(other.getRankImg()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getRank() == null) ? 0 : getRank().hashCode());
        result = prime * result + ((getMinvalues() == null) ? 0 : getMinvalues().hashCode());
        result = prime * result + ((getMaxvalues() == null) ? 0 : getMaxvalues().hashCode());
        result = prime * result + ((getRankImg() == null) ? 0 : getRankImg().hashCode());
        return result;
    }
}