<div class="wrapper background02">
    <!-- 表情包Emoticon-->
    <div id="emoticon" >
        <h2 class="margin">表情包
            <a href="${basepath}/catalog/biaoqingbao.html?isFee=n" class="more" alt="更多表情包" onclick="_czc.push(['_trackEvent', '首页', '表情包更多']);">
                <img src="${basepath}/resource/images/more.png" alt="更多表情包" >

            </a>
        </h2>
        <div class="emoticonDetail margin" >
            <div class="container">
                <div class="row clearfix">
                <#list systemManager().faceTemplateList as item>
                        <div class="col-md-3 col-xs-3 ">
                        <div class="emotbox">
                            <a href ="javascript:;" ><img src="${item.shrinkUrl!""}" class="img-responsive"  alt="${item.name}"/></a>
                            <div class="box-content">
                                <h3 class="title">${item.name}</h3>
                                <a  href="${basepath}/auth/template/download?id=${item.id}"  data-templateid="${item.id}" data-index="${item_index!""}"  target="_blank" class="btn-mfdownload btn-default">下载</a>
                            </div>
                        </div>
                     </div>
                </#list>
                    <div class="col-md-3 col-xs-3 ">
                        <div class="emotbox2">
                            <div class="row clearfix">
                                <div class="col-md-6 col-xs-6 ">
                                    <a href="${basepath}/catalog/biaoqingbao.html?ids=547"><img src="${basepath}/resource/images/index/em_sub1.png"  alt="逗趣系列表情包" /></a>
                                    <#--<div class="box-content">-->
                                        <#--<a href="${basepath}/catalog/biaoqingbao.html?ids=545" class="btn-default">详情</a>-->
                                    <#--</div>-->
                                </div>
                                <div class="col-md-6 col-xs-6 ">
                                    <a href="${basepath}/catalog/biaoqingbao.html?ids=550"><img src="${basepath}/resource/images/index/em_sub2.png"  alt="可爱萌表情包" /></a>
                                    <#--<div class="box-content">-->
                                        <#--<a href="${basepath}/catalog/biaoqingbao.html?ids=550" class="btn-default">详情</a>-->
                                    <#--</div>-->
                                </div>
                                <div class="col-md-6 col-xs-6 ">
                                    <a href="${basepath}/catalog/biaoqingbao.html?ids=552"><img src="${basepath}/resource/images/index/em_sub3.png" alt="卡通人物表情包" /></a>
                                    <#--<div class="box-content">-->
                                        <#--<a href="${basepath}/catalog/biaoqingbao.html?ids=552" class="btn-default">详情</a>-->
                                    <#--</div>-->
                                </div>
                                <div class="col-md-6 col-xs-6 ">
                                    <a href="${basepath}/catalog/biaoqingbao.html?ids=548"><img src="${basepath}/resource/images/index/em_sub4.png"  alt="动漫动画表情包" /></a>
                                    <#--<div class="box-content">-->
                                        <#--<a href="${basepath}/catalog/biaoqingbao.html?ids=548" class="btn-default">详情</a>-->
                                    <#--</div>-->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

