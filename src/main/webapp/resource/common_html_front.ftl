<#macro htmlBase title="${systemSetting().systemCode}" jsFiles=[] cssFiels=[] nobody=false>
<!DOCTYPE html>
<html>
<head>
    <meta name="renderer" content="webkit"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <#assign non_responsive2>y</#assign>
    <#assign responsive>${Session["responsive"]!""}</#assign>
    <#if responsive == "y">
        <#assign non_responsive2>n</#assign>
    <#elseif systemSetting().openResponsive == "n">
        <#assign non_responsive2>y</#assign>
    <#else >
        <#assign non_responsive2>n</#assign>
    </#if>
    <#assign style>${RequestParameters.style!""}</#assign>
    <#if style=="">
        <#assign style>${systemSetting().style}</#assign>
    </#if>

    <script type="text/javascript">
        var basepath = "${basepath}";
        var staticpath = "${staticpath}";
        var webStorePath = "${systemSetting().webStorePath}";
        var non_responsive2 = "${non_responsive2}";
            <#if currentUser()??>
            var login = true;
            var currentUser = "${currentUser().username}";
            <#else >
            var login = false;
            var currentUser = "";
            </#if>
    </script>
    <meta name="description" content="${systemSetting().description}"/>
    <meta name="keywords" content="${systemSetting().keywords}"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1"/>
    <#if non_responsive2 != "y">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </#if>
    <title>${title!"${systemSetting().systemCode}"}</title>
    <link rel="shortcut icon" type="image/x-icon" href="${systemSetting().shortcuticon}">
    <#include "/resource/common_css.ftl"/>
    <link rel="stylesheet" href="${basepath}/resource/nice-validator-1.1.1/jquery.validator.css"/>
    <#if non_responsive2 == "y">
        <link rel="stylesheet" href="${basepath}/resource/bootstrap3.3.4/css/non-responsive.css" type="text/css">
    </#if>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt  IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/r29/html5.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.js"></script>
    <![endif]-->
    <script type="text/javascript">
        function redirectUserCentral(){
            <#--window.location = "${basepath}/account/login";-->
            var url = window.location.href;
            url = url.replace(/&/g,']');
            window.location = "http://www.yomoer.cn/cas/login?service=http://www.yomoer.cn/index?authRrl="+url+"&auth=login";

        }
    </script>
</head>
    <#if nobody>
        <#if systemSetting().isopen=="false">
        ${systemSetting().closeMsg!"系统关闭，请联系管理员"}
            <#return />
        </#if>
        <#nested />
    <#else >
    <body >
        <#if systemSetting().isopen=="false">
        ${systemSetting().closeMsg!"系统关闭，请联系管理员"}
            <#return />
        </#if>
     <#nested />
        <#include "/foot.ftl">
    <script type="text/javascript" src="${basepath}/resource/bootstrap3.3.4/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${basepath}/resource/js/jquery.blockUI.js"></script>
    <script type="text/javascript" src="${basepath}/resource/nice-validator-1.1.1/jquery.validator.min.js"></script>
    <script type="text/javascript" src="${basepath}/resource/nice-validator-1.1.1/local/zh-CN.js?day=20171225"></script>
    <script type="text/javascript" src="${basepath}/resource/js/jquery.lazyload.min.js"></script>
    </body>
    </#if>
</html>
</#macro>
