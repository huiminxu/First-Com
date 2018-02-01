<#import "/resource/common_html_front.ftl" as html>
<#import "/indexMenu.ftl" as menu>
<@html.htmlBase title="评价设计师">

<link rel="stylesheet" href="${basepath}/resource/css2/design.css" type="text/css"/>
    <@menu.menu selectMenu=" evaluateDesginer"/>
    <div class="designerComment-box">
           <div class="designerComment-mian">
               <#if orderid??>
               <form role="form" id="formEvaDesigner" name="formEvaDesigner" action="${basepath}/auth/designer/insertComment?oid=${orderid}" method="post" autocomplete="off">
                   <div class="desgin-info">
                       <img src="${designer.avater!"${basepath}/resource/images/headInfo-default.png"}"/>
                       <h3>${designer.nickname}</h3>
                       <input type="hidden" name="designerId" value="${designer.id}">
                   </div>
                   <div class="comment-title">
                       服务打分
                       <div class="comment-tips"><span class="glyphicon glyphicon-question-sign" aria-hidden="true" data-toggle="tooltip" data-placement="top" title="评论不能修改与删除，请认真填写，谢谢！"></span>服务评价</div>
                   </div>

                   <div class="clearfix">
                       <ul class="star-rating">
                           <li>
                               <div>
                               品质：<span data-name="quality" class="starn"  ></span>
                               <div class="msgBox"></div>
                               </div>
                           </li>
                          <li>
                              <div>
                               速度：<span data-name="efficiency" class="starn"></span>
                              <div class="msgBox"></div>
                              </div>
                           </li>
                           <li>
                               <div>
                               服务：<span data-name="service" class="starn"></span>
                               <div class="msgBox"></div>
                               </div>
                           </li>
                       </ul>
                       <div class="txt-rating">
                          <textarea  placeholder="评论上限120个字符" name="content" class="form-control" rows="4"></textarea>
                          <div class="msgBox"></div>
                       </div>
                   </div>
                   <div class="comment-btn">
                       <button class="btn" type="submit">提交</button><input type="hidden" name="designerId" value="${designer.id}">
                   </div>

               </form>
                   <#else>
                       <div class="tresult-no">
                           您已经评价过此订单设计师，请到设计师页面查看评价详情，<a href="${basepath}/designer/info?type=comments&designerId=${designerid}"  class="a-link">点击此处</a>
                       </div>
                   </#if>
           </div>
    </div>
<script type="text/javascript" src="${basepath}/resource/raty-2.5.2/lib/jquery.raty.js"></script>
<script type="text/javascript" src="${basepath}/resource/js2/page/desgin.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $('[data-toggle="tooltip"]').tooltip();
        //星级评价
        $('.starn').raty({
            path: "${basepath}/resource/raty-2.5.2/lib/img",
            score: function () {
                return $(this).attr('data-score');
            },
            hints: ['', '', '', '', ''],
            scoreName: function () {
                return $(this).data('name')+"Score"
            },
            space:false,
            starOff: 'heart-off.png',
            starOn: 'heart-on.png',
            click: function(score, evt) {
                $(this).parent().find("input[type='hidden']").trigger("validate")
            }

        });

        YOUMO.desinger.evaluateDesginer({
            ele:"EvaDesigner",
            fields: {
            'qualityScore':{rule: 'required;',msg:'请对质量进行评分'},
            'efficiencyScore':{rule: 'required;',msg:'请对速度进行评分'},
            'serviceScore':{rule: 'required;',msg:'请对品质进行评分'},
            'content': {rule: 'required;length(~120)',msg: {required: '请填写评价内容'}}
        }});
    });
</script>
</@html.htmlBase>