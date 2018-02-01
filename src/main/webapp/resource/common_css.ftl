
<#assign style>${style!""}</#assign>
<#if style=="">
    <#assign style>${systemSetting().style}</#assign>
</#if>
<script>
    //声明_czc对象:
    var _czc = _czc || [];
</script>


<link rel="stylesheet" href="${basepath}/resource/bootstrap3.3.4/css/bootstrap.min.css"  type="text/css">
<#--<link rel="stylesheet" href="${basepath}/resource/bootstrap3.3.4/css/${style}/bootstrap.min.css"  type="text/css">-->
<link rel="stylesheet" href="${basepath}/resource/css2/base.css" type="text/css"/>
<link rel="stylesheet" href="${basepath}/resource/css2/module.css" type="text/css"/>
<!--[if lt  IE 9]>
<link rel="stylesheet" href="${basepath}/resource/css2/iehack.css" /
<![endif]-->
<script type="text/javascript" src="${basepath}/resource/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${basepath}/resource/js2/yomo.js"></script>