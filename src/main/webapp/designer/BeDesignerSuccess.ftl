<#import "/resource/common_html_front.ftl" as html>
<#import "/indexMenu.ftl" as menu>
<@html.htmlBase title="注册设计师申请成功">

<link rel="stylesheet" href="${basepath}/resource/css2/design.css" type="text/css"/>
    <@menu.menu selectMenu="toBeDesgin"/>
<div class="beDesginerSuccess-box">
    <div class="beDesginerSuccess-main">
        <div class="desgin-info">
            <p><strong>设计师名称：</strong>${d.nickname!""}</p>
            <p><strong>验证日期：</strong>${(d.auditTime?string("yyyy-MM-dd"))!""}</p>
            <p><strong>认证结果：</strong>通过</p>
        </div>
    </div>
</div>
</@html.htmlBase>