<#import "/resource/common_html_front.ftl" as html>
<#import "/indexMenu.ftl" as menu>
<#import "/account/accountMenu.ftl" as accountMenu>
<@html.htmlBase>
    <@menu.menu selectMenu=""/>
<!------灰色区域------>
<div class="grayline"></div>
<link rel="stylesheet" href="${basepath}/resource/css2/usercenter.css" type="text/css"/>
<link rel="stylesheet" href="${basepath}/resource/css2/design.css" type="text/css"/>
<div class="container distable mt20 mb45">
    <div class="usercenter-box ">
        <aside class="usercenter-menu">
            <@accountMenu.accountMenu currentMenu="tempUploadIntroduce"/>
        </aside>
        <!-- 主体内容 -->
        <div class="main customization-box">
            <div class="breadcrumbBox">
                <div class="nav-title">上传定制服务</div>
            </div>
            <div class="customization_container">
                <div class="row">
                    <div class="col-md-7">
                        <form role="form" class="form-horizontal" name="formCustomization" id="formCustomization"
                              method="post" autocomplete="off" action="${basepath}/auth/designer/uploadCustomizeOrder">
                            <input type="hidden" name="id" value="${c.id!""}">
                            <div class="form-group has-feedback customization-type">
                                <label for="cType" class="col-sm-3 control-label">定制类型：</label>
                                <div class="col-sm-5">
                                    <select class="form-control" name="cType" id="cType">
                                        <option value="">请选择分类</option>
                                        <#list systemManager().catalogs as catalog>
                                            <#if catalog.showInNav == "y" && catalog.id!="125">
                                                <option value="${catalog.id}"
                                                        <#if c.cTypeName??&&c.cTypeName==catalog.name >selected</#if>>${catalog.name}</option>
                                            </#if>
                                        </#list>
                                    </select>
                                    <span class="figure_circle form-control-feedback orange1"
                                          aria-hidden="true">&bull;</span>
                                </div>
                            </div>
                            <div class="form-group has-feedback">
                                <label for="cUse" class="col-sm-3 control-label">定制用途：</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="cUse" id="cUse"
                                           placeholder="例：公司年会视频、工作汇报ppt等" value="${c.cUse!""}">
                                    <span class="figure_circle form-control-feedback orange1"
                                          aria-hidden="true">&bull;</span>
                                </div>
                            </div>
                            <div class="form-group has-feedback">
                                <label for="price" class="col-sm-3 control-label">定制价格：</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="price" name="price"
                                           placeholder="与用户协商（单位：元）" value="${c.price!""}">
                                    <span class="figure_circle form-control-feedback orange1"
                                          aria-hidden="true">&bull;</span>
                                </div>
                            </div>
                            <div class="form-group has-feedback">
                                <label for="quantity" class="col-sm-3 control-label">定制数量：</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="quantity" name="quantity"
                                           placeholder="数、视频秒数等（区间）" value="${c.quantity!""}">
                                    <span class="figure_circle form-control-feedback orange1"
                                          aria-hidden="true">&bull;</span>
                                </div>
                            </div>
                            <div class="form-group has-feedback customization-date">
                                <label for="etcTime" class="col-sm-3 control-label">完成期限：</label>
                                <div class="col-sm-5">
                                    <input type="text" class="Wdate form-control" id="etcTime" name="etcTime"
                                           placeholder="作品完成日期" value="${(c.etc?string("yyyy-MM-dd"))!""}"
                                           onFocus="WdatePicker({isShowClear:false,readOnly:true,minDate:'%y-%M-%d',onpicked:ectPicked})">
                                    <span class="figure_circle form-control-feedback orange1"
                                          aria-hidden="true">&bull;</span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="other" class="col-sm-3 control-label">其他：</label>
                                <div class="col-sm-9">
                                    <textarea class="form-control" id="other" name="other" rows="6"
                                              placeholder="用户其他需求">${c.other!""}</textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="customerContact" class="col-sm-3 control-label">联系方式：</label>
                                <div class="col-sm-9">
                                    <textarea class="form-control" id="customerContact" name="customerContact" rows="6"
                                              placeholder="用户联系方式">${c.customerContact!""}</textarea>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-sm-offset-3 col-sm-5">
                                    <button type="submit" class="btn btn-yozo <#if c.cUse?? >btn-green</#if> form-control">确认提交</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="${basepath}/resource/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${basepath}/resource/js2/tool.js"></script>
<script type="text/javascript" src="${basepath}/resource/js2/page/desgin.js"></script>
<script type="text/javascript">
    $(function () {
        /*  select:cType//定制类型
          text:cUse//定制用途
          text:price //定制价格
          text:quantity// 定制数量
          text:etcTime // 预计完成日期
          textarea:other// 其他
          */


        YOUMO.desinger.customizationUpload({
            ele: 'Customization',
            fields: {
                'cType': {rule: 'required', msg: '请选择定制类型'},
                'cUse': {rule: 'required;length(1~150)', msg: {required: '请输入定制用途'}},
                'price': {rule: 'required;money0', msg: {required: '请输入定制价格'}},
                'quantity': {rule: 'required;length(1~50)', msg: {required: '请输入定制数量'}},
                'etcTime': {rule: 'required;date', msg: {required: '请选择作品完成时间'}},
                'other': {rule: 'length(~250)'},
                'customerContact': {rule: 'length(~110)'}
            }
        });


    });
    function ectPicked() {
        $("#etcTime").trigger("validate");
    }
</script>
</@html.htmlBase>