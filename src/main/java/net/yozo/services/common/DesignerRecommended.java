package net.yozo.services.common;

import net.yozo.core.dao.page.PagerModel;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by yozo on 2017-11-22.
 */
public class DesignerRecommended extends PagerModel implements Serializable {
    private static final long serialVersionUID = 1L;
    private String id;

    private Integer designerId;//设计师ID

    private Integer sort;//显示排序

    private Integer creator;//创建人

    private Date createdTime;//创建时间

    public void clear() {
        super.clear();
        id=null;
        designerId=null;
        sort=null;
        creator=null;
        createdTime=null;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Integer getDesignerId() {
        return designerId;
    }

    public void setDesignerId(Integer designerId) {
        this.designerId = designerId;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
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



}
