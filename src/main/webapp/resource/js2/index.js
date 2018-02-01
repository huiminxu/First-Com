// JavaScript Document
$(document).ready(function(){

		(function(){
            //index-mb tab页面
			 $("#mobanTab ul.tabUl li").click(function(){
            	   var _this=$(this);
                   _this.addClass("activeTab").siblings().removeClass("activeTab");
					var index =_this.index();
					$("#tabs > div").eq(index).fadeIn("slow").siblings().hide();
		            	var txt=_this.text().toUpperCase();
                 $(".ulborder>a").attr("href",basepath+'/catalog/'+txt+'moban.html?isFee=n');

			});

            // 绑定免费下载：
            YOUMO.templateOper._bindDownload(true);
		})();




		(function(){
			// jQuery("#slideBox").slide({
			// 	mainCell:".bd ul",
			// 	effect:"left",
			// 	autoPlay:true,
			// 	delayTime:500,
			// 	easing:"swing"});


		/* 外层tab切换 */ 

			/* 内层图片无缝滚动 */
			jQuery(".subTab .mbBox").slide({
                mainCell:"ul.piclist",
                vis:5,
				scroll:1,
				delayTime:500,
				prevCell:".sPrev",
				nextCell:".sNext",
				effect:"leftLoop",/*左循环滚动*/
				autoPlay:false,
				trigger:"click"
				});
				/* 外层tab切换 */
			jQuery(".subTab").slide({
					titCell:".subTitle li",
					mainCell:".subContent"
                     // ,targetCell:".more a"

					});
		})();
    //首页滚动图片
    (function(){
        $('#myCarousel').carousel({
            interval: 10000
        });
    })();

    (function(){
		// 切换视频
		$(".video-list li").click(function(){
            var obj = $(this),
			    parentobj=obj.parents(".videobox"),
			    _index=obj.index();
           _czc.push(['_trackEvent', '首页', 'AE模板列表',,obj.index()]);
	       // step1  初始化
	           parentobj.find('.video-box').hide();
	           var _thatAll=parentobj.find('.video-box');
                   _thatAll.find(".video-poster").show();
                   var videos=_thatAll.find("video");
                    videos.each(function (index,item) {
                        item.pause();
                    })

           // step2 video-box 现实： video-box > video-poster 隐藏
            var _that=parentobj.find('.video-box').eq(_index);
                _that.show();
                _that.find(".video-poster").hide();
                _that.find("video").get(0).play();

            // step3 li 加 当前css
			obj.addClass("now").siblings().removeClass("now");
		});

		//现实点击遮罩图播放
        $(".video-img").on('click','.video-box .video-poster',function () {
        	var _this=$(this),
				_video=_this.siblings("video").get(0);
            _this.hide();
            _video.play();

        });
        //视频点击播放
        $(".video-img").on('click','.video-box video',function () {
            var _this=$(this);
            _this.paused?_this.play():_this.pause();

        })

    })();
			

})

//首页弹出
function getsec(str)
{

    var str1=str.substring(1,str.length)*1;
    var str2=str.substring(0,1);
    if (str2=="s")
    {
        return str1*1000;
    }else if(str2=="m"){
        return str1*60*1000;
    }
    else if (str2=="h")
    {
        return str1*60*60*1000;
    }
    else if (str2=="d")
    {
        return str1*24*60*60*1000;
    }
}
function setCookie(time)
{
    var strsec = getsec(time);
    var cur=new Date();
    var exp = new Date();
    exp.setTime(exp.getTime() + strsec*1);
    document.cookie = "timeyozo" + "="+cur  + ";expires=" + exp.toGMTString();
}
//读取cookies

function dvib() {
    var index = layer.open({
        type: 1, //页面
        title: false, //无标题
        closeBtn: 0, //无关闭按钮
        time: 1000*60*3, //多长时间关闭
        shade: [1, 'transparent'], //遮罩层


        skin: 'tong-layer', //没有背景色
        shadeClose: true,
        content: $('#tong1'),
        success: function(layero, index) {
            $(layero).find('.link').click(function() {
                layer.close(index);

            })
        }

    });
    $("#tong1").css("height",document.documentElement.clientHeight*0.8+"px");
    $("#tong1").css("width",document.documentElement.clientHeight*0.8*0.9522+"px");
    $(".layui-layer-content").css("margin-left","-"+$("#tong").width()*0.2+"px");
    $("div.layui-layer.layui-layer-page.layer-anim").css("top",document.documentElement.clientHeight*0.1+"px");


}

