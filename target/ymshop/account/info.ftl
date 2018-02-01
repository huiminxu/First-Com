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
                <li class="active"><a href="${basepath}/auth/account/info">基本信息</a></li>
                <li><a href="${basepath}/auth/account/avatar">头像更换</a></li>
                <li><a href="${basepath}/auth/account/topwd">修改密码</a></li>
            </ul>
            <div class="info-box">
                <div class="toFormInfo mt40 ">
                    <div class="form-group clearfix">
                        <label for="account" class="col-sm-2 control-label">用户名：</label>
                        <div class="col-sm-6">
                            <label>${e.nickname?html}</label>
                        </div>
                    </div>
                    <#if e.email??>
                        <div class="form-group clearfix">
                            <label class="col-sm-2 control-label">邮箱：</label>
                            <div class="col-sm-6">
                                <label>${e.email!""}</label>
                                <!-- <a href="${basepath}/account/changeEmail" class="btn btn-link btn-sm">修改邮箱</a> -->
                            </div>
                        </div>
                    </#if>
                    <#if e.phone??>
                        <div class="form-group clearfix">
                            <label class="col-sm-2 control-label">手机号：</label>
                            <div class="col-sm-6">
                                <label>${e.phone!""}</label>
                                <!-- <a href="${basepath}/account/changeEmail" class="btn btn-link btn-sm">修改手机号</a> -->
                            </div>
                        </div>
                    </#if>
                    <div class="form-group clearfix undis">
                        <label class="col-sm-2 control-label">真实姓名：</label>
                        <div class="col-sm-6">
                            <label>${e.trueName!""}</label>
                        </div>
                    </div>
                    <div class="form-group clearfix">
                        <label class="col-sm-2 control-label">性别：</label>
                        <div class="col-sm-3">
                            <label>
                            <#if  e.sex??>
                                <#if  e.sex=="m">
                                    男
                                <#elseif e.sex=="f">
                                    女
                                <#elseif e.sex=="s">
                                    保密
                                </#if>
                            <#else>
                                您未设置性别
                            </#if>
                            </label>
                        </div>
                    </div>

                    <div class="form-group clearfix">
                        <label class="col-sm-2 control-label">生日：</label>
                        <div class="col-sm-3">
                            <label>${e.birthday!" 您未设置生日"}</label>
                        </div>
                    </div>
                    <div class="form-group clearfix">
                        <div class="col-sm-offset-2 col-sm-6">
                            <a class="btn  btn-sm btn-alertinfo">修改资料</a>
                        </div>
                    </div>
                </div>
                <!--个人中心end-->
                <form method="post" role="form" id="formInfo" class="form-horizontal nice-validator mt40 undis"
                      action="${basepath}/auth/account/saveSetting">
                    <div class="form-group clearfix">
                        <label for="nickname" class="col-sm-2 control-label">用户名：</label>
                        <div class="col-sm-6">
                            <input name="nickname" type="text" class="form-control text" id="nickname"
                                   value="${e.nickname!""}" placeholder="请输入昵称"
                                   data-rule="昵称:required;nickname;length[~20];remote[${basepath}/account/unique.html?primaryNick=${e.nickname!""}]"/>
                        </div>
                    </div>
                    <#if e.email??>
                        <div class="form-group clearfix">
                            <label for="email" class="col-sm-2 control-label">邮箱：</label>
                            <div class="col-sm-6">
                                <label name="email">${e.email!""}</label>
                                <!-- <a href="${basepath}/account/changeEmail" class="btn btn-link btn-sm">修改邮箱</a> -->
                            </div>
                        </div>
                    </#if>
                    <#if e.phone??>
                        <div class="form-group clearfix">
                            <label for="phone" class="col-sm-2 control-label">手机号：</label>
                            <div class="col-sm-6">
                                <label name="phone">${e.phone!""}</label>
                                <!-- <a href="${basepath}/account/changeEmail" class="btn btn-link btn-sm">修改手机号</a> -->
                            </div>
                        </div>
                    </#if>
                    <div class="form-group clearfix undis">
                        <label for="trueName" class="col-sm-2 control-label">真实姓名：</label>
                        <div class="col-sm-6">
                            <input name="trueName" type="text" class="form-control text" id="trueName"
                                   value="${e.trueName!""}" data-rule="姓名;trueName;length[0~10];remote[unique.html]"
                                   placeholder="请输入真实姓名"/>
                        </div>
                    </div>
                    <div class="form-group clearfix">
                        <label for="sex" class="col-sm-2 control-label">性别：</label>
                        <div class="col-sm-3">
                            <select name="sex" class="form-control">
                                <#if e.sex??>
                                    <option value="m" ${(e.sex=="m")?string("selected","")}>&nbsp;男&nbsp;</option>
                                    <option value="f"  ${(e.sex=="f")?string("selected","")}>&nbsp;女&nbsp;</option>
                                    <option value="s"  ${(e.sex=="s")?string("selected","")}>&nbsp;保密&nbsp;</option>
                                <#else>
                                    <option value="m">&nbsp;男&nbsp;</option>
                                    <option value="f">&nbsp;女&nbsp;</option>
                                    <option value="s" selected>&nbsp;保密&nbsp;</option>
                                </#if>
                            </select>
                        </div>
                    </div>
                    <div class="form-group clearfix">
                        <label for="birthday" class="col-sm-2 control-label">生日：</label>
                        <div class="col-sm-3">
                            <input id="birthday" name="birthday" class="Wdate form-control" value="${e.birthday!""}"
                                   type="text" onFocus="WdatePicker({isShowClear:false,readOnly:true})"/>
                        </div>
                    </div>
                    <div class="form-group clearfix">
                        <div class="col-sm-offset-2 col-sm-6">
                            <button type="submit" class="btn btn-sm" value="保存">
                                确认修改
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="${basepath}/resource/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
    $(function () {
        /* 修改用户资料*/
        $(".btn-alertinfo").on('click', function (event) {
            event.preventDefault();
            var _this = $(this),
                infoBox = _this.parents(".info-box");
            infoBox.find(".toFormInfo").css('display', 'none');
            infoBox.find("#formInfo").css('display', 'block');
        });

        if ($.trim($("#insertOrUpdateMsg").html()).length > 0) {
            $("#insertOrUpdateMsg").slideDown(1000).delay(2000).slideUp(1000);
        }
    });
</script>
</@html.htmlBase>