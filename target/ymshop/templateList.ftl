<#import "/resource/common_html_front.ftl" as html>
<#import "/indexMenu.ftl" as menu>
<@html.htmlBase>
<!--[if lt  IE 10]>
<link rel="stylesheet" href="${basepath}/resource/css2/iehackforie9.css" />
<![endif]-->
<link rel="stylesheet" href="${basepath}/resource/jquery-pagination/css/pagination.css" />
    <@menu.menu selectMenu=mainCatalogCode/>
    <!------灰色区域------>
    <div class="grayline"></div>
<div class="container">
    <div class="row">
        <div class="col-xs-12 catalog-box">
            <section class="category-nav">
                <div id="category-search-nav">
                    <!-- hd -->
                    <#if systemManager().catalogs??>
                        <div class="big-type">
                            <ul class="clearfix">
                                <#list systemManager().catalogs as item>
                                    <li <#if mainCatalogCode ==item.code >class="selected" </#if>
                                        data-big-type="${item.id}"><a
                                            href="${basepath}/catalog/${item.code}.html" data-name="${item.name}"
                                            class="btn-moban">${item.name}</a>
                                    </li>
                                    <span class="sep">|</span>
                                </#list>
                            </ul>
                        </div>
                    </#if>
                    <!-- bd -->
                    <div class="tab-body">
                        <#if catalogCode!="ALL">
                            <#list catalogs as catalog>
                                <div class="detail-type"
                                     data-big-type="${catalog.id}"   <#if selectedCatalog.code??&&catalog.code!=selectedCatalog.code >
                                     style="display:none;"</#if>>
                                    <#list catalog.labels as label>
                                        <div class="mlt-list clearfix">
                                            <h3 class="mlt-title">${label.name}</h3>
                                            <div class="mlt-tags" id='${"div"+catalog_index+"_"+label_index}'
                                                 data-type='${"templateQuery.type"+ (label_index+1)}'>
                                                <a data-value="0" id="0"  href="${basepath}/catalog/${catalog.code}.html"  data-labelname="${label.name}"
                                                   class="nolimit active">不限</a>
                                                <#list label.labelList as la>
                                                    <a data-value="${la_index+1}"
                                                       id="${la.id}" <#if ids??&&ids?contains(la.id) >
                                                       class="active"</#if>
                                                       href="${basepath}/catalog/${catalog.code}.html"
                                                       data-labelname="${label.name}">${la.name}</a>
                                                </#list>
                                            </div>
                                            <button type="button" class="btn btn-alpha mlt-more" style="display: none;">
                                                更多
                                            </button>
                                        </div>
                                    </#list>
                                </div>

                            </#list>

                        </#if>
                    </div>

                    <nav class="order-nav">
                        <ul class="clearfix" data-type="templateQuery.orderBy">
                            <li  <#if orderBy??&&orderBy=="4" > class="active"</#if> data-value="4">
                                <a href="${basepath}/catalog/${catalogCode!""}.html">推荐</a>
                            </li>
                            <li  <#if orderBy??&&orderBy=="1" > class="active"</#if> data-value="1">
                                <a href="${basepath}/catalog/${catalogCode!""}.html">人气</a>
                            </li>
                            <li <#if orderBy??&&orderBy=="2" > class="active"</#if> data-value="2">
                                <a href="${basepath}/catalog/${catalogCode!""}.html">时间</a>
                            </li>
                            <li <#if orderBy??&&orderBy=="3" > class="active"</#if> data-value="3">
                                <a href="${basepath}/catalog/${catalogCode!""}.html">销量</a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </section>
            <div class="clearfix"></div>
            <section class="category-list">
                <div class="content">
                    <#if templateList?? && templateList?size gt 0>
                        <ul class="mb-wrap clearfix">
                            <#list  templateList as  template>
                                <li class="mb-item w<#if template.catalogID=='145'|| template.catalogID=='110'||template.catalogID=='144'>2<#elseif template.catalogID=='125'>1<#elseif  template.catalogID=='121'>3<#else></#if>">
                                    <div <#if template.catalogID=='145'|| template.catalogID=='110'||template.catalogID=='144'>class="mb-item-img  img-big" <#else>class="mb-item-img" </#if>>
                                        <#if template.catalogID=='125'>
                                        <a href="${basepath}/auth/template/download?id=${template.id}"
                                           data-templateid="${template.id!""}" class="btn-mfdownload">
                                        <#else>
                                        <a href="${basepath}/template/detail/${template.id}.html" target="_blank"
                                           data-preview="${template.id}" class="info-more">
                                        </#if>
                                        <img src="${template.shrinkUrl!""}" alt="${template.name}">
                                        <figcaption></figcaption>
                                    </a>
                                        <#if  template.nowPrice="0.00"&&template.score=0  >
                                            <em class="free_samp dis-freesamp"></em>
                                        </#if>
                                        <#if template.catalogID=='125'>
                                            <span data-templateid="${template.id!""}"
                                                  data-url="${basepath}/auth/template/download?id=${template.id}"
                                                  class="btn-default download btn-mfdownload">点击下载</span>
                                        </#if>
                                    </div>
                                    <p class="mt2"><strong
                                            class="fleft mb-title" title="${template.name}">${template.name}</strong>${template.favorite}<a <#if template.favorite?? && template.favorite=="y">
                                            class="favo favo-cur"  <#else> class="favo" </#if>
                                            id="${template.id}"><i class="iconfont">&#xe672;</i></a></p>
                                    <p class="mb2"><span class="fright">${template.browseNum}
                                        浏览/${template.downloadNum}下载</span>
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
                </div>
            </section>
            <div class="pages">
                 <div id="Pagination" class="Pagination"></div>
            </div>

        </div>
    </div>
</div>
</div>

<script type="text/javascript" src="${basepath}/resource/js2/page/template.js"></script>
<script type="text/javascript" src="${basepath}/resource/jquery-pagination/js/jquery.pagination.js" ></script>

<script type="text/javascript">
    $(function () {
        "use strict";
        //分页
        YOUMO.paginationOper.init({
            ele:$("#Pagination"),
            pagerTotal:${pager.total}
            ,pagerOffset:${pager.offset},
            pagerPageSize:${pager.pageSize},
            pagerPagerUrl:"${pager.pagerUrl}",
            Urlargument:getUrlArg({
                isfee: true,
                catalogCode: true,
                orderBy: true,
                key: true,
                ids:true,
                catalogId:true
            })
    })

        // 模板页面筛选菜单
        YOUMO.templateNav.init();
        // 模板页面搜索导航显示及搜索结果显示
        // if (!!$("#category-search-nav")[0]) {
        //      YOUMO.templateNav._firstShow();
        //      YOUMO.templateNav.setSearchTag();
        //    }
        YOUMO.getMore.init();
        //绑定收藏
        YOUMO.templateOper._bindFavo();
        // 绑定免费下载：
        YOUMO.templateOper._bindDownload(true);

    });
    function cFrom() {
        var cfrom = "全部";
        <#if isFee??>
            <#if isFee=='n'>
                cfrom = "精品";
            </#if>
            <#if isFee=='y'>
                cfrom = "免费";
            </#if>
        </#if>
        return cfrom;
    }
    function getUrlArg(option) {
        var url = "";
        if (option.isfee) {
            <#if isFee??&&isFee!="">
                if (url != "") {
                    url = url + "&";
                }
                url = url + "isFee=${isFee}";
            </#if>
        };
        if (option.catalogCode) {
            <#if catalogCode??&&catalogCode!="">
                if (url != "") {
                    url = url + "&";
                }
                url = url + "catalogCode=${catalogCode}";
            </#if>
        };
        if (option.orderBy) {
            <#if orderBy??&&orderBy!="">
                if (url != "") {
                    url = url + "&";
                }
                url = url + "orderBy=${orderBy}";
            </#if>
        };

        if (option.ids) {
            <#if ids??&&ids!="">
                if (url != "") {
                    url = url + "&";
                }
                url = url + "ids=${ids}";
            </#if>
        };
        if (option.key) {
            <#if key??&&key!="">
                if (url != "") {
                    url = url + "&";
                }
                url = url + "key=${key}";
            </#if>
        };
        if (option.catalogId) {
            <#if catalogId??&&catalogId!="">
                if (url != "") {
                    url = url + "&";
                }
                url = url + "catalogId=${catalogId}";
            </#if>
        };
        return url;
    }

    function submitLabel(ele, ids) {
        var _this = ele;
        var url = "${basepath}/catalog/${catalogCode!""}.html";
        var argument = getUrlArg({
            isfee: true,
            catalogCode: true,
            orderBy: true,
            key: true
        });
        //统计代码
        var cfrom = cFrom(), labelname = _this.data("labelname"), name = _this.html(), id = _this.attr("id");
        _czc.push(['_trackEvent', cfrom, name, labelname, id]);
        if (argument) {
            url = url + '?' + argument
        }//公共参数
        if (ids) {
            url = url + "&ids=" + ids;
        } //自己参数
        var option = {
            url: url,
            type: 'post'
        }
        addForm(option);
    }


</script>

</@html.htmlBase>