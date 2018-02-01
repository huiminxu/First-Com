package net.yozo.account.entity;

import java.io.Serializable;

public class TAccountLevel implements Serializable {
    private Integer id;

    private Integer level;

    private Integer minvalues;

    private Integer maxvalues;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
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
        TAccountLevel other = (TAccountLevel) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getLevel() == null ? other.getLevel() == null : this.getLevel().equals(other.getLevel()))
            && (this.getMinvalues() == null ? other.getMinvalues() == null : this.getMinvalues().equals(other.getMinvalues()))
            && (this.getMaxvalues() == null ? other.getMaxvalues() == null : this.getMaxvalues().equals(other.getMaxvalues()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getLevel() == null) ? 0 : getLevel().hashCode());
        result = prime * result + ((getMinvalues() == null) ? 0 : getMinvalues().hashCode());
        result = prime * result + ((getMaxvalues() == null) ? 0 : getMaxvalues().hashCode());
        return result;
    }
}