<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <#include "/resource/common_css.ftl"/>
    <link rel="stylesheet" href="${basepath}/resource/css2/account.css" type="text/css"/>
</head>
<body>
<#--添加支付信息-->
<div class="withdrawCash-box">
   <form action="${basepath}/auth/account/addBankAcount" method="post" autocomplete="off" >
        <div class="form-group account-info">
            <label for="bankAccount">请输入支付宝账号</label>
            <input type="text" class="form-control" id="account" name="account">
        </div>
       <div class="form-group btnlist" >
        <#--   已有支付宝账号显示-->
        <#if exist=="y">
            <button type="button"  id="return" class="btn btn-188">返回</button>
        </#if>
        <button type="button"  id="beSure" class="btn btn-188">确认</button>
       </div>
    </form>
</div>
</body>
<script type="text/javascript">
    "use strict";
    $(document).ready(function () {
        $("form").on('click','button',function (event) {
            event.preventDefault();
            var _this=$(this),_form=_this.parents("form"),_txtHtml="",_btnHtml="",_id,account;
            _id=_this.attr("id");

          if(_id=="beSure"){
              account=_form.find("#account");
              if(account.val()==""){
                  account.focus();
                  return false;
              }
              _txtHtml=" <label class=\"account-num\">支付宝账号：<span>"+account.val()+"</span><input id=\"bankAccount\" name=\"bankAccount\" type=\"hidden\" value="+account.val()+"></label>";
              _btnHtml= "<button type=\"button\" id=\"alert\" class=\"btn btn-188\">返回修改</button>"+
                      "<button type=\"submit\" class=\"btn btn-188\">确认并提交</button>";
               console.log(_txtHtml+_form.html());
              _form.find(".account-info").html(_txtHtml);
              _form.find(".btnlist").html(_btnHtml);
          }else if(_id=="alert"){
              account=_form.find("#bankAccount");
              var ishas="${exist}";
              _txtHtml="<label for=\"account\">请输入支付宝账号</label>"+
                      "<input type=\"text\" class=\"form-control\" id=\"account\" value="+account.val()+" >";

              if(ishas=="y"){
                  _btnHtml+="<button type=\"button\"  id=\"return\" class=\"btn btn-188\">返回</button>"
              }
                 _btnHtml+="<button type=\"button\"  id=\"beSure\" class=\"btn btn-188\">确认</button>"

              _form.find(".account-info").html(_txtHtml);
              _form.find(".btnlist").html(_btnHtml);

          }else if(_id=="return"){
             goUrl("${basepath}/auth/account/chooseAccount");
          }
          else{
              //goUrl("${basepath}/auth/account/chooseAccount");
              _form.submit();
          }


        });


    });

</script>
<#include "/resource/common_js.ftl"/>

</html>
