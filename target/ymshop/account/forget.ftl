<#import "/resource/common_html_front.ftl" as html>
<#import "/indexMenu.ftl" as menu>
<@html.htmlBase>
    <@menu.menu selectMenu=""/>
<div class="container beuser-box ">
    <div class="beuser-step">
        <ul class="phone-step clearfix">
            <li class="active">1.填写手机信息</li>
            <li>2.完成</li>
        </ul>
        <ul style="display: none" class="mail-step clearfix">
            <li class="active">1.填写邮箱信息</li>
            <li>2.身份验证</li>
            <li>3.设置新密码</li>
            <li>4.完成</li>
        </ul>
    </div>
    <div class="beuser-main">
        <ul id="registerType" class="nav nav-tabs beuser-type">
            <li class="active"><a href="#phone" data-toggle="tab">手机找回密码</a></li>
            <li><a href="#mail" data-toggle="tab">邮箱找回密码</a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="phone">
                <!-- 信息-->
                <div class="formBox">
                    <div class="beuser-main-pad30 mt20">
                        <form role="form" method="post" id="formForgetPhone" name="formForgetPhone"
                              action="${basepath}/phoneManage/modifyPasswordByPhone">
                            <div class="form-group">
                                <input type="text" class="form-control" name="phone" placeholder="请输入手机号">
                                <div class="msgbox">
                                    <div class="msgPhone"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control" name="password" placeholder="请输入新密码">
                                <div class="msgbox">
                                    <div class="msgPassword"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <input type="text" name="vcode" type="text" class="form-control" id="vcode"
                                       placeholder="验证码"/>
                                <img src="${basepath}/ValidateImage.do"
                                     onclick="javaScript:reloadImg(this);" class="codes"></img>
                                <a href="javascript:void(0)"
                                   onclick="javaScript:reloadImg(this);" class="btn-link btn-sm undis">看不清？换一张</a>
                            <#--图形验证码区域-->
                                <div class="msgbox">
                                    <div class="msgyzm"></div>
                                </div>
                            </div>
                            <div class="form-group captcha-box">
                                <input type="text" class="form-control" name="captcha" placeholder="手机验证码">
                                <input type="button" class="btn-white form-control" id="btnCaptcha" value="获取验证码">
                                <div class="msgbox">
                                    <div class="msgCaptcha"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-default form-control">提交信息</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="tab-pane" id="mail">
                <div class="formBox">
                    <div class="beuser-main-pad30 mt20">
                        <form role="form" method="post" class="nice-validator n-default"
                              action="${basepath}/account/doForget.html" theme="simple">
                            <div class="form-group">
                                <input name="email" type="text" class="form-control" id="account"
                                       placeholder="请输入邮箱账号"
                                       data-rule="账号:required;account;length[3~50];remote[checkEmailExist.html]"
                                       data-target=".msgmail"/>
                                <div class="msgbox">
                                    <div class="msgmail"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <input type="text" name="vcode" type="text" class="form-control" id="vcode"
                                       placeholder="验证码"
                                       data-rule="验证码:required;vcode;remote[unique.html]" data-target=".msgyzm"/>
                                <img src="${basepath}/ValidateImage.do" class="codes"
                                     onclick="javaScript:reloadImg(this);" class="vcodeCss"/>
                                <a href="javascript:void(0)"
                                   onclick="javaScript:reloadImg(this);" class="btn-link btn-sm undis" >看不清？换一张</a>
                                <div class="msgbox">
                                    <div class="msgyzm"></div>
                                </div>
                            </div>

                            <div class="form-group">
                                <button type="submit" class="btn btn-default form-control" value="提交信息"> 提交信息</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="${basepath}/resource/js2/page/form.js"></script>
<script type="text/javascript">
    "use strict";
    $(document).ready(function () {
        //验证formPhone 表单
        var obj = {
            ele: $("#formForgetPhone"),
            tip: {phonetip: "请输入您注册的手机号码"},
            remote: {
                url1: "${basepath}/account/unique.html",
                url2: "${basepath}/phoneManage/checkCaptcha",
                url3: "${basepath}/phoneManage/sendVerification"
            }
        };
        formPhoneCheck(obj);
        // beuser-type 登录type 切换>beuser-step 切换
        $(".beuser-type").on('click', 'li', function (event) {
            event.preventDefault();
            $(".beuser-step ul").css('display', 'none');
            $(".beuser-step ul").eq($(this).index()).css('display', 'inline-block');
        });
    });
    function reloadImg(ele) {
        var _this = ele;
        var option = {
            url: "${basepath}/ValidateImage.do?random="
            + Math.random(),
            ele: _this
        }
        reloadImg2(option);
    };
</script>

</@html.htmlBase>