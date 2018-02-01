<#import "/resource/common_html_front.ftl" as html>
<#import "/indexMenu.ftl" as menu>
<@html.htmlBase>
    <@menu.menu selectMenu="customize"/>
<link rel="stylesheet" href="${basepath}/resource/css2/design.css" type="text/css"/>
<div class="customize-box">
    <div class="customize-box-top">
          <div class="customize-box-top-bg">
              <a href="${basepath}/auth/designer/designerJoin"><img src="${basepath}/resource/images/customize/join_designer.png"></a>
              <a href="${basepath}/help/center" class="details"> <img src="${basepath}/resource/images/customize/detail_processor.png"></a>

          </div>
    </div>
    <div class="container customize-box-main">
        <div class="designerBox">
                    <h2>设计师</h2>
                    <div class="design-list clearfix">
                        <#if pager.total lte 8>
                            <#list pager.list as item>
                                <div class="design-list-item" data-url="${basepath}/designer/info?designerId=${item.id}">
                                    <div  class="clearfix designerImg">
                                        <a  class="imghead" href="${basepath}/designer/info?designerId=${item.id}"><img src="${item.avater!"${basepath}/resource/images/headInfo-default.png"}" alt="${item.nickname!""}" /></a>
                                        <#if item.qqStatus==0>
                                            <img src="${basepath}/resource/images/outline.png" class="chat-sit">
                                        <#else>
                                            <img src="${basepath}/resource/images/online.png" class="chat-sit">
                                        </#if>
                                    </div>
                                    <p class="designer-name"><a href="#"  target="_blank"> <strong>${item.nickname!""}</strong> </a></p>
                                    <a href="tencent://message/?uin=${item.qq}&Site=qq&Menu=yes" class="btn btn-success design-click"><img src="${basepath}/resource/images/customize/QQ1.png">交谈</a>
                                    <div class="design-sit">
                                        <div> 已完成<br/><span>${item.finishQty!"0"}</span>  </div>
                                        <div>定制中 <br/><span>${item.unfinishQty!"0"}</span></div>
                                        <div class="lst">好评率<br/><span>
                                            <#if item.favorableRate??>
                                            ${item.favorableRate}%
                                            <#else>
                                                -
                                            </#if>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </#list>
                        <#else >
                            <#list pager.list as item>
                                <#if item_index lt 7>
                                    <div class="design-list-item" data-url="${basepath}/designer/info?designerId=${item.id}">
                                        <div  class="clearfix designerImg">
                                            <a class="imghead" href="${basepath}/designer/info?designerId=${item.id}"><img src="${item.avater!"${basepath}/resource/images/headInfo-default.png"}" alt="${item.nickname!""}" /></a>
                                            <#if item.qqStatus==0>
                                                <img src="${basepath}/resource/images/outline.png" class="chat-sit">
                                            <#else>
                                                <img src="${basepath}/resource/images/online.png" class="chat-sit">
                                            </#if>
                                        </div>
                                        <p class="designer-name"><a href="#"  target="_blank"> <strong>${item.nickname!""}</strong> </a></p>
                                        <a href="tencent://message/?uin=${item.qq}&Site=qq&Menu=yes" class="btn btn-success design-click"><img src="${basepath}/resource/images/customize/QQ1.png">交谈</a>
                                        <div class="design-sit">
                                            <div> 已完成<br/><span>${item.finishQty!"0"}</span>  </div>
                                            <div>定制中 <br/><span>${item.unfinishQty!"0"}</span></div>
                                            <div class="lst">好评率<br/><span>
                                                <#if item.favorableRate??>
                                                ${item.favorableRate}%
                                                <#else>
                                                    -
                                                </#if>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </#if>
                            </#list>
                        <#--更多-->
                            <div class="design-list-item more-designer">
                                 <a href="${basepath}/designer/designerList"> <img src="${basepath}/resource/images/customize/more.png" class=" more-png"></a>
                            </div>



                        </#if>




                    </div>
         </div>
        <div class="customizeServive">
            <h2>定制服务</h2>
            <div class="customize-list">
                <div class="customize-list-item">
                <img src="${basepath}/resource/images/customize/ppt.png" alt="">
                <div class="shadecover"></div>
                <p class="title">PPT定制</p>
                <p class="content">工作汇报、个人总结、政府党建、毕业答辩、投资路演、项目计划……你和升职加薪走向人生巅峰的距离真的就只差这一个PPT了。柚墨PPT定制，给您专业、可靠的PPT定制服务。</p>
            </div>
                <div class="customize-list-item">
                    <img src="${basepath}/resource/images/customize/word.png" alt="">
                    <div class="shadecover"></div>
                    <p class="title">简历定制</p>
                    <p class="content">简历——求职的“敲门砖”。您提供一份基础简历给设计师后，设计师会与您一对一沟通，根据您的求职目标及工作经验为您量身定制一份高质量的简历内容，让您的简历内容精炼、优势突出，提升您的求职成功率。</p>
                </div>
                <div class="customize-list-item">
                    <img src="${basepath}/resource/images/customize/Excel.png" alt="">
                    <div class="shadecover"></div>
                    <p class="title">Excel定制</p>
                    <p class="content">辛辛苦苦加班，头昏脑涨熬夜，就为了那些报表、汇总、统计、分析。专业的事情交给专业的人来做，柚墨设计师为您提供人事、财务、库管、销售等各行业的专业Excel表单。</p>
                </div>
                <div class="customize-list-item">
                    <img src="${basepath}/resource/images/customize/ae.png" alt="">
                    <div class="shadecover"></div>
                    <p class="title">AE定制</p>
                    <p class="content">无论是个人视频、婚庆礼仪，还是产品推介、企业宣传片、年会颁奖……用AE，能立刻让你的演示高端大气上档次。AE不会用，没关系，只要您提供内容、需求，柚墨设计师为您解决难题。</p>
                </div>
            </div>
        </div>
        <div class="clearfix customizeProcess">
            <h2>定制流程</h2>
            <div class="clearfix processlist">
                <div class="process-list">
                    <div class="process-list-item">
                        <img src="${basepath}/resource/images/customize/designer.png">
                        <div class="shadecover"></div>
                        <p class="content">您可以在柚<br/>墨首页选择相关设计师进行初步联系</p>

                    </div>
                    <h3>选择设计师</h3>
             </div>
                <div class="process-list">
                    <div class="process-list-item">
                        <img src="${basepath}/resource/images/customize/connectDesigner.png">
                        <div class="shadecover"></div>
                        <p class="content">确定设计师<br/>后，沟通确认详细需求、交稿时间及价格等信息</p>

                    </div>
                    <h3>需求沟通</h3>
             </div>
                <div class="process-list">
                    <div class="process-list-item">
                        <img src="${basepath}/resource/images/customize/reposit.png">
                        <div class="shadecover"></div>
                        <p class="content">需求确认后<br/>点击设计师发送的付款链接完成付款</p>

                    </div>
                    <h3>拍下付款</h3>
             </div>
                <div class="process-list">
                    <div class="process-list-item">
                        <img src="${basepath}/resource/images/customize/designWorks.png">
                        <div class="shadecover"></div>
                        <p class="content">设计师将根<br/>据您的需求进行作品设计，并提供随时沟通</p>

                    </div>
                    <h3>作品设计</h3>
             </div>
                <div class="process-list">
                    <div class="process-list-item">
                        <img src="${basepath}/resource/images/customize/downloadWorks.png">
                        <div class="shadecover"></div>
                        <p class="content">制作完成后<br/>到个人中心-我的定制-我是用户-下载作品</p>

                    </div>
                    <h3>下载作品</h3>
                </div>
                <div class="process-list">
                    <div class="process-list-item">
                        <img src="${basepath}/resource/images/customize/improve.png">
                        <div class="shadecover"></div>
                        <p class="content">若作品定制<br/>不满意可以延迟订单一次，设计师重新设计上传最新作品</p>

                    </div>
                    <h3>修改完善</h3>
                </div>
            </div>
        </div>
    </div>

</div>

<script type="text/javascript">
   $(document).ready(function(){

        $(".customize-box-main .designerBox .design-list .design-list-item:not(.more-designer)").on("click",
                function(event){
                    event.preventDefault();
                    var _this=$(this);
                    var gour=_this.data('url');

                    goUrl(gour);
                }

        );

       $(".customize-box-main .designerBox .design-list .design-list-item:not(.more-designer) a.design-click").on("click",
               function(event){
                   event.stopPropagation();
               }

       );



   }
    );

</script>
</@html.htmlBase>