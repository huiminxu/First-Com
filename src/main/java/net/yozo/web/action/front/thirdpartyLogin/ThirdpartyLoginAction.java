package net.yozo.web.action.front.thirdpartyLogin;


import com.qq.connect.QQConnectException;
import com.qq.connect.api.OpenID;

import com.qq.connect.javabeans.AccessToken;
import com.qq.connect.oauth.Oauth;


import com.qq.connect.utils.QQConnectConfig;
import com.qq.connect.utils.URLEncodeUtils;
import com.sun.mail.imap.protocol.ID;
import net.yozo.core.util.AddressUtils;
import net.yozo.core.util.DateTimeUtil;
import net.yozo.core.weibo4j.WeiboOauth;
import net.yozo.core.weibo4j.http.WeiboAccessToken;

import net.yozo.core.weibo4j.model.WeiboException;

import net.yozo.core.weixin.util.Weixin;
import net.yozo.core.weixin.util.WeixinAccessToken;
import net.yozo.core.weixin.util.WeixinConfig;
import net.yozo.services.front.account.AccountService;
import net.yozo.services.front.account.bean.Account;

import net.yozo.web.util.RequestHolder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

import java.net.URLEncoder;
import java.util.Date;

import static net.yozo.core.FrontContainer.USER_INFO;


/**
 * Created by Vicks on 2017/9/6.
 */
@Controller
@RequestMapping("ThirdpartyLogin")
public class ThirdpartyLoginAction {
    private static final org.apache.logging.log4j.Logger logger = org.apache.logging.log4j.LogManager.getLogger(ThirdpartyLoginAction.class);
    @Autowired
    private AccountService accountService;

    //QQ登录
    @RequestMapping(value="qqLogin",method = RequestMethod.GET)
    public void qqLogin(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html;charset=utf-8");

        String url1= null;
        try {
            url1 = new Oauth().getAuthorizeURL(request);
        } catch (QQConnectException e) {
            e.printStackTrace();
        }
            String tt=QQConnectConfig.getValue("redirect_URI");

        try {
            //response.sendRedirect(new Oauth().getAuthorizeURL(request));
            response.sendRedirect(url1.replace(tt,URLEncodeUtils.encodeURL(tt)));
            logger.debug("跳转至QQ登录页面");
        } catch (IOException e) {
            e.printStackTrace();
        }


    }
    @RequestMapping(value="afterQQLogin",method = RequestMethod.GET)
    public String afterQQLogin(HttpServletRequest request, HttpServletResponse response)  {
        response.setContentType("text/html; charset=utf-8");

        //PrintWriter out = response.getWriter();
        logger.debug("QQ登录后回调");
        try {
            AccessToken accessTokenObj = (new Oauth()).getAccessTokenByRequest(request);

            String accessToken   = null,
                    openID        = null;
            long tokenExpireIn = 0L;


            if (accessTokenObj.getAccessToken().equals("")) {
//                我们的网站被CSRF攻击了或者用户取消了授权
//                做一些数据统计工作
                System.out.print("没有获取到响应参数");

            } else {
                accessToken = accessTokenObj.getAccessToken();
                tokenExpireIn = accessTokenObj.getExpireIn();

                request.getSession().setAttribute("demo_access_token", accessToken);
                request.getSession().setAttribute("demo_token_expirein", String.valueOf(tokenExpireIn));

                // 利用获取到的accessToken 去获取当前用的openid -------- start
                OpenID openIDObj =  new OpenID(accessToken);
                openID = openIDObj.getUserOpenID();

               // out.println("欢迎你，代号为 " + openID + " 的用户!");
                request.getSession().setAttribute("demo_openid", openID);

                checkIsFirstLogin(openID,"qq");


                logger.debug("登录成功");
                // 利用获取到的accessToken 去获取当前用户的openid --------- end


                /*out.println("<p> start -----------------------------------利用获取到的accessToken,openid 去获取用户在Qzone的昵称等信息 ---------------------------- start </p>");
                UserInfo qzoneUserInfo = new UserInfo(accessToken, openID);
                UserInfoBean userInfoBean = qzoneUserInfo.getUserInfo();
                out.println("<br/>");
                if (userInfoBean.getRet() == 0) {
                    out.println(userInfoBean.getNickname() + "<br/>");
                    out.println(userInfoBean.getGender() + "<br/>");
                    out.println("黄钻等级： " + userInfoBean.getLevel() + "<br/>");
                    out.println("会员 : " + userInfoBean.isVip() + "<br/>");
                    out.println("黄钻会员： " + userInfoBean.isYellowYearVip() + "<br/>");
                    out.println("<image src=" + userInfoBean.getAvatar().getAvatarURL30() + "/><br/>");
                    out.println("<image src=" + userInfoBean.getAvatar().getAvatarURL50() + "/><br/>");
                    out.println("<image src=" + userInfoBean.getAvatar().getAvatarURL100() + "/><br/>");
                } else {
                    out.println("很抱歉，我们没能正确获取到您的信息，原因是： " + userInfoBean.getMsg());
                }
                out.println("<p> end -----------------------------------利用获取到的accessToken,openid 去获取用户在Qzone的昵称等信息 ---------------------------- end </p>");



               out.println("<p> start ----------------------------------- 验证当前用户是否为认证空间的粉丝------------------------------------------------ start <p>");
                PageFans pageFansObj = new PageFans(accessToken, openID);
                PageFansBean pageFansBean = pageFansObj.checkPageFans("97700000");
                if (pageFansBean.getRet() == 0) {
                    out.println("<p>验证您" + (pageFansBean.isFans() ? "是" : "不是")  + "QQ空间97700000官方认证空间的粉丝</p>");
                } else {
                    out.println("很抱歉，我们没能正确获取到您的信息，原因是： " + pageFansBean.getMsg());
                }
                out.println("<p> end ----------------------------------- 验证当前用户是否为认证空间的粉丝------------------------------------------------ end <p>");



                out.println("<p> start -----------------------------------利用获取到的accessToken,openid 去获取用户在微博的昵称等信息 ---------------------------- start </p>");
                com.qq.connect.api.weibo.UserInfo weiboUserInfo = new com.qq.connect.api.weibo.UserInfo(accessToken, openID);
                com.qq.connect.javabeans.weibo.UserInfoBean weiboUserInfoBean = weiboUserInfo.getUserInfo();
                if (weiboUserInfoBean.getRet() == 0) {
                    //获取用户的微博头像----------------------start
                    out.println("<image src=" + weiboUserInfoBean.getAvatar().getAvatarURL30() + "/><br/>");
                    out.println("<image src=" + weiboUserInfoBean.getAvatar().getAvatarURL50() + "/><br/>");
                    out.println("<image src=" + weiboUserInfoBean.getAvatar().getAvatarURL100() + "/><br/>");
                    //获取用户的微博头像 ---------------------end

                    //获取用户的生日信息 --------------------start
                    out.println("<p>尊敬的用户，你的生日是： " + weiboUserInfoBean.getBirthday().getYear()
                            +  "年" + weiboUserInfoBean.getBirthday().getMonth() + "月" +
                            weiboUserInfoBean.getBirthday().getDay() + "日");
                    //获取用户的生日信息 --------------------end

                    StringBuffer sb = new StringBuffer();
                    sb.append("<p>所在地:" + weiboUserInfoBean.getCountryCode() + "-" + weiboUserInfoBean.getProvinceCode() + "-" + weiboUserInfoBean.getCityCode()
                            + weiboUserInfoBean.getLocation());

                    //获取用户的公司信息---------------------------start
                    ArrayList<Company> companies = weiboUserInfoBean.getCompanies();
                    if (companies.size() > 0) {
                        //有公司信息
                        for (int i=0, j=companies.size(); i<j; i++) {
                            sb.append("<p>曾服役过的公司：公司ID-" + companies.get(i).getID() + " 名称-" +
                                    companies.get(i).getCompanyName() + " 部门名称-" + companies.get(i).getDepartmentName() + " 开始工作年-" +
                                    companies.get(i).getBeginYear() + " 结束工作年-" + companies.get(i).getEndYear());
                        }
                    } else {
                        //没有公司信息
                    }
                    //获取用户的公司信息---------------------------end

                    out.println(sb.toString());

                } else {
                    out.println("很抱歉，我们没能正确获取到您的信息，原因是： " + weiboUserInfoBean.getMsg());
                }

                out.println("<p> end -----------------------------------利用获取到的accessToken,openid 去获取用户在微博的昵称等信息 ---------------------------- end </p>");*/

            }
        } catch (QQConnectException e) {
            e.printStackTrace();
            logger.error("QQ登录失败",e);
        }
        return "redirect:/";

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


    //微博登录
    @RequestMapping(value="weiboLogin",method = RequestMethod.GET)
    public void weiboLogin(HttpServletResponse response)throws IOException ,WeiboException{
        response.sendRedirect(new WeiboOauth().authorize("code"));
        //BareBonesBrowserLaunch.openURL(oauth.authorize("code"));

    }
    @RequestMapping(value="afterWeiboLogin",method = RequestMethod.GET)
    public String afterWeiboLogin(HttpServletRequest request,HttpServletResponse response) {
        String queryString = ((HttpServletRequest)request).getQueryString();
        if(queryString==null){
            logger.error("微博code返回失败");
        }
        WeiboOauth oauth = new WeiboOauth();
        String code = queryString.substring(queryString.indexOf("=")+1,queryString.length());
        try {
            WeiboAccessToken accessToken=oauth.getAccessTokenByCode(code);
            String access_token=accessToken.getAccessToken();

            String uid=accessToken.getUid();
            /*User user=new User(client.get(
                    WeiboConfig.getValue("baseURL") + "users/show.json",
                    new PostParameter[] { new PostParameter("uid", uid) },
                    access_token).asJSONObject());*/
            checkIsFirstLogin(uid,"weibo");

        } catch (WeiboException e) {
            e.printStackTrace();
        }
        return "redirect:/";
    }



    //微信登录
    @RequestMapping(value="weixinLogin",method = RequestMethod.GET)
    public void weixinLogin(HttpServletResponse response,HttpServletRequest request) {
        response.setContentType("text/html;charset=utf-8");
        try{
            String url1=new Weixin().getCode(request);
            String tt= WeixinConfig.getValue("redirect_URI");
            response.sendRedirect(url1.replace(tt,URLEncodeUtils.encodeURL(tt)));
    } catch (Exception e) {
        e.printStackTrace();
    }
    }
    @RequestMapping(value="afterWeixinLogin",method = RequestMethod.GET)
    public String afterWeixinLogin(HttpServletRequest request,HttpServletResponse response)  {
        response.setContentType("text/html;charset=utf-8");
        try {
            WeixinAccessToken accessTokenObj = (new Weixin()).getAccessTokenByRequest(request);
            String openid=accessTokenObj.getOpenid();
            checkIsFirstLogin(openid,"weixin");
        } catch (QQConnectException e) {
            e.printStackTrace();
        }
        return "redirect:/";
    }
    //检查是否首次登录
    public void checkIsFirstLogin(String id,String loginType){
        Account e=new Account();

        if(loginType.equals("qq")){
            e.setOpenId(id);
        }else if(loginType.equals("weibo")){
            e.setSinaWeiboID(id);
        }else if(loginType.equals("weixin")){
            e.setWeixinID(id);
        }
        Account acc=accountService.selectOne(e);
        if(acc==null){
            acc=firstLogin(e);
        }
        updateLoginStatus(acc);
        RequestHolder.getSession().setAttribute(USER_INFO,acc);
    }
    //首次登录
    public Account firstLogin(Account e){

        int  isUnique=1;
        while(isUnique!=0){
            e.setAccount(new Date().getTime()+"");
            isUnique=accountService.selectCount(e);
        }
        e.setNickname(generateNickname());
        e.setScore(100);  //注册送积分
        e= DateTimeUtil.giveVipWhenReg(e);
        accountService.insert(e);
        return accountService.selectOne(e);
    }
    //更新用户最后登录时间
    public void updateLoginStatus(Account e){
        e.setLastLoginTime("yes");
        e.setLastLoginIp(AddressUtils.getIp(RequestHolder.getRequest()));
        String address = null;
        try {
            address = AddressUtils.getAddresses("ip=" + e.getLastLoginIp(), "utf-8");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        e.setLastLoginArea(address);
        accountService.update(e);
    }
}
