<#--<!-- 首页中间位置图片轮播 &ndash;&gt;-->
<!-- banner大图切换 -->
<div id="bannerslider" class="margin relative">
    <div class="search">
            <div class="searchBox clearfix">
                <div class="searchselect clearfix">
                <#if selectedCatalog??>
                    <span id="type" typename="${selectedCatalog.id}">${selectedCatalog.name}</span>
                <#else>
                    <span id="type" typename="1" >全部</span>
                    <#--<span id="type" typename="144">PPT模板</span>-->
                </#if>
                    <a class="searchselectbtn" href="javascript:;"></a>
                    <ul id="selectTypeList">
                    <#list systemManager().catalogs as catalog>
                        <#if catalog.showInNav == "y" >
                            <li typename="${catalog.id}"><a href="javascript:;" id="${catalog.id}">${catalog.name}</a>
                            </li>
                        </#if>
                    </#list>
                        <li class="last"></li>
                    </ul>
                </div>
                <input name="key" id="key" type="text" class="search_ipt" placeholder="请输入关键字..." value="${key!""}" maxlength="20"/>
                <input type="hidden" name="catalogId" id="catalogId"  <#if selectedCatalog??>
                       value="${selectedCatalog.id!""}"<#else>value="144" </#if>/>
                <a class="search_btn" id="searchbtn" href="javascript:void(0);" data-from="首页">搜索</a>
            </div>

        <div class="hotSearchBox">热门搜索：
        <#list systemManager().hotqueryList as item>
            <a class="hotSearch
                <#if (item_index%2)!=0>
               green
            </#if>" href="${item.url}" onclick="_czc.push(['_trackEvent', '首页', '热门搜索标签',,'${item_index!""}']);">
            ${item.key1!""}
            </a>
        </#list>
        </div>
    </div>
    <div id="myCarousel" class="carousel slide " data-ride="carousel">
        <!-- 轮播（Carousel）指标 -->
        <ol class="carousel-indicators">
        <#list systemManager().indexImages as item>
            <li data-target="#myCarousel" data-slide-to="${item_index}"
                <#if item_index==0>
                class="active"
                </#if>
            ></li>
        </#list>
        </ol>
        <!-- 轮播（Carousel）项目 -->
        <div class="carousel-inner">

        <#list systemManager().indexImages as item>
            <#if item_index==0>
            <div class="item active">
            <#else>
            <div class="item">
            </#if>
            <#if item.link??>
                <a target="_blank" href="${item.link}" onclick="_czc.push(['_trackEvent', '首页', '第一行Banner',,'${item_index}']);">
                    <img style="max-width: 100%;"
                         src="${item.picture!""}" alt="${item.title!""}" class="center-block">
                </a>
            <#else>
                <img style="max-width: 100%;"
                     src="${item.picture!""}" alt="${item.title!""}" class="center-block">
            </#if>
        </div>
        </#list>

        </div>
            <!-- 轮播（Carousel）导航 -->
            <a class="carousel-control left" href="#myCarousel"
               data-slide="prev">&lsaquo;
            </a>
            <a class="carousel-control right" href="#myCarousel"
               data-slide="next">&rsaquo;
            </a>
        </div>

    </div>
