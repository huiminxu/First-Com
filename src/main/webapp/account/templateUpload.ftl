<#import "/resource/common_html_front.ftl" as html>
<#import "/indexMenu.ftl" as menu>
<@html.htmlBase>

	<@menu.menu selectMenu=""/>
<!-- 主体内容 -->
<link rel="stylesheet" href="${basepath}/resource/css2/template.css" type="text/css"/>
<div class="templetupdata-box">
    <div class="wrapper1200">
        <div class="templet-nav clearfix">
            <div class="nav-title">上传列表</div>
            <ul class="nav nav_bottom">
                <li role="presentation"  class="active">
                    <a href="#office"  data-relate="office" role="tab" data-toggle="tab">上传Office模板</a>
                </li>
                <li role="presentation">
                    <a href="#ae" data-relate="ae" role="tab" data-toggle="tab">上传AE模板</a>
                </li>
                <li role="presentation">
                    <a href="#emotion" data-relate="emotion" role="tab" data-toggle="tab">上传表情包</a>
                </li>
            </ul>
        </div>
        <div class="templet_container tab-content">
            <div role="tabpanel" class="tab-pane active" id="office">
                <form role="form" name="formOfficeTemplet" id="formOfficeTemplet" autocomplete="off" method="post" action="${basepath}/auth/account/templateUpload/insert?catalog=office">
                    <div class="row">
                        <div class="col-md-3  wid_218">
                            <div class="user-info clearfix">
                                <span class="pull-left" style="display: none;"><i class="icon_user"></i> 美腻的坑队友狂魔</span>
                                <span class="pull-right"><i class="icon_tip ylyq"  ></i> 预览要求</span>
                            </div>
                            <div class="templet-preview">
                                <img src="${basepath}/resource/images/tmupdata_preview.jpg">
                                <div class="errormsg"></div>
                                <div class="preImg-button">
                                    <input type="file" class="uploadPreImg" name="uploadPreImg">
                                    <p class="bg-yozo">预览图(218X430)</p>
                                    <input type="hidden" name="shrinkUrl" value="">
                                </div>
                            </div>
                            <button type="submit" class="btn btn-yozo">确认上传</button>
                        </div>
                        <div class="col-md-9 mt15">
                            <div class="row">
                                <div class="col-md-6 ">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group has-feedback">
                                                <label for="name">标题</label>
                                                <input type="text" class="form-control" name="name" id="name" placeholder="添加标题" aria-describedby="inputNeedStatus">
                                                <span class="figure_circle form-control-feedback orange1" aria-hidden="true">&bull;</span>
                                                <span id="inputNeedStatus" class="sr-only">(必填)</span>

                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group has-feedback">
                                                <label for="author">作者</label>
                                                <input type="text" class="form-control" value="${e.nickname!""}" id="authorName" name="authorName" disabled="disabled" placeholder="作者" aria-describedby="inputNeedStatus">
                                                <span class="figure_circle form-control-feedback orange1" aria-hidden="true">&bull;</span>
                                                <span id="inputNeedStatus" class="sr-only">(必填)</span>
                                                <input type="hidden" name="author" value="${e.id!""}">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="label-add">文件上传<span class="pull-right"><i class="icon_tip gdgs" ></i>更多格式</span></label>
                                        <div class="fileinput-button">
                                            <input class="btn btn-default form-control" type="button" href="javascript:void(0);" role="button" value="点击上传文件(.doc .xls .ppt格式)" />
                                            <input type="file" class="updateFile" name="updateFile">
                                            <span class="figure_circle form-control-feedback orange1" aria-hidden="true">&bull;</span>
                                            <input type="hidden" name="fileUrl" value="">
                                        </div>
                                    </div>
                                    <div class="form-group ">
                                        <label for="tips" class="label-add trigger-warn">标签<span class="pull-right text-danger"><i class="icon_tip"></i>最多12个</span></label>

                                        <div class="form-control tips-box" name="tips">
                                            最多添加12个标签
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group has-feedback templet-select ">
                                                <label>分类</label>
                                                <select class="form-control" name="officeType">
                                                    <option value="">请选择分类</option>
                                                    <option value="ppt">PPT 模板</option>
                                                    <option value="word">Word 模板</option>
                                                    <option value="excel">Excel 模板</option>
                                                </select>
                                                <span class="figure_circle form-control-feedback orange1" aria-hidden="true">&bull;</span>

                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group has-feedback">
                                                <label class="label-add">详情图上传：<span class="pull-right"> (852*1767)</span></label>
                                                <div class="fileinput-button">
                                                    <input class="btn btn-default form-control" type="button" href="#" role="button" value="点击上传详情图(.jpg 格式)" />
                                                    <input type="file" class="uploadImg" name="uploadImg">
                                                    <span class="figure_circle form-control-feedback orange1" aria-hidden="true">&bull;</span>
                                                    <input type="hidden" name="imgUrl" value="">
                                                </div>

                                            </div>

                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group has-feedback mb">
                                                <label class="label-add">原创保证<span class="pull-right"><i class="zrs icon_tip"></i>责任书</span></label>
                                                <a class="btn btn-default form-control promiseBtn" href="javascript:void(0)" role="button">点击确认原创模板</a>
                                                <span class="figure_circle form-control-feedback orange1" aria-hidden="true">&bull;</span>
                                                <input type="checkbox" class="sr-only" name="promiseBtn">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group has-feedback mb">
                                                <label for="money">价格</label>
                                                <input type="text" class="form-control" id="price" name="price" placeholder="00.00元" aria-describedby="inputNeedStatus">
                                                <span class="figure_circle form-control-feedback orange1" aria-hidden="true">&bull;</span>
                                                <span id="inputNeedStatus" class="sr-only">(必填)</span>
                                            </div>
                                        </div>
                                    </div>
                                    <p class="help-block"><em>&bull;</em>点击确认之后表示您已阅读本网站责任书并保证该模板为原创模板</p>
                                </div>
                            </div>
                            <div class="row templet-tips">

                            </div>
                        </div>

                    </div>
                </form>

            </div>
            <div role="tabpanel" class="tab-pane" id="ae">
                <form role="form" name="formAeTemplet" id="formAeTemplet" method="post" autocomplete="off" action="${basepath}/auth/account/templateUpload/insert?catalog=ae">
                    <div class="row">
                        <div class="col-md-3  wid_290">
                            <div class="user-info clearfix">
                                <span class="pull-right"><i class="icon_tip ylyq"   "></i> 预览要求</span>
                            </div>
                            <div class="templet-preview">
                                <img src="${basepath}/resource/images/tmupdata_aepreview.jpg" >
                                <div class="errormsg"></div>
                                <div class="preImg-button">
                                <input type="file" class="uploadPreImg" name="uploadPreImg">
                                <p class="bg-yozo">预览视频(290X162)</p>
                                    <input type="hidden" name="shrinkUrl" value="">
                                    </div>
                            </div>
                            <button type="submit" class="btn btn-yozo">确认上传</button>
                        </div>
                        <div class="col-md-9 mt15">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group has-feedback">
                                                <label for="name">标题</label>
                                                <input type="text" class="form-control" name="name" id="name" placeholder="添加标题" aria-describedby="inputNeedStatus">
                                                <span class="figure_circle form-control-feedback orange1" aria-hidden="true">&bull;</span>
                                                <span id="inputNeedStatus" class="sr-only">(必填)</span>

                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group has-feedback">
                                                <label for="author">作者</label>
                                                <input type="text" class="form-control" id="authorName" name="authorName" value="${e.nickname!""}" disabled="disabled" placeholder="作者" aria-describedby="inputNeedStatus">
                                                <span class="figure_circle form-control-feedback orange1" aria-hidden="true">&bull;</span>
                                                <span id="inputNeedStatus" class="sr-only">(必填)</span>
                                                <input type="hidden" name="author" value="${e.id!""}">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group mt15">
                                        <label class="label-add">文件上传<span class="pull-right"><i class="icon_tip gdgs" ></i>更多格式</span></label>
                                        <div class="fileinput-button">
                                            <input class="btn btn-default form-control" type="button" href="javascript:void(0);" role="button" value="点击上传附件压缩包(.zip .rar .7z格式)" />
                                            <input type="file" class="updateFile" name="updateFile">
                                            <span class="figure_circle form-control-feedback orange1" aria-hidden="true">&bull;</span>
                                            <input type="hidden" name="fileUrl" value="">
                                        </div>
                                    </div>
                                    <div class="form-group ">
                                        <label for="tips" class="label-add trigger-warn">标签<span class="pull-right text-danger"><i class="icon_tip"></i>最多12个</span></label>

                                        <div class="form-control tips-box" name="tips">
                                            最多添加12个标签
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group has-feedback mb">
                                                <label class="label-add">原创保证<span class="pull-right"><i  class="zrs icon_tip"></i>责任书</span></label>
                                                <a class="btn btn-default form-control promiseBtn" href="javascript:void(0)" role="button">点击确认原创模板</a>
                                                <span class="figure_circle form-control-feedback orange1" aria-hidden="true">&bull;</span>
                                                <input type="checkbox" class="sr-only" name="promiseBtn">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group has-feedback mb">
                                                <label for="money">价格</label>
                                                <input type="text" class="form-control" id="price" name="price" placeholder="00.00元" aria-describedby="inputNeedStatus">
                                                <span class="figure_circle form-control-feedback orange1" aria-hidden="true">&bull;</span>
                                                <span id="inputNeedStatus" class="sr-only">(必填)</span>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <p class="help-block "><em>&bull;</em>点击确认之后表示您已阅读本网站责任书并保证该模板为原创模板</p>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group has-feedback">
                                                <label class="label-add">详情视频上传：
                                                    <span class="pull-right"><i class="icon_tip gdgs" ></i>更多格式</span>
                                                </label>
                                                <div class="radiolist">
                                                    <label class="radio-inline">
                                                        <input type="radio" name="videUrl" id="inlineRadio1" checked="checked"  value="1">本地上传
                                                   </label>
                                                    <label class="radio-inline">
                                                        <input type="radio" name="videUrl" id="inlineRadio2" value="2">链接地址上传
                                                    </label>
                                                </div>
                                                <div class="fileinput-button">

                                                    <input class="btn btn-default form-control" type="button"  role="button" value="点击上传预览视频(.MP4格式)" />
                                                    <input type="file" class="uploadVideo" name="uploadVideo">
                                                    <input class='form-control linkVideo' type='text'  name="linkVideo" placeholder='请输入链接地址' />
                                                    <span class="figure_circle form-control-feedback orange1" aria-hidden="true">&bull;</span>
                                                    <input type="hidden" name="videoUrl" value="">
                                                </div>

                                            </div>

                                        </div>
                                    </div>

                                </div>
                            </div>
                            <#--AE标签列表-->
                            <div class="row templet-tips">
                                <#list AElabelList as label>
                                    <div class="col-md-1"><label>${label.name!""}：</label></div>
                                    <div class="col-md-11">
                                        <#list label.labelList as item>
                                            <a class="clearfix" href="javascript:void(0)" role="button" data-seat="1_1" data-value="${item.id!""}"><span>${item.name!""}</span></a>
                                        </#list>
                                    </div>
                                </#list>
                            </div>
                        </div>

                    </div>
                </form>

            </div>
            <div role="tabpanel" class="tab-pane" id="emotion">
                <form role="form" name="formEmotionTemplet" id="formEmotionTemplet" method="post" autocomplete="off" action="${basepath}/auth/account/templateUpload/insert?catalog=emotion">
                    <div class="row">
                        <div class="col-md-3  wid_290">
                            <div class="user-info clearfix">
                                <span class="pull-right"><i class="icon_tip ylyq"  ></i> 预览要求</span>
                            </div>
                            <div class="templet-preview">

                                <img src="${basepath}/resource/images/tmupdata_aepreview.jpg">
                                <div class="preImg-button">
                                    <input type="file" class="uploadPreImg" name="uploadPreImg">
                                    <p class="bg-yozo" for="uploadPreImg">预览图(270X270)</p>
                                    <input type="hidden" name="shrinkUrl" value="">
                                </div>
                            </div>
                            <button type="submit" class="btn btn-yozo">确认上传</button>
                        </div>
                        <div class="col-md-9 mt15">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group has-feedback">
                                                <label for="name">标题</label>
                                                <input type="text" class="form-control" name="name" id="name" placeholder="添加标题" aria-describedby="inputNeedStatus">
                                                <span class="figure_circle form-control-feedback orange1" aria-hidden="true">&bull;</span>
                                                <span id="inputNeedStatus" class="sr-only">(必填)</span>

                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group has-feedback">
                                                <label for="author">作者</label>
                                                <input type="text" class="form-control" id="authorName" name="authorName" value="${e.nickname!""}" disabled="disabled" placeholder="作者" aria-describedby="inputNeedStatus">
                                                <span class="figure_circle form-control-feedback orange1" aria-hidden="true">&bull;</span>
                                                <span id="inputNeedStatus" class="sr-only">(必填)</span>
                                                <input type="hidden" name="author" value="${e.id!""}">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group mt15">
                                        <label class="label-add">文件上传<span class="pull-right"><i class="icon_tip gdgs" ></i>更多格式</span></label>
                                        <div class="fileinput-button">
                                            <input class="btn btn-default form-control" type="button" href="javascript:void(0);" role="button" value="点击上传附件压缩包(.zip .rar .7z格式)" />
                                            <input type="file" class="updateFile" name="updateFile">
                                            <span class="figure_circle form-control-feedback orange1" aria-hidden="true">&bull;</span>
                                            <input type="hidden" name="fileUrl" value="">
                                        </div>
                                    </div>
                                    <div class="form-group ">
                                        <label for="tips" class="label-add trigger-warn">标签<span class="pull-right text-danger"><i class="icon_tip"></i>最多12个</span></label>

                                        <div class="form-control tips-box" name="tips">
                                            最多添加12个标签
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group has-feedback mb">
                                                <label class="label-add">原创保证<span class="pull-right"><i class="icon_tip zrs"></i>责任书</span></label>
                                                <a class="btn btn-default form-control promiseBtn" href="javascript:void(0)" role="button">点击确认原创模板</a>
                                                <span class="figure_circle form-control-feedback orange1" aria-hidden="true">&bull;</span>
                                                <input type="checkbox" class="sr-only" name="promiseBtn">
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <p class="help-block "><em>&bull;</em>点击确认之后表示您已阅读本网站责任书并保证该模板为原创模板</p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group has-feedback mb">
                                                <label for="money">价格</label>
                                                <input type="text" class="form-control" id="price" name="price" placeholder="00.00元" aria-describedby="inputNeedStatus">
                                                <span class="figure_circle form-control-feedback orange1" aria-hidden="true">&bull;</span>
                                                <span id="inputNeedStatus" class="sr-only">(必填)</span>
                                            </div>
                                     </div>
                                    </div>



                                </div>
                            </div>
                            <#--表情包标签列表-->
                            <div class="row templet-tips">
                                <#list BQlabelList as label>
                                    <div class="col-md-1"><label>${label.name!""}：</label></div>
                                    <div class="col-md-11">
                                        <#list label.labelList as item>
                                            <a class="clearfix" href="javascript:void(0)" role="button" data-seat="1_1" data-value="${item.id!""}"><span>${item.name!""}</span></a>
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
<script type="text/javascript" src="${basepath}/resource/js2/tool.js"></script>
<script type="text/javascript" src="${basepath}/resource/js2/page/form.js"></script>
<script type="text/javascript">
    $(function() {

        // 1.warning
        var tipsOffice = {
            "ylyq": "<p>1、但有时我们不光想简单显示几个字</p><p>2、但有时我们不光想简单显示几个字</p><p>3、但有时我们不光想简单显示几个字</p>",
            "zrs": "<p>1、但有时我们不光想简单显示几个字</p><p>2、但有时我们不光想简单显示几个字</p><p>3、但有时我们不光想简单显示几个字</p>",
            "gdgs": "<p>1、但有时我们不光想简单显示几个字</p><p>2、但有时我们不光想简单显示几个字</p><p>3、但有时我们不光想简单显示几个字</p>"
        };
        var tipsoAe = {
            "ylyq": "<p>2-1、但有时我们不光想简单显示几个字</p><p>2、但有时我们不光想简单显示几个字</p><p>3、但有时我们不光想简单显示几个字</p>",
            "zrs": "<p>2-1、但有时我们不光想简单显示几个字</p><p>2、但有时我们不光想简单显示几个字</p><p>3、但有时我们不光想简单显示几个字</p>",
            "gdgs": "<p>2-1、但有时我们不光想简单显示几个字</p><p>2、但有时我们不光想简单显示几个字</p><p>3、但有时我们不光想简单显示几个字</p>"
        };
        var tipsoEmotion = {
            "ylyq": "<p>3-1、但有时我们不光想简单显示几个字</p><p>2、但有时我们不光想简单显示几个字</p><p>3、但有时我们不光想简单显示几个字</p>",
            "zrs": "<p>3-1、但有时我们不光想简单显示几个字</p><p>2、但有时我们不光想简单显示几个字</p><p>3、但有时我们不光想简单显示几个字</p>",
            "gdgs": "<p>3-1、但有时我们不光想简单显示几个字</p><p>2、但有时我们不光想简单显示几个字</p><p>3、但有时我们不光想简单显示几个字</p>"
        };
        formTemplet({
            ele: "Office",
            tips: tipsOffice,
            fields: {
                'officeType': "required",
                'uploadImg': "required"
            },
            uploadfile:{
                'uploadPreImg':{
                    'types': ['jpg', 'png', 'git'],
                    'size': 1048
                },
                'updateFile': {
                    'types': ['doc', 'docx', 'xls', 'ppt'],
                    'size': 2048
                },
                'uploadImg':{
                    'types': ['jpg', 'png', 'git'],
                    'size': 1048
                }
            },
            urls:{
                uploadfileurl:"${systemSetting().imageRootPath}/${e.id}/",
                tipsurl:"${basepath}/auth/account/templateUpload/changeCatalog"
            }
        });

        formTemplet({
            ele: "Ae",
            tips: tipsoAe,
            fields: {
                'uploadVideo': "required"
            },
            uploadfile:{
                'uploadPreImg':{
                    'types': ['jpg', 'png', 'git'],
                    'size': 1048
                },
                'updateFile': {
                    'types': ['zip', 'rar', '7z'],
                    'size': 10240
                },
                'uploadVideo':{
                    'types': ['mp4'],
                    'size': 10240
                }
            },
            urls:{
                uploadfileurl:"${systemSetting().imageRootPath}/${e.id}/"
            }
        });

        formTemplet({
            ele: "Emotion",
            tips: tipsoEmotion,
            fields: {

            },
            uploadfile:{
                'uploadPreImg':{
                    'types': ['jpg', 'png', 'git'],
                    'size': 1048
                },
                'updateFile': {
                    'types': ['zip', 'rar', '7z'],
                    'size': 2048
                }
            },
            urls:{
                uploadfileurl:"${systemSetting().imageRootPath}/${e.id}/"
            }
        });



    });
</script>
</@html.htmlBase>