<#include "/resource/common_css.ftl"/>
<link rel="stylesheet" href="${basepath}/resource/css2/account.css" type="text/css"/>
<div class="pay-box"  id="youdianpay">
<#if status??>
<#--柚点支付 -->
    <#if status =="1">
    <#--柚点支付:够付 -->
        <div class="pay-main" id="youdianpay-toPay">
            <div class="ydpay-detail">
               <form role="form" id="formyomoPay" method="post" class=""  action="${basepath}/auth/paygate/youdianpay?orderNum=${orderNum}" >
                <div class="clearfix detail-order">
                    <div class="fleft">订单号：<span class="order-num">${orderNum}</span></div>
                    <div class="fright">购买物品：<span class="order-name">${templateName}</span></div>
                </div>
                <div class="detail-yd">
                    <h4 class="tc">您的账号有<span class="yd-num">${accYoudian}</span>柚点</h4>
                    <div class="progress-y ">
                        <div class="progress ">
                            <div class="progress-bar" role="progressbar" aria-valuenow="${percentage}" aria-valuemin="0"
                                 aria-valuemax="100" style="width: ${percentage}%;">
                                <span class="ml20">本次消耗${amount}柚点</span>
                                <span class="fright mr">${percentage}%</span>
                            </div>
                            <span class="mr20">剩余${remain}柚点</span>
                        </div>
                    </div>
                    <p class="tr">支付<span class="recharge-yd">${amount}</span>柚点</p>
                    <p class="tr">柚点不多了？<a href="${basepath}/paygate/yomobuy" target="_blank" class="btn-link">充值柚点？</a>
                        或<a href="${basepath}/auth/order/moneypay?id=${orderNum}"  class="toonline-pay btn-link">更换支付方式</a>
                    </p>
                </div>
                <p class="tr mt40">
                    <button type="submit" class="btn-pay5">确认支付</button>
                </p>
                <p class="mt27 tr"><a href="#" class="closeiframe">取消支付</a></p>
               </form>
            </div>
        </div>
    <#elseif status =="2">
    <#--柚点支付:不够付 -->
        <div class="pay-main" id="youdianpay-notPay">
            <div class="ydpay-detail">
                <div class="clearfix detail-order">
                    <div class="fleft">订单号：<span class="order-num">${orderNum}</span></div>
                    <div class="fright">购买物品：<span class="order-name">${templateName}</span></div>
                </div>
                <div class="detail-yd">
                    <h4 class="tc">您的账号有<span class="yd-num">${accYoudian}</span>柚点</h4>
                    <div class="progress-n">
                        <div class="progress">
                            <div class="progress-bar" role="progressbar" aria-valuenow="${percentage-100}"
                                 aria-valuemin="0"  aria-valuemax="100" style="width: ${percentage-100}%;">
                                <span class="ml">${percentage}%</span>
                                <span class="fright mr20">超支${remain}柚点</span>
                            </div>
                            <span class="ml20">本次消耗${amount}柚点</span>
                        </div>
                    </div>
                    <p class="tr">支付<span class="recharge-yd">${amount}</span>柚点</p>

                    <p class="tr">柚点不多了？<a href="${basepath}/paygate/yomobuy" target="_blank" class="btn-link">充值柚点？</a>
                                  或<a href="${basepath}/auth/order/moneypay?id=${orderNum}"  class="toonline-pay btn-link">更换支付方式</a>

                    </p>

                </div>

                <p class="tr mt40">
                    <a href="JavaScript:void(0);"  class="btn-pay5"  disabled="true">确认支付</a>
                </p>
                <p class="mt27 tr"><a href="javascript:void(0);" class="closeiframe">取消支付</a></p>
            </div>
        </div>
    <#else>
        柚点支付状态获取失败！
    </#if>
<#else>
      柚点支付状态获取失败！
</#if>
</div>

<script type="text/javascript" src="${basepath}/resource/js2/page/pay.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("a.closeiframe").on('click', function (event) {
            event.preventDefault();
            closeIframe();
        });

        $("#youdianpay-notPay a.btn-pay5").on('click',function (event) {
            event.preventDefault();
            layer.alert('柚点不够支付，可去充值柚点再支付呦。')
        })

    });

</script>
<#include "/resource/common_js.ftl"/>