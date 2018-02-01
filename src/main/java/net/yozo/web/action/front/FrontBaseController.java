package net.yozo.web.action.front;

import net.yozo.core.FrontContainer;
import net.yozo.core.Services;
import net.yozo.core.dao.page.PagerModel;
import net.yozo.core.front.SystemManager;
import net.yozo.services.front.account.bean.Account;
import net.yozo.web.action.front.orders.CartInfo;
import net.yozo.web.util.LoginUserHolder;
import net.yozo.web.util.RequestHolder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * Created by dylan on 15-3-17.
 */
@Controller
public abstract class FrontBaseController<E extends PagerModel> {
    protected Logger logger = LoggerFactory.getLogger(getClass());
    public abstract Services<E> getService();
    protected static final String page_toLogin = "/account/login.html";
    protected static final String page_toLoginRedirect = "redirect:/account/login.html";

    @Autowired
    protected SystemManager systemManager;

    protected Account getLoginAccount(){
        return LoginUserHolder.getLoginAccount();
    }

    protected CartInfo getMyCart(){
        return (CartInfo) RequestHolder.getSession().getAttribute(FrontContainer.myCart);
    }


    /**
     * 查询分页信息列表
     */
    protected <X extends PagerModel> PagerModel selectPageList(Services<X> service, X model) throws Exception {
        int offset = 0;//分页偏移量
        if (RequestHolder.getRequest().getParameter("pager.offset") != null) {
            offset = Integer
                    .parseInt(RequestHolder.getRequest().getParameter("pager.offset"));
        }
        if (offset < 0)
            offset = 0;
        model.setOffset(offset);
        PagerModel pager = service.selectPageList(model);
        if (pager == null) {
            pager = new PagerModel();
        }
        int pagersize= pager.getTotal() % model.getPageSize()==0?pager.getTotal() / model.getPageSize():pager.getTotal() / model.getPageSize()+1;
        // 计算总页数
        pager.setPagerSize(pagersize);
        pager.setPageSize(model.getPageSize());
        pager.setOffset(offset);
        return pager;
    }



}
