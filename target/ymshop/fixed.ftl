<style>
    /*-- 浮动编辑按钮 --*/
    .izl-rmenu{position:fixed; width: 52px; right:0px;bottom:10px; padding-bottom:73px;  z-index:999; }
    .izl-rmenu .btn{width:52px; height:52px; margin-bottom:1px; cursor:pointer; position:relative;}
    .izl-rmenu .btn-wx{background:url(${basepath}/resource/images/r_wx.png) 0px 0px no-repeat #48b84b !important; }
    .izl-rmenu .btn-wx:hover{background-color:#48b84b;}
    .izl-rmenu .btn-wx .pic{position:absolute; left:-160px; top:-109px; display:none;width:160px;height:160px;}
    .izl-rmenu .btn-phone{background:url(${basepath}/resource/images/r_phone.png) 0px 0px no-repeat #48b84b !important; }
    .izl-rmenu .btn-phone:hover{background-color:#48b84b;}
    .izl-rmenu .btn-phone .phone{background-color:#48b84b; position:absolute; width:160px; left:-157px; top:-1px; line-height:52px; color:#FFF; font-size:18px; text-align:center; display:none;}
    .izl-rmenu .btn-top{background:url(${basepath}/resource/images/r_top.png) 0px 0px no-repeat #d0d6d9 !important;  display:none;}
    .izl-rmenu .btn-top:hover{background-color:#999;}
</style>

<div id="top"></div>
<script>
    (function(){
        //浮动广告
        var tophtml="<div id=\"izl_rmenu\" class=\"izl-rmenu\">"+
                    "<div class=\"mb\">  <a href=\"javascript:addFavorite();\"  onclick=\"_czc.push(['_trackEvent', '首页', '收藏本站']);\" class=\"sc_icon\" rel=\"sidebar\" title=\"加入到收藏\" ></a></div>"+
                    "<div class=\"btn btn-wx\"><img class=\"pic\" src='${basepath}/resource/images/index/qrCode.jpg' onclick=\"window.location.href=\''\"  alt=\"柚墨公众号二维码\"/></div><div class=\"btn btn-phone\"><div class=\"phone\">400-050-5206</div></div><div class=\"btn btn-top\"></div></div>";
        $("#top").html(tophtml);
        $("#izl_rmenu").each(function(){
            $(this).find(".btn-wx").mouseenter(function(){
                $(this).find(".pic").fadeIn("fast");
            });
            $(this).find(".btn-wx").mouseleave(function(){
                $(this).find(".pic").fadeOut("fast");
            });
            $(this).find(".btn-phone").mouseenter(function(){
                $(this).find(".phone").fadeIn("fast");
            });
            $(this).find(".btn-phone").mouseleave(function(){
                $(this).find(".phone").fadeOut("fast");
            });
            $(this).find(".btn-top").click(function(){
                $("html, body").animate({
                    "scroll-top":0
                },"fast");
            });
        });
        var lastRmenuStatus=false;
        $(window).scroll(function(){//bug
            var _top=$(window).scrollTop();
            if(_top>200){
                $("#izl_rmenu").data("expanded",true);
            }else{
                $("#izl_rmenu").data("expanded",false);
            }
            if($("#izl_rmenu").data("expanded")!=lastRmenuStatus){
                lastRmenuStatus=$("#izl_rmenu").data("expanded");
                if(lastRmenuStatus){
                    $("#izl_rmenu .btn-top").slideDown();
                }else{
                    $("#izl_rmenu .btn-top").slideUp();
                }
            }
        });

    })()
</script>
<#--<!-- 图标 &ndash;&gt;-->
<#--<div id="site-navbar" style="position: fixed;z-index: 2000;right: 35px; bottom: 100px;">-->
<#--<!-- <div id="site-navbar" style="position: fixed; border: 0; z-index: 2000; padding: 0; margin: 0; right: 135px; bottom: 100px;"> &ndash;&gt;-->
	<#--<div class="panel panel-default">-->
		<#--<div class="panel-heading" style="display: none;">-->
			<#--<a href="#here" title="快速回复"><img src="${basepath}/resource/images/comment_new.gif"/></a>-->
		<#--</div>-->
		<#--<div class="panel-body" style="cursor: pointer;" id="returnTop" href="#toTop" onclick="scrollWindow()">-->
			<#--<a href="#toTop" name="toTop" title="返回顶部"><span class="glyphicon glyphicon-plane"></span></a>-->
		<#--</div>-->
		<#--<div class="panel-footer" style="display: none;cursor: pointer;">-->
			<#--<a style="width: 100%;height: 100%;border: 1px solid red;" title="返回列表" onclick="javascript:history.back();"><img src="${basepath}/resource/images/box.gif"/></a>-->
		<#--</div>-->
	<#--</div>-->
<#--</div>-->
<#--<style type="text/css">-->
<#--.thumbnail_css22{-->
	<#--background-color:Red;-->
<#--}-->
<#--</style>-->
<#--<script type="text/javascript">-->
<#--$(function() {-->
	<#--$("#returnTop").hover(function() {-->
		<#--//$(this).addClass("thumbnail_css22");-->
	<#--}, function() {-->
		<#--//$(this).removeClass("thumbnail_css22");-->
	<#--});-->
	<#---->
	<#--//$('#returnTop').click(function() {-->
        <#--//scoll the page back to the top-->
       <#--// $(document).scrollTo(0,2000);-->
    <#--//});-->
	<#---->
	<#---->
<#--});-->

<#--function scrollWindow(){-->
	<#--window.scrollTo(0,0);-->
<#--}-->
<#--</script>-->