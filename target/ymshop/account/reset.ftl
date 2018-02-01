<#import "/resource/common_html_front.ftl" as html>
<#import "/indexMenu.ftl" as menu>
<@html.htmlBase>
    <@menu.menu selectMenu=""/>
<div class="beuser-box container">
    <div class="beuser-step">
        <ul class="mail-step clearfix">
            <li>1.填写邮箱信息</li>
            <li>2.身份验证</li>
            <li class="active">3.设置新密码</li>
            <li>4.完成</li>
        </ul>
    </div>
    <div class="beuser-main">
        <div class="beuser-msg">
            <#if reset_password_email_timeout??>
                <!-- 找回密码链接已失效了！ -->
                <p>${reset_password_email_timeout!""}</p>
                <a style="display: none;" class="btn btn-default form-control"
                   href="${systemSetting().www}/accountdoForget.html?email=${e.email!""}">重新发送邮件</a>

            <#else>
                <div class="formBox">
                    <div class="beuser-main-pad30">
                        <form role="form" action="${basepath}/account/doReset" theme="simple">
                            <input type="hidden" name="email" value="${e.email!""}"/>
                            <div class="form-group">
                                <input name="password" type="password" class="form-control" id="password"
                                       placeholder="请输入密码"
                                       data-rule="密码:required;password;length[6~20];" data-target=".msgpassword"/>
                                <div class="msgbox">
                                    <div class="msgpassword"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <input name="password2" type="password" class="form-control" id="password2"
                                       placeholder="请确认密码"
                                       data-rule="确认密码:required;password2;length[6~20];match(password)"
                                       data-target=".msgrepassword"/>
                                <div class="msgbox">
                                    <div class="msgrepassword"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-default form-control" value="提交信息">
                                    确认修改
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </#if>

        </div>
    </div>

</div>
</@html.htmlBase>