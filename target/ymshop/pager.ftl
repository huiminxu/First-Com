<#assign pg = JspTaglibs["/WEB-INF/jsp/pager-taglib.tld"]/>

<script>
    /** $(function() {
        $(".pageLink").click(function(event){
        	alert(111);
            event.preventDefault();
            linkClick(this);
        });
    });
     将a标签的get提交转换为form表单的post提交
     */

    function linkClick(linkObject) {

        var formObject = document.createElement('form');
        document.body.appendChild(formObject);
        formObject.setAttribute('method', 'post');
        var url = linkObject.href;
        var uri = '';
        var i = url.indexOf('?');

        if(i == -1) {
            formObject.action = url;
        } else {
            formObject.action = url.substring(0, i);
        }

        if( i >= 0 && url.length >= i + 1) {
            uri = url.substring(i + 1, url.length);
        }
        alert(url);
        var sa = uri.split('&');

        for(var i = 0; i < sa.length; i++) {
            var isa = sa[i].split('=');
            var inputObject = document.createElement('input');
            inputObject.setAttribute('type', 'hidden');
            inputObject.setAttribute('name', isa[0]);
            inputObject.setAttribute('value', isa[1]);
            formObject.appendChild(inputObject);
        }

        formObject.submit();

        return false;
    }
</script>

<style>
    .pagination{border-radius:0px; margin:10px auto;}
    .pagination > li > a, .pagination > li > span{
        background-color:#fff;
		color:#333;
		border: 1px solid #cdcdcd;
		margin:0 3px;
	}
    .pagination > li > a:hover, .pagination > li > span:hover, .pagination > li > a:focus, .pagination > li > span:focus {
        background-color: #48b84b;
    }
    .pagination-sm > li > a, .pagination-sm > li > span {
        font-size: 13px;
        padding: 5px 10px;
    }
    .pagination > li:first-child > a, .pagination > li:first-child > span {
        border-bottom-left-radius: 0px;
        border-top-left-radius: 0px;
        margin-left: 0;
    }
    .pagination > li:last-child > a, .pagination > li:last-child > span {
        border-bottom-right-radius: 0px;
        border-top-right-radius: 0px;
    }
</style>
<!-- 分页标签 -->
<#if pager.list?? && pager.pagerSize gt 1>
	<ul class="pagination pagination-sm " style="margin: 0px auto; *padding-left:24%;">
		<@pg.pager url="${pager.pagerUrl}" items=pager.total
		export="currentPageNumber=pageNumber"
		maxPageItems=pager.pageSize maxIndexPages=10 isOffset=true>
            <!-- 分页标签   总共：${pager.total}条,共:${pager.pagerSize}页-->
			<#if orderBy?? && orderBy != "0">
				<@pg.param name="orderBy"/>
            </#if>
			<#if isFee?? >
				<@pg.param name="isFee"/>
			</#if>
			<#if catalogCode??>
				<@pg.param name="catalogCode"/>
			</#if>
			<#if ids??>
				<@pg.param name="ids"/>
			</#if>
			<#if key??>
				<@pg.param name="key"/>
			</#if>
			<#if catalogId??>
				<@pg.param name="catalogId"/>
			</#if>
            <#if type??>
                <@pg.param name="type"/>
            </#if>

			<@pg.first>
            	<li><a href="${pageUrl}" class="pageLink" >首页</a></li>
			</@pg.first>
			<@pg.prev>
                <li><a href="${pageUrl}" class="pageLink"  >上一页</a></li>
			</@pg.prev>
			<@pg.pages>
				<#if currentPageNumber==pageNumber>
                    <li class="disabled"><a href="#" style="background:#48b84b; color: #FFFFFF; border:1px solid #48b84b;cursor: default;" <#if isFee??&&isFee=="y" >  onclick="_czc.push(['_trackEvent', ;'免费页',${pageNumber}]);"   <#else> onclick="_czc.push(['_trackEvent','精品页', ${pageNumber}]);" </#if>>${pageNumber}</a></li>
				<#else >
                    <li><a href="${pageUrl}" class="pageLink" <#if isFee??&&isFee=="y" >  onclick="_czc.push(['_trackEvent', ;'免费页',${pageNumber}]);"   <#else> onclick="_czc.push(['_trackEvent','精品页', ${pageNumber}]);" </#if>>${pageNumber}</a></li>
				</#if>
			</@pg.pages>
			<@pg.next>
                <li><a href="${pageUrl}" class="pageLink" >下一页</a></li>
			</@pg.next>
			<@pg.last>
                <li><a href="${pageUrl}" class="pageLink" >尾页</a></li>
			</@pg.last>
		</@pg.pager>
	</ul>
</#if>

