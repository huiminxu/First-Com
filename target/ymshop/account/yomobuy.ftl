<#import "/resource/common_html_front.ftl" as html>
<#import "/account/memberMenu.ftl" as menu>
<@html.htmlBase title="YOMO柚点购买列表">
<link rel="stylesheet" href="${basepath}/resource/css2/account.css" type="text/css"/>
<@menu.menu selectMenu=""/>
<div class="account-box ">
    <div class="account-box-bg"></div>
    <div class="account-main">
                <div class="breadcrumb clearfix">
                    <li class="active">充值柚点</li>
                </div>
        <form  action="${basepath}/auth/order/youdian" >
        <#--<form  action="${basepath}/auth/order/memberorder" >-->
            <div class="recharge-box">
                <ul class="recharge-list clearfix ml30">
                    <li class="tp1 active" data-value="10" data-id="1">
                        <h4>1000柚点</h4>
                        <p>实际获得1000柚点</p>
                    </li>
                    <li class="tp2" data-value="30" data-id="2">
                        <h4>3000柚点</h4>
                        <p>实际获得3450柚点(赠送15%)</p>
                    </li>
                    <li class="tp3 " data-value="50" data-id="3">
                        <h4>5000柚点</h4>
                        <p>实际获得6000柚点(赠送20%)</p>
                    </li>
                    <li class="tp4" data-value="80" data-id="4">
                        <h4>8000柚点</h4>
                        <p>实际获得10000柚点(赠送25%)</p>
                    </li>
                    <li class="tp5" data-value="100" data-id="5">
                        <h4>10000柚点</h4>
                        <p>实际获得13000柚点(赠送30%)</p>
                    </li>
                    <li class="tp6">
                        <h4>更多优惠敬请期待</h4>
                    </li>
                </ul>
                <div class="recharge-result tc">
                    <p>支付<span class="recharge-money" data-id="1" >30</span>元</p>
                    <button type="submit" class="btn-pay4">立即充值</button>
                </div>
            </div>
        </form>
    </div>
</div>

<script type="text/javascript" src="${basepath}/resource/js2/page/pay.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        /*柚点数量选择*/
        $(".recharge-list li").not(':last').on('click', function (event) {
            var _this = $(this),
            _selected = $(".recharge-money");
            //step1 获取焦点
            _this.siblings().removeClass('active');
            _this.addClass('active');
            //step2 赋值
            _selected.html(_this.data('value'));
            _selected.data("id", _this.data('id'));
            //console.log(_selected.data('id'));

        });

        /*form 提交*/
        $(".recharge-result button").on('click', function (event) {
            event.preventDefault();
            var _this = $(this),
                 _form = _this.parents('form');
            var option = {
                size:{w: '620px', h: '505px'},
                url: _form.attr('action')+"?type="+_this.siblings("p").find(".recharge-money").data("id"),
                endcallback:function () {
                    location.reload();
                }
            };
            previewPay(option, false);

        });
    });


</script>
</@html.htmlBase>