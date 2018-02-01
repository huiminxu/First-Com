package net.yozo.interceptor;

import net.yozo.account.entity.TAccount;
import net.yozo.account.entity.TAccountInfo;
import net.yozo.account.mapper.ext.TAccountExtMapper;
import net.yozo.account.mapper.ext.TAccountInfoExtMapper;
import net.yozo.core.FrontContainer;
import net.yozo.core.util.ConfigUtil;
import net.yozo.services.front.account.AccountService;
import net.yozo.services.front.account.bean.Account;
import org.apache.commons.lang.StringUtils;
import org.jasig.cas.client.authentication.AttributePrincipal;
import org.jasig.cas.client.validation.Cas20ProxyReceivingTicketValidationFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.Map;

/**
 * Created by t on 2017/10/12.
 */
@Component
public class UserInterceptor implements HandlerInterceptor {

    private Cas20ProxyReceivingTicketValidationFilter casValidationFilter;
    @Autowired
    private AccountService accountService;

    /**
     * 在请求处理之前执行，该方法主要是用于准备资源数据的，然后可以把它们当做请求属性放到WebRequest中
     */
    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response, Object handler) throws Exception {
        AttributePrincipal principal = (AttributePrincipal) request.getUserPrincipal();
//        if (principal != null && request.getSession().getAttribute(FrontContainer.USER_INFO) == null ||
//                (principal != null && request.getSession().getAttribute(FrontContainer.USER_INFO) != null &&
//                !principal.getAttributes().get("userId").equals(((Account)request.getSession().getAttribute(FrontContainer.USER_INFO)).getId()))){
        if (principal != null && principal.getAttributes().size() != 0 && request.getSession().getAttribute(FrontContainer.USER_INFO) == null){
            Map attributes = principal.getAttributes();
            Account account = new Account();
            account.setId(attributes.get("userId").toString());
            account = accountService.selectById(attributes.get("userId").toString());
            account.setScore(attributes.get("score")==null?0:Integer.valueOf(attributes.get("score").toString()));
            request.getSession().setAttribute(FrontContainer.USER_INFO, account);

        }else if (principal != null && request.getSession().getAttribute(FrontContainer.USER_INFO) == null && principal.getAttributes().size() ==0){
            response.sendRedirect(ConfigUtil.getString("cas.casServerUrlPrefix","http://www.yomoer.cn/cas")
                    +"/logout?service="+request.getRequestURL());
        } else{
                if (StringUtils.isNotEmpty(request.getParameter("authRrl"))){
//                String url = URLDecoder.decode(request.getParameter("authRrl"),"utf-8");
//                response.sendRedirect("/auth/cas?url=/"+ request.getParameter("authRrl")+"/");
                    String url = request.getParameter("authRrl").replaceAll("]", "&");
                    request.getSession().setAttribute("authRrl",url);
                    response.sendRedirect(ConfigUtil.getString("website.url", "http://www.yomoer.cn/cas") + "/auth/cas");
                  }
        }

        return true;
    }

    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
//        /** 删除session里的值 */       HttpCommonMethod.clearSessionKey(Constants.WZ_BIND_INFO,httpServletRequest);
    }

    public Cas20ProxyReceivingTicketValidationFilter getCasValidationFilter() {
        return casValidationFilter;
    }

    public void setCasValidationFilter(Cas20ProxyReceivingTicketValidationFilter casValidationFilter) {
        this.casValidationFilter = casValidationFilter;
    }

}
