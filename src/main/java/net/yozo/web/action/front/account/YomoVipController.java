package net.yozo.web.action.front.account;

import net.yozo.services.common.Youdian;
import net.yozo.services.front.account.bean.Account;
import net.yozo.services.front.order.OrderService;
import net.yozo.services.front.order.bean.Order;
import net.yozo.services.front.youdian.YoudianService;
import net.yozo.web.util.LoginUserHolder;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by t on 2017/11/14.
 */
@Controller
@RequestMapping("/auth/yomo")
public class YomoVipController {
    @Autowired
    private OrderService orderService;
    @Autowired
    private YoudianService youdianService;
    @RequestMapping("/vip")
    public String vip(Order orderWait, Model model,Youdian youdian){
        Account account = LoginUserHolder.getLoginAccount();
        if (account == null || StringUtils.isBlank(account.getId())) {
            return "redirect:/account/login.html";
        }
        String type="6";
        youdian.setId(type);
        youdian=youdianService.selectOne(youdian);
        orderWait.setAccount(account.getId());
        orderWait.setTemplateName(youdian.getItem());
        orderWait.setStatus(Order.status_paysuccess);
        orderWait.setAmount("6.66");//
        Order order2 = orderService.selectYoudianOrder(orderWait);
        if(order2==null){//代表此用户尚未享受过6.6元购买柚会员（1个月）
            model.addAttribute("isFirst","y");
        }else{
            model.addAttribute("isFirst","n");
        }

        return "vip/yomo_vip";
    }
}
