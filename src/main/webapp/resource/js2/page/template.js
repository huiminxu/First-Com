/**
 * Created by yozo on 2017/10/26.
 */

(function () {

    // 模板页查询菜单 #category-search-nav
    // 包括下面的四个排序请求 .order-nav
    YOUMO.templateNav = {
        init: function () {
            var that = this;
            // 初始化参数
            that.isFirst = false;
            // 容器标识
            that.ctx = "#category-search-nav";
            //不限按钮初始化
            that._isNolimitBtn();
            // 是否显示更多按钮
            that._isShowMoreBtn();
            // .mlt-tags a 更多事件
            that._mltMoreBtn();

            // 事件绑定：模板bigtype
            that._bigTypeBind();
            //事件绑定：detailtype->mlt-tags 多选
            that._mltSelectBtn();
            // 事件绑定：人气等搜索
            that._orderBind();

        },
        // 不限初始化
        _isNolimitBtn: function () {
            var that = this;
            var tags = $(that.ctx).find(".mlt-tags");
            for (var i = 0; i < tags.length; i++) {
                var aItem = tags.eq(i).children();
                for (var j = 0; j < aItem.length; j++) {
                    if (aItem.eq(j).attr('class') === 'active' && j != 0) {
                        aItem.eq(0).removeClass('active');
                    }
                }
            }
        },
        // 是否显示更多按钮
        _isShowMoreBtn: function () {
            var that = this;
            $(that.ctx).find(".mlt-tags").each(function (index, el) {
                var _this = $(this)
                var elWidth = $(el).width();
                var allTagsWidth = 0;
                //判断隐藏的a 里面是否有被选择的项 step1
                var flag = false;
                for (var i = 0; i < $(el).find("a").length; i++) {
                    var _a = $($(el).find("a")[i]);
                    allTagsWidth += _a.outerWidth(true);
                    //step2
                    if (elWidth < allTagsWidth) {
                        if (_a.hasClass("active")) {
                            flag = true;
                        }
                        ;
                    }
                }
                if (elWidth < allTagsWidth) {
                    $(el).next(".mlt-more").show();
                } else {
                    $(el).next(".mlt-more").hide();
                }
                //step3
                if (flag) {
                    _this.addClass("tags-more");
                }
            });
        },
        //更多按钮：点击事件
        _mltMoreBtn: function () {
            var that = this;
            $(that.ctx).on('click', '.mlt-more', function (event) {
                event.preventDefault();
                $(this).prevAll(".mlt-tags").toggleClass("tags-more");
                //that._tabInit();
            });
        },
        //tab页切换
        cancelOtherButton: function () {
            $(".mlt-select-cancel").parent().hide();
            $(".mlt-select-cancel").parent().prevAll("a").removeClass(
                "selected fa fa-check");  //隐藏选中的多选框
            $(".mlt-select-cancel").parent().prevAll("a").last().addClass(
                "selected");
            $(".mlt-select-cancel").parent().parent()
                .nextAll(".mlt-select").show();//多选按钮显示
        },
        _isMlt: function (ele) {
            return $(ele).nextAll(".tags-btn").css("display") == "block";
        },

        // 事件绑定：模板bigtype
        _bigTypeBind: function () {
            $(".btn-moban").on('click', function (event) {
                event.preventDefault();
                var _this = $(this), cfrom = cFrom(), url = _this.attr("href");
                _czc.push(['_trackEvent', cfrom, _this.data('name')]);
                var argument = getUrlArg({isfee: true, key: true});
                if (argument) {
                    url = url + "?" + argument
                }
                ;
                goUrl(url);
            });
        },
        //事件绑定：detailtype->mlt-tags 多选
        _mltSelectBtn: function () {
            var that = this;
            $(that.ctx).find(".mlt-tags").on("click", "a", function (event) {
                event.preventDefault();
                var _this = $(this);
                var ids = "";

                //判断本行是否有有选择：有 替换，没有选中
                if (_this.hasClass("active")) {
                    _this.removeClass("active");
                } else {
                    _this.parent().find("a").removeClass("active");
                    _this.addClass("active");
                }

                var selecteda = _this.parent().parent().parent().find("a[class='active']");
                if (selecteda.length !== 0) {
                    selecteda.each(function () {
                        var _that = $(this);
                        ids += _that.attr("id") + "-";
                    })
                }
                submitLabel(_this, ids);
            });
        },
        //按照人气等搜索
        _orderBind: function () {
            var that = this;
            $(".order-nav a").click(
                function (event) {
                    event.preventDefault();
                    var _this = $(this), url = _this.attr("href");
                    _this.parent().addClass("active").siblings()
                        .removeClass("active");//给父级添加active
                    var argument = getUrlArg({
                        isfee: true,
                        ids: true,
                        catalogCode: true,
                        key: true
                    });
                    if (argument) {
                        url = url + '?' + argument
                    }
                    ;//公共参数
                    url = url + "&orderBy=" + _this.parent("li").data("value");//自己参数
                    goUrl(url);
                });
        },

        _firstShow: function () {
            var $muban_list = jQuery(".mb-wrap li.mb-item");
            $muban_list.hide();
            $muban_list.slice(0, 15).show();//显示15个
        },
        setSearchTag: function () {
            if (!location.search)
                return;
            var queryObj;
            var tempKey = [];
            for (var i in queryObj) {
                tempKey.push(i);
            }

        }
    };
    // get more更多按钮
    // .get-more button
    YOUMO.getMore = {
        init: function () {
            var that = this;
            $(".get-more button").data('count', 1);
            that._bind();
        },
        _bind: function () {
            var that = this;
            jQuery("body").on('click.get-more', '.get-more button',
                function (event) {
                    event.preventDefault();
                    var count = jQuery(".get-more button").data('count');
                    // 第一次: m; 以后每次: n;
                    // start = m+n(count-1)
                    // end = m + n*count
                    var start = 15 + 10 * (count - 1);
                    var end = 15 + 10 * count;
                    var $muban_list = jQuery(".mb-wrap li.mb-item");
                    if (!jQuery(".mb-wrap li.mb-item")[0]) {//如果一个都没查到
                        $.alert("没有更多了");
                    }
                    if ($muban_list.length > 0) {
                        if ($muban_list.length < start - 1) { //超出也显示
                            $.alert("没有更多了")
                        }
                        $muban_list.slice(start, end).show();
                        $(".get-more button").data('count', ++count);
                    }
                });
        }
    };

    //用户上传
    YOUMO.templateItem = {
        init: function (option) {//option:page(0)(edit、reupload)、oType(1)(ppt、word、excel)
            this.obj = $("#formOfficeTemplet"), this.pageType = option.page;
            var eleName = $("#name"),//标题
                eleOfficeType = $("#officeType"),//office 分类
                eleUploadPreImg = $("[name$='uploadPreImg']"),//缩略图上传 input:file input:button
                eleUpdateFile = $("input[name$='updateFile']"),//文件上传模拟、文件上传 input:file input:button
                eleUploadImg = $("input[name$='uploadImg']"),//详情图上传模拟、详情图上传 input:file input:button
                elePrice = $("input[name='price']"),//价格 input:text
                elePromise = $("a[name='promise']"),//原创保证 a
                eleTips = $("div[name='tips']"),//tips  模板标签
                eleAllTips = $(".templet-tips");//office各类所有标签
            /*
             'name':eleName, 标题(0)
             'uploadPreImg':eleUploadPreImg, 缩略图上传(1)（button、file）
             'updateFile':eleUpdateFile,上传文件(2)（button、file）
             'uploadImg': eleUploadImg,上传预览图(3)(button、file)
             'price':elePrice,价格(4)（text）
             'promise':elePromise,确认原创按钮(5)(a)
             'tips': eleTips,模板标签(6)(div)
             'allTips':eleAllTips,各类型word、office、ppt 下 所有标签(7)(div)
             */
            this.eles = {
                'name': eleName,
                'uploadPreImg': eleUploadPreImg,
                'updateFile': eleUpdateFile,
                'uploadImg': eleUploadImg,
                'price': elePrice,
                'promise': elePromise,
                'tips': eleTips,
                'allTips': eleAllTips
            };
            this.editeles = {
                'officeType': eleOfficeType,
                'uploadPreImg': eleUploadPreImg,
                'updateFile': eleUpdateFile,
                'uploadImg': eleUploadImg,
                'promise': elePromise
            };
            this.eventEles = {
                'uploadPreImg': eleUploadPreImg,
                'updateFile': eleUpdateFile,
                'uploadImg': eleUploadImg,
                'promise': elePromise,
                'tips': eleTips,
                'allTips': eleAllTips
            };
            var action = this.obj.attr("action");

            if (option.page == "reupload") {
                this.obj.attr("action", action + "update?catalog=office");
                this.initReUploadPage();
                this.BindOfficeEvent(true);
            } else if (option.page == "edit") {
                this.obj.attr("action", action + "update?catalog=office");
                this.initEditPage();
                this.BindOfficeEvent(true);
                //设定disable状态
                //index:0.标题、1.缩略图上传、2.上传文件（button、file）,、3.上传预览图(button、file)、4.价格（input:text）、5.确认原创按钮a、6.模板标签div
                var _eles = this.editeles;
                if ($("select[name='officeType']").val() == 'ppt') {
                    _eles['showModel']=this.obj.find("select[name='showModel']");
                };
                eleDisable(_eles, true);

            } else {
                this.obj.attr("action", action + "insert?catalog=office");
                this.initUploadPage();
                this.initOfficeTypeEvent();
            }

        },
        initPage: function () {
            //初始化页面值
            /*
             'name':eleName, 标题(0)
             'uploadPreImg':eleUploadPreImg, 缩略图上传(1)（file、button）
             'updateFile':eleUpdateFile,上传文件(2)（button、file）
             'uploadImg': eleUploadImg,上传预览图(3)(button、file)
             'price':elePrice,价格(4)（text）
             'promise':elePromise,确认原创按钮(5)(a)
             'tips': eleTips,模板标签(6)(div)
             'allTips':eleAllTips,各类型word、office、ppt 下 所有标签(7)(div)
             */
            //缩略图初始化

            this.eles['uploadPreImg'].parents().find(".templet-preview>img").attr("src", basepath + "/resource/images/tmupdata_preview.jpg");
            this.eles['uploadPreImg'].val("");
            this.eles['uploadPreImg'].parent().find("input[type='hidden']").val("");
            //标题初始化
            this.eles['name'].val("");
            //文件上传初始化
            $(this.eles['updateFile'][0]).val("点击上传文件(.doc .docx .xls .xlsx .ppt .pptx格式)");
            $(this.eles['updateFile'][1]).val("");
            this.eles['updateFile'].parent().find("input[type='hidden']").val("");
            //预览图初始化
            this.eles['uploadImg'].parent().find("input[type='button']").val("点击上传详情图(.jpg .png .gif 格式)");
            $(this.eles['uploadImg'][1]).val("");
            this.eles['uploadImg'].parent().find("input[type='hidden']").val("");
            //价格初始化
            this.eles['price'].val("");
            this.eles['price'].attr('placehoder', '0.00')
            //确认按钮初始化
            this.eles['promise'].parent().find(":checkbox").attr("checked", false);
            this.eles['promise'].removeClass("btn-success");

        }, initReUploadPage: function () {
            otherInit();//初始化office类型 以及ppt 尺寸的值
            //根据 原模板类型初始化Event
            this.initOfficeTypeEvent();

        },

        initEditPage: function (type) {
            otherInit();//初始化office类型 以及ppt 尺寸的值
            //根据 原模板类型初始化Event
            this.initOfficeTypeEvent();



        },
        initUploadPage: function () {
            //初始化1:在分类不选择的情况下 其他元素disableed
            var eles = this.eles;
            eleDisable(eles, true);
            //添加分类验证
            var _obj = this.obj;
            _obj.validator({
                debug: 0,
                theme: 'bootstrap',
                timely: 2,
                fields: {officeType: {rule: 'required', msg: '请选择分类'}},
                target:function(elem){
                    var $formitem = $(elem).closest('div'),
                        $msgbox = $formitem.find('div.msg-box');
                    if (!$msgbox.length) {
                        $msgbox = $('<div class="msg-box"></div>').appendTo($formitem);
                    }
                    return $msgbox;
                },
            });

        }, initEvent: function () {

        }, initOfficeTypeEvent: function () {
            //根据选择的模板分类PPT、word、excel 分别绑定
            var that = this, _obj = this.obj, eles = this.eles, eventEles = this.eventEles;
            var _selectOfficeType = _obj.find(".templet-select select"), _pageType = this.pageType;
            _selectOfficeType.on('change', function (event) {
                event.preventDefault();
                //初始化值
                that.initPage();
                //清除验证
                _obj.validator('destroy');
                //清除事件绑定
                $.each(eventEles, function (index, item) {
                    item.off();
                });

                var _this = $(this);
                var officeTypeOption = _this.find('option:selected').val();
                if (!officeTypeOption) {
                    that.initUploadPage();
                } else {
                    that.BindOfficeEvent(false);
                }
            });
        }, BindOfficeEvent: function (flag) {
            //flag true 判断是否有内容初次绑定保留原内容，false 还是再次点击清空原内容
            //区别绑定后定值:
            var _obj = this.obj, officeTypeOption =_obj.find('option:selected').val(), eles = this.eles,
                updateFileValue,//上传文件提示语
                tips,//tips
                bindEle,//分类选择word、excel、ppt
                updateFileType,//根据分类限定文件上传类型
                field,//动态验证添加
                _option;
            var pptSize = _obj.find("#pptSize");//ppt尺寸div
            if(!flag){
                //1.ppt 绑定尺寸
                BindPptSize(pptSize, officeTypeOption);
            }
            if (officeTypeOption == 'ppt') {
                //文件长传类型限制为ppt、pptx
                updateFileValue = "点击上传文件(.ppt .pptx格式)";
                //2.ppt 绑定上传文件
                // 1.warning
                bindEle = "ppt";
                updateFileType = ['ppt', 'pptx'];
                field = {'showModel': {rule: 'required', msg: '请选择PPT尺寸'}};
                tipsOffice = {
                    "ylyq": "<p>1、但有时我们不光想简单</p><p>2、但有时我们不光想简单显示几个字</p><p>3、但有时我简单显示几个字</p>",
                    "zrs": "<p>1、但有时我们不光想简单显示几个字</p><p>2、但有时我们不光想简单</p><p>3、但有时我们不光想简单显示几个字</p>",
                    "gdgs": "<p>1、但有时我们不光想简单显示几个字</p><p>2、但有时我们不光想简</p><p>3、但有时我们不示几个字</p>"
                };
            } else {
                //其他 绑定上传文件
                if (officeTypeOption == 'word') {
                    updateFileValue = "点击上传文件(.doc .docx格式)";
                    // 值
                    bindEle = "word";
                    updateFileType = ['doc', 'docx'];
                    tipsOffice = {
                        "ylyq": "<p>1、但有时我们不光想简单</p><p>2、但有时我们不光想简单显示几个字</p><p>3、但有时我简单显示几个字</p>",
                        "zrs": "<p>1、但有时我们不光想简单显示几个字</p><p>2、但有时我们不光想简单</p><p>3、但有时我们不光想简单显示几个字</p>",
                        "gdgs": "<p>1、但有时我们不光想简单显示几个字</p><p>2、但有时我们不光想简</p><p>3、但有时我们不示几个字</p>"
                    };

                } else if (officeTypeOption == 'excel') {
                    updateFileValue = "点击上传文件(.xls .xlsx格式)";
                    //值
                    bindEle = "excel";
                    updateFileType = ['xls', 'xlsx'];
                    tipsOffice = {
                        "ylyq": "<p>1、但有时我们不光想简单</p><p>2、但有时我们不光想简单显示几个字</p><p>3、但有时我简单显示几个字</p>",
                        "zrs": "<p>1、但有时我们不光想简单显示几个字</p><p>2、但有时我们不光想简单</p><p>3、但有时我们不光想简单显示几个字</p>",
                        "gdgs": "<p>1、但有时我们不光想简单显示几个字</p><p>2、但有时我们不光想简</p><p>3、但有时我们不示几个字</p>"
                    };
                }
            }

            //1.重新赋值
            if (!flag) {
                /*
                 'name':eleName, 标题(0)
                 'uploadPreImg':eleUploadPreImg, 缩略图上传(1)
                 'updateFile':eleUpdateFile,上传文件(2)（button、file）
                 'uploadImg': eleUploadImg,上传预览图(3)(button、file)
                 'price':elePrice,价格(4)（text）
                 'promise':elePromise,确认原创按钮(5)(a)
                 'tips': eleTips,模板标签(6)(div)
                 'allTips':eleAllTips,各类型word、office、ppt 下 所有标签(7)(div)
                 */
                // 1-1.上传文件类型重新限定
                $(eles['updateFile'][0]).val(updateFileValue);
                //1-2.标签重新获取
                //1-2-1. 清空标签栏标签
                var _tipsbox = eles['tips'];
                _tipsbox.html("最多添加12个标签");
                //1-2-2.ajax  后台获取标签
                var _temtips = eles['allTips'];
                _temtips.html("");
                $.ajax({
                    url: basepath + "/auth/account/templateUpload/changeCatalog",
                    //url:"/account/templateUpload/changeCatalog",
                    type: 'POST',
                    data: {"seloption": officeTypeOption},
                    dataType: "json",
                    success: function (data) {
                        var tips = "";
                        $.each(data, function (index, item) {
                            tips += "<div class='col-md-1'><label>" + item.name + "：</label></div>" +
                                "<div class='col-md-11'>";
                            $.each(item.labelList, function (index2, item2) {
                                tips += "<a class='clearfix' href='javascript:void(0)' role='button' data-seat='" + item.id + "_" + item2.id + "' data-value='" + item2.id + "'><span>" + item2.name + "</span></a>";
                            });
                            tips += "</div>";
                        });
                        _temtips.html(tips);
                    },
                    error: function (error) {
                    }
                });
            };
            //2.解开显示限制、根据赋值
            eleDisable(eles, false);

            //3.绑定验证、tips、上传方法
            _option = {
                'ele': bindEle,
                'field': field,
                'tipsOffice': tipsOffice,
                'updateFileType': updateFileType
            }
            BindOffice(_option)
        }


    }


})();
