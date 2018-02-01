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
            <@accountMenu.accountMenu currentMenu="orders"/>
        </aside>
        <div class="main">
            <div class="tresult-status">

                <ul class="clearfix">
                    <li <#if type=="2">class="active"</#if>   data-url="${basepath}/auth/account/orders?type=2">
                        <em>${orderSimpleReport.orderWaitCount}</em>
                        <h2>未完成</h2>
                    </li>
                    <li <#if type=="1">class="active"</#if>   data-url="${basepath}/auth/account/orders?type=1">
                        <em>${orderSimpleReport.orderPayCount}</em>
                        <h2>已完成</h2>
                        <span class="glyphicon glyphicon-question-sign" data-toggle="tooltip" data-placement="right" title="未完成订单将2小时后被清空！"></span>
                        <!-- Generated markup by the plugin -->
                        <div class="tooltip top" role="tooltip">
                            <div class="tooltip-arrow"></div>
                            <div class="tooltip-inner">
                                Some tooltip text!
                            </div>
                        </div>
                    </li>
                </ul>

            </div>
            <div class="tresult-box order-box">
                <#if pager.list?? && pager.pagerSize gt 0>
                    <table class="table">
                        <tr>
                            <th>模板图片</th>
                            <th>模板名称</th>
                            <th>模板类别</th>
                            <th>交易时间</th>
                            <th>价格</th>
                            <th>操作</th>
                        </tr>
                        <#list pager.list as item>
                            <tr id="del${item.id!""}" class="col-num" >
                                <td colspan="6"  >
                                            订单号:${item.orderNum!""}
                                </td>
                            </tr>
                            <tr id="delete${item.id!""}" class="f15">
                                <td>
                                    <#if item.picture??>
                                        <a  href="${basepath}/template/detail/${item.templateId}.html"  target="_blank"><img src="${item.picture!""}"/></a>
                                    <#else>
                                        <a  href="${basepath}/template/detail/${item.templateId}.html"  target="_blank"><img src="${basepath}/resource/images/tmupdata_aepreview.jpg"    /></a>
                                    </#if>
                                </td>
                                <td>${item.templateName?html}</td>
                                <td>${item.catalogName}</td>
                                <td>${item.createTime!""}</td>
                                <td>
                                    <#if item.payType==1>${item.amount?number?string("0")}<#else>${item.amount} </#if>
                                </td>
                                <td rowspan="${item.quantity!""}" class="operate-box">
                                    <#if item.payType !=3 && item.status=="success">
                                        <a href="${basepath}/auth/template/download?id=${item.templateId!""}" data-templateid="${item.templateId!""}" target="_blank"
                                           class="btn-mfdownload btn btn-success btn-sm">立即下载</a>
                                    <#elseif  item.payType !=1 && item.status !="success">
                                        <a href="${basepath}/auth/order/moneypay?id=${item.orderNum!""}"
                                           class="btn-onlinepay btn btn-success btn-sm">立即购买</a>
                                        <p class="mt"><a href="javascript:void(0)" data-id="${item.id!""}" class="btn-delete">删除订单</a></p>
                                    <#elseif item.payType ==1 && item.status !="success">
                                        <a href="${basepath}/auth/order/toPay?id=${item.id!""}"
                                           class="btn-jfpay btn btn-success btn-sm">支付</a>

                                       <p class="mt"><a href="javascript:void(0)" data-id="${item.id!""}" class="btn-delete">删除订单</a></p>
                                    <#else>
                                        <a href="#" class=" btn btn-success btn-sm">缺省</a>
                                    </#if>
                                </td>
                            </tr>
                        </#list>
                    </table>
                    <!-- 分页 -->
                    <div class="pages">
                        <div id="Pagination" class="Pagination"></div>
                    </div>

                <#else>
                    <!-- 订单列表为空 -->
                    <div class="tresult-no">
                        &nbsp;亲，你还没有任何订单信息！赶紧去下个单吧！
                    </div>
                </#if>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="${basepath}/resource/js2/page/pay.js"></script>
<script type="text/javascript" src="${basepath}/resource/jquery-pagination/js/jquery.pagination.js" ></script>
<script type="text/javascript">
    $(document).ready(function () {

        //分页
        YOUMO.paginationOper.init({
            ele:$("#Pagination"),
            pagerTotal:${pager.total}
            , pagerOffset:${pager.offset},
            pagerPageSize:${pager.pageSize},
            pagerPagerUrl: "${pager.pagerUrl}",
            Urlargument: funcUrlDel("pager.offset")
        });

        //tiptool 初始化
        $('[data-toggle="tooltip"]').tooltip();

        //头部跳转
        $(".tresult-status li").on('click',function (event) {
            event.stopPropagation();
           var _this=$(this),gourl=_this.data('url');
            goUrl(gourl);
        });
        // 积分支付
        $(".btn-jfpay").on('click', function (event) {
            event.preventDefault();
            var _this = $(this);
            var option = previewPayJF(_this);
            option['endcallback']=function () {
                   location.reload();
                };
            previewPay(option);
        });
        // 在线支付
        $(".btn-onlinepay").on('click', function (event) {
            event.preventDefault();
            var _this = $(this);
            var option = previewPayOnline(_this);
            option['endcallback']=function () {
                location.reload();
            };
            previewPay(option);
        });

        // 绑定免费下载：
        YOUMO.templateOper._bindDownload(false);
        //删除订单
        $(".btn-delete").on('click', function (event) {
            event.preventDefault();
            var _this = $(this),
                    orderid = _this.data('id');
            //询问框
            layer.confirm('确认删除该订单？', {
                btn: ['确认','取消']
            }, function(){
               //btn1
                <#if RequestParameters["pager.offset"]?exists>
                    window.location.href = "${basepath}/order/deletes?ids=" + orderid+"&type="+${type!""} + "&pager.offset=${RequestParameters["pager.offset"]}";
                <#else>
                    window.location.href = "${basepath}/order/deletes?ids=" + orderid+"&type="+${type!""};
                </#if>
            }, function(){
                //btn2
               // return false;
            });

        })
    })

</script>
</@html.htmlBase>



