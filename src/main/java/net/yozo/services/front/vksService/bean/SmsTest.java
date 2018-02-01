package net.yozo.services.front.vksService.bean;

import net.yozo.core.dao.page.PagerModel;

import java.sql.Timestamp;

/**
 * Created by Vicks on 2017/8/16.
 */
public class SmsTest extends PagerModel {
    //private int id;
    private String phone;
    private String content;
    private Timestamp sendTime;
    private String type;
    private String returnCode;
    private String sendStatus;

//    public int getId() {
//        return id;
//    }

//    public void setId(int id) {
//        this.id = id;
//    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getSendTime() {
        return sendTime;
    }

    public void setSendTime(Timestamp sendTime) {
        this.sendTime = sendTime;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getReturnCode() {
        return returnCode;
    }

    public void setReturnCode(String returnCode) {
        this.returnCode = returnCode;
    }

    public String getSendStatus() {
        return sendStatus;
    }

    public void setSendStatus(String sendStatus) {
        this.sendStatus = sendStatus;
    }

}
