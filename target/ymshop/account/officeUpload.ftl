<#import "/resource/common_html_front.ftl" as html>
<#import "/indexMenu.ftl" as menu>

<#import "/account/accountMenu.ftl"  as accountMenu>


<@html.htmlBase>
    <@menu.menu selectMenu=""/>
<!------灰色区域------>

<div class="grayline"></div>
<link rel="stylesheet" href="${basepath}/resource/css2/usercenter.css" type="text/css"/>
<link rel="stylesheet" href="${basepath}/resource/css2/template.css" type="text/css"/>
<div class="container distable mt20 mb45">
    <div class="usercenter-box ">
        <aside class="usercenter-menu">
            <#if type=='upload'>
               <@accountMenu.accountMenu currentMenu="tempUploadIntroduce"/>
            <#else>
                <@accountMenu.accountMenu currentMenu="templateManage"/>
            </#if>
        </aside>
        <!-- 主体内容 -->
        <div class="main templetupdata-box">
            <div class="breadcrumbBox">上传Office模板</div>
            <div class="templet_container">
                <form role="form" name="formOfficeTemplet" id="formOfficeTemplet" autocomplete="off" method="post"
                      action="${basepath}/auth/account/templateUpload/">
                    <div class="row">
                        <div class="col-md-3 col-md-offset-2">
                            <div class="user-info clearfix">
                                <span class="pull-left undis"><i class="icon_user"></i>
                                    <input type="hidden" name="id" value="${t.id!""}">
                                    <input type="hidden" name="type" value="${type}">
                                </span>
                                <span class="pull-right undis"><i class="icon_tip ylyq"></i> 预览要求</span>
                            </div>
                            <div class="templet-preview">
                                <div class="img-area">
                                <img src="${t.shrinkUrl!"${basepath}/resource/images/tmupdata_preview.jpg"}">
                                </div>
                                <div class="errormsg"></div>
                                <div class="preImg-button">
                                    <input type="file" class="uploadPreImg" name="uploadPreImg"
                                           accept="image/gif, image/jpeg, image/png">
                                    <button  type="button"  class="btn btn-yozo  form-control " name="mn-uploadPreImg"  >预览图(218*430)</button>
                                    <input type="hidden" name="shrinkUrl" value="${t.shrinkUrl!""}">
                                </div>
                            </div>
                            <button type="submit" class="btn btn-yozo  form-control" >确认上传</button>
                        </div>
                        <div class="col-md-6 mt5">
                            <div class="form-group">
                                <label for="author" class="control-label">作者：</label>
                                <p class="form-control-static" id="authorName" name="authorName">${e.nickname?html}</p>
                                <input type="hidden" name="author" value="${e.id!""}">
                            </div>
                            <div class="row">
                                <div class="col-md-6 col-md-pl0">
                                    <div class="form-group has-feedback templet-select">
                                        <label for="officeType">分类：</label>
                                        <select class="form-control" name="officeType" id="officeType">
                                            <option value="">请选择分类</option>
                                            <option value="ppt">PPT 模板</option>
                                            <option value="word">Word 模板</option>
                                            <option value="excel">Excel 模板</option>
                                        </select>
                                        <span class="figure_circle form-control-feedback orange1"
                                              aria-hidden="true">&bull;</span>
                                    </div>
                                </div>
                                <div class="col-md-6 col-md-pr0" id="pptSize">

                                </div>
                            </div>
                            <div class="form-group has-feedback">
                                <label for="name">标题：</label>
                                <input type="text" class="form-control" name="name" id="name" placeholder="添加标题"
                                       aria-describedby="inputNeedStatus" value="${t.name!""}">
                                <span class="figure_circle form-control-feedback orange1"
                                      aria-hidden="true">&bull;</span>
                                <span id="inputNeedStatus" class="sr-only">(必填)</span>
                            </div>
                            <div class="form-group has-feedback">
                                <label class="label-add">上传文件：
                                    <span class="pull-right undis"><i
                                        class="icon_tip gdgs"></i>更多格式</span>
                                </label>
                                <div class="fileinput-button">
                                    <input class="btn btn-default form-control" name="mn-updateFile" type="button"
                                           href="javascript:void(0);" role="button"
                                           value="${t.fileUrl!"点击上传文件(.doc .docx .xls .xlsx .ppt .pptx格式)"}"/>
                                    <input type="file" class="updateFile" name="updateFile">
                                    <span class="figure_circle form-control-feedback orange1"
                                          aria-hidden="true">&bull;</span>
                                    <input type="hidden" name="fileUrl" value="${t.fileUrl!""}">
                                </div>
                            </div>
                            <div class="form-group has-feedback">
                                <label class="label-add">详情图上传：<span class="pull-right"> (852*1767)</span></label>
                                <div class="fileinput-button">
                                    <input class="btn btn-default form-control" name="mn-uploadImg" type="button"
                                           href="javascript:void(0);" role="button"
                                           value="${t.imgUrl!"点击上传详情图(.jpg .png .gif 格式)"}"/>
                                    <input type="file" class="uploadImg" name="uploadImg"
                                           accept="image/gif, image/jpeg, image/png">
                                    <span class="figure_circle form-control-feedback orange1"
                                          aria-hidden="true">&bull;</span>
                                    <input type="hidden" name="imgUrl" value="${t.imgUrl!""}">
                                </div>
                            </div>
                            <div class="row  ">
                                <div class="col-md-6 col-md-pl0">
                                    <div class="form-group  has-feedback">
                                        <label for="money">价格：</label>
                                        <div style="position: relative;">
                                            <input type="text" class="form-control" id="price" name="price"
                                                   placeholder="0.00"
                                                   aria-describedby="inputNeedStatus" value="${t.price!""}">
                                            <span class="figure_circle form-control-feedback orange1"
                                                  aria-hidden="true">&bull;</span>
                                            <span id="inputNeedStatus" class="sr-only">(必填)</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-md-pr0">
                                    <div class="form-group  has-feedback">
                                        <label class="label-add">原创保证：<span class="pull-right"><i
                                                class="zrs icon_tip"></i><a href="${basepath}/resource/protocal/copyrightConmission.pdf" target="_blank">责任书</a></span></label>
                                        <div style="position: relative;">
                                            <a class="btn btn-default form-control <#if type=='edit' >btn-success </#if> promiseBtn"
                                               name="promise" href="javascript:void(0)"
                                               role="button">点击确认原创模板</a>
                                            <span class="figure_circle form-control-feedback orange1"
                                                  aria-hidden="true">&bull;</span>
                                            <input type="checkbox" class="sr-only"
                                                   <#if type=='edit' >checked="checked"</#if> name="promiseBtn">
                                        </div>
                                        <p class="help-block"><em>&bull;</em>点击确认之后表示您已阅读本网站责任书并保证该模板为原创模板</p>
                                    </div>

                                </div>
                            </div>
                            <div class="form-group tips-container">
                                <label for="tips" class="label-add trigger-warn">标签<span class="pull-right text-danger"><i
                                        class="icon_tip"></i>最多12个</span></label>
                                <div class="form-control tips-box" name="tips">
                                    <#if t.labelList??>
                                        <#list t.labelList as label>
                                            <#list label.labelList as item>
                                                <#if label.selectedLabelList??&&(label.selectedLabelList?seq_contains(item.id+""))>
                                                    <span class="badge" data-value="${item.id!""}"
                                                          data-seat='${label.id}_${item.id}'>${item.name!""}<input
                                                            type="hidden" name="labelSelectIds"
                                                            value="${item.id!""}"></span>
                                                </#if>
                                            </#list>
                                        </#list>
                                    <#else>
                                        最多添加12个标签
                                    </#if>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-11 col-md-offset-1">

                        <#--office标签列表-->
                            <div class="row templet-tips">
                                <#if t.id??>
                                    <#list labelList as label>
                                        <div class="col-md-1"><label>${label.name!""}：</label></div>
                                        <div class="col-md-11">
                                            <#list label.labelList as item>
                                                <a class="clearfix" href="javascript:void(0)" role="button"
                                                   data-seat="${label.id}_${item.id!""}"
                                                   data-value="${item.id!""}"><span>${item.name!""}</span></a>
                                            </#list>
                                        </div>
                                    </#list>
                                </#if>
                            </div>


                        </div>
                    </div>
                </form>

            </div>

        </div>
    </div>
</div>

<!-- Automatically provides/replaces `Promise` if missing or broken. -->
<script src="${basepath}/resource/es6-promise/es6-promise.auto.min.js"></script>
<script src="${basepath}/resource/es6-promise/es6-promise.min.js"></script>

<script type="text/javascript" src="${basepath}/resource/js2/tool.js"></script>
<script type="text/javascript" src="${basepath}/resource/js2/page/template.js"></script>
<script type="text/javascript" src="${basepath}/resource/js2/page/form.js"></script>
<script type="text/javascript">
    $(function () {
        YOUMO.templateItem.init({page: '${type}'});

    });

    function otherInit() {
        var officeTypeOption = "${seloption}";
        $("select[name='officeType']").val( "${seloption}");
          BindPptSize($("#pptSize"),officeTypeOption);
        if (officeTypeOption == "ppt") {
            $("select[name='showModel']").val(${t.showModel});
        }
        //去除标签:ttips模板标签  ctips:所有标签
        var ttips = $("div[name='tips'] span"), ctips = $(".templet-tips a");
        $.each(ctips, function (index, item) {
            $.each(ttips, function (zindex, zitem) {
                if ($(item).data("seat") == $(zitem).data("seat")) {
                    $(item).css('display', 'none');
                }
            })
        })

    };
    function BindPptSize(ele,officeType) {
        //其他 清空绑定尺寸
        ele.html("");

        if (officeType == 'ppt') {
            //1.ppt 绑定尺寸
            var txt = "<div class='form-group has-feedback pptsize-select ' >" +
                    "<label>幻灯片尺寸</label>" +
                    "<select class='form-control' name='showModel' >" +
                    "<option value=''>请选择尺寸</option>" +
                    "<option value='2'>标准：4:3</option>" +
                    "<option value='1'>宽屏：16:9</option>" +
                    "</select>" +
                    "<span class='figure_circle form-control-feedback orange1' aria-hidden='true'>&bull;</span>" +
                    "</div>";
            ele.append(txt);
        }

    }

    function BindOffice(option) {

        var fields = {
            //'officeType': {rule: 'required', msg: '请选择上传分类'},
            'imgUrl': {rule: 'required', msg: '请选择上传详情图'}
        };
        $.extend(true, fields, option.field);

        formTemplet({
            ele: 'Office',
            type: option.ele,
            tips: option.tipsOffice,
            fields: fields,
            uploadfile: {
                'uploadPreImg': {//缩略图
                    'types': ['jpg', 'png', 'gif'],
                    'size': 200
                },
                'updateFile': {//上传文件
                    'types':option.updateFileType,
                    'size':81920
                },
                'uploadImg': {//上传详情图
                    'types': ['jpg', 'png', 'git'],
                    'size': 800
                }
            },
            urls: {
                 uploadfileurl: "${systemSetting().webStorePath}/web/userUpload/ymshop/${e.id}/",
                tipsurl: "${basepath}/auth/account/templateUpload/changeCatalog"
            }
        });

    };

</script>

</@html.htmlBase>