<#import "/resource/common_html_front.ftl" as html/>
<#import "/indexMenu.ftl" as menu/>
<@html.htmlBase>
<input value="${systemSetting().www}" type="hidden" id="wwwInput"/>
    <@menu.menu/>
<div class="beuser-box container">
    <div class="beuser-main mt60">
        <div class="formBox">
            <div class="beuser-main-pad30">
                <h2>登录YOMO</h2>
                <div class="form-msg">
                    <#if errorMsg??>
                        <strong>登录失败!</strong> ${errorMsg}
                    </#if>
                </div>
                <form role="form" id="form" action="${basepath}/account/doLogin" method="post">
                    <div class="form-group">
                        <input name="account" id="account" data-rule="账号:required;account;" class="form-control"
                               type="text"

                               placeholder="请输入手机号或邮箱" <#if theWrongInfo??>value="${theWrongInfo.account}" </#if>
                               data-target=".msgaccount">
                        <div class="msgbox">
                            <div class="msgaccount"></div>
                        </div>
                    </div>
                    <div class="form-group relative">
                        <input name="password" type="password" class="form-control" id="password"
                               data-rule="密码:required;password;" placeholder="请输入密码"
                               <#if theWrongInfo??>value="${theWrongInfo.password}" </#if> data-target=".msgpassword"/>

                        <a href="${basepath}/account/forget" class="a-link forgetmm">忘记密码？</a>

                        <div class="msgbox">
                            <div class="msgpassword"></div>
                        </div>
                    </div>
                    <div class="form-group mt15">
                        <button class="btn btn-default form-control" type="submit"
                                onclick="_czc.push(['_trackEvent', '登录页','点击登录'])">
                            登录
                        </button>

                    </div>
                </form>
            </div>
        </div>
        <div class="otherLoginBox">
            <div class="login-title">其他方式登录：</div>
            <ul class="login-types clearfix">
                <li><a href="${basepath}/ThirdpartyLogin/qqLogin" class="ym-login-qq" title="使用QQ号登录">qq登录</a></li>
                <li><a href="${basepath}/ThirdpartyLogin/weiboLogin" class="ym-login-sina" title="使用新浪微博账号登录">新浪微博登录</a>
                </li>
                <li><a href="${basepath}/ThirdpartyLogin/weixinLogin" class="ym-login-weixin" title="使用微信账号登录">微信登录</a>
                </li>
            </ul>
        </div>
        <div class=""><p class="no-account">还没有账户？<a href="${basepath}/account/register" class="btn_zc green">注册</a></p>
        </div>
    </div>

</div>

<script type="text/javascript">

    function showQQLogin() {
        //调用QC.Login方法，指定btnId参数将按钮绑定在容器节点中
        QC.Login({
                    //btnId：插入按钮的节点id，必选
                    btnId: "qqLoginBtn",
                    //用户需要确认的scope授权项，可选，默认all
                    scope: "all",
                    //按钮尺寸，可用值[A_XL| A_L| A_M| A_S|  B_M| B_S| C_S]，可选，默认B_S
                    size: "A_M"
                }, function (reqData, opts) {//登录成功

                    console.log('QQ登录 登录成功reqData=' + reqData);
                    $.each(reqData, function (index, value) {
                        console.log("index=" + index + "value=" + value);
                    });
                    console.log('获取openId...');
                    try {
                        QC.Login.getMe(function (openId, accessToken) {
                            //alert(["当前登录用户的", "openId为："+openId, "accessToken为："+accessToken].join("\n"));
                            console.log(["当前登录用户的", "openId为：" + openId, "accessToken为：" + accessToken].join("\n"));
                            //$("#qqLoginBtn").html("qq登陆了");
                            notifySession("login", openId, accessToken, reqData.nickname);
                        });
                    } catch (e) {
                        console.log("QC.Login.getMe异常=" + e);
                    }
                }, function (opts) {//注销成功
                    console.log('QQ登录 注销成功');
                }
        );
    }
    function notifySession(status, openId, accessToken, nickname) {
        var _url = "${systemSetting().www}/account/qqCallbackNotifySession?status=" + status + "&openId=" + openId + "&accessToken=" + accessToken + "&nickname=" + nickname;
        console.log("_url=" + _url);
        $.ajax({
            type: 'POST',
            url: _url,
            data: {},
            success: function (data) {
                console.log("notifySession.data=" + data);
                window.location.href = "${systemSetting().www}";
            },
            dataType: "text",
            error: function (er) {
                console.log("notifySession.er=" + er);
            }
        });
    }
</script>

<script type="text/javascript">

    function _login3213123() {
        WB2.login(function () {
            console.log("登录成功");
        });
    }
    function _logout321312323() {
        WB2.logout(function () {
            console.log("退出成功");
        });
    }

    function showSinaWeiboButton() {
        WB2.anyWhere(function (W) {
            W.widget.connectButton({
                id: "wb_connect_btn",
                type: '3,2',
                callback: {
                    login: function (o) {
                        console.log("logout,screen_name" + o.screen_name + "id=" + o.id);
                        //sinaWeiboLoginNotifySession("login",o.id,o.screen_name);

                        var _url = "/account/sinaWeiboLoginNotifySession?status=login" + "&id=" + o.id + "&nickname=" + o.screen_name;
                        console.log("_url=" + _url);
                        $.ajax({
                            type: 'POST',
                            url: _url,
                            data: {},
                            success: function (data) {
                                console.log("success.sinaWeiboLoginNotifySession.data=" + data);
                                window.location.href = "${systemSetting().www}";
                            },
                            dataType: "text",
                            error: function (er) {
                                console.log("sinaWeiboLoginNotifySession.er=" + er);
                            }
                        });

                    },
                    logout: function () {
                        console.log("logout");
                    }
                }
            });
        });
    }

    function sinaWeiboLoginNotifySession(status, id, nickname) {
        var _url = "user/sinaWeiboLoginNotifySession?status=" + status + "&id=" + id + "&nickname=" + nickname;
        console.log("_url=" + _url);
        $.ajax({
            type: 'POST',
            url: _url,
            data: {},
            success: function (data) {
                console.log("sinaWeiboLoginNotifySession.data=" + data);
                window.location.href = "${systemSetting().www}";
            },
            dataType: "text",
            error: function (er) {
                console.log("sinaWeiboLoginNotifySession.er=" + er);
            }
        });
    }
</script>


</@html.htmlBase>