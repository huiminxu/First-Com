<#import "/resource/common_html_front.ftl" as html>
<#import "/indexMenu.ftl" as menu>
<#import "/account/accountMenu.ftl" as accountMenu>
<@html.htmlBase>
<@menu.menu selectMenu=""/>
<!------灰色区域------>
<div class="grayline"></div>
<link rel="stylesheet" href="${basepath}/resource/css2/usercenter.css" type="text/css"/>
<div class="container distable mt20 mb45">
    <div class="usercenter-box ">
        <aside class="usercenter-menu">
			<@accountMenu.accountMenu currentMenu="account"/>
        </aside>
        <div class="main">
            <!--个人中心start-->
            <div class="headInfo clearfix" id="headInfo">
                <div class="headImg">
					<#if accountInfo.avater??>
                        <img src="${accountInfo.avater!""}">
					<#else>
                        <img src="${basepath}/resource/images/headInfo-default.png" >
					</#if>
                </div>
                <div class="headDetail">
                    <h6>您好,${accountInfo.nickname!""}</h6>
                    <div class="yoleaf">
                        <#if accountInfo.rankImg??>
                            <img src="${accountInfo.rankImg}">
                        <#else>
                            <img src="${basepath}/resource/images/yoleaf.png">
                        </#if>
                        <span>${accountInfo.rank!"暂无称号"}&nbsp;LV${accountInfo.level!"0"}</span></div>
                    <div class="progress progress1">
                        <div class="progress-bar" aria-valuemin="0" aria-valuemax="${accountInfo.maxvalues!"0"}" aria-valuenow="${accountInfo.growthValue!"0"}" style="width:${(accountInfo.growthValue/accountInfo.maxvalues)?string. percent}">
                        </div>
                        <span>${accountInfo.growthValue!"0"}/${accountInfo.maxvalues!"0"}</span>
                    </div>
                    <span class="glyphicon glyphicon-question-sign" data-toggle="tooltip" data-placement="bottom" title="消耗积分，加速成长"></span>
                    <p class="yoscore"><span>积分：<em class="green">${accountInfo.score!""}</em></span> <#--<span>柚点：<em class="green">8000</em></span>--></p>
                    <div class="entervip">
                        <a class="btn btn-sm vipcenter" href="${basepath}/member">进入会员中心</a>
                        <#if desId??>
                            <a class="btn btn-sm" href="${basepath}/designer/info?designerId=${desId}">进入设计师主页</a>
                        </#if>
                    </div>
                </div>
                <a href="${basepath}/auth/account/score"><div class="headGift"><span>完成每日任务领奖励</span><em class="yomogift_icon"></em></div></a>
            </div>
			<#--我的任务-->
			<div class="duty-box">
				<ul class="duty-nav duty-nav-tabs clearfix" id="duty-top">
                    <li  class="active"><a href="#duty" role="tab" data-toggle="tab"> 每日任务</a></li>
                    <li><a href="#grow" role="tab" data-toggle="tab">成长任务</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" role="tabpanel" id="duty">
                        <#if dailyScoreTasks??>
                            <#list dailyScoreTasks as item>
                                <div class="duty-item">
                                    <div class="duty-item-sit">${item.name!""}</div>
                                    <div class="duty-item-reward">积分奖励：${item.score!""}</div>
                                    <#if item.status==1>
                                        <div class="duty-item-act duty-item-act-comp"><a href="javascript:void(0);" class="btn">${item.urlName2!""}</a></div>
                                    <#else>
                                        <div class="duty-item-act"><a href="<#if item.url!='javascript:void(0);'>${basepath}</#if>${item.url!""}" class="btn">${item.urlName1!""}</a></div>
                                    </#if>
                                </div>
                            </#list>
                        </#if>
					</div>
                    <div class="tab-pane" role="tabpanel"  id="grow">
                        <#if onceScoreTasks??>
                            <#list onceScoreTasks as item>
                                <div class="duty-item">
                                    <div class="duty-item-sit">${item.name!""}</div>
                                    <div class="duty-item-reward2">${item.description!""}即获得${item.score!"0"}积分。
                                        <span   class="glyphicon glyphicon-question-sign" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="每个账号仅限1次."></span>
                                    </div>
                                    <#if item.status==1>
                                        <div class="duty-item-act duty-item-act-comp"><a href="javascript:void(0);" class="btn">${item.urlName2!""}</a></div>
                                    <#else>
                                        <div class="duty-item-act"><a href="<#if item.url!='javascript:void(0);'>${basepath}</#if>${item.url!""}" class="btn">${item.urlName1!""}</a></div>
                                    </#if>
                                </div>
                            </#list>
                        </#if>
                        <#if timesScoreTasks??>
                            <#list timesScoreTasks as item>
                                <div class="duty-item">
                                    <div class="duty-item-sit">${item.name!""}</div>
                                    <div class="duty-item-reward2">${item.description!""}即获得${item.score!"0"}积分。
                                        <span   class="glyphicon glyphicon-question-sign" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="每个账号每天最多获得${(item.score*item.times)!"0"}积分."></span>
                                    </div>
                                    <#if item.status==1>
                                        <div class="duty-item-act duty-item-act-comp"><a href="javascript:void(0);" class="btn">${item.urlName2!""}</a></div>
                                    <#else>
                                        <div class="duty-item-act"><a href="<#if item.url!='javascript:void(0);'>${basepath}</#if>${item.url!""}" class="btn">${item.urlName1!""}</a></div>
                                    </#if>
                                </div>
                            </#list>
                        </#if>
					</div>
				</div>
			</div>
        </div>
    </div>
</div>
<#---->
<script type="text/javascript">
    $(function(){
        $('[data-toggle="tooltip"]').tooltip();
    });
</script>

</@html.htmlBase>