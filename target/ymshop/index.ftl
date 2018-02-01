<#import "/resource/common_html_front.ftl" as html/>
<#import "/commonMenu.ftl" as menu/>
<@html.htmlBase>
<meta property="qc:admins" content="50702666757625530706654" />
<meta property="wb:webmaster" content="28e244326adb6a77" />
<link rel="stylesheet" href="${basepath}/resource/css2/index.css" type="text/css"/>
<script type="text/javascript" src="${basepath}/resource/js2/superSlide.js"></script>
<script type="text/javascript" src="${basepath}/resource/js2/index.js"></script>
	<@menu.menu/>
<script type="text/javascript" src="${basepath}/resource/js2/layer/layer.js"></script>
<script>



    $(document).ready(function() {
        $(".designBox .designer-list .designer-list-item").on("click",
                function(event){
                    event.stopPropagation();
                    event.preventDefault();

                    var _this=$(this);
                    var gour=_this.data('url');
                    goUrl(gour);
                }
        );
        $(".designBox .designer-list .designer-list-item a.design-click").on("click",
                function(event){
                    event.stopPropagation();
                }
        );

        if (document.cookie.indexOf("timeyozo")!=-1) {
            return;
        }else{

        var index = layer.open({
                    type: 1, //页面
                    title: false, //无标题
                    closeBtn: 0, //无关闭按钮
                    content: $('#tong'),
                    shade: [0.43, '#000000'], //遮罩层
                    shadeClose: true,
                    skin: 'tong-layer', //没有背景色
                   /* area[0.8,auto],*/
                    time: 1000 * 60 * 3,//多长时间关闭
                    success: function (layero, index) {
                        $(layero).find('.link').click(function () {
                            layer.close(index);

                        })
                    }
                }
        );

            $("#tong").css("height",document.documentElement.clientHeight*0.8+"px");
            $("#tong").css("width",document.documentElement.clientHeight*0.8*0.9522+"px");
            $(".layui-layer-content").css("margin-left","-"+$("#tong").width()*0.2+"px");

            $("div.layui-layer.layui-layer-page.layer-anim").css("top",document.documentElement.clientHeight*0.1+"px");


    setCookie("d1");
    }
    });


</script>
<#--弹窗-->
<div  id="tong" style="display: none;">
    <img src="${basepath}/resource/images/1.png" id="ig" />
    <a href="javascript:;" class="bbmt link" onclick="javascript:layer.closeAll();">
        <img src="${basepath}/resource/images/button.png"/>
    </a>

    <div  class="delink">
        <a href="${basepath}/member">会员特权</a><a href="javascript:dvib()">活动详情</a>
    </div>
    <a href="#" class="link cls" onclick="javascript:layer.closeAll();">
        <img src="${basepath}/resource/images/btn.png"/>
    </a>
</div>

<div  id="tong1" style="display: none;">
    <img src="${basepath}/resource/images/3.png" id="ig" />
    <a href="javascript:;" class="bbmt link">
        <img src="${basepath}/resource/images/button1.png"/>
    </a>

    <a href="#" class="link cls">
        <img src="${basepath}/resource/images/btn.png"/>
    </a>
</div>
		<#include "/index_center_slide.ftl"/>
		<#include "/index_mb.ftl"/>
		<#include "/index_emoticon.ftl"/>
		<#include "/index_ae.ftl"/>
         <#include "/index_designer.ftl"/>


</@html.htmlBase>