package net.yozo.services.common;

import net.yozo.core.dao.page.PagerModel;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by yozo on 2017-11-22.
 */
public class CustomizeOrder extends PagerModel implements Serializable {
    private static final long serialVersionUID = 1L;
    private String id;//主键

    private Integer cType;//定制类型

    private String cUse;//定制用途

    private BigDecimal price;//定制价格

    private String quantity;//定制数量

    private Date etc;//预计完成日期

    private Date finishTime;//实际完成日期

    private Date editTime;//修改时间

    private Integer creator;//创建人(account_id)

    private Date createdTime;//创建时间

    private String template;//模板作品

    private Integer delayTimes;//延迟付款次数（默认：0）

    private Integer status;//0：创建 1：订单确认 （待上传）2：已上传作品  3：确认付款  4：已完成 5：未上传作品 6：延迟付款

    private String other;//用户的其他需求

    private String customerContact;//用户联系方式

    public void clear() {
        super.clear();
        id=null;
        cType=null;
        cUse=null;
        price=null;
        quantity=null;
        etc=null;
        finishTime=null;
        editTime=null;
        creator=null;
        createdTime=null;
        template=null;
        delayTimes=null;
        status=null;
        other=null;
        customerContact=null;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Integer getcType() {
        return cType;
    }

    public void setcType(Integer cType) {
        this.cType = cType;
    }

    public String getcUse() {
        return cUse;
    }

    public void setcUse(String cUse) {
        this.cUse = cUse;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public Date getEtc() {
        return etc;
    }

    public void setEtc(Date etc) {
        this.etc = etc;
    }

    public Date getFinishTime() {
        return finishTime;
    }

    public void setFinishTime(Date finishTime) {
        this.finishTime = finishTime;
    }

    public Date getEditTime() {
        return editTime;
    }

    public void setEditTime(Date editTime) {
        this.editTime = editTime;
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

    public String getTemplate() {
        return template;
    }

    public void setTemplate(String template) {
        this.template = template;
    }

    public Integer getDelayTimes() {
        return delayTimes;
    }

    public void setDelayTimes(Integer delayTimes) {
        this.delayTimes = delayTimes;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getOther() {
        return other;
    }

    public void setOther(String other) {
        this.other = other;
    }

    public String getCustomerContact() {
        return customerContact;
    }

    public void setCustomerContact(String customerContact) {
        this.customerContact = customerContact;
    }
}
