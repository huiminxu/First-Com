<#import "/resource/common_html_front.ftl" as html>
<#import "/indexMenu.ftl" as menu>
<#import "/account/accountMenu.ftl" as accountMenu>
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
            <div class="breadcrumbBox">
                <div class="nav-title">上传AE模板</div>
            </div>
            <div class="templet_container">
                        <form role="form" name="formAeTemplet" id="formAeTemplet" method="post" autocomplete="off"
                              action="${basepath}/auth/account/templateUpload/">
                            <div class="row">
                                <div class="col-md-4 col-md-offset-1">
                                    <div class="user-info clearfix">
                                        <input type="hidden" name="id" value="${t.id!""}">
                                        <span class="pull-right undis"><i class="icon_tip ylyq"   "></i> 预览要求</span>
                                    </div>
                                    <div class="templet-preview">
                                        <div class="img-area">
                                        <img src="${t.shrinkUrl!"${basepath}/resource/images/tmupdata_aepreview.jpg"}">
                                        </div>
                                        <div class="errormsg"></div>
                                        <div class="preImg-button">
                                            <input type="file" class="uploadPreImg" name="uploadPreImg" accept="image/gif, image/jpeg, image/png">
                                            <button  type="button"  class="btn btn-yozo btn-green form-control " name="mn-uploadPreImg" >视频预览图(290*162)</button>
                                            <input type="hidden" name="shrinkUrl" value="${t.shrinkUrl!""}">
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-yozo  form-control">确认上传</button>
                                </div>
                                <div class="col-md-6 mt5">

                                    <div class="form-group has-feedback">
                                        <label for="author">作者</label>
                                        <p class="form-control-static" id="authorName" name="authorName">${e.nickname?html}</p>
                                        <input type="hidden" name="author" value="${e.id!""}">
                                    </div>


                                    <div class="form-group has-feedback">
                                        <label for="name">标题</label>
                                        <input type="text" class="form-control" name="name" id="name" placeholder="添加标题"
                                               aria-describedby="inputNeedStatus" value="${t.name!""}">
                                        <span class="figure_circle form-control-feedback orange1" aria-hidden="true">&bull;</span>
                                        <span id="inputNeedStatus" class="sr-only">(必填)</span>

                                    </div>


                                    <div class="form-group mt15">
                                        <label class="label-add">文件上传<span class="pull-right undis"><i
                                                class="icon_tip gdgs"></i>更多格式</span></label>
                                        <div class="fileinput-button">
                                            <input class="btn btn-default  form-control" type="button" name="mn-updateFile"
                                                   href="javascript:void(0);" role="button" value="${t.fileUrl!"点击上传附件压缩包(.zip .rar .7z格式)"}"/>
                                            <input type="file" class="updateFile" name="updateFile">
                                            <span class="figure_circle form-control-feedback orange1"
                                                  aria-hidden="true">&bull;</span>
                                            <input type="hidden" name="fileUrl" value="${t.fileUrl!""}">
                                        </div>
                                    </div>

                                    <div class="form-group has-feedback">
                                        <label class="label-add">详情视频上传：
                                            <span class="pull-right undis"><i class="icon_tip gdgs"></i>更多格式</span>
                                        </label>
                                        <div class="radiolist">
                                            <label class="radio-inline">
                                                <input type="radio" name="videUrl" id="inlineRadio1" checked="checked"
                                                       value="1">本地上传
                                            </label>
                                            <#--<label class="radio-inline">-->
                                                <#--<input type="radio" name="videUrl" id="inlineRadio2" value="2">链接地址上传-->
                                            <#--</label>-->
                                        </div>
                                        <div class="fileinput-button">
                                            <input class="btn btn-default form-control"  name="mn-uploadVideo" type="button" role="button"
                                                   value="${t.videoUrl!"点击上传预览视频(.MP4格式)"}"/>
                                            <input type="file" class="uploadVideo" name="uploadVideo" accept="audio/mp4, video/mp4">
                                            <#--<input class='form-control linkVideo' type='text' name="linkVideo"-->
                                                   <#--placeholder='请输入链接地址'/>-->
                                            <span class="figure_circle form-control-feedback orange1"
                                                  aria-hidden="true">&bull;</span>
                                            <input type="hidden" name="videoUrl" value="${t.videoUrl!""}">
                                        </div>

                                    </div>
                                    <div class="row  ">
                                        <div class="col-md-6 col-md-pl0">
                                            <div class="form-group has-feedback mb">
                                                <label for="money">价格</label>
                                                <div style="position: relative;">
                                                    <input type="text" class="form-control" id="price" name="price"
                                                           placeholder="0.00" aria-describedby="inputNeedStatus" value="${t.price!""}">
                                                    <span class="figure_circle form-control-feedback orange1"
                                                          aria-hidden="true">&bull;</span>
                                                    <span id="inputNeedStatus" class="sr-only">(必填)</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-md-pr0">
                                            <div class="form-group has-feedback mb">
                                                <label class="label-add">原创保证<span class="pull-right"><i
                                                        class="zrs icon_tip"></i><a href="${basepath}/resource/protocal/copyrightConmission.pdf" target="_blank">责任书</a></span></label>
                                                <div style="position: relative;">
                                                    <a class="btn btn-default form-control promiseBtn <#if type=='edit' >btn-success </#if>"
                                                       href="javascript:void(0)"   name="promise" role="button">点击确认原创模板</a>
                                                    <span class="figure_circle form-control-feedback orange1"
                                                          aria-hidden="true">&bull;</span>
                                                    <input type="checkbox" class="sr-only"   <#if type=='edit' >checked="checked"</#if> name="promiseBtn">
                                                </div>
                                                <p class="help-block "><em>&bull;</em>点击确认之后表示您已阅读本网站责任书并保证该模板为原创模板
                                                </p>

                                            </div>
                                        </div>

                                    </div>
                                    <div class="form-group tips-container">
                                        <label for="tips" class="label-add trigger-warn">标签<span
                                                class="pull-right text-danger"><i
                                                class="icon_tip"></i>最多添加12个标签</span></label>

                                        <div class="form-control tips-box" name="tips">
                                            <#if t.labelList??>
                                                <#list t.labelList as label>
                                                    <#list label.labelList as item>
                                                        <#if label.selectedLabelList??&&(label.selectedLabelList?seq_contains(item.id+""))>
                                                            <span class="badge" data-value="${item.id!""}" data-seat='${label.id}_${item.id}'>${item.name!""}<input
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
                        <#--AE标签列表-->
                            <div class="row">
                                <div class="col-md-11 col-md-offset-1">
                                    <div class="row templet-tips">
                                        <#list labelList as label>
                                            <div class="col-md-1"><label>${label.name!""}：</label></div>
                                            <div class="col-md-11">
                                                <#list label.labelList as item>
                                                    <a class="clearfix" href="javascript:void(0)" role="button"
                                                       data-seat="${label.id}_${item.id}"
                                                       data-value="${item.id!""}"><span>${item.name!""}</span></a>
                                                </#list>
                                            </div>
                                        </#list>
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
<script type="text/javascript" src="${basepath}/resource/js2/page/form.js"></script>
<script type="text/javascript">
    $(function () {
        var obj=$("#formAeTemplet"),action=obj.attr("action");
        if ("${type}" == 'edit') {
            obj.attr("action",action+"update?catalog=ae");
            //修改
            init();
            //disable 不可编辑元素
               var eleUploadPreImg = $("[name$='uploadPreImg']"),//缩略图上传 input:file
                    eleUpdateFile = $("input[name$='updateFile']"),//文件上传模拟、文件上传 input:file input:button
                    eleUploadVideo = $("input[name$='uploadVideo']"),//详情图上传模拟、详情图上传 input:file input:button
                    elePromise = $("a[name^='promise']");//原创保证 a
            var _eles={'uploadPreImg':eleUploadPreImg,'updateFile':eleUpdateFile,'uploadVideo':eleUploadVideo,'promise':elePromise};
            eleDisable(_eles, true);
            BindAe();
        } else if ("${type}" == 'reupload') {
            obj.attr("action",action+"update?catalog=ae");
            //再次上传
            init();
            BindAe();
        } else {
            // 上传
            obj.attr("action",action+"insert?catalog=ae");
            BindAe();
        }

    });


    function BindAe() {
        // 1.warning
        var tipsoAe = {
            "ylyq": "<p>2-1、但有时我们不光想简单显示几个字</p><p>2、但有时我们不光想简单显示几个字</p><p>3、但有时我们不光想简单显示几个字</p>",
            "zrs": "<p>2-1、但有时我们不光想简单显示几个字</p><p>2、但有时我们不光想简单显示几个字</p><p>3、但有时我们不光想简单显示几个字</p>",
            "gdgs": "<p>2-1、但有时我们不光想简单显示几个字</p><p>2、但有时我们不光想简单显示几个字</p><p>3、但有时我们不光想简单显示几个字</p>"
        };


        formTemplet({
            ele: "Ae",
            type: "ae",
            tips: tipsoAe,
            fields: {
                'videoUrl': {rule:'required',msg:'请选择上传视频'}
            },
            uploadfile: {
                'uploadPreImg': {
                    'types': ['jpg', 'png', 'gif'],
                    'size': 200
                },
                'updateFile': {
                    'types': ['zip', 'rar', '7z'],
                    'size': 204800
                },
                'uploadVideo': {
                    'types': ['mp4'],
                    'size': 51200
                }
            },
            urls: {
                uploadfileurl: "${systemSetting().webStorePath}/web/userUpload/ymshop/${e.id}/"
            }
        });
    }


    function init() {
       //根据templatee设置video类型和值
        <#--var vtype = "${videoType}";-->
        <#--$("radio[name='videUrl']").val(vtype);-->
        <#--if (vtype == "2") {-->
            <#--//linkVideo-->
            <#--$("input[name='linkVideo']").val('${t.videoUrl}').css('display','block');-->
        <#--}else{-->
            <#--//fileVideo-->
            <#--$("input[name='mn-uploadVideo']").val('${t.videoUrl}').css('display','block');-->
            <#--$("input[name='videoUrl']").val('${t.videoUrl}');-->

        <#--}-->
        //去除标签:ttips模板标签  ctips:所有标签
        var ttips = $("div[name='tips'] span"), ctips = $(".templet-tips a");
        $.each(ctips, function (index, item) {
            $.each(ttips, function (zindex, zitem) {
                if ($(item).data("seat") == $(zitem).data("seat")) {
                    $(item).css('display', 'none');
                }
            })
        })



    }

</script>
</@html.htmlBase>