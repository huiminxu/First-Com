package net.yozo.services.front.customizeComment.impl;

import net.yozo.core.ServersManager;
import net.yozo.core.dao.page.PagerModel;
import net.yozo.services.common.CustomizeComment;
import net.yozo.services.front.customizeComment.CustomizeCommentService;
import net.yozo.services.front.customizeComment.dao.CustomizeCommentDao;
import net.yozo.services.front.designerKpi.bean.DesignerKpi;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

/**
 * Created by Vicks on 2017/12/4.
 */
@Service
public class CustomizeCommentServiceImpl extends ServersManager<CustomizeComment, CustomizeCommentDao> implements CustomizeCommentService {
    @Autowired
    @Override
    public void setDao(CustomizeCommentDao customizeCommentDao) {this.dao=customizeCommentDao;
    }

    @Override
    public PagerModel selectPageList(CustomizeComment customizeComment) {
        PagerModel pager=dao.selectPageList(customizeComment);
        if(pager!=null){//将用户名改为X**Y的格式
            String nickname=null;
            List<CustomizeComment> list=pager.getList();
            for (CustomizeComment o:list) {
                nickname=o.getNickname();
                o.setNickname(nickname.substring(0,1)+"***"+nickname.substring(nickname.length()-1));
            }
        }
        return pager;
    }

    @Override
    public DesignerKpi calculateDesignerKpi(CustomizeComment cc) {
        return dao.calculateDesignerKpi(cc);
    }

    @Override
    public Integer calculatePositivePercentage(CustomizeComment cc) {
        int countPositive=dao.countPositive(cc);
        int countComment=dao.countComment(cc);
        return countPositive*100/countComment;
    }
}
