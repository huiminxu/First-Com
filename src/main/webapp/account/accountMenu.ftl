<#macro accountMenu currentMenu="account">
<div class="list-group">
	<a href="${basepath}/auth/account/account" class="list-group-item ${(currentMenu=="account")?string('active', '')}">
        <i class="info_icon"></i><span>&nbsp;个人中心</span>
	</a>
	<a href="${basepath}/auth/account/info" class="list-group-item ${(currentMenu=="info")?string('active', '')}">
        <i class="set_icon" ></i><span>&nbsp;我的资料</span>
	</a>
	<a href="${basepath}/auth/account/orders?type=2" class="list-group-item ${(currentMenu=="orders")?string('active', '')}">
        <i class="order_icon"></i><span>&nbsp;我的订单</span>
	</a>
    <a href="${basepath}/auth/account/customizations/imuser" class="list-group-item ${(currentMenu=="customizations")?string('active', '')}">
        <i class="cus_icon" ></i>&nbsp;我的定制
    </a>

    <a href="${basepath}/auth/account/templateManage" class="list-group-item ${(currentMenu=="templateManage")?string('active', '')}">
        <i class="manage_icon"></i>&nbsp;作品管理
    </a>
    <a href="${basepath}/auth/account/tempUploadIntroduce" class="list-group-item ${(currentMenu=="tempUploadIntroduce")?string('active', '')}">
        <i class="upload_icon"></i>&nbsp;上传作品
    </a>
    <a href="${basepath}/auth/account/download" class="list-group-item ${(currentMenu=="download")?string('active', '')}">
        <i class="download_icon" ></i><span>&nbsp;我的下载</span>
    </a>
    <a href="${basepath}/auth/account/favorite" class="list-group-item ${(currentMenu=="favorite")?string('active', '')}">
        <i class="fav_icon_w"></i><span>&nbsp;收藏夹</span>
    </a>
    <a href="${basepath}/auth/account/income" class="list-group-item ${(currentMenu=="income")?string('active', '')}">
        <i class="iconfont">&#xe604;</i><span>&nbsp;我的收入</span>
    </a>

<#--<%--     <a href="${basepath}/account/letters.html" class="list-group-item <%=getCss("letters", aa)%>">系统信件<span class="badge"><s:property value="#session.WEB_USER_INFO.notReadLetters"/></span></a> --%>-->
</div>
</#macro>