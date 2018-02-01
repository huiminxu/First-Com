package net.yozo.services.front.customizeComment;

import net.yozo.core.Services;
import net.yozo.services.common.CustomizeComment;
import net.yozo.services.front.designerKpi.bean.DesignerKpi;

import java.math.BigDecimal;

/**
 * Created by Vicks on 2017/12/4.
 */
public interface CustomizeCommentService extends Services<CustomizeComment> {
    DesignerKpi calculateDesignerKpi(CustomizeComment cc);
    Integer calculatePositivePercentage(CustomizeComment cc);
}
