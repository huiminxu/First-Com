package net.yozo.services.front.prize.dao.impl;


import net.yozo.core.dao.BaseDao;
import net.yozo.core.dao.page.PagerModel;
import net.yozo.services.common.Prize;
import net.yozo.services.common.Youdian;
import net.yozo.services.front.prize.dao.PrizeDao;
import net.yozo.services.front.youdian.dao.YoudianDao;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;


/**
 * Created by Vicks on 2017/8/21.
 */
@Repository
public class PrizeImpl implements PrizeDao {
    @Resource
    private BaseDao dao;
    public void setDao(BaseDao dao) {
        this.dao = dao;
    }


    @Override
    public int insert(Prize prize) {
        return dao.insert("front.prize.insert", prize);
    }

    @Override
    public int delete(Prize prize) {
        return 0;
    }

    @Override
    public int update(Prize prize) {
        return 0;
    }

    @Override
    public Prize  selectOne(Prize prize) {
        return null;
    }

    @Override
    public PagerModel selectPageList(Prize prize) {
        return null;
    }

    @Override
    public List<Prize > selectList(Prize prize) {
        return dao.selectList("front.prize.selectList", prize);
    }

    @Override
    public int deleteById(int id) {
        return 0;
    }

    @Override
    public Prize selectById(String id) {
        return null;
    }

    @Override
    public Prize selectTodayPrize(Prize prize) {
        return (Prize) dao.selectOne("front.prize.selectTodayPrize",prize);
    }

}
