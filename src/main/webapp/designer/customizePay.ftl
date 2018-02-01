<#import "/resource/common_html_front.ftl" as html>
<#import "/indexMenu.ftl" as menu>
<@html.htmlBase title="定制服务订单确认支付">
<link rel="stylesheet" href="${basepath}/resource/css2/design.css" type="text/css"/>
<link rel="stylesheet" href="${basepath}/resource/css2/account.css" type="text/css"/>
    <@menu.menu selectMenu="0"/>
<div class="customizePay-box">
<#if errorMsg??>
<div class="customizePay-main row">
 <div style="line-height: 40px;margin: auto;text-align:center;margin-top:20px;font-size:14px;">${errorMsg}</div>
</div>
<#else>
    <div class="customizePay-main row">
        <div class="col-sm-6  col-sx-6">
            <h1 class="section-title">定制信息确认</h1>
            <div class="customizeinfo">
                <dl class="clearfix">
                    <dt>定制类型：</dt>
                    <dd>
                        <#if customizeOrder.cType==110>EXCEL模板
                        <#elseif customizeOrder.cType==121>AE模板
                        <#elseif customizeOrder.cType==125>表情包
                        <#elseif customizeOrder.cType==144>PPT模板
                        <#elseif customizeOrder.cType==145>WORD模板
                        </#if>
                    </dd>
                    <dt>定制用途：</dt>
                    <dd>${customizeOrder.cUse}</dd>
                    <dt>定制价格：</dt>
                    <dd>${customizeOrder.price}元</dd>
                    <dt>定制数量：</dt>
                    <dd>${customizeOrder.quantity}</dd>
                    <dt>完成期限：</dt>
                    <dd>${customizeOrder.etc?date}</dd>
                    <dt>其他：</dt>
                    <dd>${customizeOrder.other}</dd>
                </dl>
            </div>
            <p class="warn">请认真核对信息</p>
        </div>
        <div class="col-sm-6 col-sx-6">
            <h1 class="section-title">扫码付款</h1>
            <div class="pay-box">
            <#--在线支付-->
                <div class="pay-main" id="onlinepay" >
                    <ul class="paytype-list clearfix">
                        <li class="zfb-item">
                            <h4><img src="${basepath}/resource/images/yomo/zfb_icon.jpg" alt="支付宝支付"></h4>
                            <p><img src="${zfb}"></p>
                        <#--<p><img src="${basepath}/order/getzfbQR?orderid=${orderNum}"></p>-->
                        <#--<p class="tl pl15">无法扫描？<a href="${basepath}/auth/order/toPagePay?orderNum=${order.orderNum}" class="btn-link">打开网页支付宝支付</a></p>-->
                        </li>
                        <li class="wx-item">
                            <h4><img src="${basepath}/resource/images/yomo/wx_icon.jpg" alt="微信支付"></h4>
                            <p><img src="${wx}"></p>
                        <#--<p><img src="${basepath}/order/getwxQR?orderid=${orderNum}" ></p>-->
                        </li>
                    </ul>
                    <div class="pay-detail tc">
                        <p class="">扫码支付<span class="recharge-money">${order.amount}</span>元</p>
                        <p class="detail-order">订单号：<span class="order-num">${order.orderNum}</span>&nbsp;&nbsp;|&nbsp;&nbsp;购买物品：<span
                                class="order-name">${order.templateName}</span></p>
                        <p>信息有误&nbsp;请联系设计师。
                            <#if ordertype?? &&ordertype!=3>
                                <a href="${basepath}/auth/paygate/yomopay?orderNum=${order.orderNum}" class="toyd-pay ml btn-link">柚点支付</a>
                            </#if>
                        </p>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<script type="text/javascript" src="${basepath}/resource/js2/page/pay.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        var loadBox=$('#payloading');
        var payBox=$('#onlinepay');
        setTimeout(function () {
            loadBox.css('display','none');
            payBox.css('display','block');
            var payResult = setInterval(function () {
                $.ajax({
                    type: 'GET',
                    dataType: "text",
                    url: "${basepath}/order/PayQuery?id=${order.orderNum}",
                    success: function (data) {
                        if (data == "A001") {
                            console.log("支付成功");
                            clearInterval(payResult);
                            window.open('${basepath}/paygate/paySuccess?status=3&orderNum=${order.orderNum}','_self');
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
    });


</script>
</#if>


</@html.htmlBase>