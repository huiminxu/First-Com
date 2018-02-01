<#include "/resource/common_css.ftl"/>
<link rel="stylesheet" href="${basepath}/resource/css2/account.css" type="text/css"/>

<#if orderStatus??>
    <#if orderStatus =="already">
    <div class="pay-box-jf">
        <div class="pay-result">
            <p class="order-num">
                订单号：${orderNum!""}
            </p>
            <p class="mb30 order-status">亲，您已经兑换过该模板</p>
            <p class="mt60">
                <a href="${basepath}/auth/template/download?id=${templateId!""}" data-basepath="${basepath}" target="_blank"
                   class="btn-pay5 btn-mfdownload" data-cfrom="积分支付下载">立即下载</a></p>
            <p class="mt27"><a href="${basepath}/auth/account/orders" target="_blank">订单中心 》》</a></p>

        </div>
    </div>
    <#elseif orderStatus =="success">
    <div class="pay-box-jf" id="payresult">
        <div class="pay-result">
                <div class="pay-result-success">
                    <h4>兑换成功</h4>
                    <p><img src="${basepath}/resource/images/yomo/pay-success.png"></p>
                    <p><a href="${basepath}/auth/template/download?id=${tId!""}" target="_blank" class="btn-pay5 btn-mfdownload" data-cfrom="积分支付下载" data-basepath="${basepath}">立即下载</a>
                    </p>
                    <p class="mt27"><a href="${basepath}/auth/account/orders" target="_blank">订单中心 》》</a></p>
                </div>
        </div>
    </div>
    <#elseif orderStatus =="fail">
    <div class="pay-box-jf" >
        <div class="pay-result">
            <div class="pay-result-fail">
                <h4>兑换失败</h4>
                <p class="mt20"><span class="red">${failMsg}</span></p>
                <p><img src="${basepath}/resource/images/yomo/pay-fail.png"></p>
                <p class="mt27"><a href="javascript:void(0);" class="closeiframe" target="_blank">关闭 》》</a></p>
            </div>
        </div>
    </div>
    <#else >
    <div class="pay-box-jf">
        <div class="pay-result">
            <p class="order-num">
                订单号：${orderNum!""}
            </p>
            <p class="mb30 order-status">亲，您已经兑换过该模板</p>
            <p>状态：<span class="green">未兑换</span></p>
            <p class="mt60">
                <a href="${basepath}/auth/order/toPay?id=${orderId!""}" class="btn-pay5">点击支付订单</a>
            </p>
        </div>
    </div>

    </#if>
<#else>
<div class="pay-box-jf" id="jfpay">
    <p class="order-num">
        订单号：${orderNum!""}
    </p>
    <dl class="order-type">
        <dt>
            积分兑换
        </dt>
        <dd>
            <p class="price">${downScore}<sub>分</sub></p>
        <#--<p class="price">${totalScore}<sub>分</sub></p>-->
            <p>当前积分:${totalScore}分</p>
        </dd>
    </dl>
    <p class="mt33">
    <a  href="${basepath}/auth/paygate/scorepay?orderId=${orderId}" id="btnPay" class="btn-pay5"/>确认兑换</a>
    </p>
    <p class="mt27"><a href="javascript:void(0);" class="closeiframe">取消兑换</a></p>
    <#--<p class="mt15">积分不够？查看<a href="${basepath}/index" target="_blank" class="btn-link">积分获取技巧</a></p>-->
</div>
</#if>

<#include "/resource/common_js.ftl"/>
<script type="text/javascript">
    $(document).ready(function () {
        //取消兑换
        $("a.closeiframe").on('click', function (event) {
            event.preventDefault();
            closeIframe();
        });

    })
</script>