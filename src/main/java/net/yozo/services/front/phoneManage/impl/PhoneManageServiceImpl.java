package net.yozo.services.front.phoneManage.impl;

import net.yozo.services.front.phoneManage.PhoneManageService;
import net.yozo.services.front.phoneManage.dao.PhoneManageDao;
import net.yozo.services.front.sms.bean.Sms;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * Created by Vicks on 2017/8/21.
 */
@Repository
public class PhoneManageServiceImpl implements PhoneManageService {
    @Autowired
    private PhoneManageDao pmd;
    @Override
    public String sendVerification(Sms sms) {
        return pmd.sendVerification(sms);

    }
}
