<#macro menu selectMenu="0"> <#--内页的头部-->
<a name="toTop" id="toTop"></a>
<!-- 顶部导航条 -->
<!-- <div class="navbar navbar-default navbar-fixed-top" -->
<div class="navbar  navbar-diy mainMenu"   >
    <div class="container" >
        <div class="row" >
            <div class="col-xs-2">
                <a href="${systemSetting().www}/index"><img style="margin-top:6px" alt="油墨logo" src="${basepath}/resource/images/logo.png"/></a>
            </div>
            <div class="col-xs-4" >
                <nav class="subnav" id="subnav" >
                    <ul class="clearfix">
                        <!-- 首页 -->
                        <li><a href="${systemSetting().www}/index" onclick="_czc.push(['_trackEvent', '导航', '进入首页']);" <#if selectMenu=="0"> class="active"  </#if> >首页</a></li>
                        <li><a href="${basepath}/catalog/${systemManager().defaultCatalog.code}.html?isFee=y" onclick="_czc.push(['_trackEvent', '导航', '进入免费模板']);" <#if isFee??&&isFee="y">class="active"</#if>>免费</a></li>
                        <li><a href="${basepath}/catalog/${systemManager().defaultCatalog.code}.html?isFee=n"  onclick="_czc.push(['_trackEvent', '导航', '进入精品模板']);" <#if isFee??&&isFee="n">class="active"</#if>>精品</a></li>
                        <li><a href="${basepath}/member" onclick="_czc.push(['_trackEvent', '导航', '进入会员页面']);" <#if isMember??> class="active"</#if>  >会员</a></li>
                       <li><a href="${basepath}/designer/customize"  onclick="_czc.push(['_trackEvent', '导航', '进入定制页面']);" <#if isCustomize??>class="active"</#if>>定制</a></li>

                        <!-- 类别作为菜单显示 -->
                    <#--<#list systemManager().catalogs as item>-->
                    <#--<#if item.showInNav == "y">-->
                    <#--<li class="${(item.code == selectMenu)?string("active","")}"><a href="${basepath}/catalog/${item.code}.html">${item.name}</a></li>-->
                    <#--</#if>-->
                    <#--</#list>-->
                    </ul>
                </nav>
            </div>
            <div class="col-xs-4" >
                <!-- search查询输入框 -->

            </div>
            <div class="col-xs-2 UserBox" >
                  <#if currentAccount()??>
                      <div class="clearfix userCenterBox" >
                        <div class="fleft" id="myshopMenuPPP">
		          			<!-- 会员中心的菜单 -->
                                  <a    href="${basepath}/auth/account/account"  class="user text-ellipsis" >
                                      <#if currentAccount().avater??>
                                          <img src="${currentAccount().avater!""}"/>
                                      <#else>
                                          <img src="${basepath}/resource/images/headInfo-default.png" >
                                      </#if>
                                     ${currentAccount().nickname?trim?html}
                                  </a>
							  <ul class="dropdown-menu" id="myshopMenu" role="menu" >
                              <#--<li><a href="${basepath}/account/account"><i class="Hui-iconfont" style="font-size:18px;">&#xe60d;</i>&nbsp;个人资料</a></li>-->
                              <#--<li><a href="${basepath}/account/topwd"><i class="Hui-iconfont" style="font-size:18px;">&#xe63f;</i>&nbsp;修改密码</a></li>-->
                              <#--<li><a href="${basepath}/account/orders"><i class="Hui-iconfont" style="font-size:18px;">&#xe687;</i>&nbsp;我的订单</a></li>-->
                              <#--<li><a href="${basepath}/account/address"><span class="glyphicon glyphicon-send"></span>&nbsp;配送地址</a></li>-->
                                  <li><a href="${basepath}/auth/account/favorite" onclick="_czc.push(['_trackEvent', '导航', '收藏夹']);"><i class="iconfont fav_icon">&#xe672;</i>&nbsp;收藏夹</a></li>
                                  <li><a href="${basepath}/auth/account/info" onclick="_czc.push(['_trackEvent', '导航', '我的资料']);" ><i class="set_icon_small" ></i>&nbsp;我的资料</a></li>
                                  <!--<li class="divider"></li>-->
                                  <li><a href="${basepath}/account/exit"><i class="out_icon" onclick="_czc.push(['_trackEvent', '导航', '退出']);"></i>&nbsp;退出</a></li>
                                  <!--正式机-->
                                  <#--<li><a href="${basepath}/account/cas/logout"><i class="out_icon" onclick="_czc.push(['_trackEvent', '导航', '退出']);"></i>&nbsp;退出</a></li>-->

                              </ul>

                        </div>

                      </div>
                    <#else >
                        <span class="registBox" id="loginOrRegSpan" >
		          			<a href="${basepath}/account/login"  onclick="_czc.push(['_trackEvent', '导航', '进入登录页']);" rel="nofollow"> 登录</a><span style="padding:0 3px; color:#ccc;"> | </span><a href="${basepath}/account/register" onclick="_czc.push(['_trackEvent', '导航', '进入注册']);" rel="nofollow">注册 </a>
		          		</span>
                    </#if>
                      <!--正式机-->
                  <#--<#else >-->
                      <#--<span class="registBox" id="loginOrRegSpan" >-->
		          			<#--<a href="javascript:redirectUserCentral();"  onclick="_czc.push(['_trackEvent', '导航', '进入登录页']);"> 登录</a><span style="padding:0 3px; color:#ccc;"> | </span><a href="http://www.yomoer.cn/vip/#/register/phone" onclick="_czc.push(['_trackEvent', '导航', '进入注册']);">注册 </a>-->
		          		<#--</span>-->
                 <#--</#if>-->
                      <#--<script type="text/javascript">-->
                          <#--function redirectUserCentral(){-->
                              <#--window.location = "http://www.yomoer.cn/cas/login?service=http://www.yomoer.cn/index?authRrl="+encodeURIComponent(window.location.href+"&auth=login");-->
                          <#--}-->
                      <#--</script>-->



            </div>
        </div>

    </div>
</div>


</#macro>