package net.yozo.services.front.applyEnchashment.dao.impl;

import net.yozo.core.dao.BaseDao;
import net.yozo.core.dao.page.PagerModel;
import net.yozo.services.front.applyEnchashment.bean.ApplyEnchashment;
import net.yozo.services.front.applyEnchashment.dao.ApplyEnchashmentDao;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

@Repository("applyEnchashmentDaoFront")
public class ApplyEnchashmentDaoImpl implements ApplyEnchashmentDao {
    @Resource
    private BaseDao dao;

    public void setDao(BaseDao dao) {
        this.dao = dao;
    }

    public PagerModel selectPageList(ApplyEnchashment e) {
        return dao.selectPageList("front.applyEnchashment.selectPageList",
                "front.applyEnchashment.selectPageCount", e);
    }

    public List selectList(ApplyEnchashment e) {
        return dao.selectList("front.applyEnchashment.selectList", e);
    }

    public ApplyEnchashment selectOne(ApplyEnchashment e) {
        return (ApplyEnchashment) dao.selectOne("front.applyEnchashment.selectOne", e);
    }

    public int delete(ApplyEnchashment e) {
        return dao.delete("front.applyEnchashment.delete", e);
    }

    public int update(ApplyEnchashment e) {
        return dao.update("front.applyEnchashment.update", e);
    }

    public int deletes(String[] ids) {
        ApplyEnchashment e = new ApplyEnchashment();
        for (int i = 0; i < ids.length; i++) {
            e.setId(ids[i]);
            delete(e);
        }
        return 0;
    }

    public int insert(ApplyEnchashment e) {
        return dao.insert("front.applyEnchashment.insert", e);
    }

    public int deleteById(int id) {
        return dao.delete("front.applyEnchashment.deleteById", id);
    }

    @Override
    public ApplyEnchashment selectById(String id) {
        return (ApplyEnchashment) dao.selectOne("front.applyEnchashment.selectById", id);
    }

    public ApplyEnchashment selectRecentApplyByAccId(String accountId){
        return (ApplyEnchashment) dao.selectOne("front.applyEnchashment.selectRecentApplyByAccId", accountId);
    }

}
