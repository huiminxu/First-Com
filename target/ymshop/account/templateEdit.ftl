<#import "/resource/common_html_front.ftl" as html>
<#import "/indexMenu.ftl" as menu>
<@html.htmlBase>

	<@menu.menu selectMenu=""/>
<!-- 主体内容 -->
<div class="templetupdata-box">
    <div class="wrapper1200">
        <div class="templet-nav clearfix">
            <div class="nav-title">上传列表</div>
            <ul class="nav nav_bottom" role="tablist">
                    <li role="presentation" class="active">
                        <a href="#office"  aria-controls="office"  role="tab" data-toggle="tab">上传Office模板</a>
                    </li>
                    <li role="presentation">
                        <a href="#ae" aria-controls="ae" role="tab" data-toggle="tab">上传AE模板</a>
                    </li>
                    <li role="presentation">
                        <a href="#emotion" aria-controls="emotion" role="tab" data-toggle="tab">上传表情包</a>
                    </li>
            </ul>
        </div>
        <div class="templet_container tab-content">
            <div role="tabpanel" class="tab-pane active" id="office">
                <form role="form" name="formOfficeTemplet" id="formOfficeTemplet" autocomplete="off" method="post" action="${basepath}/account/templateUpload/insert?catalog=office">
                    <div class="row">
                        <div class="col-md-3  wid_218">
                            <div class="user-info clearfix">
                                <span class="pull-left" style="display: none;"><i class="icon_user"></i> 美腻的坑队友狂魔</span>
                                <span class="pull-right"><i class="icon_tip ylyq"  ></i> 预览要求</span>
                            </div>
                            <div class="templet-preview">
                                <#if t.shrinkUrl??>
                                    <img src="${t.shrinkUrl!""}">
                                <#else>
                                    <img src="${basepath}/resource/images/tmupdata_preview.jpg">
                                </#if>
                                <div class="errormsg"></div>
                                <div class="preImg-button">
                                    <input type="file" class="uploadPreImg" name="uploadPreImg">
                                    <p class="bg-yozo">预览图(218X430)</p>
                                    <input type="hidden" name="shrinkUrl" value="${t.shrinkUrl!""}">
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
                                                <input type="text" class="form-control" name="name" id="name" placeholder="添加标题" aria-describedby="inputNeedStatus" value="${t.name!""}">
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
                                        <label class="row-add">文件上传<span class="pull-right"><i class="icon_tip gdgs" ></i>更多格式</span></label>
                                        <div class="fileinput-button">
                                            <#if t.fileUrl??>
                                                <input class="btn btn-default form-control" type="button" href="javascript:void(0);" role="button" value="${t.fileUrl!""}" />
                                            <#else>
                                                <input class="btn btn-default form-control" type="button" href="javascript:void(0);" role="button" value="点击上传文件(.doc .xls .ppt格式)" />
                                            </#if>
                                            <input type="file" class="updateFile" name="updateFile">
                                            <span class="figure_circle form-control-feedback orange1" aria-hidden="true">&bull;</span>
                                            <input type="hidden" name="fileUrl" value="${t.fileUrl!""}">
                                        </div>
                                    </div>
                                    <div class="form-group ">
                                        <label for="tips" class="row-add trigger-warn">标签<span class="pull-right text-danger"><i class="icon_tip"></i>最多12个</span></label>

                                        <div class="form-control tips-box" name="tips">
                                            <#if t.labelList??>
                                                <#list t.labelList as label>
                                                    <#list label.labelList as item>
                                                        <#if label.selectedLabelList??&&(label.selectedLabelList?seq_contains(item.id+""))>
                                                            <span class="badge" data-value="${item.id!""}">${item.name!""}<input type="hidden" name="labelSelectIds" value="${item.id!""}"></span>
                                                        </#if>
                                                    </#list>
                                                </#list>
                                            <#else>
                                                最多添加12个标签
                                            </#if>
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
                                                    <option value="1">Excel 模板</option>
                                                    <option value="2">PPT 模板</option>
                                                    <option value="3">Word 模板</option>
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
                                                <label class="row-add">详情图上传：<span class="pull-right"> (852*1767)</span></label>
                                                <div class="fileinput-button">
                                                    <#if t.imgUrl??>
                                                        <input class="btn btn-default form-control" type="button" href="javascript:void(0);" role="button" value="${t.imgUrl!""}" />
                                                    <#else>
                                                        <input class="btn btn-default form-control" type="button" href="javascript:void(0);" role="button" value="点击上传详情图(.jpg 格式)" />
                                                    </#if>
                                                    <input type="file" class="uploadImg" name="uploadImg">
                                                    <span class="figure_circle form-control-feedback orange1" aria-hidden="true">&bull;</span>
                                                    <input type="hidden" name="imgUrl" value="${t.imgUrl!""}">
                                                </div>

                                            </div>

                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group has-feedback mb">
                                                <label class="row-add">原创保证<span class="pull-right"><i class="zrs icon_tip"></i>责任书</span></label>
                                                <a class="btn btn-default form-control promiseBtn" href="javascript:void(0)" role="button">点击确认原创模板</a>
                                                <span class="figure_circle form-control-feedback orange1" aria-hidden="true">&bull;</span>
                                                <input type="checkbox" class="sr-only" name="promiseBtn">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group has-feedback mb">
                                                <label for="money">价格</label>
                                                <input type="text" class="form-control" id="price" name="price" placeholder="00.00元" aria-describedby="inputNeedStatus" value="${t.price!""}">
                                                <span class="figure_circle form-control-feedback orange1" aria-hidden="true">&bull;</span>
                                                <span id="inputNeedStatus" class="sr-only">(必填)</span>
                                            </div>
                                        </div>
                                    </div>
                                    <p class="help-block"><em>&bull;</em>点击确认之后表示您已阅读本网站责任书并保证该模板为原创模板</p>
                                </div>
                            </div>
                            <div class="row templet-tips">
                                <#if t.id??&&seloption lt 3>
                                <#--office标签列表-->
                                    <div class="row templet-tips">
                                        <#list officeLabelList as label>
                                            <div class="col-md-1"><label>${label.name!""}：</label></div>
                                            <div class="col-md-11">
                                                <#list label.labelList as item>
                                                    <a class="clearfix" href="javascript:void(0)" role="button" data-seat="1_1" data-value="${item.id!""}"><span>${item.name!""}</span></a>
                                                </#list>
                                            </div>
                                        </#list>
                                    </div>
                                </#if>
                            </div>
                        </div>

                    </div>
                </form>
            </div>

            <div role="tabpanel" class="tab-pane" id="ae">
                <form role="form" name="formAeTemplet" id="formAeTemplet" method="post" autocomplete="off" action="${basepath}/account/templateUpload/insert?catalog=ae">
                    <div class="row">
                        <div class="col-md-3  wid_290">
                            <div class="user-info clearfix">
                                <span class="pull-right"><i class="icon_tip ylyq"   "></i> 预览要求</span>
                            </div>
                            <div class="templet-preview">
                                <#if t.shrinkUrl??>
                                    <img src="${t.shrinkUrl!""}">
                                <#else>
                                    <img src="${basepath}/resource/images/tmupdata_preview.jpg">
                                </#if>
                                <div class="errormsg"></div>
                                <div class="preImg-button">
                                <input type="file" class="uploadPreImg" name="uploadPreImg">
                                <p class="bg-yozo">预览图(290X162)</p>
                                    <input type="hidden" name="shrinkUrl" value="${t.shrinkUrl!""}">
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
                                                <input type="text" class="form-control" name="name" id="name" placeholder="添加标题" aria-describedby="inputNeedStatus" value="${t.name!""}">
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
                                        <label class="row-add">文件上传<span class="pull-right"><i class="icon_tip gdgs" ></i>更多格式</span></label>
                                        <div class="fileinput-button">
                                            <#if t.fileUrl??>
                                                <input class="btn btn-default form-control" type="button" href="javascript:void(0);" role="button" value="${t.fileUrl!""}" />
                                            <#else>
                                                <input class="btn btn-default form-control" type="button" href="javascript:void(0);" role="button" value="点击上传附件压缩包(.zip .rar .7z格式)" />
                                            </#if>
                                            <input type="file" class="updateFile" name="updateFile">
                                            <span class="figure_circle form-control-feedback orange1" aria-hidden="true">&bull;</span>
                                            <input type="hidden" name="fileUrl" value="">
                                        </div>
                                    </div>
                                    <div class="form-group ">
                                        <label for="tips" class="row-add trigger-warn">标签<span class="pull-right text-danger"><i class="icon_tip"></i>最多12个</span></label>

                                        <div class="form-control tips-box" name="tips">
                                            <#if t.labelList??>
                                                <#list t.labelList as label>
                                                    <#list label.labelList as item>
                                                        <#if label.selectedLabelList??&&(label.selectedLabelList?seq_contains(item.id+""))>
                                                            <span class="badge" data-value="${item.id!""}">${item.name!""}<input type="hidden" name="labelSelectIds" value="${item.id!""}"></span>
                                                        </#if>
                                                    </#list>
                                                </#list>
                                            <#else>
                                                最多添加12个标签
                                            </#if>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group has-feedback mb">
                                                <label class="row-add">原创保证<span class="pull-right"><i  class="zrs icon_tip"></i>责任书</span></label>
                                                <a class="btn btn-default form-control promiseBtn" href="javascript:void(0)" role="button">点击确认原创模板</a>
                                                <span class="figure_circle form-control-feedback orange1" aria-hidden="true">&bull;</span>
                                                <input type="checkbox" class="sr-only" name="promiseBtn">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group has-feedback mb">
                                                <label for="money">价格</label>
                                                <input type="text" class="form-control" id="price" name="price" placeholder="00.00元" aria-describedby="inputNeedStatus" value="${t.price!""}">
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
                                                <label class="row-add">详情视频上传：
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
                                                    <#if t.videoUrl??>
                                                        <input class="btn btn-default form-control" type="button" role="button" value="${t.videoUrl!""}" />
                                                    <#else>
                                                        <input class="btn btn-default form-control" type="button"  role="button" value="点击上传预览视频(.MP4格式)" />
                                                    </#if>
                                                    <input type="file" class="uploadVideo" name="uploadVideo">
                                                    <input class='form-control linkVideo' type='text'  name="linkVideo" placeholder='请输入链接地址' />
                                                    <span class="figure_circle form-control-feedback orange1" aria-hidden="true">&bull;</span>
                                                    <input type="hidden" name="videoUrl" value="${t.videoUrl!""}">
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
                <form role="form" name="formEmotionTemplet" id="formEmotionTemplet" method="post" autocomplete="off" action="${basepath}/account/templateUpload/insert?catalog=emotion">
                    <div class="row">
                        <div class="col-md-3  wid_290">
                            <div class="user-info clearfix">
                                <span class="pull-right"><i class="icon_tip ylyq"  ></i> 预览要求</span>
                            </div>
                            <div class="templet-preview">
                                <#if t.shrinkUrl??>
                                    <img src="${t.shrinkUrl!""}">
                                <#else>
                                    <img src="${basepath}/resource/images/tmupdata_aepreview.jpg">
                                </#if>
                                <div class="preImg-button">
                                    <input type="file" class="uploadPreImg" name="uploadPreImg">
                                    <p class="bg-yozo" for="uploadPreImg">预览图(270X270)</p>
                                    <input type="hidden" name="shrinkUrl" value="${t.shrinkUrl!""}">
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
                                                <input type="text" class="form-control" name="name" id="name" placeholder="添加标题" aria-describedby="inputNeedStatus" value="${t.name!""}">
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
                                        <label class="row-add">文件上传<span class="pull-right"><i class="icon_tip gdgs" ></i>更多格式</span></label>
                                        <div class="fileinput-button">
                                            <#if t.fileUrl??>
                                                <input class="btn btn-default form-control" type="button" href="javascript:void(0);" role="button" value="${t.fileUrl!""}" />
                                            <#else>
                                                <input class="btn btn-default form-control" type="button" href="javascript:void(0);" role="button" value="点击上传附件压缩包(.zip .rar .7z格式)" />
                                            </#if>
                                            <input type="file" class="updateFile" name="updateFile">
                                            <span class="figure_circle form-control-feedback orange1" aria-hidden="true">&bull;</span>
                                            <input type="hidden" name="fileUrl" value="${t.fileUrl!""}">
                                        </div>
                                    </div>
                                    <div class="form-group ">
                                        <label for="tips" class="row-add trigger-warn">标签<span class="pull-right text-danger"><i class="icon_tip"></i>最多12个</span></label>

                                        <div class="form-control tips-box" name="tips">
                                            <#if t.labelList??>
                                                <#list t.labelList as label>
                                                    <#list label.labelList as item>
                                                        <#if label.selectedLabelList??&&(label.selectedLabelList?seq_contains(item.id+""))>
                                                            <span class="badge" data-value="${item.id!""}">${item.name!""}<input type="hidden" name="labelSelectIds" value="${item.id!""}"></span>
                                                        </#if>
                                                    </#list>
                                                </#list>
                                            <#else>
                                                最多添加12个标签
                                            </#if>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group has-feedback mb">
                                                <label class="row-add">原创保证<span class="pull-right"><i class="icon_tip zrs"></i>责任书</span></label>
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
                                                <input type="text" class="form-control" id="price" name="price" placeholder="00.00元" aria-describedby="inputNeedStatus" value="${t.price!""}">
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

        init();//初始化
       function  init() {
        //1.标签绑定
         if(${seloption}){
             $(".templet-nav .nav li").css('display','none');
             var index=${seloption};
             if(${seloption}<4){index=3;initOffice(${seloption}) } ;
             $(".templet-nav .nav li").eq(index-3).css('display','block');
             $(".templet-nav .nav li").eq(index-3).find("a").tab('show');

        }
       //2.如office绑定模板类性 以及尺寸
           function initOffice(index){
               var _obj = $("#formOfficeTemplet");
               var _selectType = _obj.find(".templet-select select");

               //设置选择
               _selectType.find("option").eq(index).attr("selected",true);
               if(index==1){
                   var txt = "<div class='form-group has-feedback pptsize-select '>" +
                           "<label>幻灯片尺寸</label>" +
                           "<select class='form-control' name='showModel'  data-rule='required'>" +
                           "<option value=''>请选择尺寸</option>" +
                           "<option value='1' <#if t.showModel==2> selected   </#if>>标准：4:3</option>" +
                           "<option value='2' <#if t.showModel==1> selected   </#if>>宽屏：19:9</option>" +
                           "</select>" +
                           "<span class='figure_circle form-control-feedback orange1' aria-hidden='true'>&bull;</span>" +
                           "</div>";
                   _selectType.parent().parent().next().append(txt);

               }
               }

           }



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
                tipsurl:"${basepath}/account/templateUpload/changeCatalog"
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