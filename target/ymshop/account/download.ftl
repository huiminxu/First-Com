<#import "/resource/common_html_front.ftl" as html>
<#import "/indexMenu.ftl" as menu>
<#import "/account/accountMenu.ftl" as accountMenu>
<@html.htmlBase>
    <@menu.menu selectMenu=""/>
<!------灰色区域------>
<div class="grayline"></div>
<link rel="stylesheet" href="${basepath}/resource/css2/usercenter.css" type="text/css"/>
<link rel="stylesheet" href="${basepath}/resource/jquery-pagination/css/pagination.css" />
<div class="container distable mt20 mb45">
    <div class="usercenter-box ">
        <aside class="usercenter-menu">
            <@accountMenu.accountMenu currentMenu="download"/>
        </aside>
        <div class="main">
           <div class="breadcrumbBox">我的下载</div>
            <div class="tresult-box  download-box">
                <!-- 有下载列表  -->
                <#if pager.list?? && pager.pagerSize gt 0>
                <table class="table">
                    <tr class="">
                        <th >模板图片</th>
                        <th >模板名称</th>
                        <th>模板类别</th>
                        <th>下载时间</th>
                        <th >操作</th>
                    </tr>
                    <#list pager.list as item>
                        <#if item.template??>
                            <tr >
                                <td>
                                    <#if item.template.shrinkUrl??>
                                        <a  href="${basepath}/template/detail/${item.template.id}.html"  target="_blank"><img   src="${item.template.shrinkUrl!""}" /></a>
                                    <#else>
                                        <a  href="${basepath}/template/detail/${item.template.id}.html"  target="_blank"><img src="${basepath}/resource/images/tmupdata_aepreview.jpg"    /></a>
                                    </#if>
                                </td>
                                <td>
                                    ${item.template.name?html}
                                </td>
                                <td>${item.template.catalogName!""}</td>
                                <td>${item.lastDownloadTime?string("yyyy-MM-dd HH:mm")}</td>
                                <td><a href="${basepath}/auth/template/download?id=${item.template.id!""}"  data-templateid="${item.template.id!""}"  class="btn-mfdownload btn btn-success btn-sm" target="_black">立即下载 </a> <br/></td>
                            </tr>
                        </#if>
                    </#list>
                </table>
                    <!-- 分页 -->
                    <div class="pages">
                        <div id="Pagination" class="Pagination"></div>
                    </div>
                <!-- 没有下载列表  -->
                <#else>
                    <div class="tresult-no">
                        &nbsp;亲，你还没有任何下载信息！赶紧去下载吧！
                    </div>
                </#if>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="${basepath}/resource/jquery-pagination/js/jquery.pagination.js" ></script>
<script type="text/javascript">
    $(document).ready(function () {
        //分页
        YOUMO.paginationOper.init({
            ele:$("#Pagination"),
            pagerTotal:${pager.total},
            pagerOffset:${pager.offset},
            pagerPageSize:${pager.pageSize},
            pagerPagerUrl: "${pager.pagerUrl}",
            Urlargument: funcUrlDel("pager.offset")
        });

        //头部跳转
        $(".tresult-status li").on('click',function (event) {
            event.stopPropagation();
            var _this=$(this),gourl=_this.data('url');
            goUrl(gourl);

        });

        // 绑定免费下载：
        YOUMO.templateOper._bindDownload(false);
    })

</script>
</@html.htmlBase>