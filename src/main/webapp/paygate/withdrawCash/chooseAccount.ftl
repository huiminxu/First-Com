<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<#include "/resource/common_css.ftl"/>
<link rel="stylesheet" href="${basepath}/resource/css2/account.css" type="text/css"/>
</head>
<body>
<#--选择支付宝账号-->
<div class="withdrawCash-box">
     <#if status?? && status!=-1>
        <div class="withdrawCash-result">

            <#if status==1>
                <P>您的申请已提交</P>
                <P>我们会在3个工作日内转账给您</P>
            <#elseif status==2>
                <P>您的可提现总额不足200元，不满足提现申请！</P>
            <#else >
                <P>提现申请失败，请稍后重试。</P>
            </#if>
        </div>
    <#else >
        <form action="${basepath}/auth/account/applyEnchashment" method="post" class="choose-account" autocomplete="off"  >
            <h6>请选择支付宝账号</h6>
            <ul class="accountList">
                <#list bankAccountList as item>
                    <#if item_index==0>
                        <li>
                            <input type="radio" name="chooseAccount" id="chooseAccount" value="${item.id}" checked="true"><span>${item.bankAccount}</span>
                        </li>
                    <#else >
                        <li>
                            <input type="radio" name="chooseAccount" id="chooseAccount" value="${item.id}"><span>${item.bankAccount}</span>
                        </li>
                    </#if>

                </#list>
            </ul>
            <button type="submit" class="btn btn-188">确认</button>
        </form>
        <div class="add">
            <i class="icon iconfont">&#xe78f;</i><a href="${basepath}/auth/account/addAcount">添加支付宝账号</a>
        </div>
    </#if>

</div>
<script type="text/javascript">
    "use strict";
    $(document).ready(function () {
       $(".accountList input[type='radio']").click(function (event) {
           var _this=$(this);
           _this.parents("ul").next("button").removeClass("btn-grey");
       });
        if('${status}'!=""&&'${status}'!="undefined") {
            if(${status}==1){
                var wdbtn = window.parent.document.getElementById("withdraw");
                wdbtn.innerHTML = "提现申请中";
                wdbtn.disabled = true;
            }
        }
    });

</script>
<#include "/resource/common_js.ftl"/>
</body>
</html>