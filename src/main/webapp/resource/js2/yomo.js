/**
 * @author myqianlan
 * @update 2015年4月27日14:08:39
 */
(function() {
	"use strict";
	// 油墨命名空间
	var YOUMO = {};
    // 账户操作
    YOUMO.accountOper = {
        _isLogin:function (option) {
            $.ajax({
                type: 'GET',
                url: basepath + "/paygate/acccheck",
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
                    if(er.status == 401){
                        redirectUserCentral();
                    }
                }
            });
        }
    };
    // 模板下载
    YOUMO.templateOper={
        //功能：免费下载 被调用：1.iframe 2.index 3.templatelist 4.order 5.download.5.积分支付成功,6.在线支付成功
        _bindDownload:function (ischeckLogin) {
            $(".btn-mfdownload").on('click', function (event) {
                event.preventDefault();
                var _this=$(this),templateId=_this.data("templateid");
                //流量监测
                var cfrom;
                if(_this.data("cfrom")){cfrom=_this.data("cfrom");}else{cfrom="免费下载";};
                _czc.push(['_trackEvent',cfrom,'',,templateId]);
                var option={
                    id:templateId,
                    ele:_this
                }
                if(ischeckLogin){
                    var opt = {
                        callback: function () {
                            mfDownLoad(option);
                        }
                    };
                    YOUMO.accountOper._isLogin(opt); //是否登录

                }else{
                    mfDownLoad(option);
                }


            });
        },
    //功能：添加到收藏夹 被调用：1.templatelist 2.iframe
        _bindFavo:function () {
                $(".favo").click(function (event) {
                    event.preventDefault();
                    event.stopPropagation();
                    var _this = $(this);
                    var opt = {
                        callback: function () {
                            var flag = 0;
                            if (_this.hasClass("favo-cur")) {
                                flag = 0;
                            } else {
                                flag = 1;
                            }
                            var _url = basepath + "/template/addToFavorite?templateId=" + _this.attr("id") + "&flag=" + flag + "&radom=" + Math.random();
                            $.ajax({
                                type: 'POST',
                                url: _url,
                                dataType: "text",
                                data: {},
                                success: function (data) {
                                    var _result = "";
                                    if (data == "0") {
                                        _result = "<img src='" + basepath + "/resource/images/success-figure.jpg' width='283px' height='257px'>" +
                                            "<h3>收藏成功</h3>";
                                    } else if (data == '1') {
                                        _result = "<img src='" + basepath + "/resource/images/success-figure.jpg' width='283px' height='257px'>" +
                                            "<h3>已添加，无需重复添加</h3>";
                                    } else {
                                        _result = "<img src='" + basepath + "/resource/images/success-figure.jpg' width='283px' height='257px'>" +
                                            "<h3>取消收藏</h3>";
                                    }
                                    var _html = "<div class='outwindow outwindow-favo' >" + _result + "</div>";

                                    if (flag == 0) {
                                        _this.removeClass("favo-cur");
                                    } else {
                                        _this.addClass("favo-cur");
                                    }
                                    layer.open({
                                        type: 1,
                                        shade: 0.4,
                                        area: ['auto', 'auto'],
                                        title: false, //不显示标题
                                        content: _html //捕获的元素，注意：最好该指定的元素要存放在body最外层，否则可能被其它的相对元素所影响

                                    });
                                },
                                error: function (er) {
                                    console.log("addToFavorite.er=" + er);
                                }
                            });
                        }
                    };
                    YOUMO.accountOper._isLogin(opt); //是否登录
                });


            }

};
 //分页
    YOUMO.paginationOper={
        init:function (option) {
            var current_page=option.pagerOffset/option.pagerPageSize,link_to;

            if(option.Urlargument){
                link_to=option.pagerPagerUrl+"?"+option.Urlargument+"&pager.offset=__id__";
            }else{
                link_to=option.pagerPagerUrl+"?"+"pager.offset=__id__";
            }
            option.ele.pagination(option.pagerTotal, {
                items_per_page:option.pagerPageSize,
                link_to:link_to,
                current_page:current_page   //当前页索引
            });

        }
    };
    
    // 暴露到全局
	window.YOUMO = YOUMO;
})();

