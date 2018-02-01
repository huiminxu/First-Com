package net.yozo.web.action.front.phoneManage;


import net.yozo.core.util.DateTimeUtil;
import net.yozo.core.util.MD5;
import net.yozo.services.front.account.AccountService;
import net.yozo.services.front.account.bean.Account;
import net.yozo.services.front.phoneManage.PhoneManageService;
import net.yozo.services.front.sms.SmsService;
import net.yozo.services.front.sms.bean.Sms;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.portlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import static net.yozo.core.FrontContainer.USER_INFO;

/**
 * Created by Vicks on 2017/8/21.
 */
@Controller
@RequestMapping("phoneManage")
public class phoneManageController {
    static SimpleDateFormat fmt = new SimpleDateFormat("yyyyMMdd");
    @Autowired
    private PhoneManageService phoneManageService;
    @Autowired
    private AccountService accountService;
    @Autowired
    private SmsService smsService;
    //发送限制
    @RequestMapping(value="sendVerification",method = RequestMethod.POST)
    @ResponseBody
    public  String sendLimit(String phoneData, Sms sms){
        sms.setPhone(phoneData);
        Sms res=smsService.selectOne(sms);
        int random6=(int)((Math.random()*9+1)*100000);
        if(res!=null){
            Date lastSendTime=(Date)res.getSendTime();
            Date nowTime=new Date();
            //当前日期与上一次发送验证码的日期不同，则重置 已发送数量
            if(!fmt.format(lastSendTime).equals(fmt.format(nowTime))){
                res.setSendCount(0);
                res.setContent("0");
                smsService.update(res);
            }
            //后台控制 1分钟内不能重复发送
            if(nowTime.getTime()-lastSendTime.getTime()<60000){
                return "您的操作太过频繁";
            }
            //当日已发送满6条
            if(res.getSendCount()==6){
               return "您的操作太过频繁，请明天再试";
            }
            //已发送验证码，未满10条
            /*
            if((nowTime.getTime()-lastSendTime.getTime())/60000 <10){
                return sendVerification(res,1);//比对时间，决定是否需要重新生成验证码
            }*/
            res.setContent(random6+"");
            return sendVerification(res,1);
        }
        //新用户
        sms.setContent(random6+"");
        sms.setSendCount(0);
        return sendVerification(sms,2);

    }
    //发送验证码(新/老用户调用决定更新1/插入2操作)
    public String sendVerification(Sms sms,int updateOrInsert){
        String code=sms.getContent();
        String sendContent="【永中软件】 验证码："+code+" ,请在10分钟内输入";
        sms.setContent(sendContent);
        String returnCode=phoneManageService.sendVerification(sms);//启用发送
        //String returnCode="1";

        if(returnCode.startsWith("-")){
            return "验证码发送失败，错误代码："+returnCode;
        }else {
            sms.setContent(code);
            sms.setSendCount(sms.getSendCount()+1);
            sms.setReturnCode(returnCode);
            if(updateOrInsert==1){
                smsService.update(sms);
            }else{
                smsService.insert(sms);
            }
            return  "1";//发送成功
        }
    }
    //校验手机验证码
    @RequestMapping(value="checkCaptcha",method = RequestMethod.POST)
    @ResponseBody
    public String checkCapcha(String captcha, String phone, Sms sms) {
        System.out.println(captcha+"------"+phone);
        sms.setPhone(phone);
        sms = smsService.selectOne(sms);
        if ("0".equals(sms.getContent())) {
            return "请重新获取验证码";
        }
        Date lastSendTime = (Date) sms.getSendTime();
        Date nowTime = new Date();
        if ((nowTime.getTime() - lastSendTime.getTime()) / 60000 > 10) {
            return "请重新获取验证码";
        }
        if (!sms.getContent().equals(captcha)) {
            return "验证码输入有误";
        }
        return "1";
    }
        //手机注册
        @RequestMapping(value="registerByPhone",method = RequestMethod.POST)
        public String registerByPhone(String phone, String password, HttpSession session){
            Account e=new Account();
            e.setTel(phone);
            //String account= UUID.randomUUID().toString().replace("-","");
            e.setAccount(phone);
            e.setNickname(generateNickname());
            e.setPassword(MD5.md5(password));
            e.setScore(100);  //注册送积分
            e=DateTimeUtil.giveVipWhenReg(e);
            String res=accountService.insert(e)+"";
            if(e.getId().equals(res)){
                //注册成功后将已发送验证码数量及验证码内容清空
                Sms sms=new Sms();
                sms.setPhone(phone);
                sms=smsService.selectOne(sms);
                sms.setSendCount(0);
                sms.setContent("0");
                smsService.update(sms);

                e=accountService.selectById(e.getId());
                session.setAttribute(USER_INFO,e);
                session.setAttribute("regType","phone");
                return "/account/reg_success_active_result";
                //return "redirect:/account/activeAccount";
                //"注册成功" ;
            }else{
                throw new NullPointerException("注册失败");

            }
    }
    //手机重置密码
    @RequestMapping(value="modifyPasswordByPhone",method = RequestMethod.POST)
    public String modifyPasswordByPhone(String phone, String password, HttpSession session){
        Account e=new Account();
        e.setTel(phone);
        e=accountService.selectOne(e);
        e.setPassword(MD5.md5(password));
        String res=accountService.update(e)+"";
        if(e.getId().equals(res)){
            session.setAttribute("resetType","phone");
            return "redirect:/account/resetSuccess";
        }else{
            throw new NullPointerException("修改失败");

        }
    }
    //随机生成nickname，要求唯一
    public   String generateNickname(){
        Account acc=new Account();
        String nickName=null;
        int queryResult=1;
        while(queryResult!=0){
            nickName="ym-"+(int)((Math.random()*9+1)*100000);
            acc.setNickname(nickName);
            queryResult=accountService.selectCount(acc);
        }

        return nickName;
    }

}
