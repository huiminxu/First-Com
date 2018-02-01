<!--[if lt  IE 10]>
<link rel="stylesheet" href="${basepath}/resource/css2/iehackforie9.css" /
<![endif]-->
<div class="content wrapper1200">
    <!--模板tab页面 -->
    <div id="mobanTab" class="titList" >
        <div class="ulborder clearfix">
            <a href="${basepath}/catalog/PPTmoban.html?isFee=n" class="more relative mid_more" title="更多PPT模板" onclick="_czc.push(['_trackEvent', '首页', 'PPT模板更多']);">
                   <img src="${basepath}/resource/images/more.png" alt="更多PPT模板" class="more_center" style="position:absolute; right:0px; top:0px; bottom:0px;margin:auto;">
            </a>
            <#--<a href="${basepath}/catalog/WORDmoban.html?isFee=n" class="more relative mid_more" title="更多Word模板" onclick="_czc.push(['_trackEvent', '首页', 'Word模板更多']);">-->
                <#--<img src="${basepath}/resource/images/more.png" alt="更多Word模板" class="more_center" style="position:absolute; right:0px; top:0px; bottom:0px;margin:auto;">-->
            <#--</a>-->
            <#--<a href="${basepath}/catalog/EXCELmoban.html?isFee=n" class="more relative mid_more" title="更多Excel模板" onclick="_czc.push(['_trackEvent', '首页', 'Excel模板更多']);">-->
                <#--<img src="${basepath}/resource/images/more.png" alt="更多Excel模板" class="more_center" style="position:absolute; right:0px; top:0px; bottom:0px;margin:auto;">-->
            <#--</a>-->
            <ul class="tabUl clearfix">
                <li name="#tabpage1" class="activeTab" ><h2><a href="javascript:void(0)" >PPT</a></h2></li>
                <li name="#tabpage2" ><h2><a href="javascript:void(0)">Word</a></h2></li>
                <li name="#tabpage3" ><h2><a href="javascript:void(0)">Excel</a></h2></li>
            </ul>
        </div>
        <div id="tabs">
            <div id="tabpage1">
                <!--PPT的tab页内容-->
                <div class="subTab">
                    <div class="subTitle ">

                        <ul>
                            <li><h4>最新推荐</h4></li>
                            <li><h4>最热下载</h4></li>
                            <li><h4>最新发布</h4></li>
                        </ul>
                    </div>
                    <div class="subContent">
                        <!-- 最新推荐模板图标切换 setPptLatestRecommendList  setPptHotDownList setPptLatestList-->
                        <div class="mbBox">
                            <a class="sPrev" href="javascript:void(0)" onclick="_czc.push(['_trackEvent', '首页','PPT最新推荐','向右移动','0']);">&nbsp;</a>

                            <ul class="piclist">
                            <#list systemManager().pptLatestRecommendList as item>
                                <li onclick="_czc.push(['_trackEvent', '首页','PPT最新推荐',${item_index!""},${item.id}]);">
                                    <a  href="${basepath}/template/detail/${item.id}.html" target="_blank">
<img src="${item.shrinkUrl!""}" alt="${item.name!""}" />  <#if  item.nowPrice="0.00"&&item.score=0  ><em class="free_samp dis-freesamp"></em></#if><figcaption></figcaption></a>

                                    <p class="title"><strong class="mb-title">${item.name!""}</strong></p>
                                    <div class="clearfix">
                                        <span class="download fright"><i >${item.browseNum}</i>浏览&nbsp;/<i >${item.downloadNum}</i> 下载</span>
                                        <#if  item.nowPrice!="0.00"&&item.score=0 >
                                            <span class="mb_price">
                                             <em class="price_icon"></em>${item.nowPrice}
                                           </span>
                                        <#elseif item.nowPrice=="0.00"&&item.score=0>
                                            <span class="mb_score">
                                                    <em class="free_icon"></em>免费
                                            </span>
                                        <#else>
                                            <span class="mb_score">
                                                    <em class="score_icon"></em>${item.score}
                                            </span>
                                        </#if>
                                    </span>
                                    </div>
                                </li>
                            </#list>
                            </ul>
                            <a class="sNext" href="javascript:void(0)" onclick="_czc.push(['_trackEvent', '首页','PPT最新推荐','向左移动','6']);">&nbsp;</a>
                        </div>
                        <!--最热下载图标 -->
                        <div class="mbBox">
                            <a class="sPrev" href="javascript:void(0)" onclick="_czc.push(['_trackEvent', '首页','PPT最热下载','向右移动','0']);">&nbsp;</a>

                            <ul class="piclist">
                                <#list systemManager().pptHotDownList as item>
                                    <li onclick="_czc.push(['_trackEvent', '首页','PPT最热下载',${item_index!""},${item.id}]);">
                                        <a  href="${basepath}/template/detail/${item.id}.html" target="_blank"><img src="${item.shrinkUrl!""}" alt="${item.name!""}" />
                                            <#if  item.nowPrice="0.00"&&item.score=0  ><em class="free_samp dis-freesamp"></em></#if> <figcaption></figcaption></a>

                                        <p class="title"><strong class="mb-title">${item.name!""}</strong></p>
                                        <div class="clearfix">
                                            <span class="download fright"><i >${item.browseNum}</i>浏览&nbsp;/<i >${item.downloadNum}</i> 下载</span>
                                            <#if  item.nowPrice!="0.00"&&item.score=0 >
                                                <span class="mb_price">
                                             <em class="price_icon"></em>${item.nowPrice}
                                           </span>
                                            <#elseif item.nowPrice=="0.00"&&item.score=0>
                                                <span class="mb_score">
                                                    <em class="free_icon"></em>免费
                                            </span>
                                            <#else>
                                                <span class="mb_score">
                                                    <em class="score_icon"></em>${item.score}
                                            </span>
                                            </#if>
                                        </div>
                                    </li>
                                </#list>
                            </ul>
                            <a class="sNext" href="javascript:void(0)" onclick="_czc.push(['_trackEvent', '首页','PPT最热下载','向左移动','6']);">&nbsp;</a>

                        </div>

                        <!-- 最新发布图标 -->
                        <div class="mbBox">
                            <a class="sPrev" href="javascript:void(0)" onclick="_czc.push(['_trackEvent', '首页','PPT最新发布','向右移动','0']);">&nbsp;</a>
                            <ul class="piclist">
                            <#list systemManager().pptLatestList as item>
                                <li onclick="_czc.push(['_trackEvent', '首页','PPT最新发布',${item_index!""},${item.id}]);">
                                    <a  href="${basepath}/template/detail/${item.id}.html" target="_blank"><img src="${item.shrinkUrl!""}" alt="${item.name!""}" /> <#if  item.nowPrice="0.00"&&item.score=0  ><em class="free_samp dis-freesamp"></em></#if><figcaption></figcaption></a>

                                    <p class="title"><strong class="mb-title">${item.name!""}</strong></p>
                                    <div class="clearfix">
                                        <span class="download fright"><i >${item.browseNum}</i>浏览&nbsp;/<i >${item.downloadNum}</i> 下载</span>
                                        <#if  item.nowPrice!="0.00"&&item.score=0 >
                                            <span class="mb_price">
                                             <em class="price_icon"></em>${item.nowPrice}
                                           </span>
                                        <#elseif item.nowPrice=="0.00"&&item.score=0>
                                            <span class="mb_score">
                                                    <em class="free_icon"></em>免费
                                            </span>
                                        <#else>
                                            <span class="mb_score">
                                                    <em class="score_icon"></em>${item.score}
                                            </span>
                                        </#if>
                                    </div>

                                </li>
                            </#list>
                            </ul>
                            <a class="sNext" href="javascript:void(0)" onclick="_czc.push(['_trackEvent', '首页','PPT最新发布','向左移动','6']);">&nbsp;</a>

                        </div>
                    </div>
                </div>
                <!--PPT的tab页内容end-->
            </div>
            <div id="tabpage2">
                <!--word的tab页内容-->
                <div class="subTab">
                    <div class="subTitle ">

                        <ul>
                            <li><h4>最新推荐</h4></li>
                            <li><h4>最热下载</h4></li>
                            <li><h4>最新发布</h4></li>
                        </ul>
                    </div>
                    <div class="subContent">
                        <!-- 最新推荐模板图标切换 -->
                        <div class="mbBox">
                            <a class="sPrev" href="javascript:void(0)" onclick="_czc.push(['_trackEvent', '首页','Word最新推荐','向右移动','0']);">&nbsp;</a>
                            <ul class="piclist">
                            <#list systemManager().wordLatestRecommendList as item>
                                <li onclick="_czc.push(['_trackEvent', '首页','Word最新推荐',${item_index!""},${item.id}]);">
                                    <a  href="${basepath}/template/detail/${item.id}.html" target="_blank"><img src="${item.shrinkUrl!""}" alt="${item.name!""}" /> <#if  item.nowPrice="0.00"&&item.score=0  ><em class="free_samp dis-freesamp"></em></#if><figcaption></figcaption></a>
                                    <p class="title"><strong class="mb-title">${item.name!""}</strong></p>
                                    <div class="clearfix">
                                        <span class="download fright"><i >${item.browseNum}</i>浏览&nbsp;/<i >${item.downloadNum}</i> 下载</span>
                                        <#if  item.nowPrice!="0.00"&&item.score=0 >
                                            <span class="mb_price">
                                             <em class="price_icon"></em>${item.nowPrice}
                                           </span>
                                        <#elseif item.nowPrice=="0.00"&&item.score=0>
                                            <span class="mb_score">
                                                    <em class="free_icon"></em>免费
                                            </span>
                                        <#else>
                                            <span class="mb_score">
                                                    <em class="score_icon"></em>${item.score}
                                            </span>
                                        </#if>
                                    </div>
                                </li>
                            </#list>
                            </ul>
                            <a class="sNext" href="javascript:void(0)" onclick="_czc.push(['_trackEvent', '首页','Word最新推荐','向左移动','6']);">&nbsp;</a>
                        </div>
                        <!--最热下载图标 -->
                        <div class="mbBox">
                            <a class="sPrev" href="javascript:void(0)" onclick="_czc.push(['_trackEvent', '首页','Word最热下载','向右移动','0']);">&nbsp;</a>
                            <ul class="piclist">
                            <#list systemManager().wordHotDownList as item>
                                <li onclick="_czc.push(['_trackEvent', '首页','Word最热下载',${item_index!""},${item.id}]);">
                                    <a  href="${basepath}/template/detail/${item.id}.html" target="_blank"><img src="${item.shrinkUrl!""}"  alt="${item.name!""}" /> <#if  item.nowPrice="0.00"&&item.score=0  ><em class="free_samp dis-freesamp"></em></#if><figcaption></figcaption></a>
                                    <p class="title"><strong class="mb-title">${item.name!""}</strong></p>
                                    <div class="clearfix">
                                        <span class="download fright"><i >${item.browseNum}</i>浏览&nbsp;/<i >${item.downloadNum}</i> 下载</span>
                                        <#if  item.nowPrice!="0.00"&&item.score=0 >
                                            <span class="mb_price">
                                             <em class="price_icon"></em>${item.nowPrice}
                                           </span>
                                        <#elseif item.nowPrice=="0.00"&&item.score=0>
                                            <span class="mb_score">
                                                    <em class="free_icon"></em>免费
                                            </span>
                                        <#else>
                                            <span class="mb_score">
                                                    <em class="score_icon"></em>${item.score}
                                            </span>
                                        </#if>
                                    </div>

                                </li>
                            </#list>
                            </ul>
                            <a class="sNext" href="javascript:void(0)" onclick="_czc.push(['_trackEvent', '首页','Word最热下载','向左移动','6']);">&nbsp;</a>
                        </div>

                        <!-- 最新发布图标 -->
                        <div class="mbBox">
                            <a class="sPrev" href="javascript:void(0)" onclick="_czc.push(['_trackEvent', '首页','Word最新发布','向右移动','0']);">&nbsp;</a>
                            <ul class="piclist">
                            <#list systemManager().wordLatestList as item>
                                <li onclick="_czc.push(['_trackEvent', '首页','Word最新发布',${item_index!""},${item.id}]);">
                                    <a  href="${basepath}/template/detail/${item.id}.html" target="_blank"><img src="${item.shrinkUrl!""}"  alt="${item.name!""}"/> <#if  item.nowPrice="0.00"&&item.score=0  ><em class="free_samp dis-freesamp"></em></#if><figcaption></figcaption></a>
                                    <p class="title"><strong class="mb-title">${item.name!""}</strong></p>
                                    <div class="clearfix"><span class="download fright"><i >${item.browseNum}</i>浏览&nbsp;/<i >${item.downloadNum}</i> 下载</span>
                                        <#if  item.nowPrice!="0.00"&&item.score=0 >
                                            <span class="mb_price">
                                             <em class="price_icon"></em>${item.nowPrice}
                                           </span>
                                        <#elseif item.nowPrice=="0.00"&&item.score=0>
                                            <span class="mb_score">
                                                    <em class="free_icon"></em>免费
                                            </span>
                                        <#else>
                                            <span class="mb_score">
                                                    <em class="score_icon"></em>${item.score}
                                            </span>
                                        </#if>
                                    </div>
                                </li>
                            </#list>
                            </ul>
                            <a class="sNext" href="javascript:void(0)" onclick="_czc.push(['_trackEvent', '首页','Word最新发布','向左移动','6']);">&nbsp;</a>

                        </div>
                    </div>

                </div>

                <!--word的tab页内容end-->
            </div>
            <div id="tabpage3">
                <!--excel的tab页内容-->
                <div class="subTab" >
                    <div class="subTitle">
                        <ul>
                            <li><h4>最新推荐</h4></li>
                            <li><h4>最热下载</h4></li>
                            <li><h4>最新发布</h4></li>
                        </ul>
                    </div>
                    <div class="subContent">
                        <!-- 最新推荐模板图标切换 -->
                        <div class="mbBox">
                            <a class="sPrev" href="javascript:void(0)" onclick="_czc.push(['_trackEvent', '首页','Excel最新推荐','向右移动','0']);">&nbsp;</a>
                            <ul class="piclist">
                            <#list systemManager().excelLatestRecommendList as item>
                                <li onclick="_czc.push(['_trackEvent', '首页','Excel最新推荐',${item_index!""},${item.id}]);">
                                    <a  href="${basepath}/template/detail/${item.id}.html" target="_blank"><img src="${item.shrinkUrl!""}" alt="${item.name!""}" /> <#if  item.nowPrice="0.00"&&item.score=0  ><em class="free_samp dis-freesamp"></em></#if><figcaption></figcaption></a>
                                    <p class="title"><strong class="mb-title">${item.name!""}</strong></p>
                                    <div class="clearfix"><span class="download fright"><i >${item.browseNum}</i>浏览&nbsp;/<i >${item.downloadNum}</i> 下载</span>
                                        <#if  item.nowPrice!="0.00"&&item.score=0 >
                                            <span class="mb_price">
                                             <em class="price_icon"></em>${item.nowPrice}
                                           </span>
                                        <#elseif item.nowPrice=="0.00"&&item.score=0>
                                            <span class="mb_score">
                                                    <em class="free_icon"></em>免费
                                            </span>
                                        <#else>
                                            <span class="mb_score">
                                                    <em class="score_icon"></em>${item.score}
                                            </span>
                                        </#if>
                                    </div>

                                </li>
                            </#list>
                            </ul>
                            <a class="sNext" href="javascript:void(0)" onclick="_czc.push(['_trackEvent', '首页','Excel最新推荐','向左移动','6']);">&nbsp;</a>
                        </div>
                        <!--最热下载图标 -->
                        <div class="mbBox">
                            <a class="sPrev" href="javascript:void(0)" onclick="_czc.push(['_trackEvent', '首页','Excel最热下载','向右移动','0']);">&nbsp;</a>
                            <ul class="piclist">
                            <#list systemManager().excelHotDownList as item>
                                <li onclick="_czc.push(['_trackEvent', '首页','Excel最热下载',${item_index!""},${item.id}]);">
                                    <a  href="${basepath}/template/detail/${item.id}.html" target="_blank"><img src="${item.shrinkUrl!""}" alt="${item.name!""}" /> <#if  item.nowPrice="0.00"&&item.score=0  ><em class="free_samp dis-freesamp"></em></#if><figcaption></figcaption></a>
                                    <p class="title"><strong class="mb-title">${item.name!""}</strong></p>
                                    <div class="clearfix"><span class="download fright"><i >${item.browseNum}</i>浏览&nbsp;/<i >${item.downloadNum}</i> 下载</span>
                                        <#if  item.nowPrice!="0.00"&&item.score=0 >
                                            <span class="mb_price">
                                             <em class="price_icon"></em>${item.nowPrice}
                                           </span>
                                        <#elseif item.nowPrice=="0.00"&&item.score=0>
                                            <span class="mb_score">
                                                    <em class="free_icon"></em>免费
                                            </span>
                                        <#else>
                                            <span class="mb_score">
                                                    <em class="score_icon"></em>${item.score}
                                            </span>
                                        </#if>
                                    </div>
                                </li>
                            </#list>
                            </ul>
                            <a class="sNext" href="javascript:void(0)" onclick="_czc.push(['_trackEvent', '首页','Excel最热下载','向左移动','6']);">&nbsp;</a>

                        </div>

                        <!-- 最新发布图标 -->
                        <div class="mbBox">
                            <a class="sPrev" href="javascript:void(0)" onclick="_czc.push(['_trackEvent', '首页','Excel最新发布','向右移动','0']);">&nbsp;</a>
                            <ul class="piclist">
                            <#list systemManager().excelLatestList as item>
                                <li onclick="_czc.push(['_trackEvent', '首页','PPT最热下载',${item_index!""},${item.id}]);">
                                    <a  href="${basepath}/template/detail/${item.id}.html" target="_blank"><img src="${item.shrinkUrl!""}"  alt="${item.name!""}"/> <#if  item.nowPrice="0.00"&&item.score=0  ><em class="free_samp dis-freesamp"></em></#if><figcaption></figcaption></a>
                                    <p><strong class="mb-title">${item.name!""}</strong></p>
                                    <div class="clearfix"><span class="download fright"><i >${item.browseNum}</i>浏览&nbsp;/<i >${item.downloadNum}</i> 下载</span>
                                        <#if  item.nowPrice!="0.00"&&item.score=0 >
                                            <span class="mb_price">
                                             <em class="price_icon"></em>${item.nowPrice}
                                           </span>
                                        <#elseif item.nowPrice=="0.00"&&item.score=0>
                                            <span class="mb_score">
                                                    <em class="free_icon"></em>免费
                                            </span>
                                        <#else>
                                            <span class="mb_score">
                                                    <em class="score_icon"></em>${item.score}
                                            </span>
                                        </#if>
                                    </div>
                                </li>
                            </#list>
                            </ul>
                            <a class="sNext" href="javascript:void(0 )" onclick="_czc.push(['_trackEvent', '首页','Excel最新发布','向左移动','6']);">&nbsp;</a>

                        </div>
                    </div>
                </div>

                <!--excel的tab页内容end-->
            </div>
        </div>
    </div>

</div>

<!-- 广告 -->
<div id="adBox" class="clear margin" onclick="_czc.push(['_trackEvent', '首页', '第二行Banner']);">
    <img src="${basepath}/resource/images/index/ad_banner.gif" class="img-responsive" alt="精美模板海量下载" />
</div>
