<#import "/resource/common_html_front.ftl" as html>
<#import "/indexMenu.ftl" as menu>
<@html.htmlBase>
    <@menu.menu selectMenu=mainCatalogCode/>
<!------灰色区域------>
<link rel="stylesheet" href="${basepath}/resource/css2/topic.css" type="text/css"/>
<div class="topiclist-banner">
</div>
<div class="topiclist-cont container">
    <ul class="topiclist-list clearfix"></ul>
    <a href="#"  class="button more listmore" style="display: none;" data-paper="2">下拉查看更多 </a>
</div>
<script type="text/javascript" src="${basepath}/resource/js2/page/topic.js"></script>
<script type="text/javascript">
    $(function () {
        "use strict";
        $(".topiclist-list").html("");
        new YOUMO.topic.topicList();
        //绑定收藏
        YOUMO.topic._bindFavo( $(".topiclist-list"));
    });
</script>

</@html.htmlBase>