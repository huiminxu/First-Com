/**
 * Created by yozo on 2017/10/13.
 */
/*积分支付弹出属性配置*/
function previewPayJF(ele) {
    var _this=ele;
    var option = {
        size: {w: '350px', h: '386px'},
        url: _this.attr("href")
    };
    return option;
}

/*积分支付弹出属性配置*/
function previewPayOnline(ele) {
    var _this=ele;
           //已有订单：1-已支付、2-未支付 , 3未有订单
            var wpsize,orderstatus=_this.attr("ostatus");
            if(orderstatus==1){
                wpsize={w: '620px', h: '345px'};
            }
            else if(orderstatus==2){
                wpsize={w: '620px', h: '345px'};
            }
            else{
                wpsize={w: '620px', h: '505px'};             
            }
            var option = {
                size: wpsize,
                url:_this.attr("href")
            };
            return option;

}

/*积分支付弹出属性配置*/
function previewPayOnline1(ele) {
    var _this=ele;
    $.ajax({
        type: 'POST',
        url: _this.attr("href"),
        success: function (data) {
            //已有订单：1-已支付、2-未支付 , 3未有订单
            var wpsdata,wpscallback,wpsize;
            if(data.status==1){
                wpsize={w: '620px', h: '345px'};
                wpsdata={
                    orderid: data.orderid1,
                    orderitem: data.orderitem1,
                    templateid:data.templateid1
                };
                wpscallback=function (layero, index) {
                    //现实订单信息
                    var body = layer.getChildFrame('body', index);//iframe 层
                    var data = option.data;
                    PayOnlineOperateOfHasPay(body,data);
                };
            }
            else if(data.status==2){
                wpsize={w: '620px', h: '345px'};
                wpsdata={
                    orderid: data.orderid1,
                    orderitem: data.orderitem1
                };
                wpscallback=function (layero, index) {
                    //现实订单信息
                    var body = layer.getChildFrame('body', index);//iframe 层
                    var data = option.data;
                    PayOnlineOperateOfNoPay(body,data);

                };
            }
            else{
                wpsize={w: '620px', h: '505px'};
                wpsdata= {
                    orderid: data.orderid1,
                    price: data.price1,
                    orderitem: data.orderitem1,
                    imgs: {
                        zfb: basepath + "/order/getzfbQR?orderid="+data.orderid1,
                        wx: data.wx1
                    }};
                wpscallback=function (layero, index) {
                    //现实订单信息
                    var data = option.data;
                    var body = layer.getChildFrame('body', index);//iframe 层
                    PayOnlineOperateOfToPay(body,data);

                };
            }
            var option = {
                size: wpsize,
                url:basepath + '/paygate/onlinepay',
                data:wpsdata,
                callback:wpscallback
            };
            previewPay(option, false);
        },
        error: function (er) {
            console.log("订单提交失败");
        }
    });
}

function  PayOnlineOperateOfHasPay(ele,data) {
    var divBox= ele.find('#onlinepay-hasPay');
    divBox.css('display','block');
    divBox.find('.orderNum').html(data.orderid);
    divBox.find('.btn-pay5').attr('href',basepath + "/auth/template/download?id="+data.templateid)

}

function  PayOnlineOperateOfNoPay(ele,data) {
    var divBox= ele.find('#onlinepay-noPay');
    divBox.css('display','block');
    divBox.find('.orderNum').html(data.orderid);
    divBox.find('.btn-pay5').attr('href',basepath + "/auth/order/moneypay?id="+data.orderid)

}

function  PayOnlineOperateOfToPay(ele,data) {
    var loadBox= ele.find('#onlinepay');
    var payBox= ele.find('#onlinepay');
    loadBox.css('display','block');
    /* 图片 */
    payBox.find(".zfb-item>p>img").attr("src", data.imgs.zfb);
    payBox.find(".wx-item>p>img").attr("src", data.imgs.wx);
    /* 订单信息 */
    var _orderdetail = payBox.find(".pay-detail");
    _orderdetail.find(".recharge-money").html(data.price)
    _orderdetail.find(".order-num").html(data.orderid);
    _orderdetail.find(".order-name").html(data.orderitem);
    setTimeout(function () {
        loadBox.css('display','none');
        payBox.css('display','block');
        var payResult = setInterval(function () {
            $.ajax({
                type: 'GET',
                dataType: "text",
                url: basepath + "/order/PayQuery?id=" + data.orderid,
                success: function (data) {
                    var resultBox = ele.find("#payresult");
                    if (data == "A001") {
                        clearInterval(payResult);
                        payBox.css('display', 'none');
                        resultBox.css('display', 'block');
                        resultBox.find(".pay-result-box").css('display', 'none');
                        resultBox.find(".pay-result-success").css('display', 'block');
                    }
                    if (data == "A002") {
                        clearInterval(payResult);
                        payBox.css('display', 'none');
                        resultBox.css('display', 'block');
                        resultBox.find(".pay-result-box").css('display', 'none');
                        resultBox.find(".pay-result-fail").css('display', 'block');
                    }
                },
                error: function (er) {
                    console.log("订单状态获取失败");
                }
            });
        }, 4000)
    },1000)

}

/*支付详情页面 弹出 */
function previewPay(option){
     // _czc.push(['_trackEvent', '立即兑换',,,id]);
    layer.open({
        type: 2,
        title: false,
        area: [option.size.w, option.size.h],
        fixed: false, //不固定
        shade: 0.4,
        scrollbar: false,
        closeBtn:1,
        content:[option.url,'no'],
        success: function(layero, index){

            if(option.callback){
                option.callback(layero, index);
            }

        },
        end:function () {
            if(option.endcallback) {
                option.endcallback();
            }
        }
    });
}