<#include "/resource/common_css.ftl"/>
<link rel="stylesheet" href="${basepath}/resource/css2/account.css" type="text/css"/>
<div class="pay-box">

<#if status??>
<#--已有订单-->
    <#if status =="1">
    <#--已购买：已支付-->
    <#--在线支付-已有订单：已支付-->
        <div class="pay-result" id="onlinepay-hasPay" >
            <h4 class="mb45">亲，您已经购买过该模板</h4>
            <p class="mb45">订单号：<span class="green orderNum">${templateName}</span></p>
            <p class="mb45">
                <a href="${basepath}/auth/template/download?id=${templateId}" target="_blank"
                   class="btn-pay5 btn-mfdownload"  data-basepath="${basepath}" data-cfrom="在线支付下载">立即下载</a></p>
            <p><a href="${basepath}/auth/account/orders" target="_blank">订单中心 》》</a></p>

        </div>
    <#elseif status =="2">
    <#--已购买：未支付-->
    <#--在线支付-已有订单：未支付-->
        <div class="pay-result" id="onlinepay-noPay">
            <h4 class="mb45">亲，您已经购买过该模板</h4>
            <p class="mb45  ">订单号：<span class="green orderNum">${templateName}</span></p>
            <p class="mb60  ">状态：<span class="red">未支付</span></p>
            <p>
                <a href="${basepath}/auth/order/moneypay?id=${orderNum}" class="btn-pay5">点击支付订单</a>
            </p>
        </div>
    <#else>
    <#--在线支付-->
        <div class="pay-main" id="onlinepay" >
            <ul class="paytype-list clearfix">
                <li class="zfb-item">
                    <h4><img src="${basepath}/resource/images/yomo/zfb_icon.jpg" alt="支付宝支付"></h4>
                    <p><img src="${zfb}"></p>
                    <#--<p><img src="${basepath}/order/getzfbQR?orderid=${orderNum}"></p>-->
                    <p class="tl pl15">无法扫描？<a href="${basepath}/auth/order/toPagePay?orderNum=${orderNum}" class="btn-link">打开网页支付宝支付</a></p>
                </li>
                <li class="wx-item">
                    <h4><img src="${basepath}/resource/images/yomo/wx_icon.jpg" alt="微信支付"></h4>
                    <p><img src="${wx}"></p>
                    <#--<p><img src="${basepath}/order/getwxQR?orderid=${orderNum}" ></p>-->
                </li>
            </ul>
            <div class="pay-detail tc">
                <p class="">扫码支付<span class="recharge-money">${amount}</span>元</p>
                <p class="detail-order">订单号：<span class="order-num"></span> | 购买物品：<span
                        class="order-name">${templateName}</span></p>
                <p><a href="#" class="closeiframe">取消充值</a>
                    <#if ordertype?? &&ordertype!=3>
                    <a href="${basepath}/auth/paygate/yomopay?orderNum=${orderNum}" class="toyd-pay ml btn-link">柚点支付</a>
                    </#if>
                </p>
            </div>
        </div>
    </#if>
<#else>
<#--没有订单-->
<#--loading-->
    <div class="pay-main" id="payloading" >
        <div class="loading">
            <img src="${basepath}/resource/images/loader.gif">
        </div>
    </div>
</#if>

</div>
<script type="text/javascript" src="${basepath}/resource/js2/page/pay.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("a.closeiframe").on('click', function (event) {
            event.preventDefault();
            closeIframe();
        });
        //loading
        if(${status}&&${status}=="3"){
            var loadBox=$('#payloading');
            var payBox=$('#onlinepay');
            setTimeout(function () {
                loadBox.css('display','none');
                payBox.css('display','block');
                var payResult = setInterval(function () {
                    $.ajax({
                        type: 'GET',
                        dataType: "text",
                        url: "${basepath}/order/PayQuery?id=${orderNum}",
                        success: function (data) {
                            if (data == "A001") {
                                console.log("支付成功");
                                clearInterval(payResult);
                                window.open('${basepath}/paygate/paySuccess?status=3&orderNum=${orderNum}','_self');
                            }
                            if (data == "A002") {
                                window.open('${basepath}/paygate/paySuccess?status=4','_self')
                            }
                        },
                        error: function (er) {
                            console.log("订单状态获取失败");
                        }
                    });
                }, 4000)
            },0)
        }


    });

</script>
<#include "/resource/common_js.ftl"/>
