<#import "/resource/common_html_front.ftl" as html>
<#import "/indexMenu.ftl" as menu>
<@html.htmlBase>
    <@menu.menu selectMenu="customize"/>
<link rel="stylesheet" href="${basepath}/resource/css2/design.css" type="text/css"/>
<link rel="stylesheet" href="${basepath}/resource/jquery-pagination/css/pagination.css"/>

<div class="container designer-box">
    <div class="designer-box-bordershadow">
        <div class="designer-main">
            <div class="designer-headwrap">
                <div class="design-head">
                    <img src="${designer.avater!"${basepath}/resource/images/headInfo-default.png"}" alt=""/>
                    <#if designer.qqStatus==1>
                        <img src="${basepath}/resource/images/customize/online.png" class="status">
                    <#else>
                        <img src="${basepath}/resource/images/customize/outline.png" class="status">
                    </#if>

                </div>
            </div>
            <div class="designer-cont">
                <h2>${designer.nickname}</h2>
                <div class="firs">
                    <#if isDesigner=="y">
                        <div class="btn-list">
                            <i class="iconfont" name="edit-info-btn">&#xe608;</i>
                        </div>
                    </#if>
                    <p data-text="${designer.resume}">${designer.resume}</p>

                </div>

                <div class="comment">
                    <div class="comment-left">
                        <div> 品质
                            <div data-score="<#if designerKpi.qualityScore??>${designerKpi.qualityScore/20}<#else >0</#if>"
                                 class="starn"></div>

                        </div>


                        <div>
                            速度
                            <div data-score="<#if designerKpi.efficiencyScore??>${designerKpi.efficiencyScore/20}<#else >0</#if>"
                                 class="starn"></div>

                        </div>
                        <div>
                            服务
                            <div id="star"
                                 data-score="<#if designerKpi.serviceScore??>${designerKpi.serviceScore/20}<#else >0</#if>"
                                 class="starn"></div>

                        </div>
                    </div>
                    <#if isDesigner!="y">
                        <div class="comment-right">
                            <a class="btn btn-class"
                               href="tencent://message/?uin=${designer.qq}&Site=qq&Menu=yes">立即交谈</a>
                        </div>
                    </#if>

                </div>
            </div>
            <div class="clearfix"></div>
            <div class="designer-bar">
                <div>已完成
                    <span class="line"></span>
                    <span class="amount"><#if designerKpi.finishQty??>${designerKpi.finishQty}<#else >0</#if></span>
                </div>
                <div class="sec">定制中
                    <span class="line"></span>
                    <span class="amount"><#if designerKpi.unfinishQty??>${designerKpi.unfinishQty}<#else >0</#if></span>
                </div>
                <div class="tir">好评率
                    <span class="line"></span>
                    <span class="amount"><#if designerKpi.favorableRate??>${designerKpi.favorableRate}%<#else >
                        -</#if></span>
                </div>
            </div>


            <div class="designer-select">
                <!--选项卡          -->
                <ul class="">
                    <li <#if type=="works">class="active"</#if> data-url="${basepath}/designer/info?type=works"><a
                            data-toggle="tab" role="tab">作品展示</a></li>
                    <li <#if type=="records">class="active sec"<#else>class="sec"</#if>
                        data-url="${basepath}/designer/info?type=records"><a
                            data-toggle="tab" role="tab">成交记录</a></li>
                    <li <#if type=="comments">class="active tir"<#else>class="tir"</#if>
                        data-url="${basepath}/designer/info?type=comments"><a
                            data-toggle="tab" role="tab">服务评价</a></li>
                </ul>

            </div>

            <!--面板-->

        <div class="designer-select-items">
            <#if type=="works">
                <div class="designer-select-item1" id="worksshow">
                    <#if pager.list?? && pager.pagerSize gt 0>
                        <ul class="works-list clearfix">
                            <#list pager.list as item>
                                <li class="">
                                    <a href="${basepath}/template/detail/${item.id}.html" target="_blank"
                                       data-preview="${item.id}" class="info-more">
                                        <img src="${item.shrinkUrl}" alt="${item.name}">
                                        <#if item.nowPrice="0.00"&&item.score=0>
                                            <em class="free_samp dis-freesamp"></em>
                                        </#if>
                                    </a>


                                    <p title="${item.name}">
                                        <strong class="work-title">${item.name}</strong>

                                        <a <#if item.favorite?? && item.favorite=="y">
                                                class="favo favo-cur fav_icon"  <#else> class="favo fav_icon" </#if>
                                                id="${item.id}"></a>
                                    </p>
                                    <p><span class="fright">${item.browseNum}
                                        浏览/${item.downloadNum}下载</span>
                                        <#if  item.nowPrice!="0.00"&&item.score=0 >
                                            <span class="mb_price"><em class="price_icon"></em>${item.nowPrice}</span>
                                        <#elseif item.nowPrice=="0.00"&&item.score=0>
                                            <span class="mb_score"><em class="free_icon"></em>免费</span>
                                        <#else >
                                            <span class="mb_score"><em class="score_icon"></em>${item.score}</span>
                                        </#if>
                                    </p>
                                </li>
                            </#list>
                        </ul>
                    <#else>
                        <div class="tresult-no">
                            暂无作品
                        </div>
                    </#if>
                    <div class="pages">
                        <div id="Pagination" class="Pagination"></div>
                    </div>

                </div>
            </#if>
            <#if type=="records">
                <div class="designer-select-item2" id="donerecord">
                    <table>
                        <tr class="head">
                            <td class="user">用户</td>
                            <td class="need">需求</td>
                            <td class="checkprice">成交价格</td>
                            <td class="checktime">成交时间</td>
                        </tr>
                        <#if pager.list?? && pager.pagerSize gt 0>
                            <#list pager.list as item>
                                <tr class="body">
                                    <td class="user">${item.nickname}</td>
                                    <td class="need">${item.name}</td>
                                    <td class="checkprice">${item.amount}</td>
                                    <td class="checktime">${item.createTime?substring(0,19)}</td>
                                </tr>
                            </#list>
                        <#else>
                            <tr class="body">
                                <td colspan="4" class="bodyn">
                                    <div class="tresult-no">暂无成交记录</div>
                                </td>
                            </tr>
                        </#if>

                    </table>

                    <div class="pages">
                        <div id="Pagination" class="Pagination"></div>
                    </div>
                </div>
            </#if>
            <#if type=="comments">
                <div class="designer-select-item3" id="servicecomment">
                    <table>
                        <tr class="head">
                            <td class="user">
                                <div><span
                                        class="vline"></span><#if designerKpi.favorableRate??>${designerKpi.favorableRate}
                                    <span class="percent">%</span><#else >-</#if></div>
                </div>
                <span>好评率</span>
                </td>
                <td class="comment">
                    <div>
                        <span>品质</span>
                        <div id="star"
                             data-score="<#if designerKpi.qualityScore??>${designerKpi.qualityScore/20}<#else >0</#if>"
                             class="starn"></div>

                    </div>
                    <div>
                        <span>速度</span>
                        <div id="star"
                             data-score="<#if designerKpi.efficiencyScore??>${designerKpi.efficiencyScore/20}<#else >0</#if>"
                             class="starn"></div>

                    </div>
                    <div>
                        <span>服务</span>
                        <div id="star"
                             data-score="<#if designerKpi.serviceScore??>${designerKpi.serviceScore/20}<#else >0</#if>"
                             class="starn"></div>

                    </div>
                </td>
                <td class="content">
                    <div>作品品质：<#if designerKpi.qualityScore??>${designerKpi.qualityScore}分
                        比平均值${designerKpi.qualityScoreCompareWithAverage}%<#else >暂无评分</#if></div>
                    <div>交稿速度：<#if designerKpi.efficiencyScore??>${designerKpi.efficiencyScore}分
                        比平均值${designerKpi.efficiencyScoreCompareWithAverage}%<#else >暂无评分</#if></div>
                    <div>服务态度：<#if designerKpi.serviceScore??>${designerKpi.serviceScore}分
                        比平均值${designerKpi.serviceScoreCompareWithAverage}%<#else >暂无评分</#if></div>
                </td>
                </tr>
                <tr class="body bodyhead">
                    <td class="user">用户</td>
                    <td class="comment">评分</td>
                    <td class="content">内容</td>

                </tr>
                <#if pager.list?? && pager.pagerSize gt 0>
                    <#list pager.list as item>
                        <tr class="body bodycontent">
                            <td class="user">${item.nickname}</td>
                            <td class="comment">
                                <div> 品质
                                    <div id="star" data-score="${item.qualityScore/20}" class="starn"></div>

                                </div>
                                <div> 速度
                                    <div id="star" data-score="${item.efficiencyScore/20}" class="starn"></div>

                                </div>
                                <div> 服务
                                    <div data-score="${item.serviceScore/20}" class="starn"></div>

                                </div>
                            </td>
                            <td class="content">
                            ${item.content}
                                <span> ${item.createdTime?substring(0,19)}</span>
                            </td>
                        </tr>
                    </#list>
                <#else>
                    <tr class="body">
                        <td colspan="3" class="bodyn">
                            <div class="tresult-no">暂无评价</div>
                        </td>
                    </tr>
                </#if>
                </table>
                <div class="pages">
                    <div id="Pagination" class="Pagination"></div>
                </div>
            </div>
            </#if>
        </div>
    </div>
</div>


<script type="text/javascript" src="${basepath}/resource/raty-2.5.2/lib/jquery.raty.js"></script>
<script type="text/javascript" src="${basepath}/resource/js2/page/desgin.js"></script>
<script type="text/javascript" src="${basepath}/resource/jquery-pagination/js/jquery.pagination.js"></script>


<script type="text/javascript">
    $(document).ready(function () {
        "use strict";
        //分页
        YOUMO.paginationOper.init({
            ele:$("#Pagination"),
            pagerTotal:${pager.total}
            , pagerOffset:${pager.offset},
            pagerPageSize:${pager.pageSize},
            pagerPagerUrl: "${pager.pagerUrl}",
            Urlargument: funcUrlDel("pager.offset")
        });

        YOUMO.desinger.desginerInfo({});
        /*绑定收藏*/
        YOUMO.templateOper._bindFavo();
        if ("${type}" == "works") {
            /*瀑布流*/
            var waterFallwidth = $(".works-list").width() * 0.25;
            new WaterFall({
                item: $(".works-list"),
                colsHeight: [0, 0, 0, 0],
                width: waterFallwidth
            });
        }

        //星级评价
        $('.starn').raty({
            path: "${basepath}/resource/raty-2.5.2/lib/img",
            score: function () {
                return $(this).attr('data-score');
            },
            round: {down: .01, up: .99},
            readOnly: true,
            hints: ['', '', '', '', ''],
            noRatedMsg: "",
            size: 48,
            half: true,
            starHalf: 'heart-half.png',
            starOff: 'heart-off.png',
            starOn: 'heart-on.png'

        });


    });
</script>

</@html.htmlBase>