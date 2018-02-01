<#import "/resource/common_html_front.ftl" as html>
<#import "/indexMenu.ftl" as menu>
<@html.htmlBase>
    <link rel="stylesheet" href="${basepath}/resource/css2/base.css" type="text/css" />
    <link rel="stylesheet" href="${basepath}/resource/css2/common.css" />
    <link rel="stylesheet" href="${basepath}/resource/css2/buy.css" type="text/css" />
<!-- main -->
<@menu.menu/>
<div class="buy-box ">
    <div class="buy-box-bg"></div>
    <div class="buy-main">
        <div class="page-nav">
            充值会员
        </div>
        <form action="${basepath}/auth/order/memberorder" method="post">
            <div class="memberrec-box">
                <ul class="memberrec-list clearfix ml30">
                    <#if isFirst=="y">
                        <li class="tp active" data-value="6.66" data-id="6">
                            <div class="discount"></div>
                            <h3>新年特惠</h3>
                            <p class="price">6.66<strong>RMB</strong></p>
                            <p class="vipmember">1个月柚墨会员</p>
                            <p class="warn"><del>16.8</del></p>
                        </li>
                    <#else >
                        <li class="tp active" data-value="16.8" data-id="6">
                            <h3>柚墨热购</h3>
                            <p class="price">16.80 <strong>RMB</strong></p>
                            <p class="vipmember">1个月柚墨会员</p>
                        </li>
                    </#if>

                    <li class="tp" data-value="32" data-id="7">
                        <h3>柚墨热购</h3>
                        <p class="price">32.00 <strong>RMB</strong></p>
                        <p class="vipmember">2个月柚墨会员</p>
                    </li>
                    <li class="tp" data-value="88" data-id="8">
                        <h3>柚墨热购</h3>
                        <p class="price">88.00 <strong>RMB</strong></p>
                        <p class="vipmember">6个月柚墨会员</p>
                    </li>
                    <li class="tp" data-value="168" data-id="9">
                        <h3>柚墨热购</h3>
                        <p class="price">168.00  <strong>RMB</strong></p>
                        <p class="vipmember">1年柚墨会员</p>
                    </li>
                </ul>
                <div class="recharge-result tc">
                    <p class="undis">支付<span class="recharge-money" data-id="1">16.8</span>元</p>
                        <#--<p>支付<span class="recharge-money" data-id="1">16.8</span>元</p>-->
                    <input type="hidden" name="type" class="recharge-id" value="6">
                    <button type="submit" class="btn-buy6"  >确认购买</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript" src="${basepath}/resource/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${basepath}/resource/js2/tool.js"></script>
<script type="text/javascript" src="${basepath}/resource/js2/page/pay.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        /*会员套餐选择*/
        $(".memberrec-list li").on('click', function(event) {
            var _this = $(this),
                    _selected = $(".recharge-money");
            //step1 获取焦点
            _this.siblings().removeClass('active');
            _this.addClass('active');
            //step2 赋值
            _selected.html(_this.data('value'));
            _selected.data("id", _this.data('id'));
            console.log(_selected.data('id')+"--"+_this.data('id'));
            $(".recharge-id").val(_this.data('id'))

        });
        /*form 提交*/
        $(".recharge-result button").on('click', function (event) {
            event.preventDefault();
            var _this = $(this),
                    _form = _this.parents('form');
            var option = {
                size:{w: '620px', h: '505px'},
                url: _form.attr('action')+"?type="+ $(".recharge-id").val(),
                endcallback:function () {
                    location.reload();
                }
            };
            previewPay(option, false);

        });


    });
</script>
</@html.htmlBase>