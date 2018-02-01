<#include "/resource/common_css.ftl"/>
<link rel="stylesheet" href="${basepath}/resource/css2/account.css" type="text/css"/>
<div class="pay-box-jf">
    <div class="pay-result" id="payresult">
        <h4>支付成功</h4>
        <p><img src="${basepath}/resource/images/yomo/pay-success.png"></p>
        <p> <a  href="${basepath}/auth/template/download?id=${RequestParameters["templateId"]}"  target="_blank"   class="btn-pay5">立即下载</a></p>
        <p class="mt27"><a   href="${basepath}/auth/account/orders"  target="_blank"   >订单中心 》》</a></p>
    </div>
</div>
<#include "/resource/common_js.ftl"/>