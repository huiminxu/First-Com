package net.yozo.services.common;

import net.yozo.core.dao.page.PagerModel;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * Created by yozo on 2017-11-22.
 */
public class DesignerKpi extends PagerModel implements Serializable {
    private static final long serialVersionUID = 1L;
    private String id;

    private Integer designerId;//设计师ID

    private Integer finishQty;//完成数量

    private Integer unfinishQty;//未完成数量

    private BigDecimal qualityScore;//品质评分

    private BigDecimal efficiencyScore;//速度评分

    private BigDecimal serviceScore;//服务评分

    private Integer favorableRate;//好评率

    public void clear() {
        super.clear();
        id=null;
        designerId=null;
        finishQty=null;
        unfinishQty=null;
        qualityScore=null;
        efficiencyScore=null;
        serviceScore=null;
        favorableRate=null;
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

    public Integer getFinishQty() {
        return finishQty;
    }

    public void setFinishQty(Integer finishQty) {
        this.finishQty = finishQty;
    }

    public Integer getUnfinishQty() {
        return unfinishQty;
    }

    public void setUnfinishQty(Integer unfinishQty) {
        this.unfinishQty = unfinishQty;
    }

    public BigDecimal getQualityScore() {
        return qualityScore;
    }

    public void setQualityScore(BigDecimal qualityScore) {
        this.qualityScore = qualityScore;
    }

    public BigDecimal getEfficiencyScore() {
        return efficiencyScore;
    }

    public void setEfficiencyScore(BigDecimal efficiencyScore) {
        this.efficiencyScore = efficiencyScore;
    }

    public BigDecimal getServiceScore() {
        return serviceScore;
    }

    public void setServiceScore(BigDecimal serviceScore) {
        this.serviceScore = serviceScore;
    }

    public Integer getFavorableRate() {
        return favorableRate;
    }

    public void setFavorableRate(Integer favorableRate) {
        this.favorableRate = favorableRate;
    }

}
