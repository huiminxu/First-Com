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
            <@accountMenu.accountMenu currentMenu="customizations"/>
        </aside>
        <div class="main customizations">
            <div class="tresult-status">
                <ul class="clearfix">
                    <li class="active minehack"><a href="#"> <em>${pager.total!"0"}</em>
                        <h2>我是用户</h2></a></li>
                    <li class="minehack"><a href="${basepath}/auth/designer/designizations"> <em>${imDesignerCount}</em>
                        <h2>我是设计师</h2></a></li>
                </ul>
            </div>
            <div class="tab-content tresult-box customizations-box">
                <div class="consumer" id="consumer">
                    <#if pager.list?? && pager.pagerSize gt 0>
                        <table class="table">
                            <tr>
                                <th>设计师</th>
                                <th>创建时间</th>
                                <th>截止时间</th>
                                <th>定制需求</th>
                                <th>状态</th>
                                <th>操作</th>
                            </tr>
                            <#list pager.list as item>
                                <tr id="del11305" class="col-num order-num">
                                    <td colspan="6">
                                        <a class="btn fright  btncustomize"
                                           href="tencent://message/?uin=${item.designerQQ}&Site=qq&Menu=yes"><img
                                                src="${basepath}/resource/images/customize/qq.png">与设计师交流</a>
                                        订单号:${item.orderNum}
                                    </td>
                                </tr>
                                <tr data-id="${item.id}" data-designer="${item.designerID}" data-orderid="${item.orderID}">
                                    <td>
                                    ${item.designerNickName}
                                    </td>
                                    <td>${item.createdTime?string("yyyy-MM-dd")}</td>
                                    <td class="etctime">${item.etc?string("yyyy-MM-dd")}</td>
                                    <td><a href="javascript:void(0)" t class="look-btn"  >查看</a></td>
                                    <td>
                                        <#if item.status=1>
                                            <#if item.etc?datetime gt now?datetime>
                                                待上传
                                            <#else >
                                                超时未上传
                                            </#if>
                                        <#elseif item.status=2>
                                            待确认
                                        <#elseif item.status=3 >
                                            已完成
                                        <#elseif item.status=6>
                                            <#if item.etc?datetime gt now?datetime>
                                                推迟
                                            <#else>
                                                超时未上传
                                            </#if>
                                        </#if>
                                    </td>
                                    <td rowspan="" class="operate-box">
                                        <#if item.status=1>
                                            <#if item.etc?datetime gt now?datetime>

                                            <#else >
                                              <a href="javascript:;" onclick="window.open('http://kefu.qycn.com/vclient/chat/?websiteid=130565'+'&originPageTitle='+encodeURIComponent(window.document.title)+'&originPageUrl='+encodeURIComponent(document.referrer)+'&originPageLocationUrl='+encodeURIComponent(document.location.href), '_blank', 'toolbar=no,scrollbars=yes,menubar=no,status=no,resizable=yes,location=no,width=960,height=620,top=38,left=200')" rel="nofollow"><h2>联系客服</h2></a>
                                            </#if>
                                        <#elseif item.status=2>
                                            <a href="${basepath}/auth/template/customizeTempDownload?id=${item.id}"
                                               target="_blank"><img
                                                    src="${basepath}/resource/images/customize/download-active.png">
                                                <h2>下载</h2></a>
                                            <a href="${basepath}/auth/designer/customize/changeStatus?coid=${item.id}&opt=confirm&did=${item.designerID}"
                                               target="_self" class="confirm-btn" ><img
                                                    src="${basepath}/resource/images/customize/confirm-active.png">
                                                <h2>确认</h2></a>
                                            <#if item.delayTimes=0>
                                                <a href="${basepath}/auth/designer/customize/changeStatus?coid=${item.id}&opt=delay"
                                                   target="_self" class="defer-btn"><img
                                                        src="${basepath}/resource/images/customize/delay-active.png">
                                                    <h2>推迟</h2></a>
                                            </#if>
                                        <#elseif item.status=3 >
                                            <a href="${basepath}/auth/template/customizeTempDownload?id=${item.id}"
                                               target="_blank"><img
                                                    src="${basepath}/resource/images/customize/download-active.png">
                                                <h2>下载</h2></a>
                                            <#if item.commentID=0>
                                                <a href="${basepath}/auth/designer/designerComment?did=${item.designerID}&oid=${item.orderID}" target="_blank" class="evaluate-btn"><i class="icon iconfont">&#xe612;</i>
                                                    <h2>评价</h2></a>

                                            </#if>

                                        <#elseif item.status=6>
                                            <#if item.etc?datetime gt now?datetime>
                                                <a href="${basepath}/auth/template/customizeTempDownload?id=${item.id}"
                                                   target="_blank"><img
                                                        src="${basepath}/resource/images/customize/download-active.png">
                                                    <h2>下载</h2></a>
                                                <a href="${basepath}/auth/designer/customize/changeStatus?coid=${item.id}&opt=confirm&did=${item.designerID}"
                                                   target="_self"  class="confirm-btn"><img
                                                        src="${basepath}/resource/images/customize/confirm-active.png">
                                                    <h2>确认</h2></a>
                                            <#else>
                                                <a href=#" target="_blank"><h2>联系客服</h2></a>
                                            </#if>
                                        </#if>
                                    </td>
                                </tr>
                            </#list>
                        </table>
                        <!-- 分页 -->
                        <div class="pages">
                            <div id="Pagination" class="Pagination"></div>
                        </div>
                    <#else >
                        <div class="tresult-no">
                            &nbsp;亲，您还没有定制订单，赶快去定制一个吧！
                        </div>
                    </#if>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="customization-show">
    <div class="form-horizontal" >
        <div class="form-group">
            <label for="cType" class="col-sm-4 control-label">定制类型：</label>
            <div class="col-sm-8">
                <label  class="form-control" name="cType"></label>
            </div>
        </div>
        <div class="form-group">
            <label for="cUse" class="col-sm-4 control-label">定制用途：</label>
            <div class="col-sm-8">
                <label  class="form-control" name="cUse"></label>
            </div>
        </div>
        <div class="form-group">
            <label for="price"  class="col-sm-4 control-label">定制价格：</label>
            <div class="col-sm-8">
                <label  class="form-control" name="price"></label>
            </div>
        </div>
        <div class="form-group">
            <label for="quantity"  class="col-sm-4 control-label">定制数量：</label>
            <div class="col-sm-8">
                <label  class="form-control" name="quantity"></label>
            </div>
        </div>
        <div class="form-group">
            <label for="etcTime"  class="col-sm-4 control-label">完成期限：</label>
            <div class="col-sm-8">
                <label  class="form-control" name="etcTime"></label>

            </div>
        </div>
        <div class="form-group">
            <label for="other"  class="col-sm-4 control-label">其他：</label>
            <div class="col-sm-8">
                <label  class="form-control" name="other">
                </label>
            </div>
        </div>
        <div class="form-group">
            <label for="customerContact"  class="col-sm-4 control-label">联系方式：</label>
            <div class="col-sm-8">
                <label  class="form-control" name="customerContact">

                </label>
            </div>
        </div>

    </div>
</div>

<script type="text/javascript" src="${basepath}/resource/js2/page/desgin.js"></script>
<script type="text/javascript" src="${basepath}/resource/jquery-pagination/js/jquery.pagination.js" ></script>
<script type="text/javascript">
    $(function () {
        //分页
        YOUMO.paginationOper.init({
            ele:$("#Pagination"),
            pagerTotal:${pager.total}
            , pagerOffset:${pager.offset},
            pagerPageSize:${pager.pageSize},
            pagerPagerUrl: "${pager.pagerUrl}",
            Urlargument: funcUrlDel("pager.offset")
        });

        YOUMO.desinger.IamCustomizations({
            confirmBtn:$(".confirm-btn"),
            deferBtn: $(".defer-btn"),
            lookBtn:$(".look-btn")

        })
    });
</script>
</@html.htmlBase>



