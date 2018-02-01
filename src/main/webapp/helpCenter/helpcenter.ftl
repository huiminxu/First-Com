<#import "/resource/common_html_front.ftl" as html>
<#import "/indexMenu.ftl" as menu>
<#import "/account/accountMenu.ftl" as accountMenu>
<@html.htmlBase>
    <@menu.menu selectMenu=""/>
<!------灰色区域------>
<div class="helpcentertop">
    <div class="container">
        <img src="../resource/images/helpcenter/help.png" alt="">
    </div>

</div>
<div class="helpcentercont clearfix">
    <ul class="aside">
        <li class="guide">
          服务指南
        </li>
        <li class="active">
            <a href="#customize" data-toggle="tab" role="tab" aria-controls="customize" data-from="customize">定制问题</a>
        </li>
        <li>
            <a href="#uploadques" data-toggle="tab" role="tab" aria-controls="uploadques" data-from="uploadques">上传问题</a>
        </li>
        <li>
            <a href="#memberques" data-toggle="tab" role="tab" aria-controls="memberques" data-from="memberques">会员问题</a>
        </li>
</ul>
    <div class="tab-content helpcont">
        <div class="tab-pane fade in active" id="customize">
            <h3>用户该如何定制？</h3>
            <p data-height="40"><i class="iconfont shows">&#xe602;</i><i class="iconfont shou">&#xe61d;</i>定制页面选择设计师→沟通确认详细需求、交稿时间及价格等信息→点击付款链接付款→设计师完成作品后下载→若不满意，可以推迟订单一次，设计师重新设计上传最新作品。</p>
            <h3>设计作品达不到理想效果怎么办？</h3>
            <p data-height="60"><i class="iconfont shows">&#xe602;</i><i class="iconfont shou">&#xe61d;</i>在约定需求不变的前提下，首先，请您特别重视与设计师沟通，只要在订单过程中，您都可以直接联系设计师，针对进展、目标等进行沟通。在第一次下载设计师的定制作品后，若不满意，可以推迟订单一次，设计师重新设计上传最新作品。若还未满意，申请仲裁，客服将介入调解。若设计师为责任方，则平台将款项退还客户，但需据情况扣除一定的服务费；若客户为责任方，则不予退款。</p>
            <h3>设计师如何接单，完成定制任务？</h3>
            <p data-height="200"><i class="iconfont shows">&#xe602;</i><i class="iconfont shou">&#xe61d;</i>①用户定制页面选择设计师。<br/>
                ②双方沟通确认详细需求、交稿时间及价格等信息。<br/>
                ③设计师选择个人中心→上传作品→上传定制服务，将定制类型、定制价格、完成期限等填写完毕，确认提交。<br/>
                ④确认提交后点击“发送订单”按钮，将自动复制付款链接到剪切板，设计师然后发送付款链接给用户。<br/>
                ⑤用户付款后，设计师即可开始作品设计。<br/>
                ⑥作品完成后，设计师需在约定的完成期限前，在“我的定制”中完成作品上传。<br/>
                ⑦若用户第一次不满意，选择了“推迟”，设计师将要根据用户需求进行作品修改，然后再次进行作品上传。<br/>
                ⑧用户确认订单，订单完成。<br/>
                ⑨若定制过程中产生纠纷，设计师也可申请仲裁，客服将介入调解。若设计师为责任方，则平台将款项退还客户，但需据情况扣除一定的服务费；若客户为责任方，则不予退款。</p>
            <h3>设计师如何提现？</h3>
            <p class="last" data-height="20"><i class="iconfont shows">&#xe602;</i><i class="iconfont shou">&#xe61d;</i>设计师完成定制订单后，可以进入个人中心→我的收入查看。设计师的总收入累计超过200元后方可提现。</p>
        </div>
        <div class="tab-pane" id="uploadques">
            <h3>我不是设计师也可以上传吗？</h3>
            <p data-height="20"><i class="iconfont shows">&#xe602;</i><i class="iconfont shou">&#xe61d;</i>柚墨模板网站的所有注册用户都可以进行作品上传，入口：个人中心→上传作品。</p>

            <h3>我可以上传什么作品？</h3>
            <p data-height="40"><i class="iconfont shows">&#xe602;</i><i class="iconfont shou">&#xe61d;</i>Office模板（PPT模板、Excel模板和Word模板）、AE模板和表情包。<br/>为了提高您的模板通过率，在进行模板上传时，请仔细阅读相关模板上传规范。</p>

            <h3>我为什么要在柚墨上传作品？</h3>
            <p data-height="40"><i class="iconfont shows">&#xe602;</i><i class="iconfont shou">&#xe61d;</i>柚墨网站提供给用户的不仅是一个资源下载平台，还是一个可供用户上传模板获取收益的交易平台，且目前柚墨网站不收取任何手续费，最大程度保证的用户的权益。</p>

            <h3>上传模板出售获得的收入如何提现？</h3>
            <p class="last" data-height="20"><i class="iconfont shows">&#xe602;</i><i class="iconfont shou">&#xe61d;</i>您可以进入个人中心→我的收入查看。当出售模板的总收入累计超过200元后方可提现。</p>


        </div>
        <div class="tab-pane" id="memberques">

            <h3>什么是柚墨会员?</h3>
            <p data-height="20"><i class="iconfont shows">&#xe602;</i><i class="iconfont shou">&#xe61d;</i>柚墨会员是柚墨网站推出的一款模板包月服务，您只需支付每月16.8元，即可享受全场模板免费下载。</p>


            <h3>会员有什么特权?</h3>
            <p data-height="20"><i class="iconfont shows">&#xe602;</i><i class="iconfont shou">&#xe61d;</i>柚墨会员可享有：全场模板免费下载（除新品模板外）、新品模板专享5折特权、尊贵会员身份头衔、专属客服等。 </p>


            <h3>柚墨会员怎样购买？</h3>
            <p class="last" data-height="60"><i class="iconfont shows">&#xe602;</i> <i class="iconfont shou">&#xe61d;</i>会员可以通过微信和支付宝方式购买开通。<br/>
                用户进入柚墨网站会员专区，点击柚会员→立即充值，会弹出相应的会员购买页面<br/>
                一旦开通柚墨会员服务，不提供退款，请谅解！</p>

        </div>
    </div>
</div>

<link rel="stylesheet" href="${basepath}/resource/css2/help.css" type="text/css"/>
<script type="text/javascript">
    $(document).ready(function () {
        console.log(window.location.href+"123456");
        $(".helpcont h3").click(function() {
                    $(this).toggleClass("toggleColor");}
        );
        $(".helpcont p").each(function(i,ele){
               if($(ele).data("height")===20){
                  $(ele).find("i").hide();
               }else{
                   console.log("aaa");
                   $(ele).find("i.shou").hide();
                   $(ele).find("i.shows").show();
                    $(ele).addClass("addDefault");

               }
                                                 }
        );
        $(".helpcont").on("click","h3",function(){
            if( $(this).next("p").data("height")===20){
                $(this).next("p").find("i").hide();
            }else{
                $(this).next("p").toggleClass("addDefault");
                $(this).next("p").find("i.shows").fadeToggle();
                $(this).next("p").find("i.shou").fadeToggle();
            }

                }

        );

        $(".helpcont").on("click","i",function(){
                    if( $(this).closest("p").data("height")===20){
                        $(this).closest("p").find("i").hide();
                    }else{
                        $(this).closest("p").toggleClass("addDefault");
                        $(this).closest("p").find("i.shows").fadeToggle();
                        $(this).closest("p").find("i.shou").fadeToggle();
                    }

                }

        );
        var  addres='';
        addres=window.location.href;
        $(".helpcentercont .aside li a").each(function () {
            var _this=$(this);
            if(addres.indexOf(_this.data("from"))>0){
                _this.tab('show');
            }
        })



    });

</script>
</@html.htmlBase>