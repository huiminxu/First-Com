package net.yozo.services.common;

import net.yozo.core.dao.page.PagerModel;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 定制订单的用户评价
 * Created by Vicks on 2017/12/4.
 */
public class ApplyEnchashment extends PagerModel implements Serializable {
    private String id;

    private Integer accountId;//用户ID

    private String alipayAccount;//用户支付宝

    private Integer auditStatus;//审核状态 0:提交审核 1：审核通过 2：审核不通过

    private Date auditTime;//审核时间

    private Integer adminId;//管理员ID

    private String rejectReason;//驳回理由

    private BigDecimal amount;//提现金额

    private Date applyTime;//申请时间

    private Integer isDelete;//是否删除 0:未删除 1：已删除

    private Integer transferStatus;//转账状态 0:默认 1：转账中

    private static final long serialVersionUID = 1L;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Integer getAccountId() {
        return accountId;
    }

    public void setAccountId(Integer accountId) {
        this.accountId = accountId;
    }

    public String getAlipayAccount() {
        return alipayAccount;
    }

    public void setAlipayAccount(String alipayAccount) {
        this.alipayAccount = alipayAccount;
    }

    public Integer getAuditStatus() {
        return auditStatus;
    }

    public void setAuditStatus(Integer auditStatus) {
        this.auditStatus = auditStatus;
    }

    public Date getAuditTime() {
        return auditTime;
    }

    public void setAuditTime(Date auditTime) {
        this.auditTime = auditTime;
    }

    public Integer getAdminId() {
        return adminId;
    }

    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }

    public String getRejectReason() {
        return rejectReason;
    }

    public void setRejectReason(String rejectReason) {
        this.rejectReason = rejectReason;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public Date getApplyTime() {
        return applyTime;
    }

    public void setApplyTime(Date applyTime) {
        this.applyTime = applyTime;
    }

    public Integer getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }

    public Integer getTransferStatus() {
        return transferStatus;
    }

    public void setTransferStatus(Integer transferStatus) {
        this.transferStatus = transferStatus;
    }
}
