<#import "/resource/common_html_front.ftl" as html>
<#import "/indexMenu.ftl" as menu>
<#import "/account/accountMenu.ftl" as accountMenu>
<@html.htmlBase>
    <@menu.menu selectMenu=""/>
<!------灰色区域------>
<div class="grayline"></div>
<link rel="stylesheet" href="${basepath}/resource/css2/usercenter.css" type="text/css"/>
<div class="container distable mt20 mb45">
    <div class="usercenter-box ">
        <aside class="usercenter-menu">
            <@accountMenu.accountMenu currentMenu="info"/>
        </aside>
        <div class="main">
            <!-- Nav tabs -->
            <ul class="navline-tabs clearfix">
                <li><a href="${basepath}/auth/account/info">基本信息</a></li>
                <li class="active"><a href="${basepath}/auth/account/avatar">头像更换</a></li>
                <li><a href="${basepath}/auth/account/topwd">修改密码</a></li>
            </ul>
            <div class="portrait-box mt40">
                <div class="portrait-info clearfix">
                    <form method="post" role="form" id="formtxUpload" action="#">
                        <div class="fleft imginfo-box">
                            <div class="img-box">
                                <img src="${e.avater!"${basepath}/resource/images/headInfo-default.png"}" data-type="0">
                            </div>
                            <button href="#" class="btn mt btn-sm btn-alerttx">确认提交</button>
                        </div>
                        <div class="fleft file-box ml20 pt30">
                            <input type="file"/>
                            <p class="mt20">[友情提示]：推荐上传真实头像!(支持格式："jpg","png","gif")</p>
                        </div>
                    </form>
                </div>

                <h6 class="mt60">选择头像</h6>
                <ul class="portrait-list clearfix">
                    <li>
                        <img src="${basepath}/resource/images/tx/1.jpg">
                    </li>
                    <li>
                        <img src="${basepath}/resource/images/tx/2.jpg">
                    </li>
                    <li>
                        <img src="${basepath}/resource/images/tx/3.jpg">
                    </li>
                    <li>
                        <img src="${basepath}/resource/images/tx/4.jpg">
                    </li>
                    <li>
                        <img src="${basepath}/resource/images/tx/5.jpg">
                    </li>
                    <li>
                        <img src="${basepath}/resource/images/tx/6.jpg">
                    </li>
                    <li>
                        <img src="${basepath}/resource/images/tx/7.jpg">
                    </li>
                    <li>
                        <img src="${basepath}/resource/images/tx/8.jpg">
                    </li>
                    <li>
                        <img src="${basepath}/resource/images/tx/9.jpg">
                    </li>
                    <li>
                        <img src="${basepath}/resource/images/tx/10.jpg">
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        //修改头像
        /*自带*/
        $(".portrait-list").on('click', 'li', function (event) {
            var _this = $(this),
                    _preImg = _this.parents(".portrait-box").find(".img-box img");
            _preImg.attr('src', _this.find('img').attr('src'));
            _preImg.data("type", "1");
        });
        /*上传*/
        $(".file-box input[type='file']").on('change', function (event) {
            event.preventDefault();
             var _this = $(this),
                 _parent = _this.parents(".portrait-box");
            var _option = {
                'file': this,
                'types': ['jpg', 'png', 'gif'],
                'size': false,
                'fileuploadurl': '${systemSetting().imageRootPath}/${e.id}/'
            };
            var redata = upLoadFileCheck(_option);
            if (redata.statu) {
                      var imgBox = _parent.find(".img-box"),
                        imgOption = {
                            obj: this,
                            preImg: imgBox.find("img")[0],
                            localImg: imgBox[0]
                        }
                getInputFileUrl(imgOption);
                return true;

            }else{
                layer.alert(redata.msg);
                return false;
            }
        });
        $(".btn-alerttx").on('click', function (event) {
            event.preventDefault();
            var _this=$(this), sopt,
                    _preImg=_this.siblings(".img-box").find('img'),
                    imgType=_preImg.data('type');
            var ss=_preImg.attr('src');
            if(imgType=="0"){
              layer.alert("请修改头像,再确认提交。")
            }else if(imgType=="1"){
                sopt={
                    type: "POST",
                    url:"${basepath}/auth/account/changeAvater",
                    data:{avater:_preImg.attr('src')},
                    dataType:'text',
                    success:function (data) {
                        if(data=="success"){
                            //修改顶部头像
                            $(".UserBox .user img").attr('src',ss);
                            _preImg.data('type','0');
                            layer.alert("修改成功！");
                        } else if (data == "fail") {
                            layer.alert("修改失败！");
                        }
                    },
                    error: function(er){

                        console.log("errror"+er);
                    }
                };
            }
            else if (imgType == "2") {
                var formData = new FormData();
                var _parent = _this.parents(".portrait-box"),
                        file = _parent.find(".file-box input[type='file']")[0],
                        filename = getFileName(file.value);
                formData.append("file", file.files[0]);
                sopt={
                    type: "POST",
                    url:  "${systemSetting().webStorePath}/web/avater/ymshop/avater/${e.id}/" + filename,
                    data: formData,
                    processData : false,
                    contentType : false,
                    success:function (data) {
                       if (data.sta == 1) {
                            //上传并保存数据库成功
                            //数据库保存路径的值：data.data.url
                           $(".UserBox .user img").attr('src',data.data.url);
                           _preImg.data('type','0');
                            layer.alert("修改成功");
                        } else if (data.sta == 0) {
                            //上传头像失败
                            layer.alert("修改失败");
                        } else {
                            layer.alert("修改失败");
                        }
                    },
                    error: function(er){console.log(er);}
                }

            }
            else {
                console.log("获取失败");
            }
            $.ajax(sopt);

        });
    });
</script>
</@html.htmlBase>