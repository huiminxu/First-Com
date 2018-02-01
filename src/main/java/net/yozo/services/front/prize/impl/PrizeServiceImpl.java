package net.yozo.services.front.prize.impl;

import net.yozo.core.ServersManager;
import net.yozo.services.common.Prize;
import net.yozo.services.common.Youdian;
import net.yozo.services.front.prize.PrizeService;
import net.yozo.services.front.prize.dao.PrizeDao;
import net.yozo.services.front.youdian.YoudianService;
import net.yozo.services.front.youdian.dao.YoudianDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Vicks on 2017/8/21.
 */
@Service
public class PrizeServiceImpl extends ServersManager<Prize, PrizeDao> implements PrizeService {
    @Autowired
    @Override
    public void setDao(PrizeDao prizeDao) {
        this.dao=prizeDao;

    }


    @Override
    public Prize selectTodayPrize(Prize prize) {
        return dao.selectTodayPrize(prize);
    }
}
