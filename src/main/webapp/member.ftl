<#import "/resource/common_html_front.ftl" as html>
<#import "/indexMenu.ftl" as menu>
<@html.htmlBase>
    <@menu.menu selectMenu="member"/>
<link rel="stylesheet" href="${basepath}/resource/css2/member.css" type="text/css"/>
<div class="member-box">
    <div class="member-box-top">
        <a class="to-recharge " href="${basepath}/auth/yomo/vip"></a>
    </div>
    <div class="member-box-main">
        <div class="member-box-main-bg"></div>
        <div class="container">
            <div class="to-down"><span class="down-icon"></span></div>
            <div class="breadcrumbBox">柚会员</div>
            <div class="privilege-box">
                <img src="${basepath}/resource/images/member/member-fl.jpg">
                <a href="${basepath}/auth/yomo/vip" class="btn">立即充值</a>
            </div>
            <div class="breadcrumbBox">每日抽奖</div>
            <div class="lottery-box">
                <div class="lotteryTurntable">
                  <div class="lotteryTurntable-box">
                     <img src="${basepath}/resource/images/member/arrow.png" class="rota-arrow">
                     <div class="arrow-top"></div>
                  </div>
                  <div class="lotteryTurntable-rule">
                      <dl>
                          <dt>规则说明</dt>
                          <dd>·成为柚会员，即可每天免费抽奖</dd>
                          <dd>· 除了每天的轮盘抽奖，系统还会不定期送出超级大奖</dd>
                          <dd>· 抽奖次数越多，每期超级大奖的中奖概率越高</dd>
                      </dl>
                  </div>
                </div>
                <div class="lottery-megs clearfix">
                    <div class="msgs-logo">
                    <span class="sona-icon"></span>
                    </div>
                    <ul class="clearfix" style="width:1200px;">
                          <#list prizeList as item>
                             <li>恭喜 ${item.account} 获得 ${item.prize}</li>
                           </#list>
                    </ul>
                </div>
            </div>
            <div class="copyright">此活动最终解释权归www.yomoer.cn所有</div>
        </div>
        <div class="container-bottom"></div>
        <div class="member-box-bg-bottom"></div>
    </div>
</div>
<script src="${basepath}/resource/js2/jquery.rotate.min.js"></script>
<script type="text/javascript" src="${basepath}/resource/js2/superSlide.js"></script>
<script type="text/javascript">
    $(function () {
        // 抽奖
        var flag=true;
        $('.rota-arrow,.arrow-top').on('click',function(event){
            //alert(flag)
            //解决连续点击
            if(flag){flag=false}else{
                layer.alert("请不要连续点击");
                return false;
            }

            //后台获取获奖信息:2
           ajaxGet({url:"${basepath}/auth/account/lottery",
                callback:function(data){
                 if(typeof data.obj != "undefined" ){
                    rotateFunc(data.obj,data.msg);
                 }else{
                     flag=true;
                     layer.alert(data.msg, {
                         title:'错误信息',
                         closeBtn: 0
                     });
                 }
                }
            });
        });

        var rotateFunc = function(angle,text){
            $('.rota-arrow').stopRotate();
            $('.rota-arrow').rotate({
                angle: 0,
                duration: 5000,
                animateTo: angle + 2520,
                callback: function(){
                    flag=true;
                    layer.alert(text, {
                        title:'获奖信息',
                       closeBtn: 0
                    })
                }
            });
        };
    })
    //文字无缝滚动
    jQuery(".lottery-megs").slide({mainCell:"ul",autoPlay:true,effect:"leftMarquee",interTime:50,vis:2,trigger:"click"});
</script>
</@html.htmlBase>