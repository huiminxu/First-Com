<#import "/resource/common_html_front.ftl" as html>
<#import "/indexMenu.ftl" as menu>
<@html.htmlBase>
<style>
	#advert img{
		max-width: 300px;
		max-height: 477px;
		border:0px;
	}
</style>
	<@menu.menu selectMenu=""/>
	<div class="container">
		<div class="row" style="margin-top: 10px;">
			<#--<div class="col-xs-4" style="background-color:#fff;border:0px;">-->
				<#--<div id="advert" style="text-align: right;">-->
					<#--<div style="margin-top: 100px;text-align: right;font-weight: 600" >-->
						<#--<div class="panel panel-default">-->
							<#--<div class="panel-heading">也可以这样登陆：</div>-->
						  <#--<div class="panel-body">-->
						    <#---->
						    <#---->
						    <#--<div>-->
								<#--<a href="${basepath}/account/qqLogin.html" title="使用QQ号登陆">-->
			              		<#--<img src="${systemSetting().www}/resource/images/qqLogin.png">-->
			              	<#--</a>-->
							<#--</div>-->
			              	<#--<br>-->
	              	<#---->
			              	<#--<div>-->
				              	<#--<a  href="${basepath}/account/sinawb.html" title="使用新浪微博账号登陆">-->
				              		<#--<img src="${systemSetting().www}/resource/images/sinawbLogin.png">-->
				              	<#--</a>-->
			              	<#--</div>-->
			              	<#--<br>-->
	              	<#---->
			              	<#--<div>-->
				              	<#--<a href="${basepath}/account/alipayFastLogin.html" title="使用支付宝快捷登陆">-->
									<#--<img src="${systemSetting().www}/resource/images/alipay_fastlogin.jpg" alt="支付宝快捷登陆">-->
								<#--</a>-->
			              	<#--</div>-->
							<#--<br>-->
					<#---->
						  <#--</div>-->
						<#--</div>-->
					<#--</div>-->
					<#---->
				<#--</div>-->
			<#--</div>		-->
				<div class="row">
					<div class="col-md-12" style="font-size: 14px;font-weight: normal;">
						<span class="label label-success" style="font-size:100%;">
							1.填写注册信息 
						</span>
						&nbsp;<span class="glyphicon glyphicon-circle-arrow-right"></span>
						<span class="label label-default" style="font-size:100%;">
							2.邮箱验证 
						</span>
						&nbsp;<span class="glyphicon glyphicon-circle-arrow-right"></span>
						<span class="label label-default" style="font-size:100%;">
							3.注册成功 
						</span>
					</div>
				</div>
				<hr>
                <div class="loginIpt">
                    <div class="formBox" >
                        <h2>欢迎加入YOMO家族</h2>
                        <form role="form" id="form" method="post" class="form-horizontal" action="${basepath}/account/doRegister.html" theme="simple" >
                        <div class="clearfix borderbottomgray">
                            <label class="fleft" for="account">账号：</label>
                            <div class="item-ifo">
                                <input  name="account" type="text" class="text" id="account" placeholder="请输入账号"
                                        data-rule="账号:required;account;length[3~10];remote[unique.html]" maxlength="100" />
                            </div>
                        </div>
                        <div class="clearfix borderbottomgray">
                            <label class="fleft" for="nickname">昵称：</label>
                            <div class="item-ifo">
                                <input  name="nickname" type="text" class="text" id="nickname" placeholder="请输入昵称"
                                        data-rule="昵称:required;nickname;length[2~10];remote[unique.html]" maxlength="100"/>
                            </div>
                        </div>
                        <div class="clearfix borderbottomgray">
                            <label class="fleft" for="password">密码：</label>
                            <div class="item-ifo left">
                                <input  name="password" type="password" class="text" id="password" placeholder="请输入密码"
                                        maxlength="100" data-rule="密码:required;password"/>
                            </div>
                        </div>
                        <div class="clearfix borderbottomgray">
                            <label class="fleft" for="password2">确认密码：</label>
                            <div class="item-ifo left">
                                <input  name="password2" type="password" class="text" id="password2" placeholder="请输入确认密码"
                                        maxlength="100" data-rule="确认密码:required;match(password)"/>
                            </div>
                        </div>
                        <div class="clearfix borderbottomgray">
                            <label class="fleft" for="email">邮箱：</label>
                            <div class="item-ifo left">
                                <input  name="email" type="text" class="text" id="email" maxlength="45"
                                        data-rule="邮箱:required;email;length[1~45];remote[unique.html]" placeholder="请输入邮箱，找回密码用的" />
                            </div>
                        </div>
                        <div class="clearfix borderbottomgray">
                            <label class="fleft" for="vcode">验证码：</label>
                            <div class="item-ifo left">
                                <input type="text" name="vcode" type="text" class="text"  style="width:100px;"id="vcode" placeholder="验证码"
                                       data-rule="验证码:required;vcode;remote[unique.html]" size="4" maxlength="4" />
                                <img src="${systemSetting().www}/Validate看不清？换一张Image.do" id="codes2"
                                     onclick="javaScript:reloadImg2();" class="vcodeCss"></img>
                                <a href="javascript:void(0);" onclick="javascript:reloadImg2();" class="btn btn-link btn-sm">看不清?换一张</a>
                            </div>
                        </div>
                        <div class="clearfix borderbottomgray">
                            <label class="fleft">注册协议：</label>
                            <div class="item-ifo left">
                                <a target="_blank" id="link-zcxy" class="btn btn-link btn-md" href="${systemSetting().www}/help/zcxy.html">ymshop用户注册协议</a>
                            </div>
                        </div>
                        <p><input type="checkbox" />阅读并同意<a href="#" class="green">服务协议</a></p>
                        <div  class="zcBox">
                            <input class="btn-entry" type="submit" value="注 册">
                        </div>
                    </div>
					</form>
                </div>
                <div class="recommend_mb">
                    <h2>推荐模板</h2>
                    <ul>
                        <#list systemManager().aeTemplateList as item>
                        <li>
                            <a href="javascript:;"><img src="${item.imgUrl!""}" /></a>
                            <div class="tj_content">
                                <a href="${basepath}/auth/template/download?id=${item.id}" class="tc">下载</a>
                            </div>
                        </li>
                        </#list>
                    </ul>
                </div>
			</div>
		</div>
<script type="text/javascript">
function reloadImg2() {
	document.getElementById("codes2").src = "${basepath}/ValidateImage.do?" + "radom="
			+ Math.random();
	$("#vcode2").focus();
}
</script>
</@html.htmlBase>