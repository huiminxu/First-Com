package net.yozo.services.common;

import net.yozo.core.dao.page.PagerModel;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by yozo on 2017-11-22.
 */
public class BankAccount extends PagerModel implements Serializable {
    private static final long serialVersionUID = 1L;
    private String id;//主键

    private Integer accountId;//账户ID

    private String bankAccount;//银行账户

    private String securityPhone;//安全手机号

    private Integer status;//状态 0:正常 1：解绑

    private String bankName;//金融机构名：例如:支付宝

    private Date bindTime;//绑定时间

    public void clear() {
        super.clear();
        id=null;
        accountId=null;
        bankAccount=null;
        securityPhone=null;
        status=null;
        bankName=null;
        bindTime=null;
    }

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

    public String getBankAccount() {
        return bankAccount;
    }

    public void setBankAccount(String bankAccount) {
        this.bankAccount = bankAccount;
    }

    public String getSecurityPhone() {
        return securityPhone;
    }

    public void setSecurityPhone(String securityPhone) {
        this.securityPhone = securityPhone;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getBankName() {
        return bankName;
    }

    public void setBankName(String bankName) {
        this.bankName = bankName;
    }

    public Date getBindTime() {
        return bindTime;
    }

    public void setBindTime(Date bindTime) {
        this.bindTime = bindTime;
    }
}
