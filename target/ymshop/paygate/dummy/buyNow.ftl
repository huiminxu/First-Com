<#import "/resource/common_html_front.ftl" as html/>
<#import "/indexMenu.ftl" as menu/>
<@html.htmlBase>

<input value="${systemSetting().www}" type="hidden" id="wwwInput"/>
	<@menu.menu/>
	<div class="loginBox wrapper1200 ">
        <caption>
			<#if errorMsg??>
                <div class="bs-callout bs-callout-danger author" style="text-align: left;font-size: 14px;margin: 2px 0px;">
                    <strong>登录失败!</strong> ${errorMsg}
                </div>
			</#if>
        </caption>
        <div id="payBox" class="wrapper1200 margin">
            <div class="payTip">
                <p><b>订单提交成功，请您尽快付款</b><span>订单号：20161208d997293e | 金额：<i>20</i>元</span></p>
                <p>请在<span class="red f16">72小时</span>内付款，逾期未付款系统将自动取消订单。</p>
            </div>
            <div class="payDetail">
                <div class="clearfix">
                    <dl>
                        <dt>
                            支付方式：
                        </dt>
                        <dd>
                            <ul class="zf_img">
                                <li><a href="javascript:;" title="支付宝"><img src="images/yomo/zfb.jpg" alt="支付宝" /></a><i></i></li>
                                <li ><a href="javascript:;" title="微信"><img src="images/yomo/wx.jpg" alt="微信" /></a><i></i></li>
                            </ul>
                        </dd>
                    </dl>
                </div>
                <div>
                    <input type="checkbox" />使用优惠券 <span class="color99">当前没有可用的优惠券</span>
                </div>
                <div>
                    <input type="button" value="下一步" class="nextStep" /><div class="fright">支付：<span class="red">20.00</span></div>
                </div>
            </div>
        </div>
	</div>

<!-- baidu登陆 
</@html.htmlBase>