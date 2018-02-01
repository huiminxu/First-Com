<#import "/resource/common_html_front.ftl" as html>
<#import "/indexMenu.ftl" as menu>

<@html.htmlBase>
    <@menu.menu selectMenu=""/>
<div class="beuser-box container">
    <div class="beuser-step">
        <#if resetType=='phone'>
            <ul class="phone-step clearfix">
                <li>1.填写手机信息</li>
                <li class="active">2.完成</li>
            </ul>
        <#elseif resetType=='mail'>
            <ul class="mail-step clearfix">
                <li>1.填写邮箱信息</li>
                <li>2.身份验证</li>
                <li>3.设置新密码</li>
                <li class="active">4.完成</li>
            </ul>
        </#if>
    </div>
    <div class="beuser-main">
        <div class="beuser-msg">
            <img src="../resource/images/yomo-figure-exciting.png">
            <h4 class="green">密码成功修改！</h4>
            <P>您可以使用新密码登录了。</P>
            <a href="${basepath}/account/login.html" class="btn btn-default form-control">立即登录</a>
        </div>
    </div>
</div>
</@html.htmlBase>