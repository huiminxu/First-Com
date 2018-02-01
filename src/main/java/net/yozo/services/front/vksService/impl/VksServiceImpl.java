package net.yozo.services.front.vksService.impl;

import net.yozo.services.front.vksService.VksService;
import net.yozo.services.front.vksService.dao.SmsTestDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * Created by Vicks on 2017/8/16.
 */
@Repository
public class VksServiceImpl implements VksService{
    @Autowired
    private SmsTestDao std;
    @Override
    public int insertSmsTest(String phone) {
        return std.insertSmsTest(phone);


    }
}
