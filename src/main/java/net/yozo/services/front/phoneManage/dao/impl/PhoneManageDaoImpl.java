package net.yozo.services.front.phoneManage.dao.impl;

import net.yozo.core.sms.Client;
import net.yozo.core.sms.SMSWebChinese;
import net.yozo.services.front.phoneManage.dao.PhoneManageDao;
import net.yozo.services.front.sms.bean.Sms;
import org.springframework.stereotype.Repository;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

/**
 * Created by Vicks on 2017/8/21.
 */
@Repository
public class PhoneManageDaoImpl implements PhoneManageDao{


    //发送短信验证码
    @Override
    public String sendVerification(Sms sms) {
        Client client= null;
        try {
            client = new Client("SDK-WSS-010-02425","6%-a1e3-");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        String returnCode=client.mt(sms.getPhone(),sms.getContent(),"","","");
        return  returnCode;
    }
}
