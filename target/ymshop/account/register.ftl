<#import "/resource/common_html_front.ftl" as html>
<#import "/indexMenu.ftl" as menu>
<@html.htmlBase>

    <@menu.menu selectMenu=""/>
<div class="beuser-box container">
    <div class="beuser-step">
        <ul class="phone-step clearfix">
            <li class="active">1.填写注册信息</li>
            <li>2.注册成功</li>
        </ul>
        <ul style="display: none" class="mail-step clearfix">
            <li class="active">1.填写注册信息</li>
            <li>2.邮箱验证</li>
            <li>3.注册成功</li>
        </ul>
    </div>

    <div class="beuser-main">
        <ul id="registerType" class="nav nav-tabs beuser-type">
            <li class="active"><a href="#phone" data-toggle="tab">手机注册</a></li>
            <li><a href="#mail" data-toggle="tab">邮箱注册</a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="phone">
                <div class="formBox">
                    <!-- 手机登录 form表单 提交：form-action  获取验证码按钮：ajax -->
                    <form name="formRegisetPhone" id="formRegisetPhone" role="form" method="post" autocomplete="off"
                          action="${basepath}/phoneManage/registerByPhone">
                        <div class="beuser-main-pad30">
                            <div class="form-group">
                                <input type="text" class="form-control" name="phone" autocomplete="off"
                                       placeholder="请输入手机号">
                                <div class="msgbox">
                                    <div class="msgPhone"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control" name="password" autocomplete="off"
                                       placeholder="请输入密码">
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
                                   onclick="javaScript:reloadImg(this);"
                                   class="btn-link btn-sm undis">看不清？换一张</a> <#--图形验证码区域-->

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
                        </div>
                        <div class="form-group protocol-box">
                            <input type="checkbox" checked="checked" name="protocol"/>注册即同意<a
                                href="${basepath}/help/zcxy.html?id=0" class="a-link"
                                target="_blank">《永中云办公系列用户协议》</a>和<a href="${basepath}/help/zcxy.html?id=1"
                                                                     class="a-link" target="_blank">《保密私密协议》</a>
                            <div class="msgbox">
                                <div class="msgProtocol"></div>
                            </div>
                        </div>
                        <div class="beuser-main-pad30">
                            <div class="form-group">
                                <button type="submit" class="btn btn-default form-control"
                                        onclick="_czc.push(['_trackEvent','手机注册页', '点击注册']);">注册
                                </button>
                            </div>
                        </div>
                    </form>

                </div>
                <div class=""><p class="has-account">已经拥有账户？<a href="${basepath}/account/login" class="btn_zc">登录</a>
                </p>
                </div>

            </div>
            <div class="tab-pane" id="mail">
                <div class="formBox">
                    <form role="form" method="post" class="nice-validator n-default"
                          action="${basepath}/account/doRegister.html">
                        <div class="beuser-main-pad30">
                            <div class="form-group">
                                <input name="email" type="text" class="form-control" id="email" maxlength="45"
                                       data-rule="邮箱:required;email;length[1~45];remote[unique.html]"
                                       placeholder="请输入邮箱" data-target=".msgmail"/>

                                <div class="msgbox">
                                    <div class="msgmail"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <input name="password" type="password" class="form-control" id="password"
                                       placeholder="请输入密码"
                                       data-rule="密码:required;password" data-target=".msgpassword"/>
                                <div class="msgbox">
                                    <div class="msgpassword"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <input name="password2" type="password" class="form-control" id="password2"
                                       placeholder="请输入确认密码"
                                       data-rule="确认密码:required;match(password)" data-target=".msgrepassword"/>
                                <div class="msgbox">
                                    <div class="msgrepassword"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <input type="text" name="vcode" type="text" class="form-control" id="vcode"
                                       placeholder="验证码"
                                       data-rule="验证码:required;vcode;remote[unique.html]" data-target=".msgyzm"/>

                                <img src="${basepath}/ValidateImage.do" class="codes"
                                     onclick="javaScript:reloadImg(this);" class="vcodeCss"/>
                                <a href="javascript:void(0)"
                                   onclick="javaScript:reloadImg(this);" class="btn-link btn-sm undis">看不清？换一张</a>
                            <#--图形验证码区域-->

                                <div class="msgbox">
                                    <div class="msgyzm"></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group protocol-box">
                            <input type="checkbox" checked="checked" name="protocol" data-rule="协议:checked"
                                   data-msg-checked="请阅读注册协议并勾选同意" data-target="msgprotocol1"/>注册即同意<a
                                href="${basepath}/help/zcxy.html?id=0" class="a-link"
                                target="_blank">《永中云办公系列用户协议》</a>和<a href="${basepath}/help/zcxy.html?id=1"
                                                                     class="a-link" target="_blank">《保密私密协议》</a>
                            <div class="msgbox">
                                <div class="msgProtocol"></div>
                            </div>
                        </div>
                        <div class="beuser-main-pad30">
                            <div class="form-group">
                                <button class="btn btn-default form-control" type="submit"
                                        onclick="_czc.push(['_trackEvent', '邮箱注册页','点击注册']);">注 册
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class=""><p class="has-account">已经拥有账户？<a href="${basepath}/account/login" class="btn_zc">登录</a>
                </p>
                </div>

            </div>
        </div>
    </div>
</div>
<div class="container undis">
    <div class="recommend_mb">
        <h2>推荐模板</h2>
        <ul>
            <#list systemManager().pushTemplates as item>
                <li>
                    <a href="${item.url}"><img src="${item.key1!""}"/></a>
                </li>
            </#list>
        </ul>
    </div>
</div>
</div>
<script type="text/javascript" src="${basepath}/resource/js2/page/form.js"></script>
<script type="text/javascript">
    "use strict";
    $(document).ready(function () {
        //验证formPhone 表单
        var obj = {
            ele: $("#formRegisetPhone"),
            tip: {phonetip: "注册成功后可用手机号进行登录"},
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