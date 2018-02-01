<#import "/resource/common_html_front.ftl" as html>
<#import "/indexMenu.ftl" as menu>
<@html.htmlBase>
    <@menu.menu selectMenu="customize"/>
<link rel="stylesheet" href="${basepath}/resource/css2/design.css" type="text/css"/>
<link rel="stylesheet" href="${basepath}/resource/jquery-pagination/css/pagination.css" />
<div class="customize-box">
    <a href="${basepath}/auth/designer/designerJoin" class="bedesigner"><img src="${basepath}/resource/images/customize/designerbanner.png" class="designerBanner"></a>
    <div class="container customize-box-main  customize-box-main-mt">
        <div class="designerBox">
            <div class="design-list clearfix">
                <#list pager.list as item>
                    <div class="design-list-item" data-url="${basepath}/designer/info?designerId=${item.id}">
                        <div class="clearfix designerImg">
                            <a class="imghead" href="${basepath}/designer/info?designerId=${item.id}"><img
                                    src="${item.avater!"${basepath}/resource/images/headInfo-default.png"}"
                                    alt="${item.nickname!""}"/></a>
                            <#if item.qqStatus==0>
                                <img src="${basepath}/resource/images/outline.png" class="chat-sit">
                            <#else>
                                <img src="${basepath}/resource/images/online.png" class="chat-sit">
                            </#if>
                        </div>
                        <p class="designer-name"><a href="#" target="_blank"> <strong>${item.nickname!""}</strong> </a>
                        </p>
                        <a href="tencent://message/?uin=${item.qq}&Site=qq&Menu=yes"
                           class="btn btn-success design-click"><img
                                src="${basepath}/resource/images/customize/QQ1.png">交谈</a>
                        <div class="design-sit">
                            <div> 已完成<br/><span>${item.finishQty!"0"}</span></div>
                            <div>定制中 <br/><span>${item.unfinishQty!"0"}</span></div>
                            <div class="lst">好评率<br/><span>
                                <#if item.favorableRate??>
                                ${item.favorableRate}%
                                <#else>
                                    -
                                </#if>
                            </span>
                            </div>
                        </div>
                    </div>
                </#list>
            </div>
        </div>
    </div>
    <div class="pages">
        <div id="Pagination" class="Pagination"></div>
    </div>

</div>


<script type="text/javascript" src="${basepath}/resource/jquery-pagination/js/jquery.pagination.js" ></script>
<script type="text/javascript">
    $(document).ready(function(){
                //分页
                YOUMO.paginationOper.init({
                    ele:$("#Pagination"),
                    pagerTotal:${pager.total}
                    ,pagerOffset:${pager.offset},
                    pagerPageSize:${pager.pageSize},
                    pagerPagerUrl:"${pager.pagerUrl}",
                    Urlargument:funcUrlDel("pager.offset")
                });


        $(".customize-box-main .designerBox .design-list .design-list-item:not(.more-designer)").on("click",
                function(event){
                    event.preventDefault();
                    var _this=$(this);
                    var gour=_this.data('url');
                    goUrl(gour);
                }
        );
        $(".customize-box-main .designerBox .design-list .design-list-item:not(.more-designer) a.design-click").on("click",
                        function(event){
                           event.stopPropagation();

                        }
                );

    }
    );

</script>

</@html.htmlBase>