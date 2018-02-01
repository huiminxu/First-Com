package net.yozo.services.front.prize;

import net.yozo.core.Services;
import net.yozo.services.common.Prize;
import net.yozo.services.common.Youdian;


/**
 * Created by Vicks on 2017/8/21.
 */
public interface PrizeService extends Services<Prize> {
      Prize selectTodayPrize(Prize prize);


}
