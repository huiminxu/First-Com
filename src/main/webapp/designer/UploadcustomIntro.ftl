<#import "/resource/common_html_front.ftl" as html>
<#import "/indexMenu.ftl" as menu>
<#import "/account/accountMenu.ftl" as accountMenu>
<@html.htmlBase>
    <@menu.menu selectMenu=""/>
<!------灰色区域------>
<div class="customIntrogray"></div>
<link rel="stylesheet" href="${basepath}/resource/css2/design.css" type="text/css"/>
<div class="customIntro">
    <div class="customIntro-box">
       <h2>定制服务说明</h2>
        <P>1、与用户沟通之后填写订单信息</P>
        <img src="${basepath}/resource/images/desgin/introduce1.png"/>
        <p class="mt30">2、点击提交之后前往：我的定制-我是设计师，查看订单并发送订单给用户（点击发送订单，复制订单链接到剪切板）</p>
        <img src="${basepath}/resource/images/desgin/introduce2.png"/>
        <p class="mt30 mb-10">3、用户点击订单之后，确认信息无误并扫码支付款项。（如果需要修改订单信息，请返回上一步，点击编辑需求）</p>
        <img src="${basepath}/resource/images/desgin/introduce3.png"/>
        <p>4、设计师完成作品后前往：我的定制-我是设计师，选择文件上传</p>
        <img src="${basepath}/resource/images/desgin/introduce4.png"/>
        <p class="contactService"><a href="#">如有其他疑问，请联系Yomoer客服</a></p>
    </div>
</div>


</@html.htmlBase>