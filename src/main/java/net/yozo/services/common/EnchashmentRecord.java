package net.yozo.services.common;

import net.yozo.core.dao.QueryModel;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 定制订单的用户评价
 * Created by Vicks on 2017/12/4.
 */
public class EnchashmentRecord extends QueryModel implements Serializable {
    private String id;

    private String no;//订单号

    private Integer accountId;//账户ID

    private String alipayAccount;//支付宝

    private BigDecimal amount;//提现金额

    private Date createdTime;//提现时间

    private String orderId;//支付宝订单

    private static final long serialVersionUID = 1L;

    public void clear() {
        super.clear();
        id=null;
        no=null;
        accountId=null;
        alipayAccount=null;
        amount=null;
        createdTime=null;
    }

    @Override
    public String getId() {
        return id;
    }

    @Override
    public void setId(String id) {
        this.id = id;
    }

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
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

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }
}
