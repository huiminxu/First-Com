/**
 * Created by yozo on 2017/12/1.
 */
"use strict";
//设计师
(function () {

    YOUMO.desinger ={
        init:function () {

        },
        toBeDesginer:function (option) {//注册、认证 设计师(toBeDesigner)
           var _obj = $("#form" + option.ele );
            //1.上传验证
            $.each(option.uploadfile, function (name, value) {
                _obj.find("input[name="+name+"]").on('change', function (event) {
                    event.preventDefault();
                    event.stopPropagation();
                    var _this = $(this),
                        _parent=_this.parent(),
                        fileType=_this.data("fileType"),
                        objfile = this;
                       _this.attr('disabled',true);
                    //1.loading
                    _parent.append("<div class='loding'></div>");
                    //2.检测上传文件大小、类型
                    var _option = {
                        'file': objfile,
                        'fileuploadurl': option.urls.uploadfileurl
                    };
                    $.extend(true, _option, value);
                    var redata = upLoadFileCheck(_option);
                    if (redata.statu) {
                        //3.上传文件
                        //3-1.获得文件上传地址
                        var _urlOption = {
                            'ele': option.ele,//上传类型ToBeDesign
                            'name': name,//上传按钮名称：file-idPicFront、file-idPicBack、file-avater、file-sample、file-poa
                            'type': option.type,//上传模板类型 word、excel、ppt、ae、bq
                            'url': {
                                'qUrl': option.urls.uploadfileurl,
                                'hUrl': redata.filename
                            }
                        };
                        var fileuploadurl = getFileUpLoadUrl(_urlOption);
                        var eleValidate = _this.nextAll("input[type='hidden']");
                        //3-2.上传文件
                            uploadFile(fileuploadurl, objfile).then(function (value) {
                                //成功：后台返回地址
                                var uploadFileUrl = value;
                                setTimeout(function () {
                               //修改名字
                                _this.nextAll(".loding").remove();
                                _this.attr('disabled',false);
                                if(fileType=="image"){
                                    var timestamp = Date.parse(new Date());
                                    _this.nextAll("img").attr('src',uploadFileUrl+"?"+timestamp).css('display','block');
                                }else if(fileType=="file"||fileType=="samplefile"){
                                    _this.prevAll("input[type='button']").val(getFileName(objfile.value));
                                }
                                //给验证hidde 赋值
                                if(fileType=="samplefile"){
                                    var start=uploadFileUrl.indexOf("/storeData");
                                    uploadFileUrl=uploadFileUrl.substring(start+10);
                                }
                               eleValidate.val(uploadFileUrl);
                               //触发验证
                               eleValidate.trigger("validate");
                                },5000);
                            }, function (value) {
                                //失败
                                _this.nextAll(".loding").remove();
                                _this.attr('disabled',false);
                                eleValidate.trigger("showmsg", ["error", value]);
                            });

                    } else {
                        //检测不通过
                        _this.nextAll(".loding").remove();
                        _this.attr('disabled',false);
                        objfile.value = "";
                        _this.parent().find("input[type='hidden']").trigger("showmsg", ["error", redata.msg]);
                    }
                })

            });


            //2.表单提交:验证
            var defaultfields = {};
            $.extend(true, defaultfields, option.fields);
            _obj.validator({
                debug: 0,
                theme: 'bootstrap',
                timely: 2,
                fields: defaultfields,
                target:function(elem){
                    var $formitem = $(elem).closest('div'),
                        $msgbox = $formitem.find('.msgBox');
                    if (!$msgbox.length) {
                        $msgbox = $('<div class="msgBox"></div>').appendTo($formitem);
                    }
                    return $msgbox;
                },
                validation: function (element, result) {

                }

            });
        },
        customizationUpload:function (option) {//上传定制服务(customizationUpload)
            var _obj = $("#form" + option.ele );
            //1.表单提交 :验证
            var defaultfields = {};
            $.extend(true, defaultfields, option.fields);
            _obj.validator({
                debug: 0,
                theme: 'bootstrap',
                timely: 2,
                fields: defaultfields,
                target:function(elem){
                    var $formitem = $(elem).closest('div'),
                        $msgbox = $formitem.find('.msgBox');
                    if (!$msgbox.length) {
                        $msgbox = $('<div class="msgBox"></div>').appendTo($formitem);
                    }
                    return $msgbox;
                },
                validation: function (element, result) {
                     if (element.form.isValid) {
                        _obj.find("button[type='submit']").addClass('btn-green');
                    } else {
                        _obj.find("button[type='submit']").removeClass('btn-green');
                    }

                }

            });
        },
        IamDesignizations:function (option) {
            option.file.on('change', function (event) {
                event.preventDefault();
                var _this = $(this),
                    _parent = _this.parents('td'),
                    _defaultType=['zip','rar','7z'];
                    var type=_this.data("type");
                    if(type==144){
                        _defaultType.push('ppt','pptx');
                    }else if(type==145){
                        _defaultType.push('doc','docx');
                    }else if(type==121){
                        _defaultType.push('mp4');
                    }else if(type==110){
                        _defaultType.push('xls','xlsx');
                    }

                var _option = {
                    'file': this,
                    'types':_defaultType,
                    'size': false
                };
                var redata = upLoadFileCheck(_option);
                if (redata.statu) {

                    if(!$(".file-name").length){
                    var fileNameTxt= "<div class='file-name'>"+getFileName(this.value)+"</div>",
                        uploadBtnTxt="<a href='javascript:void(0);' data-type='"+type+"'  class='upload-btn' target='_blank'>确认上传</a>";
                    _parent.prepend(fileNameTxt);
                    _parent.append(uploadBtnTxt);
                    }else{
                        $(".file-name").html(getFileName(this.value));
                    }
                    return true;

                }else{
                    layer.alert(redata.msg);
                    return false;
                }
            });

            option.uploadBtn.on('click','.upload-btn', function (event) {
               event.preventDefault();
                var _this=$(this);
               var formData = new FormData();
                var _parent = _this.parents("td"),
                    file = _parent.find("input[type='file']")[0],
                    filename = getFileName(file.value);
               formData.append("file", file.files[0]);


                var eleFileName=_parent.find("div.file-name"),
                    eleUploadfileBox=_parent.find(".uploadfile-box"),
                    eleUploadBtn=_parent.find(".upload-btn"),eleLoding;
                var eleUpload=[eleFileName,eleUploadfileBox,eleUploadBtn];
                //1.loading
                enterUploadSattus();
                var type=_this.data("type"),defaultType;
                if(type==144){
                    defaultType="ppt";
                }else if(type==145){
                    defaultType="doc";
                }else if(type==121){
                    defaultType="ae";
                }else if(type==110){
                    defaultType="xls";
                }else if(type==125){
                    defaultType="biaoqing";
                }
                var url1=option.urls.url1+defaultType;

                $.ajax({
                    type: "POST",
                    url:  url1,
                    data: formData,
                    processData : false,
                    contentType : false,
                    success:function (data) {
                        if(data.sta==1){
                            //文件上传成功，改为相对路径并存储
                            var turl=data.data.url;
                            var start=turl.indexOf("/storeData");
                            var url=turl.substring(start+10);

                            $.ajax({
                                type:'POST',
                                url:option.urls.url2,
                                data:{id:_this.parents("tr").data("id"),template:url},
                                dataType:"text",
                                success:function (data) {
                                    _parent.html("");
                                    _parent.prev("td").html("待确认");
                                    layer.alert('上传成功');
                                },
                                error: function(e){
                                    leaveUploadSattus();
                                    layer.alert("上传失败,请再次尝试，或联系客服");

                                }
                            })
                        }else{
                            leaveUploadSattus();
                            //提示信息data.msg显示
                            layer.alert(data.msg);
                        }

                    },
                    error: function(e){
                        leaveUploadSattus();
                        layer.alert("上传失败,请再次尝试，或联系客服");
                    }
                });


                function  enterUploadSattus() {
                    $.each(eleUpload,function (index,item) {
                        item.hide();
                    });
                    _parent.append("<div class='loding'></div>");
                    eleLoding=$(".loding");
                }
                function  leaveUploadSattus() {
                    $.each(eleUpload,function (index,item) {
                        item.show();
                    });
                    eleLoding.remove();
                }



            });
            option.deleteBtn.on('click', function (event) {
                event.preventDefault();
                var _this=$(this),
                    _parenttr=_this.parents("tr");
                    layer.alert('确认删除订单？',function (index) {
                        $.get(_this.attr('href'), function (data) {
                            _parenttr.prev("tr").fadeOut("normal", function () {
                                $(this).remove();
                            });
                            _parenttr.fadeOut("normal", function () {
                                $(this).remove();
                            });
                            _this.parents(".customizations").find(".tresult-status li a em").eq(1).html(data);
                        }, "text");
                        layer.close(index);
                    });

            });

           //定制信息查看按钮
            option.lookBtn.click(function (event) {
                event.preventDefault();
                var _this=$(this),
                    _parent=_this.parents("tr"),
                _customizationSow=$(".customization-show");
                //Ajax获取
                $.post(basepath+'/auth/designer/showCustom', {'id':_parent.data('id')}, function(data){
                    //dom:customization-show 内容修改 cType、cUse、price、quantity、etcTime、other、customerContact
                    _customizationSow.find("label[name='cType']").html(data.cTypeName);
                    _customizationSow.find("label[name='cUse']").html(data.cUse);
                    _customizationSow.find("label[name='price']").html(data.price);
                    _customizationSow.find("label[name='quantity']").html(data.quantity);
                    _customizationSow.find("label[name='etcTime']").html(data.etc);
                    _customizationSow.find("label[name='other']").html(data.other);
                    _customizationSow.find("label[name='customerContact']").html(data.customerContact);
                    //弹出
                    layer.open({
                        type: 1,
                        title: false, //无标题
                        area: ['auto', 'auto'],
                        content: _customizationSow
                    });
                });

            });

            option.contactBtn.on('click', function (event) {
                var _this=$(this),contactMsg;
                contactMsg=(_this.data("contact")=="")?"没有预留联系方式，请联系客服":_this.data("contact");
               event.preventDefault();
                layer.open({
                    title:"联系方式",
                    type: 1,
                    content: "<div class='pop-msg'>"+contactMsg+"</div>"
                });

            });
            
        },
        IamCustomizations:function (option) {
            option.confirmBtn.click(function (event) {
                event.preventDefault();
                var _this=$(this);
                layer.alert('确认订单？',function (index) {
                    $.get(_this.attr('href'),function (data) {
                        GetOrderStatus({obj:_this,orderStatus:data});
                    },"text");
                    layer.close(index);
                })


            });
            option.deferBtn.click(function (event) {
                event.preventDefault();
                var _this=$(this);
                    layer.alert('确认推迟订单？',function (index) {
                        $.get(_this.attr('href'),function (data) {
                            GetOrderStatus({obj:_this,orderStatus:data});
                        },"text")
                        layer.close(index);
                    })

            });

            function  GetOrderStatus(option) {
                var _this=option.obj,
                    _parenttr=_this.parents('tr'),
                    _parent=_this.parent('td'),
                    _statustd=_parent.prev('td');
                if(option.orderStatus=="3"){
                    _statustd.html("已完成");
                    //去除 推迟按钮
                    _this.remove();
                    _parent.find('.defer-btn').remove();
                    //添加评价按钮
                   var evaluatebtn="<a href='"+basepath+"/auth/designer/designerComment?did="+_parenttr.data("designer")+"&oid="+_parenttr.data("orderid")+"' target='_blank' class='evaluate-btn'><i class='icon iconfont'>&#xe612;</i><h2>评价</h2></a>";
                    _parent.append(evaluatebtn)
                }else if(option.orderStatus=="null"){

                }else{
                    if(new Date(option.orderStatus) > new Date()){
                        _statustd.html("推迟");
                        _parenttr.find('td.etctime').html(formatTime(option.orderStatus));
                        _this.remove();
                    }else{
                        _statustd.html("超时未上传");
                        _parent.html("<a href='#' target='_blank'><h2>联系客服</h2></a>");
                    }


                }
            };

            //定制信息查看按钮
            option.lookBtn.click(function (event) {
                event.preventDefault();
                var _this=$(this),
                    _parent=_this.parents("tr"),
                _customizationSow=$(".customization-show");

                //Ajax获取
                $.post(basepath+'/auth/designer/showCustom', {'id':_parent.data('id')}, function(data){
                    //dom:customization-show 内容修改 cType、cUse、price、quantity、etcTime、other、customerContact
                    _customizationSow.find("label[name='cType']").html(data.cTypeName);
                    _customizationSow.find("label[name='cUse']").html(data.cUse);
                    _customizationSow.find("label[name='price']").html(data.price);
                    _customizationSow.find("label[name='quantity']").html(data.quantity);
                    _customizationSow.find("label[name='etcTime']").html(data.etc);
                    _customizationSow.find("label[name='other']").html(data.other);
                    _customizationSow.find("label[name='customerContact']").html(data.customerContact);
                    //弹出
                    layer.open({
                        type: 1,
                        title: false, //无标题
                        area: ['auto', 'auto'],
                        content: _customizationSow
                    });
                });

            });


        },
        evaluateDesginer:function (option) {//服务评价(customizationUpload)
            var _obj = $("#form" + option.ele );
            //1.表单提交 :验证
            var defaultfields = {};
            $.extend(true, defaultfields, option.fields);
            _obj.validator({
                debug: 0,
                theme: 'bootstrap',
                timely: 2,
                fields: defaultfields,
                target:function(elem){
                    var $formitem = $(elem).closest('div'),
                        $msgbox = $formitem.find('.msgBox');
                    if (!$msgbox.length) {
                        $msgbox = $('<div class="msgBox"></div>').appendTo($formitem);
                    }
                    return $msgbox;
                }

            });

            _obj.on('valid.form', function(e){
                e.preventDefault();
                var _this=$(this);
                $.post(_this.attr('action'), _this.serialize())
                    .done(function(data){
                        if(data==0){
                            layer.alert("<div class='pop-msg'>提交失败,请再尝试</div>");
                        }else{
                            var designerId=_this.find("input[name='designerId']").val();
                            layer.alert("<div class='pop-msg'>提交成功，谢谢评价</div>", function(index){
                                   goUrl(basepath+"/designer/info?type=comments&designerId="+designerId)
                                    layer.close(index);
                                });
                        }
                    });
            });
        },
        desginerInfo:function (option) {
            /*编辑设计师签名*/
            $(".firs p").on('change keydown keyup','textarea',function () {
                var _this=$(this);
                   if(_this.val().length>120){
                     var txt=_this.val();
                    _this.val(txt.substring(0, 120));
                }
            });
            $(".firs .btn-list").on('click','i',function (event) {
                var _this=$(this),_parnet=_this.parent(),_parentSibling=_parnet.siblings('p');
                var btnTxt,resumeTxt;
                //编辑按钮
                if(_this.attr('name')=='edit-info-btn'){
                    btnTxt="<i class='iconfont' name='confirm-info-btn'>&#xe665;</i>"+
                        "<i class='iconfont' name='cancel-info-btn'>&#xe600;</i>";
                    resumeTxt="<textarea name='resume' class='form-control'>"+_parentSibling.html()+"</textarea>"
                    operatAssignment();
                }
                //确认按钮
                if(_this.attr('name')=='confirm-info-btn'){
                    btnTxt="<i class='iconfont' name='edit-info-btn'>&#xe608;</i>";
                    $.post(basepath+'/auth/designer/changeResume', {'resume':_parentSibling.find('textarea').val()}, function(data){
                        resumeTxt=data;
                        _parentSibling.data('text',resumeTxt);
                        operatAssignment();
                    },'text');
                }
                //取消按钮
                if(_this.attr('name')=='cancel-info-btn'){
                    btnTxt="<i class='iconfont' name='edit-info-btn'>&#xe608;</i>";
                    resumeTxt=_parentSibling.data('text');
                    operatAssignment();

                }
                function  operatAssignment() {
                    //移除内容
                    _parnet.html("");
                    _parentSibling.html("");
                    //添加内容
                    _parnet.append(btnTxt);
                    _parentSibling.append(resumeTxt);

                }
            });

            //作品展示 、成交记录、服务评价 切换
            $('.designer-box .designer-select ul li a').click(function (e) {
                e.preventDefault();
                var _this = $(this), gourl = _this.parent().data('url');
                goUrl(gourl);
            });

        }

    }

})();


function getFileUpLoadUrl(option) {
 /*   'ele': option.ele,//上传类型ToBeDesign
        'name': name,//上传按钮名称：file-idPicFront、file-idPicBack、file-avater、file-sample、file-poa
        'url': {
        'qUrl': option.urls.uploadfileurl,
        'hUrl': redata.filename
    }
    */
    var joinUrl;
    if (option.name == "file-idPicFront") {//身份证正面
        joinUrl = "idPicFront";
    } else if (option.name=="file-idPicBack") {//身份证反面
        joinUrl = "idPicBack";
    } else if (option.name == "file-avater") {//头像
        joinUrl = "avater";
    } else if (option.name == "file-sample") {//上传文件 zip 、rar
        joinUrl = "sample";
    } else if (option.name == "file-poa") {//授权书
        joinUrl = "poa";
    }
    joinUrl = joinUrl ;
    return option.url.qUrl + joinUrl ;

}