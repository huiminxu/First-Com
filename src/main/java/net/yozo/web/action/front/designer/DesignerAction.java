package net.yozo.web.action.front.designer;

import com.alibaba.fastjson.JSON;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.yozo.core.FrontContainer;
import net.yozo.core.dao.page.PagerModel;
import net.yozo.core.front.SystemManager;
import net.yozo.core.util.JsonDateProcessor;
import net.yozo.services.common.CustomizeComment;
import net.yozo.services.front.account.AccountService;
import net.yozo.services.front.account.bean.Account;
import net.yozo.services.front.customizeComment.CustomizeCommentService;
import net.yozo.services.front.customizeOrder.CustomizeOrderService;
import net.yozo.services.front.customizeOrder.bean.CustomizeOrder;
import net.yozo.services.front.designer.DesignerService;
import net.yozo.services.front.designer.bean.Designer;
import net.yozo.services.front.designerKpi.DesignerKpiService;
import net.yozo.services.front.designerKpi.bean.DesignerKpi;
import net.yozo.services.front.favorite.FavoriteService;
import net.yozo.services.front.favorite.bean.Favorite;
import net.yozo.services.front.order.OrderService;
import net.yozo.services.front.order.bean.OrderRecordForCustomize;
import net.yozo.web.action.front.FrontBaseController;
import net.yozo.web.action.front.template.TemplateAction;
import net.yozo.web.util.LoginUserHolder;
import net.yozo.web.util.RequestHolder;
import org.apache.commons.lang.StringUtils;
import net.yozo.services.front.template.TemplateService;
import net.yozo.services.front.template.bean.Template;
import net.yozo.web.util.RequestHolder;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.xml.namespace.QName;


import java.net.MalformedURLException;
import java.rmi.RemoteException;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 设计师相关
 */
@Controller

public class DesignerAction extends FrontBaseController<Designer>{
    @Autowired
    protected TemplateService templateService;
    @Autowired
    protected DesignerService designerService;
    @Autowired
    protected OrderService orderService;
    @Autowired
    protected DesignerKpiService designerKpiService;
    @Autowired
    protected CustomizeCommentService customizeCommentService;
    @Autowired
    protected CustomizeOrderService customizeOrderService;
    @Autowired
    protected AccountService accountService;
    @Autowired
    protected FavoriteService favoriteService;
    @Override
    public DesignerService getService() {
        return designerService;
    }
    //设计师页面-模板作品works-成交记录records-服务评价comments
    @RequestMapping("/designer/info")
    public String works(ModelMap model, HttpServletRequest request) {
        Account account = LoginUserHolder.getLoginAccount();
        String isDesigner="n";
        int offset = 0;//分页偏移量
        String pagerOffset = RequestHolder.getRequest().getParameter("pager.offset");
        if (StringUtils.isNotBlank(pagerOffset)) {
            offset = Integer.parseInt(pagerOffset);
        }
        if (offset < 0) {
            offset = 0;
        }

        String designerId = request.getParameter("designerId");
        if(designerId==null){
            designerId = (String) request.getSession().getAttribute("designerId");
        }
        Designer designer=designerService.selectById(designerId);
        if(designer.getAuditStatus()!=Designer.DESIGNER_AUSTA_Y){
            return "/";
        }
        List<Designer> list=new ArrayList<>();
        list.add(designer);
        designerService.setQQstatus(list);
        String type = request.getParameter("type");
        if(type==null){//由首页进入，则默认展示作品页
            type="works";
        }
        DesignerKpi designerKpi=new DesignerKpi();
        designerKpi.setDesignerId(Integer.parseInt(designerId));
        designerKpi=designerKpiService.selectOne(designerKpi);
        if(designerKpi==null ){//对于未接过单的设计师，数据库没有相应的kpi数据
            designerKpi=new DesignerKpi();//为了前台少一步判断kpi对象是否存在
        }else if(designerKpi.getEfficiencyScore()!=null){//有相关订单数据，并且有评价数据
            designerKpi=designerKpiService.compareWithAverage(designerKpi);//计算各项评分与平均值的差距
        }
        if(account!=null && designer.getAccountId()==Integer.parseInt(account.getId()) && Designer.DESIGNER_AUSTA_Y==designer.getAuditStatus()){
            isDesigner="y";
        }
        request.getSession().setAttribute("isDesigner", isDesigner);
        request.getSession().setAttribute("designer", designer);
        request.getSession().setAttribute("designerKpi", designerKpi);
        request.getSession().setAttribute("designerId",designerId);

        PagerModel pager =null;
        //模板作品works
        if(type.equals("works")){
            Template template = new Template();
            template.setAuthor(designer.getAccountId()+"");
            template.setStatus(1);//展示已上架、非定制订单
            template.setOffset(offset);
            //template.setOrderBy();如果需要按1最新2热度3销量排序的话
            template.setPageSize(20);
            pager = templateService.selectDesignerWorks(template);
            pager.setPageSize(20);//测试分页

            loadFavorite(pager.getList());

        //成交记录records
        }else if(type.equals("records")){
            OrderRecordForCustomize o=new OrderRecordForCustomize();
            o.setCreatorID(designer.getAccountId()+"");
            o.setOffset(offset);
            o.setStatus("success");//用户已支付
            o.setType(1);//定制订单
            o.setPageSize(10);
            pager =orderService.selectOrderRecordForCustomize(o);
            pager.setPageSize(10);//测试分页
        //服务评价comments
        }else if(type.equals("comments")){
            CustomizeComment cc=new CustomizeComment();
            cc.setDesignerId(Integer.parseInt(designerId));
            cc.setIsDelete(0);//未删除
            cc.setOffset(offset);
            cc.setPageSize(10);
            pager = customizeCommentService.selectPageList(cc);
            pager.setPageSize(10);//测试分页
        }
        if(pager!=null){
            // 计算总页数（每页展示数量pageSize默认值为10）
            pager.setPagerSize((pager.getTotal() + pager.getPageSize() - 1)
                    / pager.getPageSize());
            pager.setPagerUrl("info");
        }
        request.getSession().setAttribute("type",type);
        //model.addAttribute("type", type);
        pager.setOffset(offset);
        model.addAttribute("pager", pager);
        return "/designer/designer";
    }

    @RequestMapping(value="/auth/designer/changeResume",method = RequestMethod.POST)
    @ResponseBody
    public String changeResume(ModelMap model){
        Account account = LoginUserHolder.getLoginAccount();
        if (account == null || StringUtils.isBlank(account.getAccount())) {
            return "/account/login";
        }
        //权限判断
        Designer designer=designerService.selectByAccountId(Integer.parseInt(account.getId()));
        if( designer == null || StringUtils.isBlank(designer.getId()) || Designer.DESIGNER_AUSTA_Y != designer.getAuditStatus()) {
            return "fail";
        }
        String resume = RequestHolder.getRequest().getParameter("resume");
        designer.setResume(resume);
        designerService.updateInfo(designer);
        return resume;
    }

    @RequestMapping("/designer/customize")
    public String customize(ModelMap model,HttpServletRequest request) throws Exception {
        model.addAttribute("isCustomize","y");
        Designer d=new Designer();
        d.setPageSize(8);//查找8条数据
        PagerModel pager = super.selectPageList(getService(), d);
        pager.setPagerUrl("customize");
        designerService.setQQstatus(pager.getList());
        model.addAttribute("pager", pager);
        return "/customize";
    }

    @RequestMapping("/designer/designerList")
    public String designerList(ModelMap model,HttpServletRequest request) throws Exception {
        model.addAttribute("isCustomize","y");
        Designer d=new Designer();
        int offset = 0;
        String pagerOffset = RequestHolder.getRequest().getParameter("pager.offset");
        if (StringUtils.isNotBlank(pagerOffset)) {
            offset = Integer.parseInt(pagerOffset);
        }
        if (offset < 0)
            offset = 0;
        d.setOffset(offset);
        d.setPageSize(12);//4行，一行4个
        PagerModel pager = super.selectPageList(getService(), d);
        if(pager==null)pager = new PagerModel();
        // 计算总页数
        pager.setPagerSize((pager.getTotal() + pager.getPageSize() - 1)
                / pager.getPageSize());
        pager.setPagerUrl("designerList");
        designerService.setQQstatus(pager.getList());
        pager.setOffset(offset);
        model.addAttribute("pager", pager);
        return "/designer/designerList";
    }



    @RequestMapping("/auth/designer/toBeDesigner")
    public String toBeDesigner(ModelMap model) {
        Account account = LoginUserHolder.getLoginAccount();
        String registStatus="";
        if (account == null || StringUtils.isBlank(account.getAccount())) {
            return "/account/login";
        }
        String type=RequestHolder.getRequest().getParameter("type");
        Designer d=designerService.selectByAccountId(Integer.parseInt(account.getId()));
        if(d==null|| StringUtils.isBlank(d.getId())){
            registStatus="regist";
            account=accountService.selectById(account.getId());
            d=new Designer();
        }else if(Designer.DESIGNER_AUSTA_NEW==d.getAuditStatus()){
            registStatus="wait";
        }else if("edit".equals(type)&&Designer.DESIGNER_AUSTA_N==d.getAuditStatus()){
            registStatus="edit";
        }else if(Designer.DESIGNER_AUSTA_N==d.getAuditStatus()){
            registStatus="fail";
        }else if(Designer.DESIGNER_AUSTA_Y==d.getAuditStatus())
        {
            return "redirect:/auth/designer/beDesignerSuccess";
        }
        model.addAttribute("registStatus",registStatus);
        model.addAttribute("d",d);
        model.addAttribute("e", account);
        return "/designer/toBeDesigner";
    }

    //设计师注册功能
    @RequestMapping("/auth/designer/insert")
    public String insert(ModelMap model, Designer e){
        Account account = LoginUserHolder.getLoginAccount();
        if (account == null || StringUtils.isBlank(account.getAccount())) {
            return "/account/login";
        }
        //初始化
        e.setAccountId(Integer.parseInt(account.getId()));//设置申请人账号
        e.setAuditStatus(Designer.DESIGNER_AUSTA_NEW);//设置审核状态为新增
        Designer d=designerService.selectByAccountId(Integer.parseInt(account.getId()));
        if(d!=null&&StringUtils.isBlank(d.getId())){
            e.setId(d.getId());
            designerService.update(e);
        }else{
            designerService.insert(e);
        }
        return "redirect:/auth/designer/toBeDesigner";
    }


    @RequestMapping("/auth/designer/designizations")
    public String designizations(ModelMap model) {
        Account account = LoginUserHolder.getLoginAccount();
        if (account == null || StringUtils.isBlank(account.getAccount())) {
            return "/account/login";
        }
        //我是用户的数量
        Integer userOrdersCount=customizeOrderService.userOrdersCount(account.getId());
        model.addAttribute("imUserCount",userOrdersCount);
        //判断是否为设计师
        Designer d=designerService.selectByAccountId(Integer.parseInt(account.getId()));
        if(d == null || StringUtils.isBlank(d.getId()) || Designer.DESIGNER_AUSTA_Y != d.getAuditStatus()){
            model.addAttribute("isdesigner","n");
            return "/account/designizations";
        }
        int offset = 0;//分页偏移量
        String pagerOffset = RequestHolder.getRequest().getParameter("pager.offset");
        if (StringUtils.isNotBlank(pagerOffset)) {
            offset = Integer.parseInt(pagerOffset);
        }
        if (offset < 0) {
            offset = 0;
        }
        CustomizeOrder c=new CustomizeOrder();
        c.setCreator(Integer.parseInt(account.getId()));
        c.setOffset(offset);
        PagerModel pager = customizeOrderService.designerPageList(c);
        if(pager!=null){
            // 计算总页数（每页展示数量pageSize默认值为10）
            pager.setPagerSize((pager.getTotal() + pager.getPageSize() - 1)
                    / pager.getPageSize());
            pager.setPagerUrl("designizations");
        }
        model.addAttribute("now", new Date());
        pager.setOffset(offset);
        model.addAttribute("pager", pager);
        return "/account/designizations";

    }

    /*上传定制服务操作、insert or edit*/
    @RequestMapping("/auth/designer/customizationUpload")
    public String customizationUpload(ModelMap model,CustomizeOrder c) {
        Account account = LoginUserHolder.getLoginAccount();
        if (account == null || StringUtils.isBlank(account.getAccount())) {
            return "/account/login";
        }
        //判断是否为设计师,有无权限
        Designer d=designerService.selectByAccountId(Integer.parseInt(account.getId()));
        if(d == null || StringUtils.isBlank(d.getId()) || Designer.DESIGNER_AUSTA_Y != d.getAuditStatus()){
            //设计师不存在或设计师非审核通过状态
            return "redirect:/auth/account/tempUploadIntroduce";
        }
        if(c!=null||!StringUtils.isNotBlank(c.getId())){
            c=customizeOrderService.selectById(c.getId());
            if(c==null){
                //查询不到定制订单
                c=new CustomizeOrder();
            }else if(CustomizeOrder.CUSTORDER_NEW!=c.getStatus()||!account.getId().equals(String.valueOf(c.getCreator()))){
                //1：不是新增状态的定制订单2：用户非定制订单的创建者，则非法操作跳404
                return "404";
            }
        }
        model.addAttribute("c",c);
        model.addAttribute("e", account);
        return "/account/customizationUpload";
    }

    @RequestMapping(value="/auth/designer/showCustom",method = RequestMethod.POST)
    @ResponseBody
    public String showCustom(ModelMap model){
        Account account = LoginUserHolder.getLoginAccount();
        if (account == null || StringUtils.isBlank(account.getAccount())) {
            return "/account/login";
        }
        String id = RequestHolder.getRequest().getParameter("id");
        CustomizeOrder c=customizeOrderService.selectById(id);
        int accountId=Integer.parseInt(account.getId());
        if(c==null||c.getId()==null|| (c.getCreator()!=null && c.getCreator()!=accountId && c.getUserId()!= null && c.getUserId()!= accountId)){
            c=new CustomizeOrder();
        }
        JsonConfig jsonConfig = new JsonConfig();
        jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateProcessor());
        String result = JSONObject.fromObject(c, jsonConfig).toString();
        System.out.println(result);
        return result;
    }

    /**
     * ajax验证输入的字符的唯一性
     * @return
     * @throws IOException
     */
    @RequestMapping("/designer/unique")
    @ResponseBody
    public String unique(Designer e,HttpServletRequest request) throws IOException{
        if(StringUtils.isNotBlank(e.getNickname())){//验证昵称是否被占用
            String nickname = e.getNickname();
            String primaryNick=request.getParameter("primaryNick");
            if(primaryNick.equals(nickname)){
                return ("{\"ok\":\"昵称可以使用!\"}");
            }
            e.clear();
            e.setNickname(nickname);
            if (designerService.selectCount(e)>0){
                return ("{\"error\":\"昵称已经被占用!\"}");
            }else{
                return ("{\"ok\":\"昵称可以使用!\"}");
            }
        }else if(StringUtils.isNotBlank(e.getTel())){//验证电话号码是否被占用
            String tel = e.getTel();
            String primaryTel=request.getParameter("primaryTel");
            if(primaryTel.equals(tel)){
                return ("{\"ok\":\"昵称可以使用!\"}");
            }
            e.clear();
            e.setTel(tel);
            if (designerService.selectCount(e)>0){
                return ("{\"error\":\"电话号码已经被占用!\"}");
            }else{
                return ("{\"ok\":\"电话号码可以使用!\"}");
            }
        }else if(StringUtils.isNotBlank(e.getIdNumber())){
            String idNumber = e.getIdNumber();
            String primaryIdNumber=request.getParameter("primaryIdNumber");
            if(primaryIdNumber.equals(idNumber)){
                return ("{\"ok\":\"昵称可以使用!\"}");
            }
            e.clear();
            e.setIdNumber(idNumber);
            if (designerService.selectCount(e)>0){
                return ("{\"error\":\"身份证号码已经被占用!\"}");
            }else{
                return ("{\"ok\":\"身份证号码可以使用!\"}");
            }
        }else if(StringUtils.isNotBlank(e.getQq())){
            String qq = e.getQq();
            String idNumber = e.getIdNumber();
            String primaryQq=request.getParameter("primaryQq");
            if(primaryQq.equals(qq)){
                return ("{\"ok\":\"昵称可以使用!\"}");
            }
            e.clear();
            e.setQq(qq);
            if (designerService.selectCount(e)>0){
                return ("{\"error\":\"qq已经被占用!\"}");
            }else{
                qq+=":";
                String result = "";
                String charset = "UTF-8";
                String callurl ="http://webpresence.qq.com/getonline?Type=1&";
                try {
                    java.net.URL url = new java.net.URL(callurl + qq);
                    java.net.URLConnection connection = url.openConnection();
                    connection.connect();
                    java.io.BufferedReader reader = new java.io.BufferedReader(
                            new java.io.InputStreamReader(connection
                                    .getInputStream(), charset));
                    String line;
                    while ((line = reader.readLine()) != null) {
                        result += line;
                        result += "\n";
                    }
                    return ("{\"ok\":\"qq可以使用!\"}");
                } catch (Exception qqex) {
                    return ("{\"error\":\"qq号不存在!\"}");
                }
            }
        }
        if(e!=null){
            e.clear();
        }
        return null;
    }

    @RequestMapping("/auth/designer/designerJoin")
    public String designer(ModelMap model){
        Account account = LoginUserHolder.getLoginAccount();
        if (account == null || StringUtils.isBlank(account.getAccount())) {
            return "/account/login";
        }
        Designer d=designerService.selectByAccountId(Integer.parseInt(account.getId()));
        if(d==null|| StringUtils.isBlank(d.getId())){
            return "redirect:/auth/designer/toBeDesigner";//注册页

        }else{
            if(Designer.DESIGNER_AUSTA_Y==d.getAuditStatus()){
                return "redirect:/auth/designer/beDesignerSuccess";//注册成功，证书
            }else{
                return "redirect:/auth/designer/toBeDesigner";//注册页
            }
        }
    }

    @RequestMapping("/auth/designer/beDesignerSuccess")
    public String beDesignerSuccess(ModelMap model) {
        Account account = LoginUserHolder.getLoginAccount();
       if (account == null || StringUtils.isBlank(account.getAccount())) {
            return "/account/login";
        }
        Designer d=designerService.selectByAccountId(Integer.parseInt(account.getId()));
       if(d!=null && Designer.DESIGNER_AUSTA_Y==d.getAuditStatus()){
           model.addAttribute("d",d);
           return "/designer/BeDesignerSuccess";
       }else{
           return "redirect:/designer/customize";
       }
    }

    //定制需求生成insert或update
    @RequestMapping("/auth/designer/uploadCustomizeOrder")
    public String uploadCustomizeOrder(ModelMap model, CustomizeOrder e) throws Exception{
        Account account = LoginUserHolder.getLoginAccount();
        if (account == null || StringUtils.isBlank(account.getAccount())) {
            return "/account/login";
        }
        //初始化
        e.setCreator(Integer.parseInt(account.getId()));//设置定制需求的设计师的用户id
        e.setStatus(e.CUSTORDER_NEW);//设置状态为创建
        String etcTime=RequestHolder.getRequest().getParameter("etcTime")+" 23:59:59";
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        java.util.Date etc=sdf.parse(etcTime);
        e.setEtc(etc);
        if(StringUtils.isBlank(e.getId())){
            customizeOrderService.insert(e);
        }else{
            customizeOrderService.update(e);
        }
        return "redirect:/auth/designer/designizations";
    }


    /**
     * 上传定制文件、数据存储定制订单状态、文件路径
     * @return
     *
     */
    @RequestMapping(value="/auth/designer/updateUploadStatus",method = RequestMethod.POST)
    @ResponseBody
    public String updateUploadStatus(ModelMap modeles){
        Account account = LoginUserHolder.getLoginAccount();
        if (account == null || StringUtils.isBlank(account.getAccount())) {
            return "/account/login";
        }
        String id =RequestHolder.getRequest().getParameter("id");
        String template =RequestHolder.getRequest().getParameter("template");
        try{
            CustomizeOrder custom=new CustomizeOrder();
            custom.setId(id);
            custom.setTemplate(template);
            custom.setStatus(CustomizeOrder.CUSTORDER_UPLOAD);
            customizeOrderService.uploadEdit(custom);
            return "success";
        }catch(Exception e){
            logger.error("定制订单更新失败,定制订单id为："+id);
            return "fail";
        }
    }

    @RequestMapping(value="/auth/designer/delCustomizeOrder")
    @ResponseBody
    public String delCustomizeOrder(HttpServletRequest request, CustomizeOrder c){
        Account acc = getLoginAccount();
        if(acc==null || StringUtils.isBlank(acc.getId())){
            return "/account/login";
        }
        try {
            c.setCreator(Integer.parseInt(acc.getId()));
            customizeOrderService.delete(c);
            int num=customizeOrderService.designerOrderCount(Integer.parseInt(acc.getId()));
            return num+"";
        }catch(Exception e){
            logger.error("定制订单删除失败,定制订单id为："+c.getId());
            return "fail";
        }
    }


    //跳转设计师评价页面
    @RequestMapping("/auth/designer/designerComment")
    public String customizeOrderComment(ModelMap model, HttpServletRequest request) {
        String designerId=request.getParameter("did");
        String orderId=request.getParameter("oid");
        //判断是否已经评价过
        CustomizeComment cc=new CustomizeComment();
        cc.setOrderId(Integer.parseInt(orderId));
        cc=customizeCommentService.selectOne(cc);
        if(cc!=null){//已评价过
            model.addAttribute("designerid", designerId);
        }else {
            Designer designer = designerService.selectById(designerId);
            designer.setIdNumber(null);
            designer.setIdPicFront(null);
            designer.setIdPicBack(null);
            model.addAttribute("designer", designer);
            model.addAttribute("orderid", orderId);
        }
        return "/designer/evaluateDesigner";
    }
    //提交评价
    @RequestMapping( value="/auth/designer/insertComment",method = RequestMethod.POST)
    @ResponseBody
    public String insertComment( HttpServletRequest request,CustomizeComment cc) {
        String orderid=request.getParameter("oid");
        Account acc = getLoginAccount();
        cc.setOrderId(Integer.parseInt(orderid));
        cc.setCreator(Integer.parseInt(acc.getId()));
        int efficiencyScore=cc.getEfficiencyScore()*20;
        int qualityScore=cc.getQualityScore()*20;
        int serviceScore=cc.getServiceScore()*20;
        cc.setPositive(0);
        cc.setNegative(0);
        cc.setModerate(0);
        if(efficiencyScore<=20 && qualityScore<=20 && serviceScore<=20){//差评
            cc.setNegative(1);
        }else if(efficiencyScore>=60 && qualityScore>=60 && serviceScore>=60){//好评
            cc.setPositive(1);
        }else{//中评
            cc.setModerate(1);
        }
        cc.setEfficiencyScore(efficiencyScore);
        cc.setQualityScore(qualityScore);
        cc.setServiceScore(serviceScore);
        cc.setIsDelete(0);
        int res=customizeCommentService.insert(cc);//插入评价
        if(res!=0){
            updateDesignerKPI( cc.getDesignerId());
        }
        return res+"";
    }
    //更新设计师的kpi信息
    public void updateDesignerKPI(int designerID){
        CustomizeComment cc=new CustomizeComment();
        cc.setDesignerId(designerID);
        cc.setIsDelete(0);
        DesignerKpi designerKpi=customizeCommentService.calculateDesignerKpi(cc);//3项指标的平均分
        designerKpi.setFavorableRate(customizeCommentService.calculatePositivePercentage(cc));//好评率
        designerKpi.setDesignerId(designerID);
        designerKpi.setId(designerKpiService.selectOne(designerKpi).getId());
        designerKpiService.update(designerKpi);
    }
    @RequestMapping("auth/designer/UploadcustomIntro")
    public String kkkf(ModelMap model, @ModelAttribute("e") Template t, HttpServletRequest request) throws Exception {
        System.out.println("www");
        return "designer/UploadcustomIntro";
    }

    private void loadFavorite(List<Template> templates) {
        Account acc = getLoginAccount();
        if(acc==null || StringUtils.isBlank(acc.getId())){
            return ;
        }
        for(Template template:templates){
            Favorite favorite = new Favorite();
            favorite.setAccount(acc.getId());
            favorite.setProductID(template.getId());
            List<Favorite> favorites = favoriteService.selectList(favorite);
            if (favorites.size()>0) {
                template.setFavorite("y");
            } else {
                template.setFavorite("n");
            }
        }
    }
}
