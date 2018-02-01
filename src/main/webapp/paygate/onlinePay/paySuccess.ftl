<#include "/resource/common_css.ftl"/>
<link rel="stylesheet" href="${basepath}/resource/css2/account.css" type="text/css"/>
<div class="pay-box">
<#--支付结果-->
    <div class="pay-result" id="payresult">
    <#if status =="3">
        <div class="pay-result-success pay-result-box">
            <h4>支付成功</h4>
            <p><img src="${basepath}/resource/images/yomo/pay-success.png"></p>
            <#if tempID?? >
            <p>
                <a href="${basepath}/auth/template/download?id=${tempID}" target="_blank" data-cfrom="在线支付下载" data-basepath="${basepath}" class="btn-pay5 btn-mfdownload">立即下载</a>
            </p>
         </#if>
        <#if CU == "CU" >
            <p class="mt27"><a href="${basepath}/auth/account/customizations/imuser" target="_blank">我的定制 》》</a></p>

        <#else>
            <p class="mt27"><a href="${basepath}/auth/account/orders" target="_blank">订单中心 》》</a></p>
        </#if>
        </div>
    <#else>
        <div class="pay-result-fail pay-result-box">
            <h4>支付失败</h4>
            <p><img src="${basepath}/resource/images/yomo/pay-success.png"></p>
            <p class="mt27"><a href="javascript:void(0);" class="closeiframe" target="_blank">关闭 》》</a></p>
        </div>
    </#if >
    </div>
<#include "/resource/common_js.ftl"/>