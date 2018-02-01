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
                    <h6>您好,${accountInfo.nickname?html}</h6>
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
                   <span class="glyphicon glyphicon-question-sign " data-toggle="tooltip" data-placement="bottom" title="消耗积分，加速成长"></span>
                    <p class="yoscore"><span>积分：<em class="green">${accountInfo.score!""}</em></span> <#--<span>柚点：<em class="green">8000</em>--></span></p>
                    <div class="entervip">
                        <a class="btn btn-sm" href="${basepath}/member">进入会员中心</a>
                        <#if desId??>
                            <a class="btn btn-sm" href="${basepath}/designer/info?designerId=${desId}">进入设计师主页</a>
                        </#if>
                    </div>
                </div>
                <a href="${basepath}/auth/account/score"><div class="headGift"><span>完成每日任务领奖励</span><em class="yomogift_icon"></em></div></a>
            </div>

            <div class="temps-box mt27 clearfix">
                <div class="panel panel-default mr">
                    <div class="panel-heading">
                        <h3 class="panel-title">我的模板</h3>
                    </div>
                    <div class="panel-body">
                       <div class="other-info clearfix">
                           <div class="fleft">
                               <em class="green">${downloadCount!""}</em>
                               <p>我的下载</p>
                           </div>
                           <div class="fright">
                               <em class="green">${favoriteCount!""}</em>
                               <p>收藏夹</p>
                           </div>
                       </div>
                        <p class="tc"><a href="${basepath}/auth/account/favorite" class="btn btn-sm">进入</a> </p>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">我的订单</h3>
                    </div>
                    <div class="panel-body">
                        <div class="other-info clearfix">
                            <div class="fleft">
                                <em class="green">${orderSimpleReport.orderPayCount!""}</em>
                                <p>已完成</p>
                            </div>
                            <div class="fright">
                                <em class="green">${orderSimpleReport.orderWaitCount!""}</em>
                                <p>未完成</p>
                            </div>
                        </div>
                        <p class="tc"><a href="${basepath}/auth/account/orders" class="btn btn-sm">进入</a> </p>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="news-list undis">
                <div class="panel panel-default mr">
                    <div class="panel-heading">
                        <h3 class="panel-title">消息列表</h3>
                    </div>
                    <div class="panel-body">
                        <ul>
                            <li>
                                <span class="time">2017-09-27</span>
                                <a href="#" class="link">您完成今天的签到，获得10积分</a>
                            </li>
                            <li>
                                <span class="time">2017-09-26</span>
                                <a href="#" class="link">您消耗50积分兑换《清新淡雅工作汇报PPT模板》，请到“我的订单”中查看。</a>
                            </li>
                        </ul>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        //tiptool 初始化
        $('[data-toggle="tooltip"]').tooltip();
        $('.tooltip').tooltip('show');
    });
</script>
</@html.htmlBase>