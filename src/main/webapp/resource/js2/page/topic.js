/**
 * Created by yozo on 2017/10/26.
 */

(function () {
    "use strict";
    // 模板页查询菜单 #category-search-nav
    // 包括下面的四个排序请求 .order-nav
    YOUMO.topic = {
        //功能：添加到收藏夹 被调用：1.templatelist 2.iframe
        _bindFavo:function (ele) {
           ele.on('click','a.topic-favo',function (event) {
                event.preventDefault();
                var _this = $(this);
                var opt = {
                    callback: function () {
                        var flag = 0;
                        if (_this.hasClass("favo-cur")) {
                            flag = 0;
                        } else {
                            flag = 1;
                        }
                        var _url = basepath + "/template/addToFavorite?templateId=" + _this.data("id") + "&flag=" + flag + "&radom=" + Math.random()+"&type=topic";
                        $.ajax({
                            type: 'GET',
                            url: _url,
                            success: function (data) {
                                var _result = "",starnum=parseInt(_this.next("span").html());
                                if (data == "1") {
                                    _result = "<img src='" + basepath + "/resource/images/success-figure.jpg' width='283px' height='257px'>" +
                                        "<h3>收藏成功</h3>";
                                } else {
                                    _result = "<img src='" + basepath + "/resource/images/success-figure.jpg' width='283px' height='257px'>" +
                                        "<h3>取消收藏</h3>";
                                }
                                var _html = "<div class='outwindow outwindow-favo' >" + _result + "</div>";
                                if (flag == 0) {
                                    _this.removeClass("favo-cur");
                                    if(starnum>=1){
                                    _this.next("span").html(starnum-1);
                                    }
                                } else {
                                    _this.addClass("favo-cur");
                                    _this.next("span").html(starnum+1);
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
    YOUMO.topic.topicList=function () {
            this.topiclist= $(".topiclist-list"),
            this.listmore=$(".listmore");
            this.currentPage=1;
            this.init();
            this.initEvent();
    }
    YOUMO.topic.topicList.prototype= {
        constructor :YOUMO.topic.topicList,
        init:function () { //initPage
            this.getTopicList();
        }, initEvent:function () { //initPageEvent
            var that=this;
            that.listmore.on('click', function (event) {
                event.preventDefault();
                that.currentPage += 1;
                that.getTopicList(that.currentPage);

            });
        },
        getTopicList: function () {
            var that = this,
                i = that.currentPage,//当前页
                _html = "";
            $.ajax({
                type: 'GET',
                url: basepath+'/topic/list/' + i,
                success: function (data) {
                    if (data.list != null && data.list.length > 0) {
                        $.each(data.list, function (i, item) {
                            _html += "<li class='topiclist-list-item' >" +
                                "<a href=" + basepath + "/topic/detail/" + item.id + "><img src=" + item.topicImage + "></a>" +
                                "<div class='floatl'>" +
                                "<p class='name text-ellipsis'>" + item.topicName + "</p>" +
                                "<p class='date'><i class='iconfont'>&#xe606;</i>" + item.topicPeriod + "</p>" +
                                "</div>" +
                                "<div class='flaotr'>" +
                                "<p><i class='iconfont'>&#xe610;</i><span>" + item.pageView + "</span></p>";
                            if(item.isCollect=='y'){
                                _html +="<p><a class='topic-favo favo-cur' data-id='"+item.id+"'><i class='iconfont'>&#xe672;</i></a><span>" + item.collect + "</span></p>";
                            }else{
                                _html +="<p><a class='topic-favo ' data-id='"+item.id+"'><i class='iconfont'>&#xe672;</i></a><span>" + item.collect + "</span></p>";
                            }
                            _html +="</div></li>";

                        });
                        that.topiclist.append(_html);
                    }
                    if (i == data.pagerSize) {
                        that.listmore.hide();
                    } else {
                        that.listmore.show();
                    }

                },
                error: function (er) {

                }
            });
        }

    }
})();
