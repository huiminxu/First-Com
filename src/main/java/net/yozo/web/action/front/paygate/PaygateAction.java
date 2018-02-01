package net.yozo.web.action.front.paygate;

import com.alipay.api.AlipayApiException;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.demo.trade.config.Configs;
import com.google.zxing.MultiFormatWriter;
import net.sf.json.JSONObject;
import net.yozo.account.dto.AccountInfo;
import net.yozo.account.service.AccountInfoService;
import net.yozo.core.FrontContainer;
import net.yozo.core.front.SystemManager;
import net.yozo.core.wxpay.sdk.WXPay;
import net.yozo.core.wxpay.sdk.WXPayConfig;
import net.yozo.core.wxpay.sdk.WXPayUtil;
import net.yozo.core.wxpay.test.WXPayConfigImpl;
import net.yozo.services.common.Orderpay;
import net.yozo.services.common.Result;
import net.yozo.services.common.Youdian;
import net.yozo.services.front.account.AccountService;
import net.yozo.services.front.account.bean.Account;
import net.yozo.services.front.customizeOrder.CustomizeOrderService;
import net.yozo.services.front.customizeOrder.bean.CustomizeOrder;
import net.yozo.services.front.designerKpi.DesignerKpiService;
import net.yozo.services.front.designerKpi.bean.DesignerKpi;
import net.yozo.services.front.order.OrderService;
import net.yozo.services.front.order.bean.Order;
import net.yozo.services.front.orderpay.OrderpayService;
import net.yozo.services.front.ordership.OrdershipService;
import net.yozo.services.front.ordership.bean.Ordership;
import net.yozo.services.front.scoreDetail.ScoreDetailService;
import net.yozo.services.front.template.TemplateService;
import net.yozo.services.front.template.bean.Template;
import net.yozo.services.front.youdian.YoudianService;
import net.yozo.web.util.FormDateReportConvertor;
import net.yozo.web.util.LoginUserHolder;
import net.yozo.web.util.MD5Facade;
import net.yozo.web.util.RequestHolder;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import sun.misc.Request;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.math.BigDecimal;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLDecoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @author joey
 * @date 16/2/18 22:58
 * Email: dinguangx@163.com
 */
@Controller("frontPaygateAction")

public class PaygateAction{
    private Logger logger = LoggerFactory.getLogger(getClass());
    private static SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    @Autowired
    SystemManager systemManager;
    @Autowired
    private AccountService accountService;
    @Autowired
    private TemplateService templateService;//商品服务
    @Autowired
    private OrderService orderService;
    @Autowired
    private OrdershipService ordershipService;
    @Autowired
    private OrderpayService orderpayService;
    @Autowired
    private YoudianService youdianService;
    @Autowired
    private ScoreDetailService scoreDetailService;
    @Autowired
    private AccountInfoService accountInfoService;
    @Autowired
    private CustomizeOrderService customizeOrderService;
    @Autowired
    private DesignerKpiService designerKpiService;
    @RequestMapping("paygate/pay")
    public String pay(String orderId,   ModelMap modelMap,HttpServletRequest request ) {
        Order order = orderService.selectById(orderId);
        Account acc = LoginUserHolder.getLoginAccount();
        AccountInfo accountInfo=accountInfoService.selectByAccount(Integer.parseInt(acc.getId()));

        if("y".equals(request.getParameter("flag"))){//订单已存在
            if("success".equals(order.getStatus())){//已支付
                modelMap.addAttribute("orderStatus","already");
                modelMap.addAttribute("templateId",order.getTemplateId());
            }else{
                //未支付
                modelMap.addAttribute("orderStatus","notpaid");
            }
        }else {
            //刚生成的现金支付订单
           /* if(order.getPayType()==order.paytype_xianjin){
                Orderpay orderpay = orderpayService.selectById(orderPayId);
                if (orderpay == null) {
                    throw new NullPointerException("根据订单号查询不到支付信息！");
                }
            }*/
        }

        //        RequestHolder.getRequest().setAttribute("payInfo", payInfo);
        modelMap.addAttribute("orderId", order.getId());
        modelMap.addAttribute("orderNum", order.getOrderNum());
        modelMap.addAttribute("totalScore", accountInfo.getScore());

        //现金支付，对t_orderpay的额外操作
       /* if(order.getPayType()==order.paytype_xianjin){
            order.setOrderpayID(orderPayId);
            PayInfo payInfo = createPayInfo(order, null);
            modelMap.addAttribute("payInfo", payInfo);
            String paygateType = systemManager.getProperty("paygate.type");
            if("alipay".equalsIgnoreCase(paygateType)) {
                return "paygate/alipay/alipayapi";
            }
        }*/

        String downScore=null;
        String jifen=order.getAmount();
        downScore= jifen.substring(0,jifen.indexOf("."));//积分需取整
        modelMap.addAttribute("downScore", downScore);
        return "paygate/dummy/pay";
        //return "paygate/alipay/alipayapi";
    }
    /**
     * 创建支付宝的付款信息对象
     * @param order
     */
    private PayInfo createPayInfo(Order order,Ordership ordership) {
        if(order==null ){
            throw new NullPointerException("参数不能为空！请求非法！");
        }

        PayInfo payInfo = new PayInfo();
        //payInfo.setWIDseller_email(ordership.getPhone());
        String www = SystemManager.getInstance().getSystemSetting().getWww();

        /**
         * 解决由于本地和线上正式环境提交相同的商户订单号导致支付宝出现TRADE_DATA_MATCH_ERROR错误的问题。
         * 本地提交的商户订单号前缀是test开头，正式环境提交的就是纯粹的支付订单号
         */
        if(www.startsWith("http://127.0.0.1") || www.startsWith("http://localhost")){
            payInfo.setWIDout_trade_no("test"+order.getOrderpayID());
        }else{
            payInfo.setWIDout_trade_no(order.getId());
        }
        payInfo.setWIDsubject(order.getProductName());

        payInfo.setWIDprice(Double.valueOf(order.getAmount()));
        payInfo.setWIDbody(order.getRemark());
//		payInfo.setShow_url(SystemManager.systemSetting.getWww()+"/product/"+payInfo.getWIDout_trade_no()+".html");
        payInfo.setShow_url(SystemManager.getInstance().getSystemSetting().getWww()+"/order/orderInfo.html?id="+order.getId());
     /*   payInfo.setWIDreceive_name(ordership.getShipname());
        payInfo.setWIDreceive_address(ordership.getShipaddress());
        payInfo.setWIDreceive_zip(ordership.getZip());
        payInfo.setWIDreceive_phone(ordership.getTel());
        payInfo.setWIDreceive_mobile(ordership.getPhone());*/
        payInfo.setWIDsubject(order.getRemark());

       // payInfo.setLogistics_fee(Double.valueOf(order.getFee()));
       // payInfo.setLogistics_type(order.getExpressCode());

        logger.debug(payInfo.toString());
        return payInfo;
    }

    @RequestMapping("paygate/dummyPay")
    @ResponseBody
    public String dummyPay(String orderId){

        return "{\"success\":1}";
    }
    //积分兑换
    @RequestMapping("auth/paygate/scorepay")
    public String scorepay(HttpServletRequest request,  ModelMap modelMap) {
        Account acc = LoginUserHolder.getLoginAccount();
        if(acc==null || StringUtils.isBlank(acc.getId())){
            return ("/account/login");
        }

        String orderId = request.getParameter("orderId");
        Order order = orderService.selectById(orderId);
        if(order == null) {
            throw new NullPointerException("根据订单号查询不到订单信息！");
        }
        String result=scoreDetailService.reduceScoreAllOperations(order);
        if("fail".equals(result)){
            modelMap.addAttribute("failMsg","您的积分不足");
            modelMap.addAttribute("orderStatus","fail");
            return "paygate/dummy/pay";
        }
        // 全额支付
        order.setStatus(Order.status_paysuccess);
        orderService.update(order);
        Template template = templateService.selectById(order.getTemplateId()+"");
        templateService.updateSellCount(template);

        modelMap.addAttribute("orderStatus","success");
        RequestHolder.getSession().setAttribute(FrontContainer.USER_INFO, acc);//更新session中的账号信息
        return "paygate/dummy/pay";
    }

    //柚点支付页面
    @RequestMapping("auth/paygate/youdianpay")
    public String youdianpay(HttpServletRequest request,  ModelMap modelMap) {
        Account acc = LoginUserHolder.getLoginAccount();
        if(acc==null || StringUtils.isBlank(acc.getId())){
            return ("/account/login");
        }
        String orderNum=request.getParameter("orderNum");
        Order order=orderService.selectByOrderNum(orderNum);
        if(order == null) {
            throw new NullPointerException("根据订单号查询不到订单信息！");
        }
        //柚点定价，待定
        int amount=(int)(100*Double.valueOf(order.getAmount()));
        int accYoudian=acc.getYoudian();
        acc.setYoudian(accYoudian-amount);
        accountService.update(acc);
        RequestHolder.getSession().setAttribute(FrontContainer.USER_INFO, acc);//更新session中的账号信息
        // 全额支付
        order.setStatus(Order.status_paysuccess);
        order.setPayChannel(1);
        orderService.update(order);

        modelMap.addAttribute("status","3");
        if(order.getTemplateName().startsWith("T")){

            Template template = templateService.selectById(order.getTemplateId()+"");
            templateService.updateSellCount(template);
            modelMap.addAttribute("tempID",order.getTemplateId());
        }
        return "paygate/onlinePay/paySuccess";
    }
    //现在支付异步通知
    @RequestMapping("paygate/ipaynowNotify")
    public void backnotify(HttpServletRequest req, HttpServletResponse resp){
        logger.info("-------------------现在支付--异步通知------------------------");
        //获取通知数据需要从body中流式读取
        BufferedReader reader = null;
        try {
            reader = req.getReader();
        } catch (IOException e) {
            e.printStackTrace();
        }
        StringBuilder reportBuilder = new StringBuilder();
        String tempStr = "";
        try {
            while((tempStr = reader.readLine()) != null){
                reportBuilder.append(tempStr);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        String reportContent = reportBuilder.toString();
        Map<String,String> dataMap = FormDateReportConvertor.parseFormDataPatternReportWithDecode(reportContent, "UTF-8", "UTF-8");
        //获取支付状态
        String status=dataMap.get("transStatus");

        //去除签名值
        String signature = dataMap.remove("signature");

        //拿到自己应用的md5Key
        InputStream propertiesInput = Thread.currentThread().getContextClassLoader().getResourceAsStream("ipaynow.properties");
        Properties properties = new Properties();
        try {
            properties.load(propertiesInput);
        } catch (IOException e) {
            e.printStackTrace();
        }
        String md5Key = (String) properties.get("md5Key");
        //验证签名
        boolean isValidSignature = MD5Facade.validateFormDataParamMD5(dataMap,md5Key,signature);

        System.out.println("验签结果："+isValidSignature);
        String orderNumAfterJoint=dataMap.get("mhtOrderNo");//拼接上remark后的订单号
        System.out.println("--------------------------"+orderNumAfterJoint+"-----------------");
        String orderNum="";
        if (orderNumAfterJoint.startsWith("CU")){
            orderNum = orderNumAfterJoint;
        }else{
            orderNum = orderNumAfterJoint.substring(0,orderNumAfterJoint.indexOf("M"));
        }
        //一定要返回
        if(isValidSignature) {

            //支付成功
            if("A001".equals(status)){
                logger.info("支付成功");
                if (orderNum.startsWith("CU")){

                    String cId = orderNum.split("\\.")[1];
                    String accountId=orderNum.split("\\.")[2];
                    Order order = new Order();
                    order.setOrderNum(orderNum);
                    //修改定制订单状态
                    CustomizeOrder corder =customizeOrderService.selectById(cId);
                    order.setAmount(corder.getPrice().toString());
                    order.setAccount(accountId);
                    order.setPayType(2);
                    order.setType(1);
                    order.setPayChannel(net.yozo.services.common.Order.payChannel_weixin);
                    order.setStatus(Order.status_paysuccess);
                    order.setCustomizeId(Integer.valueOf(cId));
                    orderService.insert(order);
                    moneyToGrow(order);
                    corder.setStatus(1);
                    if (corder != null) {
                        customizeOrderService.update(corder);
                        //更新设计师KPI数据
                        designerKpiService.updateDesingerUnfinishQty(Integer.valueOf(corder.getDesignerID()));
                    }
                }else{
                    Order order = orderService.selectByOrderNum(orderNum);
                    if(!"success".equals(order.getStatus())){
                        order.setPayChannel(3);
                        alterOrderAndTemp(order);
                    }
                }

            }
            try {
                System.out.println("----------------------success=Y---------------------");
                resp.getOutputStream().write("success=Y".getBytes());
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else{
            System.out.println("----------------------success=N---------------------");
            try {
                resp.getOutputStream().write("success=N".getBytes());
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
    //微信异步通知
    @RequestMapping("paygate/wxNotify")
    @ResponseBody
    public String wxNotify(HttpServletRequest req, HttpServletResponse response) throws Exception {
        logger.info("-------------------微信支付--异步通知------------------------");
        //获取通知数据需要从body中流式读取
        BufferedReader reader = null;
        try {
            reader = req.getReader();
        } catch (IOException e) {
            e.printStackTrace();
        }
        StringBuilder reportBuilder = new StringBuilder();
        String tempStr = "";
        try {
            while((tempStr = reader.readLine()) != null){
                reportBuilder.append(tempStr);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        String reportContent = reportBuilder.toString();
        WXPayConfig config = WXPayConfigImpl.getInstance();
        WXPay wxpay = new WXPay(config);

        Map<String, String> notifyMap = WXPayUtil.xmlToMap(reportContent);  // 转换成map
        String return_code="SUCCESS";
        String return_msg="OK";
        if (wxpay.isPayResultNotifySignatureValid(notifyMap)) {
            // 签名正确
            logger.info("验证签名成功！");

            if(!notifyMap.get("return_code").equals("SUCCESS")){
                return_code="FAIL";
                return_msg="通信失败";
                logger.error("通信失败,错误信息："+notifyMap.get("return_msg"));
            }else{
                String orderNum=notifyMap.get("out_trade_no");
                System.out.println("------------weixin--------------"+orderNum);
                if (orderNum.startsWith("CU")){
                    String cId = orderNum.split("\\.")[1];
                    String accountId=orderNum.split("\\.")[2];
                    Order order = new Order();
                    order.setOrderNum(orderNum);
                    String mhtOrderAmt = notifyMap.get("total_fee");
                    order.setAmount(mhtOrderAmt);
                    order.setAccount(accountId);
                    order.setPayType(2);
                    order.setType(1);
                    order.setPayChannel(net.yozo.services.common.Order.payChannel_weixin);
                    order.setStatus(Order.status_paysuccess);
                    order.setCustomizeId(Integer.valueOf(cId));
                    orderService.insert(order);
                    moneyToGrow(order);
                    //修改定制订单状态
                    CustomizeOrder corder =customizeOrderService.selectById(cId);
                    corder.setStatus(1);
                    if (corder != null) {
                        customizeOrderService.update(corder);
                        //更新设计师KPI数据
                        designerKpiService.updateDesingerUnfinishQty(Integer.valueOf(corder.getDesignerID()));
                    }
                }else{
                    Order order = orderService.selectByOrderNum(orderNum);
                    String amount=""+(int)(100*Double.valueOf(order.getAmount()));
                    //按官方文档要求对订单金额进行校验
                    if(!amount.equals(notifyMap.get("total_fee"))){
                        return_code="FAIL";
                        return_msg="金额不匹配";
                        logger.error("订单金额不匹配");
                    }else if(!notifyMap.get("result_code").equals("SUCCESS")){
                        logger.info("支付失败");
                    } else {
                        logger.info("支付成功");
                        //成功 更新状态
                        if(!"success".equals(order.getStatus())) {
                            alterOrderAndTemp(order);
                        }
                    }
                }

            }
        }
        else {
            // 签名错误，如果数据里没有sign字段，也认为是签名错误
            return_code="FAIL";
            return_msg="签名错误";
            logger.error("验证签名错误");
        }
        return "<xml><return_code><![CDATA["+return_code+"]]></return_code><return_msg><![CDATA["+return_msg+"]]></return_msg></xml>";

    }
    //支付宝异步通知
    @RequestMapping("paygate/zfbNotify")
    public void zfbNotify(HttpServletRequest request, HttpServletResponse response) throws IOException {
        logger.info("---------------------支付宝--异步通知------------------------");
        String  message = "success";
        Map<String, String> params = new HashMap<String, String>();
        // 取出所有参数是为了验证签名
        Enumeration<String> parameterNames = request.getParameterNames();
        while (parameterNames.hasMoreElements()) {
            String parameterName = parameterNames.nextElement();
            params.put(parameterName, request.getParameter(parameterName));
        }
        //验证签名
        boolean signVerified = false;
        try {
            signVerified = AlipaySignature.rsaCheckV1(params, Configs.getAlipayPublicKey(), "UTF-8","RSA2");
        } catch (AlipayApiException e) {
            e.printStackTrace();
            message =  "failed";
        }
        if (signVerified) {
            logger.info("验证签名成功！");
            //按官方文档要求分别对out_trade_no、total_amount、seller_id进行校验
            String outtradeno = params.get("out_trade_no");
            String totalamount = params.get("total_amount");
            String sellerid = params.get("seller_id");
            CustomizeOrder corder = null;
            if (outtradeno.startsWith("CU")){
                String cId = outtradeno.split("\\.")[1];
                corder =customizeOrderService.selectById(cId);
            }
            Order order = orderService.selectByOrderNum(outtradeno);
            // 若参数中的appid和填入的appid不相同，则为异常通知
            if (!Configs.getAppid().equals(params.get("app_id"))) {
                logger.info("与付款时的appid不同，此为异常通知，应忽略！");
                message =  "failed";
            }else if(order==null && corder ==null){
                logger.info("订单号不存在，此为异常通知，应忽略！");
                message =  "failed";
            } else if(order !=null && !totalamount.equals(order.getAmount()) ){
                logger.info("订单金额不匹配，此为异常通知，应忽略！");
                message =  "failed";
            }else if(!sellerid.equals(Configs.getPid())){
                logger.info("商户ID不匹配，此为异常通知，应忽略！");
                message =  "failed";
            }else{
                String status = params.get("trade_status");
                if (status.equals("WAIT_BUYER_PAY")) { // 如果状态是正在等待用户付款

                } else if (status.equals("TRADE_CLOSED")) { // 如果状态是未付款交易超时关闭，或支付完成后全额退款

                } else if (status.equals("TRADE_SUCCESS") || status.equals("TRADE_FINISHED")) { // 如果状态是已经支付成功
                    System.out.println("------------zhifubao--------------"+outtradeno);
                    logger.info("支付成功");
                    if (outtradeno.startsWith("CU")){
                        String cId = outtradeno.split("\\.")[1];
                        String accountId=outtradeno.split("\\.")[2];
                        Order orderc = new Order();
                        orderc.setOrderNum(outtradeno);
                        orderc.setAmount(totalamount);
                        orderc.setAccount(accountId);
                        orderc.setPayType(2);
                        orderc.setType(1);
                        orderc.setPayChannel(net.yozo.services.common.Order.payChannel_weixin);
                        orderc.setStatus(Order.status_paysuccess);
                        orderc.setCustomizeId(Integer.valueOf(cId));
                        orderService.insert(orderc);
                        moneyToGrow(orderc);
                        //修改定制订单状态
                        if (corder != null){
                            corder.setStatus(1);
                            customizeOrderService.update(corder);
                            //更新设计师KPI数据
                            designerKpiService.updateDesingerUnfinishQty(Integer.valueOf(corder.getDesignerID()));
                        }
                    }else {
                        //成功 更新状态
                        if(!"success".equals(order.getStatus())) {
                            order.setPayChannel(2);
                            alterOrderAndTemp(order);
                        }
                    }

                }
            }
        } else { // 如果验证签名没有通过
            message =  "failed";
            logger.info("验证签名失败！");
        }
        BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
        out.write(message.getBytes());
        out.flush();
        out.close();
    }

    /*@RequestMapping("onlinepay")
    public String onlinepay(String orderId){
        System.out.println("111");

        return "paygate/onlinePay/onlinepay";
    }*/
    //柚点支付界面
    @RequestMapping("auth/paygate/yomopay")
    public String yomopay(HttpServletRequest request,  ModelMap modelMap){
        Account acc = LoginUserHolder.getLoginAccount();
        if(acc==null || StringUtils.isBlank(acc.getId())){
            return ("/account/login");
        }
        acc =accountService.selectById(acc.getId());
        String orderNum=request.getParameter("orderNum");
        Order order=orderService.selectByOrderNum(orderNum);
        //柚点定价，待定
        int amount=(int)(100*Double.valueOf(order.getAmount()));
        int accYoudian=acc.getYoudian();
        if(accYoudian==0){
            modelMap.addAttribute("percentage",0);
        }else{
            modelMap.addAttribute("percentage",amount*100/accYoudian);
        }
        modelMap.addAttribute("orderNum",order.getOrderNum());
        modelMap.addAttribute("templateName",order.getTemplateName());
        modelMap.addAttribute("accYoudian",accYoudian);
        modelMap.addAttribute("amount",amount);
        if(accYoudian>=amount){
            modelMap.addAttribute("status","1");
            modelMap.addAttribute("remain",accYoudian-amount);
        }else{
            modelMap.addAttribute("status","2");
            modelMap.addAttribute("remain",amount-accYoudian);
        }
        return "paygate/onlinePay/yomopay";
    }
    @RequestMapping("paygate/paySuccess")
    public String paySuccess(HttpServletRequest request,ModelMap modelMap){
        String status=request.getParameter("status");
        String orderNum=request.getParameter("orderNum");
        if(orderNum!=null){
            Order order=orderService.selectByOrderNum(orderNum);
            if(order.getTemplateName() != null && order.getTemplateName().startsWith("T")){
                modelMap.addAttribute("tempID",order.getTemplateId());
            }
        }
        if (orderNum.startsWith("CU")){
            modelMap.addAttribute("CU","CU");
        }else{
            modelMap.addAttribute("CU","");
        }
        modelMap.addAttribute("status",status);
        return "paygate/onlinePay/paySuccess";
    }
    @RequestMapping("paygate/yomobuy")
    public String yomobuy(){

        return "account/yomobuy";
    }
    @RequestMapping("paygate/acccheck")
    @ResponseBody
    public String acccheck() {
        Account acc = LoginUserHolder.getLoginAccount();
        if (acc == null || StringUtils.isBlank(acc.getId())) {
            return "-1";
        }
        return "1";
        
    }

    //修改订单状态为成功，并更新模板销售、下载情况(现金订单会走这方法)
    public void alterOrderAndTemp(Order order){

        order.setStatus(Order.status_paysuccess);
        orderService.update(order);

        if( order.getOrderNum().startsWith("Y") ){
            Account acc = accountService.selectById(order.getAccount());
            String item=order.getTemplateName();
            Youdian yd=new Youdian();
            yd.setItem(item);
            int obtain=youdianService.selectOne(yd).getQuantity();
            acc.setYoudian(acc.getYoudian()+obtain);
            accountService.update(acc);
            logger.info("---------------增加用户柚点");
            RequestHolder.getSession().setAttribute(FrontContainer.USER_INFO, acc);//更新session中的账号信息
        }//如果是会员充值订单则更新用户的会员到期日
        else if( order.getOrderNum().startsWith("H") ){
            Account acc = accountService.selectById(order.getAccount());
            String item=order.getTemplateName();
            Youdian yd=new Youdian();
            yd.setItem(item);
            int addVipDate=youdianService.selectOne(yd).getQuantity();
            String accVipDate=acc.getVipDate();
            Date startDate=new Date();
            try {
                //如果会员尚未过期，则以该日期为计时起点
                if(accVipDate!=null && sdf.parse(accVipDate).after(startDate)){
                    startDate=sdf.parse(accVipDate);
                }
                acc.setVipDate(sdf.format(org.apache.commons.lang.time.DateUtils.addDays(startDate,addVipDate)));
            } catch (ParseException e) {
                e.printStackTrace();
            }
            accountService.update(acc);
            logger.info("-------------增加用户会员天数");
            RequestHolder.getSession().setAttribute(FrontContainer.USER_INFO, acc);//更新session中的账号信息


        }
        moneyToGrow(order);
        logger.info("------------异步--修改订单状态success");
    }
    //消耗现金增加成长值
    public void moneyToGrow(Order order){
        //用户成长值添加，消耗现金1:10增加成长值
        AccountInfo accountInfo=new AccountInfo();
        accountInfo.setAccountId(Integer.parseInt(order.getAccount()));
        int num = Math.round(AccountInfo.scale_xianjin*Float.parseFloat(order.getAmount()));
        accountInfo.setAddGrowthValue(num);
        accountInfoService.updateGrowthValue(accountInfo);
    }
    //支付宝同步通知
    @RequestMapping("paygate/zfbReturn")
    public String zfbReturn(HttpServletRequest request, HttpServletResponse response) throws IOException {
        logger.info("---------------------支付宝网页支付同步通知------------------------");
        String  message = "3";//成功
        Map<String, String> params = new HashMap<String, String>();
        // 取出所有参数是为了验证签名
        Enumeration<String> parameterNames = request.getParameterNames();
        while (parameterNames.hasMoreElements()) {
            String parameterName = parameterNames.nextElement();
            System.out.println(parameterName+"--");
            params.put(parameterName, request.getParameter(parameterName));
        }
        //验证签名
        boolean signVerified = false;
        try {
            signVerified = AlipaySignature.rsaCheckV1(params, Configs.getAlipayPublicKey(), "UTF-8","RSA2");
        } catch (AlipayApiException e) {
            e.printStackTrace();
            message =  "4";
        }
        String outtradeno = params.get("out_trade_no");
        if (signVerified) {
            logger.info("验证签名成功！");
            //按官方文档要求分别对out_trade_no、total_amount、seller_id进行校验
            String totalamount = params.get("total_amount");
            String sellerid = params.get("seller_id");
            Order order = orderService.selectByOrderNum(outtradeno);
            // 若参数中的appid和填入的appid不相同，则为异常通知
            if (!Configs.getAppid().equals(params.get("app_id"))) {
                logger.info("与付款时的appid不同，此为异常通知，应忽略！");
                message =  "4";
            }else if(order==null){
                logger.info("订单号不存在，此为异常通知，应忽略！");
                message =  "4";
            }else if(!totalamount.equals(order.getAmount())){
                logger.info("订单金额不匹配，此为异常通知，应忽略！");
                message =  "4";
            }else if(!sellerid.equals(Configs.getPid())){
                logger.info("商户ID不匹配，此为异常通知，应忽略！");
                message =  "4";
            }else{
                /*String status = params.get("trade_status");
                if (status.equals("WAIT_BUYER_PAY")) { // 如果状态是正在等待用户付款

                } else if (status.equals("TRADE_CLOSED")) { // 如果状态是未付款交易超时关闭，或支付完成后全额退款

                } else if (status.equals("TRADE_SUCCESS") || status.equals("TRADE_FINISHED")) { // 如果状态是已经支付成功
                    logger.info("支付成功");
                    //成功 更新状态

                    if(!"success".equals(order.getStatus())) {
                        alterOrderAndTemp(order);
                    }
                }*/
            }
        } else { // 如果验证签名没有通过
            message =  "4";
            logger.info("验证签名失败！");
        }
        /*BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
        out.write(message.getBytes());
        out.flush();
        out.close();*/
        if(message.equals("3")){
            return "redirect:/paygate/paySuccess?status="+message+"&orderNum="+outtradeno;
        }else{
            return "redirect:/paygate/paySuccess?status="+message;
        }
    }

    public static void main(String[] args){
        String no = "CU201712210006.1.294";
        System.out.println(no.startsWith("CU"));
        String totalamount = "0.01";
        BigDecimal p = new BigDecimal(0.01);
        System.out.println(totalamount.equals(p.toString()));
    }

}
