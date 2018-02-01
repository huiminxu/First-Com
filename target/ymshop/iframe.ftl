<#import "/resource/common_html_front.ftl" as html>
<#import "/indexMenu.ftl" as menu>
<@html.htmlBase>
    <@menu.menu selectMenu=mainCatalogCode/>
<!--[if lt  IE 10]>
<link rel="stylesheet" href="${basepath}/resource/css2/iehackforie9.css" /
<![endif]-->
<div class="background03 catalogdetail-bg">
    <div class="container">
        <div class="catalogdetail-box clearfix">
            <div class="catalog-detail">
                <#if  e.nowPrice!="0.00"&&e.score=0 >
                    <div class="catalog-tip online-tip"></div>
                <#elseif e.nowPrice=="0.00"&&e.score=0>
                    <div class="catalog-tip mf-tip"></div>
                <#else>
                    <div class="catalog-tip jf-tip"></div>
                </#if>
                <div class="context-wrap">
                    <div class="catalog-info">
                        <h2>${e.name}</h2>
                        <p class="tips">标签：<#list e.labelNames as label>${label}&nbsp;</#list></p>
                        <#if  e.catalogID=="144" >
                            <p>尺寸：<#if  e.showModel==1>16:9<#elseif  e.showModel==2>4:3</#if> </p>
                        </#if>
                        <p>
                            <span>上传：${e.publishTime?string("yyyy-MM-dd HH:mm")} </span>
                            <#if e.status==1>
                                <span class="tj"><i class="iconfont see">&#xe601;</i>&nbsp;${e.browseNum}<i class="iconfont ml20 download">&#xe746;</i>&nbsp;${e.downloadNum}</span>
                            </#if>
                        </p>
                    </div>
                        <#if favorite?? && favorite=="y">
                            <a class="favo favo-cur" id="${e.id}"><i class="iconfont">&#xe672;</i></a>
                        <#else>
                            <a class="favo" id="${e.id}"><i class="iconfont">&#xe672;</i></a>
                        </#if>
                     <div class="share-btns">
                         分享：<i class="iconfont share-Qzone">&#xe644;</i><i class="iconfont share-TSina">&#xe67b;</i><i class="iconfont share-WeiXin">&#xe609;</i>
                         <div id="qrcode" style="display: none;"></div>
                     </div>

               </div>
                <div class="img_wrap">
                    <#if catalogCode?? && catalogCode =='AEmoban'>
                        <#if videoType==1>
                            <div class="relative video-img">

                            </div>
                         <#else>
                        <div class="relative video-img">
                            <video src="${e.videoUrl!""}"
                                   preload="none" controls="controls"
                                   poster="${e.shrinkUrl!""}"
                                   class="video_haha"></video>
                            <div class="video-poster">
                                <img src="${e.shrinkUrl!""}" class="video_sam"
                                     onerror="javasrcipt:this.src='${basepath}/resource/images/tmupdata_aepreview.jpg;this.onerror=null;'">
                                <img src="${basepath}/resource/images/icon-video.png" class="icon-video">
                            </div>
                        </div>
                        </#if>
                    <#else>
                        <img src="${e.imgUrl}"/>
                    </#if>
                </div>
            </div>
            <div class="fright right-box">
                <div class="catalog-detailmore">
                    <div class="background">
                        <#if e.source=1>
                            <img src="${basepath}/resource/images/headInfo.png" class="portrait">
                         <#elseif e.source=2 && designId??>
                            <a href="${basepath}/designer/info?designerId=${designId}"><img src="${e.avater!"${basepath}/resource/images/headInfo-default.png"}" class="portrait"></a>
                        <#else>
                            <img src="${e.avater!"${basepath}/resource/images/headInfo-default.png"}" class="portrait">
                        </#if>
                        <h6>${e.author}</h6>
                        <p class="temp-name">${e.name}</p>
                        <p class="clearfix pb">
                            <span class="price undis"><em class="price_icon"></em>原价：<b>${e.price}</b></span>
                            <span class="price undis"><em class="price_icon"></em>现价：<b>${e.nowPrice}</b></span>
                            <span class="score">
                                <#if  e.nowPrice!="0.00"&&e.score=0 >
                                    <b>${e.nowPrice}</b>元
                                <#elseif e.nowPrice=="0.00"&&e.score=0>
                                    <b>免费</b>
                                <#else >
                                    <b>${e.score}</b>积分
                                </#if>
                            </span>
                        </p>
                    </div>
                    <#if e.status!=1>
                    <#elseif e.nowPrice!="0.00"&&e.score=0>
                        <a href="${basepath}/auth/order/moneypay?id=${e.id!""}&payType=2" data-ostatus="3" class="btn btn-onlinepay form-control">立即购买</a>
                    <#elseif  e.nowPrice=="0.00"&&e.score=0>
                        <a href="${basepath}/auth/template/download?id=${e.id!""}" data-ostatus="3"  data-templateid="${e.id!""}"  class="btn btn-mfdownload form-control">免费下载</a>
                    <#else>
                        <a href="${basepath}/auth/order/pay?id=${e.id!""}&payType=1" data-ostatus="3"
                           class="btn btn-jfpay form-control">立即兑换</a>
                    </#if>
                </div>
                <div class="hot-recom">
                    <div class="clearfix mb">
                        <div class="fleft">热门推荐</div>
                        <div class="fright"><a href="#"
                                               data-id="${randomT.id}" class="recom-refesh"><i
                                class="iconfont">&#xe68d;</i>换一换</a></div>
                    </div>
                    <div class="recom-img">
                        <a href="${basepath}/template/detail/${randomT.id}.html">
                            <img src="${randomT.shrinkUrl}">
                        </a>
                    </div>
                </div>

            </div>
        </div>
        <input type="hidden" value="${e.name!""}" id="templateName">
        <input type="hidden" value="${e.id!""}" id="templateID">
        <input type="hidden" value="${e.nowPrice!""}" id="nowPrice">

    </div>
</div>
<div class="related-recom container">
    <section class="category-list-relate">
        <div class="clearfix category-list-item">
        <div class="fleft">相关推荐</div> <div class="fright"><div data-id="#" class="related-refesh"><i
                class="iconfont">&#xe68d;</i>换一换</div></div>
            <input type="hidden" name="currentPage" id="currentPage" value="1">
        </div>
            <ul class="relate-wrap " id="relateds">
                加载中.............
            </ul>

    </section>

</div>
<script type="text/javascript" src="${basepath}/resource/js2/page/pay.js"></script>
<#--分享-->
<script type="text/javascript" src="${basepath}/resource/share-js/qrcode.js"></script>
<script type="text/javascript" src="${basepath}/resource/share-js/share.js"></script>
<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
<script type="text/javascript">
    $(function () {
        //分享
          YOUMO.templateShare.init({
            title:$(".catalog-info h2").html(),
            desc:$(".catalog-info p.tips").html(),
            pic:$(".img_wrap img").attr("src"),
            shareList:['TSina','Qzone','WeiXin'],
            weixin:{
                appId: "${weixinConfig.appId}", // 必填，公众号的唯一标识
                timestamp:"${weixinConfig.timestamp}" , // 必填，生成签名的时间戳
                nonceStr: "${weixinConfig.nonceStr}", // 必填，生成签名的随机串
                signature:"${weixinConfig.signature}"// 必填，签名，见附录1
            }
        });


        //ae视频
        $(".video-img").on('click', '.video-poster', function () {
            var _this = $(this),
                    _video = _this.siblings("video").get(0);
            _this.hide();
            _video.play();
        });
        //视频点击播放
        $(".video-img").on('click', '.video_haha', function () {
            var _this = $(this);
            _this.paused ? _this.play() : _this.pause();
        })
        //热点推荐
        $(".recom-refesh").on('click', function (event) {
            event.preventDefault();
            var _this = $(this);
            var option = {
                url: '${basepath}/template/randomRecommend?name=${catalogCode}&tid=${e.id!""}&rid=' + _this.data('id'),
                callback: function (data) {
                    var recomBox = _this.parents('.clearfix').next();
                    _this.data('id', data.id);
                    recomBox.find('a').attr('href', "${basepath}/template/detail/" + data.id + ".html")
                    recomBox.find('a>img').attr('src', data.shrinkUrl)
                }
            }
            ajaxGet(option);
        });
        // *********** 支付 *********************
        // 积分支付
        $(".btn-jfpay").on('click', function (event) {
            event.preventDefault();
            _czc.push(['_trackEvent', '积分支付', , ,${e.id!""}]);
            var _this = $(this);
            var callback = function () {
                var option = previewPayJF(_this);
                previewPay(option, false);
            };
            var opt = {
                callback: callback
            };
            isLogin(opt); //是否登录
        });
        // 在线支付
        $(".btn-onlinepay").on('click', function (event) {
            _czc.push(['_trackEvent', '在线支付', , ,${e.id!""}]);
            event.preventDefault();
            var _this = $(this),
                    orderdata = {name: ${e.id!""}};
            var callback = function () {
                var option = previewPayOnline(_this);
                previewPay(option, false);
            };
            var opt = {
                callback: callback
            };
            isLogin(opt);
        });

        // 相关推荐
        $(".related-refesh").on('click', function (event) {
            event.preventDefault();
            $.ajax({
                type: 'POST',
                url: '${basepath}/template/related',
                dataType:"json",
                contentType: "application/json;charset=utf-8",
                data:JSON.stringify({templateId:${e.id},currentPage:$("#currentPage").val()}),
                success: function (data) {
                    $("#currentPage").val(data.currentPage);
                    if(data.relatedList != null && data.relatedList.length >0){
                        $.each(data.relatedList,function(i,item){
                            var html;
                            //Excel,ppt,word
                            if(item.catalogID == 110 ||item.catalogID == 144 || item.catalogID == 145) {
                                html = " <li class=\"relate-item w2\">"
                            }else if(item.catalogID == 121) {
                                html = " <li class=\"relate-item w3\">"
                            }else if(item.catalogID == 125) {
                                html = " <li class=\"relate-item w1\">"
                            }
                            html +="<div class=\"relate-item-img  img-big\">"
                               +"<a href=\"/template/detail/"+item.id+".html\" target=\"_blank\" data-preview=\""+item.id+"\" class=\"info-more\">"
                               +"<img src=\""+item.shrinkUrl+"\" alt=\""+item.name+"\">"
                               +"<figcaption></figcaption>"
                               +"</a>";
                            if(item.nowPrice =="0.00"&&item.score ==0){
                                html += "<em class='free_samp dis-freesamp'></em>";
                            }
                            html+= "</div>" +"<p class=\"mt2\"><strong class=\"fleft mb-title\" title=\""+item.name+"\">"+item.name+"</strong>";
                            if(item.favorite == "y"){
                                html += "<a class=\"favo favo-cur\" id=\""+item.id+"\">";
                            }else{
                                html += "<a class=\"favo\" id=\""+item.id+"\">"
                            }
                            html+="<i class=\"iconfont\">&#xe672;</i></a></p><p class=\"mb2\"><span class=\"fright\">"+item.browseNum+"浏览/"+item.downloadNum+"下载</span>";
                            if(item.nowPrice !="0.00"&&item.score ==0){
                                html += "<span class=\"mb_price\"><i class=\"iconfont\">&#xe617;</i>"+item.nowPrice+"</span></p></li>";
                            }else if(item.nowPrice =="0.00"&&item.score ==0){
                                html += "<span class=\"mb_price\"><i class=\"iconfont\">&#xe616;</i>免费</span></p></li>";
                            }else {
                                html += "<span class=\"mb_price\"><i class=\"iconfont\">&#xe618;</i>"+item.score+"</span></p></li>";
                            }
                            if(i == 0){
                                $("#relateds").html(html);
                            }else{
                                $("#relateds").append(html);
                            }
                        });
                    }
                    //绑定收藏
                    YOUMO.templateOper._bindFavo();
                    // 绑定免费下载：
                    YOUMO.templateOper._bindDownload(true);
                },
                error: function (er) {
                    if(er.status == 401){
                        redirectUserCentral();
                    }
                }
            });
        });

        $(".related-refesh").click();




    });

</script>
</@html.htmlBase>