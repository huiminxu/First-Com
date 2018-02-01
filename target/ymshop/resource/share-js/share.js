(function () {

    YOUMO.templateShare={
        init:function (option) {
            var that=this;
            $.each(option,function (name,value) {
              //  console.log(name+":"+value);
            });
            this.option={
                         title:"",
                         desc:"",
                         url:location.href,
                         pic:basepath+"/resource/images/logo.png",
                         site:"永中模板平台",
                          }
             $.extend(this.option,option);
            $.each(this.option,function (name,value) {
             //  console.log(name+":"+value);
            });
            this.pos= {
                top: window.screen.height / 2 - 250,
                left : window.screen.width / 2 - 300
            };
            //页面分享初始化
            $.each(this.option.shareList,function (index,item) {
                $(".share-"+item).click(function (event) {
                    event.preventDefault();
                    if(item=="TSina"){
                        that.shareTSina();
                    }else if(item=="Qzone"){
                        that.shareQzone();
                    }else if(item=="WeiXin"){
                        that.shareWeixin();
                    }

                    
                })
            });
            //手机端微信分享初始化
            that.shareTWeixin();

        },
        shareTSina:function () {
            //title是标题，rLink链接，summary内容，site分享来源，pic分享图片路径,分享到新浪微博
               var that=this,
                title = that.option.title,
                rLink = that.option.url,
                pic = that.option.pic;
                window.open("http://service.weibo.com/share/share.php?pic=" +encodeURIComponent(pic) +"&title=" +
                    encodeURIComponent(title.replace(/&nbsp;/g, " ").replace(/<br \/>/g, " "))+ "&url=" + encodeURIComponent(rLink),
                    "分享至新浪微博",
                    "height=500,width=600,top=" + that.pos.top + ",left=" + that.pos.left + ",toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no");

        },
        shareQzone:function () {
            var that=this;
            var p = {
                url:location.href,
                showcount:'0',/*是否显示分享总数,显示：'1'，不显示：'0' */
                desc:'',/*默认分享理由(可选)*/
                summary:'',/*分享摘要(可选)*/
                title:'',/*分享标题(可选)*/
                site:'',/*分享来源 如：腾讯网(可选)*/
                pics:'', /*分享图片的路径(可选)*/
                style:'203',
                width:22,
                height:22
            };
            var s = [];
            for(var i in p){
                s.push(i + '=' + encodeURIComponent(p[i]||''));
            }
           var desc = that.option.desc,
            title = that.option.title,
            rLink = that.option.url,
            site = that.option.site,
            summary = that.option.desc,
            pics = that.option.pic;

            window.open('http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?title='+
                encodeURIComponent(title)+'&url='+encodeURIComponent(rLink)+'&summary='+
                encodeURIComponent(summary)+ '&site='+encodeURIComponent(site) + '&desc=' +  encodeURIComponent(desc) + '&pics=' + pics
                ,'_blank','scrollbars=no,width=600,height=450,left=' + that.pos.left + ',top=' + that.pos.top + ',status=no,resizable=yes');


        },
        shareWeixin:function () {
            var that=this,
                qrcode=$('#qrcode');
                qrcode.html("");
            new QRCode(document.getElementById("qrcode"), that.option.url);
            layer.open({
                type: 1,
                shade: false,
                area: ['auto', 'auto'],
                title: "微信扫描二维码分享", //不显示标题
                content: qrcode //捕获的元素，注意：最好该指定的元素要存放在body最外层，否则可能被其它的相对元素所影响

            });


        },
        //手机端微信初始化
        shareTWeixin:function () {
            var that=this;
            var desc = that.option.desc,
                title = that.option.title,
                rLink = that.option.url,
                site = that.option.site,
                summary = that.option.desc,
                pic = that.option.pic;

            //微信分享
            wx.config({
                debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
                appId: that.option.weixin.appId, // 必填，公众号的唯一标识
                timestamp:that.option.weixin.timestamp, // 必填，生成签名的时间戳
                nonceStr: that.option.weixin.nonceStr, // 必填，生成签名的随机串
                signature:that.option.weixin.signature,// 必填，签名，见附录1
                jsApiList: ['onMenuShareTimeline','onMenuShareAppMessage','onMenuShareQZone'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
            });


            wx.ready(function(){
                //微信朋友圈
                wx.onMenuShareTimeline({
                    title: title, // 分享标题
                    link: rLink, // 分享链接，该链接域名或路径必须与当前页面对应的公众号JS安全域名一致
                    imgUrl:pic, // 分享图标
                    success: function () {
                        // 用户确认分享后执行的回调函数
                    },cancel: function () {
                        // 用户取消分享后执行的回调函数
                    }
                });
                //微信朋友
                wx.onMenuShareAppMessage({
                    title: title, // 分享标题
                    desc: desc, // 分享描述
                    link: rLink, // 分享链接，该链接域名或路径必须与当前页面对应的公众号JS安全域名一致
                    imgUrl: pic, // 分享图标
                    type: '', // 分享类型,music、video或link，不填默认为link
                    dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
                    success: function () {
                        // 用户确认分享后执行的回调函数
                    },
                    cancel: function () {
                        // 用户取消分享后执行的回调函数
                    }
                });
                //QQ空间
                wx.onMenuShareQZone({
                    title: title, // 分享标题
                    desc: desc, // 分享描述
                    link: rLink, // 分享链接
                    imgUrl:pic, // 分享图标
                    success: function () {
                        // 用户确认分享后执行的回调函数
                    },
                    cancel: function () {
                        // 用户取消分享后执行的回调函数
                    }
                });
            });
            wx.error(function(res){
                console.log(res);
            });

        }


        

    }
})();

