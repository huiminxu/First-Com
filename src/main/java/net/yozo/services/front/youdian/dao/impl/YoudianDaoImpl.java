package net.yozo.services.front.youdian.dao.impl;


import net.yozo.core.dao.BaseDao;
import net.yozo.core.dao.page.PagerModel;
import net.yozo.services.common.Youdian;
import net.yozo.services.front.youdian.dao.YoudianDao;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;


/**
 * Created by Vicks on 2017/8/21.
 */
@Repository
public class YoudianDaoImpl implements YoudianDao {
    @Resource
    private BaseDao dao;
    public void setDao(BaseDao dao) {
        this.dao = dao;
    }

    @Override
    public int insert(Youdian youdian) {
        return 0;
    }

    @Override
    public int delete(Youdian youdian) {
        return 0;
    }

    @Override
    public int update(Youdian youdian) {
        return 0;
    }

    @Override
    public Youdian selectOne(Youdian youdian) {
        return (Youdian) dao.selectOne("front.youdian.selectOne", youdian);
    }

    @Override
    public PagerModel selectPageList(Youdian youdian) {
        return null;
    }

    @Override
    public List<Youdian> selectList(Youdian youdian) {
        return null;
    }

    @Override
    public int deleteById(int id) {
        return 0;
    }

    @Override
    public Youdian selectById(String id) {
        return null;
    }
}
