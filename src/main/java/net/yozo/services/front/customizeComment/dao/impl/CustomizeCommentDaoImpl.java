package net.yozo.services.front.customizeComment.dao.impl;

import net.yozo.core.dao.BaseDao;
import net.yozo.core.dao.page.PagerModel;
import net.yozo.services.common.CustomizeComment;
import net.yozo.services.front.customizeComment.dao.CustomizeCommentDao;
import net.yozo.services.front.designerKpi.bean.DesignerKpi;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Vicks on 2017/12/4.
 */
@Repository
public class CustomizeCommentDaoImpl implements CustomizeCommentDao {
    @Resource
    private BaseDao dao;
    public void setDao(BaseDao dao) {
        this.dao = dao;
    }
    @Override
    public int insert(CustomizeComment customizeComment) {
        return dao.insert("front.customizeComment.insert",customizeComment);
    }

    @Override
    public int delete(CustomizeComment customizeComment) {
        return 0;
    }

    @Override
    public int update(CustomizeComment customizeComment) {
        return 0;
    }

    @Override
    public CustomizeComment selectOne(CustomizeComment customizeComment) {
        return (CustomizeComment)dao.selectOne("front.customizeComment.selectOne",customizeComment);
    }

    @Override
    public PagerModel selectPageList(CustomizeComment customizeComment) {
        return dao.selectPageList("front.customizeComment.selectPageList",
                "front.customizeComment.selectPageCount", customizeComment);
    }

    @Override
    public List<CustomizeComment> selectList(CustomizeComment customizeComment) {
        return null;
    }

    @Override
    public int deleteById(int id) {
        return 0;
    }

    @Override
    public CustomizeComment selectById(String id) {
        return null;
    }

    @Override
    public DesignerKpi calculateDesignerKpi(CustomizeComment cc) {
        return (DesignerKpi)dao.selectOne("front.customizeComment.calculateDesignerKpi",cc);
    }

    @Override
    public Integer countPositive(CustomizeComment cc) {
        return (Integer) dao.selectOne("front.customizeComment.countPositive",cc);
    }

    @Override
    public Integer countComment(CustomizeComment cc) {
        return (Integer) dao.selectOne("front.customizeComment.countComment",cc);
    }
}
