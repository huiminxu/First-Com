package net.yozo.services.front.youdian.impl;

import net.yozo.core.ServersManager;
import net.yozo.services.common.Youdian;
import net.yozo.services.front.phoneManage.PhoneManageService;
import net.yozo.services.front.phoneManage.dao.PhoneManageDao;
import net.yozo.services.front.sms.bean.Sms;
import net.yozo.services.front.youdian.YoudianService;
import net.yozo.services.front.youdian.dao.YoudianDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

/**
 * Created by Vicks on 2017/8/21.
 */
@Service
public class YoudianServiceImpl extends ServersManager<Youdian, YoudianDao> implements YoudianService {
    @Autowired
    @Override
    public void setDao(YoudianDao youdianDao) {
        this.dao = youdianDao;
    }
}
