/**
 * Created by yozo on 2017/8/18.
 */
"use strict";
function formPhoneCheck(option) {
    var flag,
        $formphone = option.ele,
        $urls = option.remote;
    $formphone.validator({
        valid: function (form) {
            //提交数据
            var captcha = $formphone.find("input[name='captcha']").val(),
                phone = $formphone.find("input[name='phone']").val();
            $.ajax({
                type: 'POST',
                url: $urls.url2,
                data: {"captcha": captcha, "phone": phone},
                dataType: "text",
                success: function (data) {
                    console.log(data);
                    if (data == "1") {
                        form.submit();
                    } else {
                        $formphone.find("#btnCaptcha").prev().trigger("showmsg", ["error", data]);
                    }
                },
                error: function (er) {
                    // console.log("电话号码传送失败");
                    $formphone.find("#btnCaptcha").prev().trigger("showmsg", ["error", "验证码验证失败、请重新获取"]);

                }
            });
        },
        fields: {
            phone: {
                rule: '手机号:required;mobile;length(11);remote[' + $urls.url1 + ']',
                tip: option.tip.phonetip,
                target: ".msgPhone"
            },
            password: {
                rule: '密码:required;password',
                tip: '6-16位，英文（区分大小写）、数字或常用符号',
                target: '.msgPassword'
            },
            vcode: {
                rule: '验证码:required;vcode;remote[' + $urls.url1 + ']',
                target: '.msgyzm'
            },
            captcha: {
                rule: '验证码:required',
                target: '.msgCaptcha'
            },
            protocol: {
                rule: '协议:checked',
                msg: {checked: "请阅读注册协议并勾选同意"},
                target: '.msgProtocol1'
            }
        }

    });
    $formphone.find("input[name='phone']").on('invalid.field', function (e, result) {
        flag = false;
    });
    //倒计时
    $formphone.find("#btnCaptcha").on('click', function (event) {
        event.stopPropagation();
        event.preventDefault();
        var _this = $(this),
            $time = 60,
            timechange;
        flag = true;
        //验证手机号
        $formphone.find("input[name='phone']").trigger('validate');
        if (!flag) {
            return;
        }
        _this.attr('disabled', true);//防止连续点击
        //提交数据
        var phoneData = $formphone.find("input[name='phone']").val();//*验证码后台获取数据
        $.ajax({
            type: 'POST',
            url: $urls.url3,
            data: {"phoneData": phoneData},
            dataType: "text",
            success: function (data) {
                // console.log(data);
                if (data !== "1") {
                    _this.removeAttr('disabled');
                    _this.prev().trigger("showmsg", ["error", data]);
                } else {
                    //倒计时60s
                    _this.attr("value", $time + "s");
                    timechange = setInterval(timeless, 1000);
                }
            },
            error: function (er) {
                // console.log("电话号码传送失败");
                _this.removeAttr('disabled');
                _this.prev().trigger("showmsg", ["error", "获取验证码失败、请重新获取"]);

            }
        });
        function timeless() {
            // console.log($time);
            if ($time === 0) {
                clearInterval(timechange);
                _this.attr("value", "获取验证码");
                _this.removeAttr('disabled');
                return;
            }
            $time--;
            _this.attr("value", $time + "s");
        }
    })
}

function formTemplet(option) {
    var _obj = $("#form" + option.ele + "Templet");
    var tips = option.tips;
    // 1.warning
    // showTips(_obj, tips);
    //3.templet:预览图、文件上传、预览大图上传验证
    $.each(option.uploadfile, function (name, value) {
        _obj.find("." + name).on('change', function (event) {
            event.preventDefault();
            event.stopPropagation();
            var _this = $(this);
            _this.attr('disabled',true)
            var objfile = this;
            var _option = {
                'file': objfile,
                'fileuploadurl': option.urls.uploadfileurl
            };
            $.extend(true, _option, value);
            var redata = upLoadFileCheck(_option);
            if (redata.statu) {
                //获得文件上传地址
                var _urlOption = {
                    'ele': option.ele,//上传按钮类型Office、Emotion、Ae
                    'type': option.type,//上传模板类型 word、excel、ppt、ae、bq
                    'name': name,//1、office:uploadPreImg、updateFile、uploadImg  2、Emotion：uploadPreImg、updateFile 3、Ae：uploadPreImg、updateFile、uploadVideo
                    'url': {
                        'qUrl': option.urls.uploadfileurl,
                        'hUrl': redata.filename
                    }
                };
                var fileuploadurl = getFileUpLoadUrl(_urlOption);
                var eleValidate;
                if (name == "uploadPreImg") {
                    //上传图片获取地址现实缩略图
                    eleValidate = _this.nextAll("input[name='shrinkUrl']");
                    uploadFile(fileuploadurl, objfile).then(function (value) {
                        var preimgurl = value;
                        //后台上传返回地址
                        _obj.find(".templet-preview .img-area>img").attr("src", preimgurl);
                        eleValidate.val(value);
                        eleValidate.trigger("validate");
                        _this.attr('disabled',false);
                    }, function (value) {
                        //console.log(value);
                        _this.attr('disabled',false);
                        eleValidate.trigger("showmsg", ["error", value]);
                    });
                } else if (name == "updateFile") {
                    //上传文件获取文件地址
                    eleValidate = _this.nextAll("input[name='fileUrl']");
                    uploadFile(fileuploadurl, objfile).then(function (value) {
                        _this.prev().val(getFileName(objfile.value));
                        var start = value.indexOf("/storeData");
                        var url1 = value.substring(start + 10);
                        eleValidate.val(url1);
                        eleValidate.trigger("validate");
                        _this.attr('disabled',false);
                    }, function (value) {
                        //console.log(value);
                        _this.attr('disabled',false);
                        eleValidate.trigger("showmsg", ["error", value]);
                    });
                } else if (name == "uploadImg") {
                    eleValidate = _this.nextAll("input[name='imgUrl']");
                    uploadFile(fileuploadurl, objfile).then(function (value) {
                        _this.prev().val(getFileName(objfile.value));
                        eleValidate.val(value);
                        eleValidate.trigger("validate");
                        _this.attr('disabled',false);
                    }, function (value) {
                        //console.log(value);
                        _this.attr('disabled',false);
                        eleValidate.trigger("showmsg", ["error", value]);
                    });

                }  else if (name == "uploadVideo") {
                    eleValidate = _this.nextAll("input[name='videoUrl']");
                    uploadFile(fileuploadurl, objfile).then(function (value) {
                        _this.prev().val(getFileName(objfile.value));
                        eleValidate.val(value);
                        eleValidate.trigger("validate");
                        _this.attr('disabled',false);
                    }, function (value) {
                        //console.log(value);
                        _this.attr('disabled',false);
                        eleValidate.trigger("showmsg", ["error", value]);
                    });
                }
            } else {
                objfile.value = "";
                _this.attr('disabled',false)
                _this.parent().find("input[type='hidden']").trigger("showmsg", ["error", redata.msg]);
            }
        })

    })

    //4.原创保证
    _obj.find(".promiseBtn").on("click", function (event) {
        event.preventDefault();
        var _this = $(this)
        var _thischeck = _this.parent().find("input[name='promiseBtn']");
        _thischeck.trigger("hidemsg");
        //_thischeck.trigger('click');
        _thischeck.click();
        if (_thischeck.attr("checked")) {
            _thischeck.attr("checked", false);
            _this.removeClass("btn-success");
        } else {
            _thischeck.attr("checked", true);
            _this.addClass("btn-success");
        }
        ;


    });
    //2.templet:添加标签
    _obj.find(".templet-tips").on('click', 'a', function (event) {
        event.preventDefault();
        event.stopPropagation();
        var _this = $(this);
        var txt;
        var tipBox = _obj.find(".tips-box");
        var tiplength = tipBox.find("span").length;
        txt = "<span class='badge' data-seat=" + _this.data("seat") + " data-value=" + _this.data("value") + ">" + _this.text() + "<input type='hidden' name='labelSelectIds' value='" + _this.data("value") + "'></span>";
        if (tiplength >= 12) {
            tipBox.prev().find(".text-danger").css("display", "block");
        } else {
            if (tiplength == 0) {
                tipBox.html("");
            }
            //插入.tips_box对应的位置
            tipBox.append(txt);
            //隐藏.templet-tips a 元素
            _this.css("display", "none");
        }

    })
    //templet:去除标签
    _obj.find(".tips-box").on('click', 'span', function (event) {
        event.preventDefault();
        event.stopPropagation();
        var _this = $(this);
        //templet-tips 显示
        _obj.find(".templet-tips a[data-seat=" + _this.data("seat") + "]").css("display", "inline-block");
        //tips去除
        _this.remove();
    })
    /*5.Video 上传模式选择
     if (option.ele == 'Ae') {
     var _radioType = _obj.find(".radiolist");
     //页面加载初始化
     _radioType.on('click', ':radio', function () {
     //1:本地 file现实 2：外链 input 现实
     var _this = $(this),
     val = _this.val();
     if (val === "1") {
     //显示 input:file 控件
     _this.parent().parent().next().find(".uploadVideo").css('display', 'block');
     _this.parent().parent().next().find("input[type='button']").css('display', 'block');
     //添加 input:file  验证、清空 input:text   验证
     _obj.validator("setField",{ videoUrl: {rule:'required',msg:'请选择上传视频'},
     linkVideo : null
     })
     //隐藏 input:text控件
     _this.parent().parent().next().find("input[type='text']").css('display', 'none');

     } else if (val === "2") {
     //显示 input:text 控件
     _this.parent().parent().next().find("input[type='text']").css('display', 'block');
     // 添加 input:text   验证,去除 input:file  验证

     _obj.validator("setField",{ linkVideo: {rule:'required;url',
     msg:{required:'请填写上传视频路径',url:'请上传有效的url地址'}},
     videoUrl : null
     });
     //隐藏 input:file 控件
     _this.parent().parent().next().find(".uploadVideo").css('display', 'none');
     _this.parent().parent().next().find("input[type='button']").css('display', 'none');

     }
     })
     }*/
    //6.表单提交 title:标题type:分类 updateFile:文件上传uploadImg缩略图上传promiseBtn:原创保证price:价格
    var defaultfields = {
        'name': {rule: 'required', msg: '请输入模板名称'},
        'fileUrl': {rule: 'required', msg: '请选择上传文件'},
        'shrinkUrl': {
            rule: 'required;',
            msg: '请选择预览图',
            target: ".errormsg"
        },
        'promiseBtn': {rule: 'checked', msg: '请确认原创保证'},
        'price': {rule: 'required;money', msg: {required: '请输入模板价格', money: '请输入有效的数字'}}
    };
    $.extend(true, defaultfields, option.fields);
    _obj.validator({
        debug: 0,
        theme: 'bootstrap',
        timely: 2,
        fields: defaultfields,
        target:function(elem){
            var $formitem = $(elem).closest('div'),
                $msgbox = $formitem.find('div.msg-box');
            if (!$msgbox.length) {
                $msgbox = $('<div class="msg-box"></div>').appendTo($formitem);
            }
            return $msgbox;
        },
        validation: function (element, result) {
            //_obj.trigger("validate");
            if (element.form.isValid) {
                _obj.find("button[type='submit']").addClass('btn-green');
            } else {
                _obj.find("button[type='submit']").removeClass('btn-green');
            }

        }

    });


}


function getFileUpLoadUrl(option) {
    var joinUrl;
    if (option.name == "uploadPreImg") {//缩略图shrink
        joinUrl = "shrink";
    } else if (option.name == "uploadImg") {//预览图
        joinUrl = "img";
    } else if (option.name == "updateFile") {//上传文件 zip 、rar
        joinUrl = option.type;
    } else if (option.name == "uploadVideo") {
        joinUrl = "video";
    }
    joinUrl = joinUrl + "/";
    return option.url.qUrl + joinUrl + option.url.hUrl

}