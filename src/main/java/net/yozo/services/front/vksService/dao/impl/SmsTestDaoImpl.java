package net.yozo.services.front.vksService.dao.impl;

import net.yozo.core.dao.BaseDao;
import net.yozo.services.front.vksService.dao.SmsTestDao;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;

/**
 * Created by Vicks on 2017/8/16.
 */
@Repository
public class SmsTestDaoImpl implements SmsTestDao{
    @Resource
    private BaseDao dao;
    @Override
    public int insertSmsTest(String phone) {
        return dao.insert("front.vksService.insertSmsTest",phone);
    }
}
