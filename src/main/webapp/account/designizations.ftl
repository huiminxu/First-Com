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

                    <li class="minehack"><a href="${basepath}/auth/account/customizations/imuser">
                        <em>${imUserCount!"0"}</em>
                        <h2>我是用户</h2></a></li>
                    <li class="active minehack"><a href="#"> <em>
                        <#if pager??>
                        ${pager.total!"0"}
                        <#else >
                            0
                        </#if>
                    </em>
                        <h2>我是设计师</h2></a></li>
                </ul>
            </div>
            <div class="tab-content tresult-box customizations-box">
                <div class="stylist" id="stylist">
                    <#if isdesigner?? && isdesigner=="n">
                       <div class="desginer-no">
                        <div class="desginerno-text">
                            不好意思哦<br/>
                            您还不是Yomoer设计师<br/>
                            <a class="btn" href="${basepath}/auth/designer/toBeDesigner">立即认证</a>
                        </div>

                       </div>
                    <#elseif pager.list?? && pager.pagerSize gt 0>
                        <table class="table">
                            <tr>
                                <th>定制类型</th>
                                <th>创建时间</th>
                                <th>截止时间</th>
                                <th>定制需求</th>
                                <th>状态</th>
                                <th>操作</th>
                            </tr>
                            <#list pager.list as item>
                                <#if item??>
                                    <tr data-id="${item.id!""}" class="col-num order-num">
                                        <td colspan="6" class="clearfix">
                                            <#if item.status!=0>
                                                订单号:${item.orderNum!""}
                                            </#if>
                                            <a href="javascript:void(0);" class="btn fright contact-btn" data-contact="${item.customerContact!""}">查看联系方式</a>
                                        </td>
                                    </tr>
                                    <tr data-id="${item.id!""}">
                                        <td>
                                        ${item.cTypeName!""}
                                        </td>
                                        <td>${(item.createdTime?string("yyyy-MM-dd"))!""}</td>
                                        <td>${(item.etc?string("yyyy-MM-dd"))!""}</td>
                                        <td><a href="javascript:void(0);"
                                               class="look-btn" target="_blank">查看</a></td>
                                        <td>
                                            <#if item.status==0>
                                                未付款
                                            <#elseif item.status==1>
                                                <#if item.etc?datetime gt now?datetime>
                                                    待上传
                                                <#else >
                                                    超时未上传
                                                </#if>
                                            <#elseif item.status==2>
                                                待确认
                                            <#elseif item.status==3||item.status==4>
                                                已完成
                                            <#elseif item.status==6>
                                                <#if item.etc?datetime gt now?datetime>
                                                    推迟
                                                <#else >
                                                    超时未上传
                                                </#if>
                                            </#if>
                                        </td>
                                        <td rowspan="" class="operate-box">
                                            <#if item.status==0>
                                                <a href="javascript:void(0)" class="send-btn"
                                                   data-clipboard-text="${systemSetting().www}${basepath}/auth/designer/customize/pay?id=${item.id}"><img
                                                        src="${basepath}/resource/images/customize/sendOrder-active.png">
                                                    <h2>发送订单</h2></a>
                                                <a href="${basepath}/auth/designer/customizationUpload?id=${item.id}&type=edit"
                                                   target="_blank" class="edit-btn"><img
                                                        src="${basepath}/resource/images/customize/edit-active.png">
                                                    <h2>编辑需求</h2></a>
                                                <a href="${basepath}/auth/designer/delCustomizeOrder?id=${item.id}"
                                                    class="delete-btn"><i
                                                        class="icon iconfont">&#xe60e;</i>
                                                    <h2>删除</h2></a>
                                            <#elseif item.status==1>
                                                <#if item.etc?datetime gt now?datetime>
                                                    <div class="uploadfile-box">
                                                        <a href="javascript:void(0);" target="_blank">选择文件</a>
                                                        <input type="file" data-type="${item.cType}">
                                                    </div>
                                                </#if>
                                            <#elseif item.status==6>
                                                <#if item.etc?datetime gt now?datetime>
                                                    <div class="uploadfile-box">
                                                        <a href="javascript:void(0);" target="_blank">选择文件</a>
                                                        <input type="file" data-type="${item.cType}">
                                                    </div>
                                                </#if>
                                            </#if>
                                        </td>
                                    </tr>
                                </#if>
                            </#list>
                        </table>
                        <!-- 分页 -->
                        <div class="pages">
                            <div id="Pagination" class="Pagination"></div>
                        </div>
                    <#else>
                        <div class="tresult-no">
                            &nbsp;亲，您还没有定制订单，请加油哦！
                        </div>
                    </#if>
                </div>
            </div>
        </div>
    </div>
</div>
<style type="text/css">

</style>

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

<script type="text/javascript" src="${basepath}/resource/js2/clipboard.min.js"></script>
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
        // 发送订单：复制到剪贴板
        var btns = document.querySelectorAll('.send-btn');
        try {
            if (Clipboard && typeof(Clipboard) == "function") {
                var clipboard = new Clipboard(btns);
                clipboard.on('success', function (e) {
                    layer.msg('已复制到剪贴板');
                });

                clipboard.on('error', function (e) {
                    layer.msg('复制到剪贴板请重新联系客服');
                });
            }
        } catch (e) {
            $.each(btns, function (index, item) {
                var _this = $(this);
                $(this).css('display', 'none');
                var txt = "<div class='Clipboard-no'>" +
                        "<p>请手动复制文本框内容发送订单</p>" +
                        "<input type='text'   disabled value=" + _this.data('clipboardText') + ">" +
                        "</div>";
                $(this).parent().prepend(txt);

            });
        }

        //选择文件
        YOUMO.desinger.IamDesignizations({
            file: $("input[type='file']"),
            uploadBtn: $(".operate-box"),
            deleteBtn: $(".delete-btn"),
            lookBtn:$(".look-btn"),
            contactBtn:$(".contact-btn"),
            urls: {
                url1: "${systemSetting().webStorePath}/web/designer/customization/ymshop/",
                url2: "${basepath}/auth/designer/updateUploadStatus"
            }
        })


    });
</script>
</@html.htmlBase>



