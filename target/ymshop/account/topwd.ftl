<#import "/resource/common_html_front.ftl" as html>
<#import "/indexMenu.ftl" as menu>
<#import "/account/accountMenu.ftl" as accountMenu>
<@html.htmlBase>
    <@menu.menu selectMenu=""/>
<!------灰色区域------>
<div class="grayline"></div>
<link rel="stylesheet" href="${basepath}/resource/css2/usercenter.css" type="text/css"/>
<div class="container distable mt20 mb45">
    <div class="usercenter-box ">
        <aside class="usercenter-menu">
            <@accountMenu.accountMenu currentMenu="info"/>
        </aside>
        <div class="main">
            <!-- Nav tabs -->
            <ul class="navline-tabs clearfix">
                <li ><a href="${basepath}/auth/account/info">基本信息</a></li>
                <li><a href="${basepath}/auth/account/avatar">头像更换</a></li>
                <li class="active"><a href="${basepath}/auth/account/topwd">修改密码</a></li>
            </ul>
            <div class="password-box">
                <form role="form" id="formPassword" method="post" class="form-horizontal jqtransform mt40"
                      action="${basepath}/auth/account/changePwd" autocomplete="off" theme="simple">

                    <div class="clearfix mb">
                        <#if errorMsg??>
                            <div id="insertOrUpdateMsg" class="col-sm-offset-2  col-sm-6 bg-success">
                            ${errorMsg!""}
                            </div>
                        </#if>
                    </div>
                    <div class="form-group clearfix">
                        <label for="password" class="col-sm-2 control-label">原密码:</label>
                        <div class="col-sm-6">
                            <input name="password" type="password" class="form-control" id="required"
                                   data-rule="旧密码:required;password" placeholder="请输入原密码"/>
                        </div>
                    </div>

                    <div class="form-group clearfix">
                        <label for="newPassword" class="col-sm-2 control-label">新密码:</label>
                        <div class="col-sm-6">
                            <input name="newPassword" type="password" class="form-control" id="newPassword"
                                   data-rule="新密码: required;password;" placeholder="请输入密码"/>
                        </div>
                    </div>
                    <div class="form-group clearfix">
                        <label for="newPassword2" class="col-sm-2 control-label">确认新密码:</label>
                        <div class="col-sm-6">
                            <input name="newPassword2" type="password" class="form-control" id="newPassword2"
                                   data-rule="确认新密码: required;match(newPassword);" placeholder="请输入确认密码"/>
                        </div>
                    </div>

                    <div class="form-group clearfix">
                        <div class="col-sm-offset-2 col-sm-8">
                            <#if currentAccount().accountType??>
                                <div class="panel panel-default">
                                    <div class="panel-body"
                                         style="font-size: 16px;font-weight: normal;text-align: center;">
                                        <span class="glyphicon glyphicon-user"></span>亲，非系统账号登录，无需修改密码哦！
                                    </div>
                                </div>
                                <hr>
                                <input type="submit" class="btn btn-success btn-sm" value="修改" disabled="disabled"/>
                            <#else>
                                <button type="submit" class="btn btn-success btn-sm" value="保存">
                                    修改
                                </button>
                            </#if>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        //修改密码form 提交
        $("#formPassword").validator({
            valid: function (form) {
                //提交数据
                var $form = $(form);
                var Url = "${basepath}/account/changePwdVail",//!*验证码后端获取地址
                        password = $form.find("input[name='password']").val(),
                        newpassword = $form.find("input[name='newpassword']").val();
                $.ajax({
                    type: 'POST',
                    url: Url,
                    data: {"password": password, "newpassword": newpassword},
                    dataType: "text",
                    success: function (data) {
                        if (data == "success") {
                            form.submit();
                        } else {
                            $form.find("input[name='password']").trigger("showmsg", ["error", data]);
                        }
                    },
                    error: function (er) {
                        //原密码错误
                        //form.find("input[name='password']").trigger("showmsg", ["error", "原密码输入有误"]);
                        console.log("修改失败");

                    }
                });

            }
        });
        if ($.trim($("#insertOrUpdateMsg").html()).length > 0) {
            $("#insertOrUpdateMsg").slideDown(1000).delay(2000).slideUp(1000);
        }
    });
</script>
</@html.htmlBase>