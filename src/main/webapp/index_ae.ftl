<div class="wrapper">
    <!-- AE start-->
    <div id="aeBox" class="wrapper1200 margin">
        <h2 class="margin">AE模板
        <a href="${basepath}/catalog/AEmoban.html?isFee=n" class="more" title="更多AE模板" onclick="_czc.push(['_trackEvent', '首页', 'AE更多']);">
            <img src="${basepath}/resource/images/more.png" alt="更多AE模板" >
        </a>
        </h2>
        <div class="videobox">
            <div class="video-img tc">
                <#--<img src="${basepath}/resource/images/index/ae.jpg" id="js_videoCon_0"  />-->
           <#-- <#list systemManager().aeTemplateList as item>
                <embed id='${"js_videoCon_"+ (item_index+1)}'  <#if item_index!=0>style="display:none"  </#if> class="js_videoCon"  src="${item.videoUrl!""}"  play="false"  quality="high" width="932" height="527" align="middle"   type="application/x-shockwave-flash"></embed>
            </#list>
            -->
            <#list systemManager().aeTemplateList as item>
              <div class="video-box" style="width:932px; height:527px;">
                <video id='${"js_videoCon_"+ (item_index+1)}' class="js_videoCon"  src="${item.videoUrl!""}" style="width:100%; height: 100%;"  preload="none"  controls="controls" loop="loop" poster="${item.shrinkUrl!""}">您的浏览器不支持 video 标签。</video>
                <div class="video-poster" >
                    <img src="${item.shrinkUrl!""}"  alt="${item.name}">
                    <img src="${basepath}/resource/images/icon-video.png" class="icon-video">
                </div>
              </div>
            </#list>
             </div>
            <div class="video-list">
                <ul class="clearfix">
                <#list systemManager().aeTemplateList as item>
                    <li id="${item.videoUrl!""}" video="${item_index+1}" vid="${item_index+1}">
                        <img src="${item.shrinkUrl!""}" alt="${item.name}">
                        <img src="${basepath}/resource/images/icon-video.png" class="icon-video" >

                        <p><a href="${basepath}/template/detail/${item.id}.html"  target="_blank"> <strong>${item.name}</strong> </a></p>
                        <p class="clearfix">
                            <span class="fright">${item.browseNum}浏览/${item.downloadNum}下载</span>

                            <#if  item.nowPrice!="0.00"&&item.score=0 >
                                <span class="mb_price">
                                             <em class="price_icon"></em>${item.nowPrice}
                                           </span>
                            <#elseif item.nowPrice=="0.00"&&item.score=0>
                                <span class="mb_score">
                                                    <em class="free_icon"></em>免费
                                </span>

                            <#else>
                                <span class="mb_score">
                                                    <em class="score_icon"></em>${item.score}
                                            </span>
                            </#if>

                        </p>

                     <#--   <h3><a href="javascript:void(0)" onclick="preview(${item.id},false)"> <b>${item.name}</b> </a></h3>-->

                    </li>
                </#list>
                </ul>
            </div>
        </div>
    </div>
    </div>