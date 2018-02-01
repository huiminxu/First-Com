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
			<@accountMenu.accountMenu currentMenu="favorite"/>
        </aside>
        <div class="main">
            <div class="tresult-status">
                <ul class="clearfix">
                    <li data-url="${basepath}/auth/account/favorite">
                       <em>${favoriteCount!""}</em>
                        <h2>模板收藏</h2>
                    </li>
                    <li  class="active" data-url="#">
                        <em class="topicfavo-num">${subjectFavoriteCount!""}</em>
                        <h2>专题收藏</h2>
                    </li>
                </ul>
            </div>
            <div class="subjectfavorite-box">
                    <#if pager.list?? && pager.pagerSize gt 0>
                               <ul class="clearfix">
                                   <#list pager.list as topic>
                                   <li>
                                       <a href="#"><img src="${topic.topicImage}"></a>
                                       <h3>${topic.topicName}</h3>
                                       <p><a href="javascript:void(0);" data-id="${topic.id}" class="btn fright cancel-fav">取消收藏</a><time>${topic.createdTime?string("yyyy-MM-dd")}</p>
                                   </li>
                                   </#list>

                               </ul>
                                <div class="pages">
                                    <div id="Pagination" class="Pagination"></div>
                                </div>
                    <#else>
                        <div class="tresult-no">
                            &nbsp;亲，您暂时没有收藏任何专题哦，赶紧去收藏几个吧！
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
            pagerTotal:${pager.total}
            , pagerOffset:${pager.offset},
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

        $(".cancel-fav").on('click',function (event) {//取消收藏
            event.preventDefault();
            var _this=$(this);
            var _url = basepath + "/template/addToFavorite?templateId=" + _this.data("id") + "&flag=0&radom=" + Math.random()+"&type=topic";
            $.ajax({
                type: 'GET',
                url: _url,
                success: function (data) {
                    if(data=2){
                        _this.parents("li").remove();
                        var favonum= $(".topicfavo-num").html()-1;
                        $(".topicfavo-num").html(favonum);
                        if(favonum===0){
                            _this.parents(".subjectfavorite-box").empty();
                            _this.parents(".subjectfavorite-box").html("<div class=/"tresult-no/">&nbsp;亲，您暂时没有收藏任何专题哦，赶紧去收藏几个吧！</div>");
                        }
                    }else{
                       layer.msg("取消失败");
                    }
                }
            });
        })

    })

</script>
</@html.htmlBase>