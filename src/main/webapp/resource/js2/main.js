// JavaScript Document
window.onload = function () {
    //浏览器<ie7 检测
    if (LowerIE7() === 0) {
        var txt = " <div id='browreswarn' >您的浏览器版本过低，如果页面显示不正常，建议将浏览器升级到最新版本</div>";
        $('body').prepend(txt);
    }
};

$(document).ready(function () {
    // 头部下拉菜单
    (function () {
        $("#myshopMenuPPP").hover(
            function () {
                $("#myshopMenu").show();
            },
            function () {
                $("#myshopMenu").hide();
            }
        );
    })();

    /* 搜索下拉 */
    var selectListShow = 0;
    (function () {
        $(".searchselect").click(function () {
            if (selectListShow) {
                $("#selectTypeList").slideUp("fast");
                selectListShow = 0;
            } else {
                $("#selectTypeList").slideDown("fast");
                selectListShow = 1;
            }
            return false;
        });
        $("body").click(function () {
            if (selectListShow) {
                $("#selectTypeList").slideUp("fast");
                selectListShow = 0;
            }
        });
        $(".searchselect li").click(function () {
            $("#type").text($(this).text());
            $("#type").attr("typename", $(this).attr("typename"));
            $("#catalogId").attr("value", $(this).attr("typename"));
            //alert($(this).attr("typename"));
            $(this).parent().hide();
        });


        //回车绑定
        $(".searchBox #key,.searchselect").mousedown(function (event) {
            event.stopPropagation();
            var _this = $(this).siblings("#searchbtn");
            document.onkeydown = function (event) {
                e = event ? event : (window.event ? window.event : null);
                e.stopPropagation();
                if (e.keyCode == "13") {
                    index_search(_this);
                }
            };
        });

        $("#searchbtn").click(function (event) {
            event.preventDefault();
            index_search($(this));
        });
    })();


});


function mfDownLoad(option) {
    if(typeof basepath == "undefined"){
        basepath=option.ele.data("basepath");
    }
    //走ajax
    var opt = {
        type: "POST",
        url: webStorePath+"/template/checkFileExist",
        data:{"id":option.id},
        dataType:'text',
        success:function (data) {
            if(data=="fail"){
                layer.alert("资源缺失，请联系我们，我们将致力解决这个问题~");
            }else{
                var url1;
              if(option.ele.attr("href")){
                  url1=option.ele.attr("href");
              }else{
                  url1=option.ele.data("url");
              }
                goUrl(url1);
            }
        },
        error: function (er) {
            console.log(er);
        }
    };
    $.ajax(opt);
}
