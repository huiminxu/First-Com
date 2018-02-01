package net.yozo.web.action.front.customizeOrder;

import net.yozo.core.FrontContainer;
import net.yozo.core.util.DateTimeUtil;
import net.yozo.services.RedisService;

import net.yozo.services.front.account.bean.Account;
import net.yozo.services.front.customizeOrder.CustomizeOrderService;
import net.yozo.services.front.customizeOrder.bean.CustomizeOrder;
import net.yozo.services.front.designerKpi.DesignerKpiService;
import net.yozo.services.front.designerKpi.bean.DesignerKpi;
import net.yozo.services.front.order.OrderService;
import net.yozo.services.front.order.bean.Order;
import net.yozo.services.front.pay.PayService;
import net.yozo.web.action.front.FrontBaseController;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 定制需求
 * Created by emily.lee on 2017/12/7.
 */
@Controller
//@RequestMapping("/auth/designer/customize")
@RequestMapping("/auth/designer/customize")
public class CustomizeOrderAction extends FrontBaseController<CustomizeOrder> {
    @Autowired
    private CustomizeOrderService customizeOrderService;
    @Autowired
    private RedisService redisService;
    @Autowired
    private PayService payService;
    @Autowired
    private RedisTemplate<String, String> redisTemplate;
    @Autowired
    private OrderService orderService;
    @Autowired
    private DesignerKpiService designerKpiService;
    @Override
    public CustomizeOrderService getService() {
        return customizeOrderService;
    }

    /**
     * 订单支付页面
     * @return
     */
    @RequestMapping("/pay")
    public String pay(HttpServletRequest request,ModelMap model){
        String orderId = request.getParameter("id");
        if (StringUtils.isNotEmpty(orderId)){
            Order orderQuery = new Order();
            orderQuery.setCustomizeId(Integer.valueOf(orderId));
            orderQuery.setStatus(Order.status_paysuccess);
            orderQuery.setType(1);
            // 如果订单已支付 - 提示信息：订单不存在，请联系设计师
            if (orderService.selectCustomizeOrder(orderQuery) != null){
                model.put("errorMsg","該定制订单已经被购买，不能重复购买。");
                return "designer/customizePay";
            }
            Account account = getLoginAccount();
            CustomizeOrder customizeOrder = new CustomizeOrder();
            customizeOrder.setId(orderId);
            customizeOrder = customizeOrderService.selectOne(customizeOrder);
            if (customizeOrder == null){
                model.put("errorMsg","订单不存在，请联系设计师。");
                return "designer/customizePay";
            }
            String orderNum = redisService.numberGenerator("CU");
            Order order = new Order();
            order.setOrderNum("CU"+orderNum+"."+customizeOrder.getId()+"."+account.getId());
            order.setType(1); // 1:定制订单
            if(customizeOrder.getcType() == 110){
                order.setTemplateName("柚墨-定制Excel模板");
            }else if (customizeOrder.getcType() == 121){
                order.setTemplateName("柚墨-定制AE模板");
            }else if(customizeOrder.getcType() == 125){
                order.setTemplateName("柚墨-定制表情包");
            }else if(customizeOrder.getcType() == 144){
                order.setTemplateName("柚墨-定制PPT模板");
            }else if(customizeOrder.getcType() == 145){
                order.setTemplateName("柚墨-定制WORD模板");
            }
            order.setAmount(customizeOrder.getPrice()+"");
            order.setType(1);
            order.setStatus(Order.status_waitforpay);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            order.setCreateTime(DateTimeUtil.getDateTimeString(new Date()));
            order.setAccount(account.getId());
//            orderService.insert(order);
            //获得微信二维码地址
            String wx = payService.getWeixinQR(order);
            model.addAttribute("wx", wx);
            //获得支付宝二维码
            String zfb = payService.getZhifubaoQR(order);
            model.addAttribute("zfb", zfb);
            model.addAttribute("order",order);
            model.addAttribute("customizeOrder",customizeOrder);
        }
        return "designer/customizePay";
    }
    //我是用户-确认/推迟订单
    @RequestMapping("/changeStatus")
    @ResponseBody
    public String confirmOrder(HttpServletRequest request){
        String customizeOrderID=request.getParameter("coid");
        String option=request.getParameter("opt");
        CustomizeOrder customizeOrder=new CustomizeOrder();
        customizeOrder.setId(customizeOrderID);
        if("confirm".equals(option)){
            customizeOrder.setStatus(CustomizeOrder.CUSTORDER_SUCCESS);
            customizeOrder.setFinishTime(new Date());
            customizeOrderService.update(customizeOrder);
            String designerID=request.getParameter("did");
            DesignerKpi designerKpi=new DesignerKpi();
            designerKpi.setDesignerId(Integer.parseInt(designerID));
            designerKpi=designerKpiService.selectOne(designerKpi);
            designerKpi.setFinishQty(designerKpi.getFinishQty()+1);//完成数加1
            designerKpi.setUnfinishQty(designerKpi.getUnfinishQty()-1);//未完成数减1
            designerKpiService.update(designerKpi);
            return  "3";
        }else if("delay".equals(option)){
            customizeOrder=customizeOrderService.selectById(customizeOrderID);
            if(customizeOrder.getDelayTimes()!=1){
                Date newETC=org.apache.commons.lang.time.DateUtils.addDays(customizeOrder.getEtc(),7);//新的截止日期
                customizeOrder.setEtc(newETC);
                customizeOrder.setStatus(CustomizeOrder.CUSTORDER_DELAY);
                customizeOrder.setDelayTimes(1);
                customizeOrderService.update(customizeOrder);
                return newETC.toString();
            }
        }
        return null;
        //return "forward:/auth/account/customizations/imuser";
    }
}
