package net.yozo.services.common;

import net.yozo.core.dao.QueryModel;
import net.yozo.core.dao.page.PagerModel;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by yozo on 2017-11-22.
 */
public class Designer extends QueryModel implements Serializable {
    private static final long serialVersionUID = 1L;
    private String id;//主键

    private String realname;//姓名

    private String tel;//电话号码

    private String idNumber;//身份证号码

    private String idPicFront;//身份证照片（正面）

    private String idPicBack;//身份证照片（背面）

    private String qq;//qq

    private String resume;//个人简介

    private String sample;//样稿

    private String poa;//授权书

    private Integer auditStatus;//审核状态 0:未审核 1：审核通过 2：审核驳回

    private String auditOpinion;//审核意见

    private Integer auditor;//审核人(t_user外键)

    private Integer accountId;//申请人

    private Date createdTime;//申请时间

    private Byte isDeleted;//删除状态：0:未删除 1：删除

    private Integer status;//状态：0：空闲 1：忙

    private Date auditTime;//审核日期

    public void clear() {
        super.clear();
        id=null;
        realname=null;
        tel=null;
        idNumber=null;
        idPicFront=null;
        idPicBack=null;
        qq=null;
        resume=null;
        sample=null;
        poa=null;
        auditStatus=null;
        auditOpinion=null;
        accountId=null;
        createdTime=null;
        isDeleted=null;
        status=null;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getIdNumber() {
        return idNumber;
    }

    public void setIdNumber(String idNumber) {
        this.idNumber = idNumber;
    }

    public String getIdPicFront() {
        return idPicFront;
    }

    public void setIdPicFront(String idPicFront) {
        this.idPicFront = idPicFront;
    }

    public String getIdPicBack() {
        return idPicBack;
    }

    public void setIdPicBack(String idPicBack) {
        this.idPicBack = idPicBack;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public String getResume() {
        return resume;
    }

    public void setResume(String resume) {
        this.resume = resume;
    }

    public String getSample() {
        return sample;
    }

    public void setSample(String sample) {
        this.sample = sample;
    }

    public String getPoa() {
        return poa;
    }

    public void setPoa(String poa) {
        this.poa = poa;
    }

    public Integer getAuditStatus() {
        return auditStatus;
    }

    public void setAuditStatus(Integer auditStatus) {
        this.auditStatus = auditStatus;
    }

    public String getAuditOpinion() {
        return auditOpinion;
    }

    public void setAuditOpinion(String auditOpinion) {
        this.auditOpinion = auditOpinion;
    }

    public Integer getAuditor() {
        return auditor;
    }

    public void setAuditor(Integer auditor) {
        this.auditor = auditor;
    }

    public Integer getAccountId() {
        return accountId;
    }

    public void setAccountId(Integer accountId) {
        this.accountId = accountId;
    }

    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    public Byte getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(Byte isDeleted) {
        this.isDeleted = isDeleted;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getAuditTime() {
        return auditTime;
    }

    public void setAuditTime(Date auditTime) {
        this.auditTime = auditTime;
    }

}
