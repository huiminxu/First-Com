<#import "/resource/common_html_front.ftl" as html>
<#import "/indexMenu.ftl" as menu>
<@html.htmlBase title="注册设计师">

<link rel="stylesheet" href="${basepath}/resource/css2/design.css" type="text/css"/>
    <@menu.menu selectMenu="customize"/>
<div class="beDesginer-box">
    <h1 class="page-title">设计师申请</h1>
    <div class="beDesginer-main row">
        <#if registStatus=="regist"||registStatus=="edit">
        <!-- 设计师申请 -->
        <form action="${basepath}/auth/designer/insert" class="form-horizontal" id="formToBeDesginer" method="post">
            <div class="col-sm-6 col-xs-12 form-left">
                <p class="warn">柚墨会为您的信息严格保密请放心填写</p>
                <div class="form-group">
                    <label for="realName" class="col-sm-4 control-label">真实姓名:</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="realname" name="realname" placeholder="请输入您的真实姓名" value="${d.realname!""}">
                        <div class="msgBox"></div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="tel" class="col-sm-4 control-label">电话号码:</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="tel" name="tel" placeholder="请输入真实的电话号码" value="<#if registStatus=="regist">${e.tel!""}<#else>${d.tel!""}</#if>">
                        <div class="msgBox"></div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="qq" class="col-sm-4 control-label">QQ号:</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="qq" name="qq" placeholder="请输入您的QQ号用于与客户交流"  value="${d.qq!""}">
                        <div class="msgBox"></div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="idNumber" class="col-sm-4 control-label">身份证号:</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="idNumber" name="idNumber" placeholder="请输入您的身份证号"  value="${d.idNumber!""}">
                        <div class="msgBox"></div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label">电子版上传:</label>
                    <div class="col-sm-8 idPicList">
                        <div class="row">
                            <div class="col-sm-5">
                                <input type="button" class="btn  form-control"  name="mn-idPicFront"   value="身份证正面">
                                <input type="file" name="file-idPicFront"  data-file-type="image"  class="form-control" />
                                <input type="hidden" id="idPicFront" name="idPicFront" value="${d.idPicFront!""}"/>
                                <img <#if registStatus=="edit"> style="display: block" </#if> src="${d.idPicFront!""}"/>
                                <div class="msgBox"></div>
                            </div>
                            <div class="col-sm-5 col-sm-offset-1">
                                <input type="button" class="btn form-control" name="mn-idPicBack"  value="身份证反面">
                                <input type="file"  class="form-control" data-file-type="image" name="file-idPicBack" />
                                <input type="hidden" id="idPicBack" name="idPicBack" value="${d.idPicBack!""}"/>
                                <img  <#if registStatus=="edit"> style="display: block" </#if> src="${d.idPicBack!""}"/>
                                <div class="msgBox"></div>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <P>
                                请上传手持身份证正反面照片，人脸出镜，以确保人证一致。<br/>
                                jpg/png/gif格式，1M以内。
                            </P>
                        </div>
                    </div>
                </div>

            </div>
            <div class="col-sm-5 col-xs-12">

                <div class="form-group">
                    <label for="resume" class="col-sm-4 control-label">简介:</label>
                    <div class="col-sm-8">
                        <textarea class="form-control" id="resume" name="resume" rows="3" placeholder="个人简介，不超过120字，简单扼要的介绍您自己，让用户了解您的服务和内容" >${d.resume!""}</textarea>
                        <div class="msgBox"></div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="sample" class="col-sm-4 control-label">上传样稿:</label>
                    <div class="col-sm-8">
                        <input type="button" class="form-control btn" name="mn-sample" value="${d.sample!"请上传一件代表作品用于审核"}"/>
                        <input type="file" name="file-sample"  data-file-type="samplefile"  class="form-control" />
                        <input type="hidden" id="sample" name="sample" value="${d.sample!""}">
                        <div class="msgBox"></div>
                        <P>单个文件大小不得超过50M<br/>请打包成格式请打包成zip、rar、7z格式上传</P>
                    </div>
                </div>
                <div class="form-group">
                    <label for="poa" class="col-sm-4 control-label">上传授权书:</label>
                    <div class="col-sm-8">
                        <input type="button" class="form-control btn"  name="mn-poa"  value="${d.poa!"上传合作内容授权书"}"/>
                        <input type="file" name="file-poa" data-file-type="file"  class="form-control" />
                        <input type="hidden" id="poa" name="poa" value="${d.poa!""}">
                        <div class="msgBox"></div>
                        <p>请将授权书打印签字或盖章并扫描上传 <a href="${basepath}/resource/protocal/cooperationDesign.pdf" class="a-link" target="_blank">授权书下载</a><br/>jpg/png/gif格式，5M以内
                        </p>
                    </div>
                </div>
                <div class="col-sm-12">
                    <div class="btn-list">
                        <div class="protocol-box">
                            <input type="checkbox" checked="checked" name="grRule"/>我已确认并同意柚墨<br/>
                            <a href="${basepath}/resource/protocal/yomoerDesginerRole.pdf" class="a-link" target="_blank">《柚墨设计师规则书》</a><br/>
                            <a href="${basepath}/resource/protocal/yomoerUploadProtocal.pdf" class="a-link" target="_black">《柚墨平台数字作品上传发布使用协议》</a><br/>
                        </div>
                        <button type="submit" class="btn btn-big">确认信息</button>
                    </div>
                </div>
            </div>

        </form>
        <#elseif registStatus=="wait">
        <!-- 设计师申请等待 -->
        <div class="beDesginer-result">
            <img src="${basepath}/resource/images/success-figure.jpg">
           <p>您的申请已经提交至柚墨后台、请耐心等待<br/>我们将在三个工作日内审核完毕</p>
        </div>
        <#elseif registStatus=="fail">
        <!-- 设计师申请失败 -->
        <div class="beDesginer-result">
            <img src="${basepath}/resource/images/fail-figure.jpg">
            <p>您的申请不成功<br/>原因：<span>${d.auditOpinion}</span>,<a href="${basepath}/auth/designer/toBeDesigner?type=edit" class="a-link">修改</a>。 </p>
        </div>
        </#if>
    </div>
</div>

<!-- Automatically provides/replaces `Promise` if missing or broken. -->
<script src="${basepath}/resource/es6-promise/es6-promise.auto.min.js"></script>
<script src="${basepath}/resource/es6-promise/es6-promise.min.js"></script>

<script type="text/javascript" src="${basepath}/resource/js2/tool.js"></script>
<script type="text/javascript" src="${basepath}/resource/js2/page/desgin.js"></script>
<script type="text/javascript">
  /*
    text:realname//真实姓名
    text:tel//电话号码
    text:qq //QQ 号码
    text：idNumber// 身份证号码
    hidden：idPicFront // 身份证照片（正面）
    hidden：idPicBack // 身份证照片（背面）
    text:nickname //昵称
    textarea:resume//简介
    hideen:avater//上传头像
    hidden:sample //上传样稿
    hidden:poa//上传授权书
    checkbox:grRule//同意协议书
    */

    $(function(){
        YOUMO.desinger.toBeDesginer({
            ele:'ToBeDesginer',
            type:"desgin",
            fields: {
                'realname':{rule: 'required;length(1~20)', msg: {required:'请输入您的真实姓名'}},
                'tel': {rule: 'required;mobile;remote[${basepath}/designer/unique?primaryTel=${d.tel!""}]', msg:{required:'请输入您的电话号码'}},
                'qq': {rule: 'required;qq;remote[${basepath}/designer/unique?primaryQq=${d.qq!""}]', msg: {required:'请输入您的qq号码'}},
                'idNumber': {rule: 'required;certificate;remote[${basepath}/designer/unique?primaryIdNumber=${d.idNumber!""}]', msg: {required:'请输入您的身份证号码'}},
                'idPicFront': {
                    rule: 'required;',
                    msg: '请选择身份证正面照',
                   // target: ".errormsg"
                },
                'idPicBack': {
                    rule: 'required;',
                    msg: '请选择身份证反面照',
                    // target: ".errormsg"
                },
                'resume': {rule: 'required;length(~120)', msg: {required: '请输入您的简介'}},
                'sample': {
                    rule: 'required;',
                    msg: '请上传样稿'
                },
                'poa': {
                    rule: 'required;',
                    msg: '请上传协议书'
                },
                'grRule': {rule:'checked', msg:{checked:'请确认柚墨成为设计师协议以及规则'},target:""}
            },
            uploadfile: {
                'file-idPicFront': {
                    'types': ['jpg', 'png', 'gif'],
                    'size': 1024
                },
                'file-idPicBack': {
                    'types': ['jpg', 'png', 'gif'],
                    'size': 1024
                },
                'file-sample': {
                    'types': ['zip', 'rar', '7z'],
                    'size': 51200
                },
                'file-poa': {
                    'types':  ['jpg', 'png', 'gif'],
                    'size': 5120
                }

            },
            urls: {
                uploadfileurl: "${systemSetting().webStorePath}/web/designer/info/ymshop/${e.id}/"
            }
        });

    });
</script>
</@html.htmlBase>