package net.yozo.services.front.customizeComment.dao;

import net.yozo.core.DaoManager;
import net.yozo.services.common.CustomizeComment;
import net.yozo.services.front.designerKpi.bean.DesignerKpi;

/**
 * Created by Vicks on 2017/12/4.
 */
public interface CustomizeCommentDao extends DaoManager<CustomizeComment> {
    DesignerKpi calculateDesignerKpi(CustomizeComment cc);
    Integer countPositive(CustomizeComment cc);
    Integer countComment(CustomizeComment cc);
}
