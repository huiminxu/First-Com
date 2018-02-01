package net.yozo.services.front.prize.dao;

import net.yozo.core.DaoManager;
import net.yozo.core.dao.BaseDao;
import net.yozo.services.common.Prize;
import net.yozo.services.common.Youdian;

import javax.annotation.Resource;


/**
 * Created by Vicks on 2017/8/21.
 */
public interface PrizeDao extends DaoManager<Prize> {
    Prize selectTodayPrize(Prize prize);


}
