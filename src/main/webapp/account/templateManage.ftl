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
            <@accountMenu.accountMenu currentMenu="templateManage"/>
        </aside>
        <div class="main" >
            <div class="manageTop">
                <div class="manage_nav clearfix">
            <ul class="clearfix nodis">
                     <#--   <li data-url="${basepath}/auth/account/templateManage?type=1"  <#if type=="1">class="active"</#if>>
                            <a> Office模板</a>
                        </li>
                        <li data-url="${basepath}/auth/account/templateManage?type=2" <#if type=="2">class="active"</#if>>
                            <a>AE模板</a>
                        </li>
                        <li data-url="${basepath}/auth/account/templateManage?type=3" <#if type=="3">class="active"</#if>  >
                                <a>表情包模板</a>
                        </li>-->
                    </ul>

                </div>
                <div class="breadcrumbBox">作品管理</div>
            </div>
            <div class=" manageBody tab-content">
                    <div class="tresult-box   favorite-box">
                        <#if pager.list?? && pager.pagerSize gt 0>
                            <table class="table">
                                <tr>
                                    <th >模板图片</th>
                                    <th>模板名称</th>
                                    <th>模板类别</th>
                                    <th>上传时间</th>
                                    <th>状态</th>
                                    <th>操作</th>
                                </tr>

                            <#list pager.list as item>
                                <tr>
                                    <td>
                                       <img   src="${item.shrinkUrl}" />
                                    </td>
                                    <td>
                                        ${item.name?html}
                                    </td>
                                    <td>
                                     <#if item.catalogID=="110">EXCEL模板
                                     <#elseif item.catalogID=="121">AE模板
                                     <#elseif item.catalogID=="125">表情包
                                     <#elseif item.catalogID=="144">PPT模板
                                     <#elseif item.catalogID=="145">WORD模板
                                     </#if>
                                    </td>
                                    <td>${item.createTime?string("yyyy-MM-dd")}</td>
                                    <#if item.status==0>
                                        <td>待审核</td>
                                        <td class="tdlast">
                                            <div style="display:inline-block;display:block;">
                                            <span class="wait">等待中</span>
                                            <br/>
                                            <span>三个工作日内审核完毕</span>
                                             </div>
                                        </td>
                                    <#elseif item.status==1>
                                        <td>已上架</td>
                                        <td class="tdlast"><a class="btn btn-success btn-sm"  href="javascript:;">编辑</a>
                                            <div style="display:inline-block;display: none;" class="edtb edtbt">
                                                <span><a href="${basepath}/template/detail/${item.id}.html" target="_blank"><i class="icon iconfont">&#xe610;</i><br/>查看</a></span>
                                                <span>
                                                    <#if item.catalogID=="121">
                                                        <a href="${basepath}/auth/account/templateUpload/aeEdit?id=${item.id}">
                                                    <#elseif item.catalogID=="125">
                                                        <a href="${basepath}/auth/account/templateUpload/bqEdit?id=${item.id}">
                                                    <#else>
                                                        <a href="${basepath}/auth/account/templateUpload/officeEdit?id=${item.id}">
                                                    </#if>
                                                     <i class="icon iconfont">&#xe613;</i><br/>修改</a></span>
                                                <span><a href="javascript:;" onclick="window.open('http://kefu.qycn.com/vclient/chat/?websiteid=130565'+'&originPageTitle='+encodeURIComponent(window.document.title)+'&originPageUrl='+encodeURIComponent(document.referrer)+'&originPageLocationUrl='+encodeURIComponent(document.location.href), '_blank', 'toolbar=no,scrollbars=yes,menubar=no,status=no,resizable=yes,location=no,width=960,height=620,top=38,left=200')" rel="nofollow"><i class="icon iconfont">&#xe611;</i><br/>下架</a></span>
                                            </div>
                                        </td>
                                    <#elseif item.status==2>
                                        <td>已下架</td>
                                        <td class="tdlast"><a class="btn btn-success btn-sm" href="javascript:;">编辑</a>
                                            <div style="display:inline-block;display: none;" class="edtb">
                                                <span class="boldU"><a href="javascript:;" onclick="window.open('http://kefu.qycn.com/vclient/chat/?websiteid=130565'+'&originPageTitle='+encodeURIComponent(window.document.title)+'&originPageUrl='+encodeURIComponent(document.referrer)+'&originPageLocationUrl='+encodeURIComponent(document.location.href), '_blank', 'toolbar=no,scrollbars=yes,menubar=no,status=no,resizable=yes,location=no,width=960,height=620,top=38,left=200')" rel="nofollow"><i class="icon iconfont">&#xe60f;</i><br/>上架</a></span>
                                            </div>
                                        </td>
                                    <#else >
                                        <td>审核未通过<br/>
                                        <span class="causez">原因：<#if item.comment??>${item.comment}<#else >无</#if></span>
                                        </td>
                                        <td class="tdlast"><a class="btn btn-success btn-sm"  href="javascript:;" >编辑</a>
                                            <div style="display:inline-block;display: none;" class="edtb">
                                                <span class="reupload">
                                                    <#if item.catalogID=="121">
                                                    <a href="${basepath}/auth/account/templateUpload/aeEdit?id=${item.id}">
                                                    <#elseif item.catalogID=="125">
                                                    <a href="${basepath}/auth/account/templateUpload/bqEdit?id=${item.id}">
                                                    <#else>
                                                    <a href="${basepath}/auth/account/templateUpload/officeEdit?id=${item.id}">
                                                    </#if>
                                                    <i class="icon iconfont">&#xe60d;</i><br/>重新上传</a></span>
                                                <span><a  href="javascript:;" onclick="deleteTr(${item.id},this)"> <i class="icon iconfont">&#xe60e;</i><br/>删除</a></span>
                                            </div>
                                        </td>
                                    </#if>
                                </tr>

                            </#list>
                            </table>
                            <!-- 分页 -->
                            <div class="pages">
                                <div id="Pagination" class="Pagination"></div>
                            </div>
                         <#else>
                         <div class=" manageBody tab-content">
                             <table class="table">
                                 <tr>
                                     <th >模板图片</th>
                                     <th>模板名称</th>
                                     <th>模板类别</th>
                                     <th>上传时间</th>
                                     <th>状态</th>
                                     <th>操作</th>
                                 </tr>

                             </table>

                             <div class="tresult-box order-box">
                                 <!-- 订单列表为空 -->
                                 <div class="tresult-no">
                                     &nbsp;    亲，你还没有任何模板信息！赶紧去上传作品吧！
                                 </div>
                             </div>
                         </div>
                        </#if>
                    </div>
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
            pagerTotal:${pager.total}
            , pagerOffset:${pager.offset},
            pagerPageSize:${pager.pageSize},
            pagerPagerUrl: "${pager.pagerUrl}",
            Urlargument: funcUrlDel("pager.offset")
        });

        $("tr>td>a").click(function(){
            $("tr>td>a").siblings("div").hide();
            $("tr>td>a").show();
            $(this).hide();
            $(this).siblings("div").show();

        });

     /*
     头部跳转
      $(".manage_nav li").on('click',function (event) {
            event.stopPropagation();
            var _this=$(this),gourl=_this.data('url');
            goUrl(gourl);
            _this.addClass("active");

        });*/


    });
    function deleteTr(a,mm) {

    /*    event.preventDefault();
        event.stopPropagation();*/
         var _mm=$(mm);
        layer.confirm('您确认删除？', {
                    btn: ['确认', '取消']
                }//按钮
                , function (index) {
                    _mm.closest("tr").hide();
                    $.ajax({
                        type: 'GET',
                        url: basepath + "/template/delTemp",
                        data: {id: a}
                    });
                   layer.close(index);
                }, function () {}
        );
    }

</script>

</@html.htmlBase>