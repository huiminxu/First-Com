<#import "/resource/common_html_front.ftl" as html>
<#import "/indexMenu.ftl" as menu>
<@html.htmlBase>
    <@menu.menu selectMenu=""/>

<div class="beuser-box container">
    <div class="beuser-step">

        <ul class="mail-step clearfix">
            <li>1.填写邮箱信息</li>
            <li class="active">2.身份验证</li>
            <li>3.设置新密码</li>
            <li>4.完成</li>
        </ul>
    </div>

    <div class="beuser-main">
        <div class="beuser-msg">
            <p>邮件已发送至</p>
            <h4 class="green">${currentEmail}</h4>
            <p>请您登录邮箱完成身份验证！</p>
            <#if  emailURL!= '1'>
                <a href="${emailURL}" class="btn btn-default form-control">前往邮箱验证</a>
            </#if>
            <div class="mt60  tl">
                <dl>
                    <dt class="green">如果您长时间未收到邮件，您可以：</dt>
                    <dd>1、请检查邮件地址是否正确。</dd>
                    <dd>2、请检查邮件是否在邮箱的垃圾箱中。</dd>
                    <dd>3、您可以点击<span class="glyphicon glyphicon-share-alt"></span><a
                            href="${systemSetting().www}/account/sendEmailAgain.html?uid=${uid!""}">再次发送</a></dd>
                    <dd>如果已上都不能解决您的问题，请联系管理员寻求帮助：${systemSetting().email!""}</dd>
                </dl>
            </div>
        </div>

    </div>

</div>
</@html.htmlBase>