/**
 * Created by yozo on 2017/8/18.
 */

"use strict";
/* -----------------------common function -----------------------*/
//上传文件检测step1
function upLoadFileCheck(option) {
    var file = option.file;
    var types = $(option.types); //容许的类型
    var size = option.size; //容许的大小
    var filetype, filesize, uploadtype, filename;
    var fileuploadurl = option.fileuploadurl;
    var flag = false,
        typestxt = "";

    //file type 类型检测
    filetype = getFileType(file.value);
    //检测 是否为空
    if(filetype==""){
        return false;
    }
    filename = getFileName(file.value);
    types.each(function (index, item) {
           if (item == filetype) {
            flag = true;
            if (item == "doc" || item == "docx") {
                uploadtype = "word";
            } else if (item == "xls"|| item == "xlsx") {
                uploadtype = "excel";
            } else if (item == "ppt"|| item == "ppt") {
                uploadtype = "ppt";
            } else if (item == "jpg" || item == "png" || item == "gif") {
                uploadtype = "image";
            } else if (item == "mp4") {
                uploadtype = "video";
            } else if (item == "rar" || item == "zip") {
                uploadtype = "file"
            }
        }
        typestxt+= item;
        if (index != types.length - 1) {
            typestxt += "、"
        }
    });

    if (!flag) {
        typestxt = "请上传" + typestxt + "格式的文件";
        return {statu: 0, msg: typestxt};

    } else {
        if (size) {
            //获取附件大小（单位：KB）
            filesize = getFileSize(file);
            filesize = (filesize / 1024).toFixed(0);
            if (filesize > size) {
                typestxt = "文件大小不能超过" + size + "KB";
                return {statu: 0, msg: typestxt};
            }
        }
    }
    //fileuploadurl += uploadtype + '/' + filename;
    return {statu: 1, "filename": filename};
}
function getFileType(filePath) {
    var startIndex = filePath.lastIndexOf(".");
    if (startIndex != -1)
        return filePath.substring(startIndex + 1, filePath.length).toLowerCase();
    else return "";
}
function getFileName(filePath) {
    var pos = filePath.lastIndexOf("\\");
    return filePath.substring(pos + 1);
}
function getFileSize(obj) {
    var file = obj, fileSize;
    if (file.files && file.files[0]) {
        fileSize = file.files[0].size;
    } else {
        try {
            file.select();
            file.blur();
            var path = document.selection.createRange().text;
            var fso = new ActiveXObject("Scripting.FileSystemObject");
            fileSize = fso.GetFile(path).size;
        } catch (e) {
           layer.alert(e+"\n"+"如果错误为：Error:Automation 服务器不能创建对象；"+"\n"+"请按以下方法配置浏览器："+"\n"+"请打开【Internet选项-安全-Internet-自定义级别-ActiveX控件和插件-对未标记为可安全执行脚本的ActiveX控件初始化并执行脚本（不安全）-点击启用-确定】");

        }
    }
    return fileSize;
}

function getInputFileUrl(option) {
    var obj=option.obj;
    if(obj.files && obj.files[0])
    {
          //火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
        option.preImg.src=window.URL.createObjectURL(obj.files[0]);
    }
    else
    {
        //IE下，使用滤镜
        obj.select();
        var imgSrc = document.selection.createRange().text;
        var localImag=option.localImg;
        try {
            localImag.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
            localImag.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
        } catch(e) {
            layer.alert("您上传的图片格式不正确，请重新选择!");
        }
        option.preImg.style.display='none';
        document.selection.empty();
    }
    $(option.preImg).data("type",'2')
}
//文件上传后台：step2 预览

function uploadFile(url, file) {
    return new Promise(function (resolve, reject) {
        var formData = new FormData();
        formData.append("file", file.files[0]);
        $.ajax({
            url: url,
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            beforeSend: function () {
                console.log("正在进行，请稍候");
            },
            success: function (responseData) {
                if (responseData.sta === 1 || responseData.sta == 1) {
                    resolve(responseData.data.url);
                    //console.log(responseData.data.url);
                } else {
                    reject(responseData.msg);
                   // console.log(responseData.msg);

                }

            },fail:function (data) {
                console.log("上传失败,请联系客服")
                reject(responseData.msg);
            }
        });
    });
}



// showtips
function showTips(ele, obj) {
    for (var item in obj) {
        //console.log(item);
        ele.find('.' + item).tooltip({
            html: true,
            title: obj[item]

        })
    }

}

/*添加到浏览器收藏夹*/
function addFavorite(e) {
    //ie11 不支持
    var url = window.location;
    var title = document.title;
    var ua = navigator.userAgent.toLowerCase();
    if (ua.indexOf("360se") > -1) {
        alert("由于360浏览器功能限制，请按 Ctrl+D 手动收藏！");
    }
    else if (ua.indexOf("msie 8") > -1) {
        window.external.AddToFavoritesBar(url, title); //IE8
    }
    else if (document.all) {
        try {
            window.external.addFavorite(url, title);
        } catch (e) {
            alert('您的浏览器不支持,请按 Ctrl+D 手动收藏!');
        }
    }
    else if (window.sidebar) {
        window.sidebar.addPanel(title, url, "");
    }
    else {
        alert('您的浏览器不支持,请按 Ctrl+D 手动收藏!');
    }
}

function LowerIE7() {
    var userAgent = navigator.userAgent;
    var IsOpera = userAgent.indexOf("Opera") > -1;
    var IsIE = userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1 && !IsOpera;
    if (IsIE) {
        var reIE = new RegExp("MSIE (\\d+\\.\\d+);");
        reIE.test(userAgent);
        var fIEVersion = parseFloat(RegExp["$1"]);
        if (fIEVersion < 8) {
            return 0;
        } //IE版本过低
    }

}

/* -------------------yomo function----------------------- */
/*模板详情页面 弹出*/
function preview(id, flag) {
    layer.open({
        type: 2,
        title: false,
        area: ['80%', '95%'],
        fixed: false, //不固定
        shade: 0.4,
        scrollbar: false,
        closeBtn: 1,
        content: [basepath + '/template/detail/' + id + '.html', 'no'],
        end: function () {
            if (typeof flag === "function") {
                // console.log("function");
                flag();
            } else if (typeof flag === "boolean" && flag) {
                // console.log("boolean"+flag);
                parent.location.reload();
            }
        }
    });
}


/*关闭 layerjs iframe的弹出层 */
function closeIframe() {
    var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
    parent.layer.close(index);
}

function index_search(ele) {
     /*-----热点统计代码---------*/
      var _this = ele, _parent = _this.parent(),
        _mb = _parent.find("#type"),
        _key =$.trim(_parent.find("#key").val()),
        _cfrom = _this.data("from"),_isfree;
    if (_cfrom == "y") {
        _isfree=_cfrom;
        _cfrom = "免费页";
    } else if (_cfrom == "n") {
        _isfree=_cfrom;
        _cfrom = "精品页";
    }
    _czc.push(['_trackEvent', _cfrom, _mb.html(), _key, , 'searchbtn']);
    /*-----热点统计代码---------*/
     if (_key == '') {
        layer.alert("关键字不能为空!");
    } else if (_mb.attr("typename") == -1) {
        layer.alert("请选择模板类别!");

    } else {
         var url=basepath+"/template/search?key="+_key+"&catalogId=" + _mb.attr("typename");
         if(_isfree){
             url=url+"&isFee="+_isfree;
         }
         var option={
             url:url,
             type:'post'
         }
         addForm(option);

    }
}


//加入购物车
function addToCart() {
    var _url = basepath + "/cart/addToCart?templateID=" + $("#templateID").val();
    $.ajax({
        type: 'POST',
        url: _url,
        data: {},
        success: function (data) {
            console.log("data=" + data);
            if (data == 0) {
                //$("#addToCartBtn").attr("data-original-title",data.tips).tooltip('destroy');
                $('#myModal').modal('toggle');
            } else {
                console.log("出现错误。data.tips=" + data.tips);
                //$("a[name=stockErrorTips]").attr("data-original-title",data.tips).tooltip('show');
                //$("#addToCartBtn").attr("data-original-title",data.tips).tooltip('show');
            }
        },
        dataType: "json",
        error: function (e) {
            console.log("加入购物车失败！请联系站点管理员。异常:" + e);
            $("#addToCartBtn").attr("data-original-title", "加入购物车失败！请联系客服寻求解决办法。").tooltip('show');
        }
    });
}




function reloadImg2(option) {
    $(option.ele).parent().find(".codes").attr('src', option.url);
    // $(option.ele).parent().prev().find("input[name='vcode']").focus();
}


function isLogin(option) {
    $.ajax({
        type: 'GET',
        url: basepath+"/paygate/acccheck",
        success: function (data) {
            if (data == '-1') {//提示用户要先登陆
                var _result = "使用此功能需要先登录！";
                layer.alert(_result);
            } else {
                option.callback();
            }
        },
        error: function (er) {
            console.log(er);
        }
    });
}



function ajaxGet(option) {
    $.ajax({
        type: 'POST',
        url: option.url,
        success: function (data) {
            if (option.callback) {
                option.callback(data);
            }
        },
        error: function (er) {
           if(er.status == 401){
                redirectUserCentral();
            }
        }
    });

}

function ajaxPost(option) {
    $.ajax({
        url: option.url,
        type: "POST",
        data: option.data,
        dataType: "text",
        error: function(er){
            console.log(er);
            if(er.status == 401){
                redirectUserCentral();
            }
        },
        success: function(data){
            if (option.callback) {
                option.callback(data);
            }
        }
    });

}

//字符串中插入字符ystr ：原字符串 istr：插入的字符串 sstr：分割字符串
function insert_flag(ystr,istr,sstr) {
    var _index=ystr.indexOf(sstr),_length=ystr.length,newstr;
      if(_index){
       newstr=ystr.substring(0,_index)+istr+ystr.substring(_index,_length);
       return newstr;
    }else{return false;}
}
//截取字符串
function slice_flag(ystr,istr) {
    var _index=ystr.indexOf(sstr),_length=ystr.length,newstr;
    if(_index){
        newstr=ystr.substring(0,_index)+istr+ystr.substring(_index,_length);
        return newstr;
    }else{return false;}
}

//跳转
function goUrl(url){
    if(url) {
        console.log("112")
        window.location.href = url;
    }
}
//删除url 指定参数
function funcUrlDel(name){
    var loca = window.location;
    var query = loca.search.substr(1);

    if (query.indexOf(name)>-1) {
        var obj = {}
        var arr = query.split("&");
        for (var i = 0; i < arr.length; i++) {
            arr[i] = arr[i].split("=");
            obj[arr[i][0]] = arr[i][1];
        };
        delete obj[name];
        var url = JSON.stringify(obj).replace(/[\"\{\}]/g,"").replace(/\:/g,"=").replace(/\,/g,"&");
        return url
    };
    return query;
}

//跳转
function addForm(opton){
    var form = $("<form></form>");
    form.attr('action',opton.url);
    form.attr('method',opton.type);
    form.appendTo("body");
    form.css('display', 'none');
    form.submit();
}

//元素disabled设置
function eleDisable(ele,flag) {
    var _ele=ele;
    $.each(_ele,function (tag,item) {
        if(flag){
            item.attr('disabled','disabled');
            if(tag=='uploadPreImg'){$(item[1]).removeClass("btn-green")};
        }else{
            item.removeAttr('disabled');

            if(tag=='uploadPreImg'){ $(item[1]).addClass("btn-green")};
        };
    });

}

//瀑布流定位
function WaterFall(option){
    this.elesHeight=[];//每个元素的高度
    this.colsHeight=option.colsHeight;//每列元素现有的高度
    this.option=option;
    this.init();

}
WaterFall.prototype={
    constructor:WaterFall,
    init:function(){
       this.getElesHeight();

    },
    getElesHeight:function(){
        var that=this,liLength=that.option.item.find("li").length;
        that.option.item.find("li").each(function(index, item) {
            var newImg = new Image();
            var _this=$(this);
            newImg.onload = function(){
                var eleHeight = _this.height();
                //console.log(eleHeight);
                that.elesHeight.push(eleHeight);
                if((index+1)==liLength){
                    that.setElesPosition();
                }
            }
            newImg.src = _this.find('a img').attr('src');

        });

    },setElesPosition:function(){
        var that=this,liLength=that.option.item.find("li").length;
        //依次摆放每一个元素
        that.option.item.find("li").each(function(index, item) {
            //获得该元素应该在第几列
            var _this=$(this),colShould;
                 colShould = getMinHeightCol(that.colsHeight);
                var tempTop = that.colsHeight[colShould];
                var tempLeft = colShould * that.option.width;
                //同时将该列的高度加上当前新增元素的高度
                that.colsHeight[colShould] += _this.height() + 20;
                _this.css({
                    "position": "absolute",
                    "top": tempTop + "px",
                    left: tempLeft + "px"
                });

                if((index+1)==liLength){
               /*  for(var i in that.colsHeight) {
                     console.log(that.colsHeight[i]+"-------max--"+liLength+"----"+that.colsHeight[getMaxHeightCol(that.colsHeight)])
                     }*/
                    that.option.item.css('height',that.colsHeight[getMaxHeightCol(that.colsHeight)]+100);
                }


        });




        //得到四列中高度最小的那一列
        function getMinHeightCol(arr) {
            var minHeight = Math.min.apply(null, arr);
            for(var i in arr) {
             //   console.log(arr[i]+"-----min")
                if(arr[i] == minHeight) {
                    return i;
                }
            }
            //默认第一列
            return 0;
        }

        //得到四列中高度最小的那一列
        function getMaxHeightCol(arr) {
            var maxHeight = Math.max.apply(null, arr);
             for(var i in arr) {
               //  console.log(arr[i]+"-----max")
                if(arr[i] == maxHeight) {
                    return i;
                }
            }
            //默认第一列
            return 0;
        }

    }



}



function formatTime(date) {
    var time = new Date(date);
    return time.getFullYear() + '-' + (time.getMonth() + 1) + '-' + time.getDate();
}
