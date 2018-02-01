<div class="wrapper">
    <!-- Designer start-->
    <div class="designBox" class="wrapper1200 margin">
        <h2>设计师
        <a href="${basepath}/designer/customize" class="more" title="更多设计师" onclick="_czc.push(['_trackEvent', '首页', '设计师更多']);">
            <img src="${basepath}/resource/images/more.png" alt="更多设计师" >
        </a>
        </h2>
        <div class="designer-list">
            <ul class="clearfix">
                <#list designers as item>
                    <li  class="designer-list-item" data-url="${basepath}/designer/info?designerId=${item.id}">
                        <div  class="clearfix designerImg">
                            <a href="${basepath}/designer/info?designerId=${item.id}" class="imghead">
                            <img src="${item.avater!"${basepath}/resource/images/headInfo-default.png"}" alt="${item.nickname!""}" />
                            <#if item.qqStatus==0>
                                <img src="${basepath}/resource/images/outline.png" class="chat-sit">
                            <#else>
                                <img src="${basepath}/resource/images/online.png" class="chat-sit">
                            </#if>
                                </a>
                        </div>
                        <#--点击昵称进入设计师主页-->
                        <p class="designer-name"><a href="#"  target="_blank"> <strong>${item.nickname}</strong> </a></p>
                        <a href="tencent://message/?uin=${item.qq}&Site=qq&Menu=yes" class="btn btn-success design-click"><img src="${basepath}/resource/images/QQ.png">交谈</a>
                        <div class="design-sit">
                            <div> 已完成<br/><span>${item.finishQty!"0"}</span>  </div>
                            <div>定制中 <br/><span>${item.unfinishQty!"0"}</span></div>
                            <div class="lst">好评率<br/><span><#if item.favorableRate??>${item.favorableRate}%<#else >
                                -</#if></span> </div>
                        </div>
                    </li>
                </#list>
            </ul>
        </div>


    </div>
    </div>
