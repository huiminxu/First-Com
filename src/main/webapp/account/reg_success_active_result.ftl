<#import "/resource/common_html_front.ftl" as html>
<#import "/indexMenu.ftl" as menu>
<@html.htmlBase>
<@menu.menu selectMenu=""/>

<div class="beuser-box container">
    <div class="beuser-step">
        <#if regType=='phone'>
            <ul class="phone-step clearfix">
                <li>1.填写手机信息</li>
                <li class="active">2.完成</li>
            </ul>
        <#elseif regType=='mail'>
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
            <#if LinkInvalid??>
                <h4 class="green">链接已失效！</h4>
            <#else>
                <img src="../resource/images/yomo-figure-happy.png">
                <h4 class="green">注册成功</h4>
                <h2 class="green">欢迎加入YOMO！</h2>
            </#if>
            <p class="mt60 ml30">5s后将自动跳转到首页</p>
            <a href="${systemSetting().www}/index" class="btn-link btn-sm">手动跳转</a>
        </div>
    </div>
</div>
<script type="text/javascript">
 $(document).ready(function () {
     setTimeout(goUrl,5000)
     function goUrl(){
           window.location.href="${systemSetting().www}/index";
     }
 })
</script>
</@html.htmlBase>