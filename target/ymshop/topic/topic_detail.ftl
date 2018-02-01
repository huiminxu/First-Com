<#import "/resource/common_html_front.ftl" as html>
<#import "/indexMenu.ftl" as menu>
<#import "/account/accountMenu.ftl" as accountMenu>
<@html.htmlBase>
    <@menu.menu selectMenu=""/>
<!------灰色区域------>
<#--ie9动画效果-->
<!--[if lt  IE 10]>
<link rel="stylesheet" href="${basepath}/resource/css2/iehackforie9.css" /
<![endif]-->
<link rel="stylesheet" href="${basepath}/resource/css2/topic.css" type="text/css"/>
<link rel="stylesheet" href="${basepath}/resource/jquery-pagination/css/pagination.css" />
<div class="subjectTop center-block">
    <img src="${topic.topicImage}" class="img">
    <div class="subjectTop-shadow"></div>
    <div class="topic-recom container topic-recom1">
        <div class="mb-examp-img w<#if templateList[0].catalogID=='145'|| templateList[0].catalogID=='110'||templateList[0].catalogID=='144'>2<#elseif templateList[0].catalogID=='125'>1<#elseif  templateList[0].catalogID=='121'>3</#if>  topic-item">
            <div class="topic-item-img img-big">
                <a href="${basepath}/template/detail/${templateList[0].id}.html" target="_blank" data-preview="${templateList[0].id}" class="info-more">
                    <img src="${templateList[0].shrinkUrl!""}" alt="${templateList[0].name!""}"><figcaption></figcaption>
                </a>
            </div>

        </div>
        <div class="subjectcont">
            <h2>${topic.topicName}</h2>
            <p class="eclips">${topic.topicDesc}</p>
            <i class="iconfont">&#xe610;</i><span>${topic.pageView}</span>
            <a class="topic-favo" id="${topic.id}"><i class="iconfont">&#xe672;</i></a><span>${topic.pageView}</span>
            <span class="date"><i class="iconfont">&#xe606;</i>${topic.topicPeriod}</span>
        </div>
        <#if topic.isCollect=='y'><a class="favoRT topic-favo favo-cur" data-id="${topic.id}"> <i class="iconfont">&#xe672;</i></a><#else> <a class="favoRT topic-favo" data-id="${topic.id}"> <i class="iconfont">&#xe672;</i></a></#if>

        <div class="share">分享：<a class="">  <a class=""><i class="iconfont">&#xe644;</i></a>
            <a class=""><i class="iconfont">&#xe67b;</i></a><a class=""><i class="iconfont">&#xe609;</i></a></div>
    </div>
</div>
</div>
<div class="topic-recom container">
    <section class="category-list-relate">
        <div class="clearfix category-list-item">
            <input type="hidden" name="currentPage" id="currentPage" value="2">
        </div>
        <#if templateList?? && templateList?size gt 0>
            <ul class="relate-wrap" id="relateds">
                <#list  templateList as  template>
                    <li class="topic-item w<#if template.catalogID=='145'|| template.catalogID=='110'||template.catalogID=='144'>2<#elseif template.catalogID=='125'>1<#elseif  template.catalogID=='121'>3<#else></#if>">
                        <div <#if template.catalogID=='145'|| template.catalogID=='110'||template.catalogID=='144'>class="topic-item-img  img-big" <#else>class="topic-item-img" </#if>>
                            <a href="${basepath}/auth/template/download?id=${template.id}" target="_blank" data-preview="${template.id}" class="info-more">
                                <img src="${template.shrinkUrl!""}" alt="${template.name}"><figcaption></figcaption>
                            </a>
                            <#if template.catalogID=='125'>
                                <span data-templateid="1237" data-url="${basepath}/auth/template/download?id=${template.id}" class="btn-default download btn-mfdownload">点击下载</span>
                            </#if>
                            <#if  template.nowPrice=="0.00"&&template.score=0  ><em class="free_samp dis-freesamp"></em></#if>
                        </div>
                        <p class="mt2">
                            <strong
                                    class="fleft mb-title" title="${template.name}">${template.name}</strong>${template.favorite!""}<a <#if template.favorite?? && template.favorite=="y">
                                class="favo favo-cur"  <#else> class="favo" </#if>
                                id="${template.id}"><i class="iconfont">&#xe672;</i></a>
                        </p>
                        <p class="mb2">
                            <span class="fright">${template.browseNum}浏览/${template.downloadNum}下载</span>
                            <#if  template.nowPrice!="0.00"&&template.score=0 >
                                <span class="mb_price">
                                             <i class="iconfont">&#xe617;</i>${template.nowPrice}
                                           </span>
                            <#elseif template.nowPrice=="0.00"&&template.score=0>
                                <span class="mb_score">
                                                    <i class="iconfont">&#xe616;</i>免费
                                            </span>
                            <#else>
                                <span class="mb_score">
                                                    <i class="iconfont">&#xe618;</i>${template.score}
                                            </span>
                            </#if>
                        </p>
                    </li>
                </#list>
            </ul>
        <#else>
            <br>
            <div class="category-no">
                <span> 抱歉，没有找到<span color='#f40'>“${key?html}”</span>相关的模板!</span>
                <span class="glyphicon glyphicon-search" style="color:#48b84b;"></span>
                <span class="text-success" style="color:#48b84b;">您可以尝试换一个关键词或者换一个分类。</span>
            </div>

        </#if>
        <div class="pages">
            <div id="Pagination" class="Pagination"></div>
        </div>

    </section>
</div>

<div class="topic-recomed container">
    <span class="more"><a href="${basepath}/topic/list">更多</a></span>
    <h3>往期推荐</h3>
    <ul class="topic-list clearfix">
        <#list  topThreeTopicList as  topic>
            <#if topic_index == 0>
            <li class="topic-list-item topic-list-item1" data-url="#">
                <a href="#"><img src="${topic.topicImage}"></a>
            <#else>
            <li class="topic-list-item " data-url="#">
                <a href="${basepath}/topic/detail/${topic.id}"><img src="${topic.topicImage}"></a>
            </#if>

            <div class="floatl">
                <p class="name text-ellipsis">${topic.topicName}</p>
                <p class="date"><i class="iconfont">&#xe606;</i>${topic.topicPeriod}</p>
            </div>
            <div class="flaotr">
                <p><i class="iconfont">&#xe610;</i><span>${topic.pageView}</span></p>
                <p>${topic.isCollect!""}  <a <#if topic.isCollect?? && topic.isCollect=="y">
                        class="topic-favo favo-cur"  <#else> class="topic-favo" </#if>
                        data-id="${topic.id}" href="javascript:void(0);"><i class="iconfont">&#xe672;</i></a><span>${topic.collect}</span></p>

            </div>
        </li>
        </#list>

    </ul>

</div>


</div>
<script type="text/javascript" src="${basepath}/resource/jquery-pagination/js/jquery.pagination.js" ></script>
<script type="text/javascript" src="${basepath}/resource/js2/page/topic.js"></script>
<script type="text/javascript" src="${basepath}/resource/js2/page/template.js"></script>
<#--分享-->
<script type="text/javascript" src="${basepath}/resource/share-js/qrcode.js"></script>
<script type="text/javascript" src="${basepath}/resource/share-js/share.js"></script>
<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        //分享
        YOUMO.templateShare.init({
            title:$(".subjectcont h2").html(),
            desc:$(".subjectcont p").html(),
            pic:$(".subjectTop>img").attr("src"),
            shareList:['TSina','Qzone','WeiXin'],
            weixin:{
                appId: "${weixinConfig.appId}", // 必填，公众号的唯一标识
                timestamp:"${weixinConfig.timestamp}" , // 必填，生成签名的时间戳
                nonceStr: "${weixinConfig.nonceStr}", // 必填，生成签名的随机串
                signature:"${weixinConfig.signature}"// 必填，签名，见附录1
            }
        });

        /*判断有没有超过三行*/
        if($(".eclips").height()>104){
            $(".eclips").height(104);
            $(".eclips").addClass("eclips1");
        }
        //分页
        YOUMO.paginationOper.init({
            ele:$("#Pagination"),
            pagerTotal:${pager.total}
            , pagerOffset:${pager.offset},
            pagerPageSize:${pager.pageSize},
            pagerPagerUrl: "${pager.pagerUrl}",
            Urlargument: funcUrlDel("pager.offset")
        });


        YOUMO.templateOper._bindFavo();
        YOUMO.topic._bindFavo($(".topic-recom"));
        YOUMO.topic._bindFavo($(".topic-recomed"));
        // 绑定免费下载：
        YOUMO.templateOper._bindDownload(true);


    });

</script>
</@html.htmlBase>