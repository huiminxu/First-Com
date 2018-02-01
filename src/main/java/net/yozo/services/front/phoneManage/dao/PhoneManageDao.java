package net.yozo.services.front.phoneManage.dao;

import net.yozo.services.front.sms.bean.Sms;

/**
 * Created by Vicks on 2017/8/21.
 */
public interface PhoneManageDao {
    String sendVerification(Sms sms);

}
