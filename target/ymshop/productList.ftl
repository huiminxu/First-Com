<#import "/resource/common_html_front.ftl" as html>
<#import "/indexMenu.ftl" as menu>
<@html.htmlBase>

<style type="text/css">
img{border: 0px;}

.thumbnail_css{
	border-color: #f40;
}
.attr_css{
	font-size: 100%;
	float: left;
}
.left_product{
	font-size: 12px;max-height: 35px;overflow: hidden;text-overflow: ellipsis;-o-text-overflow: ellipsis;
}

.left_title {
	display: block;
	/* width: 280px; */
	overflow: hidden;
	white-space: nowrap;
	-o-text-overflow: ellipsis;
	text-overflow: ellipsis;
}

img.err-product {
<#if systemSetting().defaultProductImg??>
background: url(${systemSetting().defaultProductImg}) no-repeat 50% 50%;
</#if>


.lazy {
  display: none;
}

</style>
<script type="text/javascript">
function defaultProductImg(){ 
	var img=event.srcElement; 
	img.src="${systemSetting().defaultProductImg}";
	img.onerror=null; //控制不要一直跳动 
}
</script>

<@menu.menu selectMenu=mainCatalogCode/>
	<div class="container">
		<div class="row">
			<div class="col-xs-12">
				<!-- 导航栏 -->
				<div class="row">
					<#if e.mainCatalogName??>
                    <div class="breadcrumbBox">
                        <ul class="breadcrumb"  style="margin-bottom: 10px; height:35px; line-height:20px;margin-top:10px; background:none; ">
                            <li class="active"><a href="${basepath}/catalog/${mainCatalogCode}.html">${e.mainCatalogName!""}</a></li>
							<#if e.childrenCatalogName??>
                                <li class="active"><a href="#">${e.childrenCatalogName!""}</a></li>
							</#if>
                        </ul>
                        <span>一共<strong>40000</strong>个模板</span>
                    </div>
					</#if>
				</div>
				<div class="row">
					<div class="col-xs-12">
                        <section class="category-nav">
                            <div id="category-search-nav">
                                <!-- hd -->
                                <div class="big-type">
                                    <ul class="clearfix">
										<#--<#list systemManager().catalogs as item>-->
											<#--<#if item.showInNav == "y">-->
                                                <#--<li class="${(item.code == selectMenu)?string("active","")}"><a href="${basepath}/catalog/${item.code}.html">${item.name}</a></li>-->
                                                <#--<span class="sep">|</span>-->
											<#--</#if>-->
										<#--</#list>-->
                                        <li class="" data-big-type="1">PPT模板</li>
                                        <span class="sep">|</span>
                                        <li data-big-type="2" class="">WORD文字</li>
                                        <span class="sep">|</span>
                                        <li data-big-type="3" >EXCEL表格</li>
                                        <span class="sep">|</span>
                                        <li data-big-type="4" >AE模板</li>
                                        <span class="sep">|</span>
                                        <li data-big-type="5">表情包</li>
                                        <span class="sep">|</span>
                                        <li data-big-type="6">H5模板</li>
                                    </ul>
                                </div>
                                <!-- bd -->
                                <div class="tab-body">
                                    <div class="detail-type" data-big-type="1" style="display: none;">
                                        <div class="mlt-list clearfix">
                                            <h3 class="mlt-title">用途</h3>
                                            <div class="mlt-tags" data-type="templateQuery.type1">
                                                <a data-value="0" href="#" class="selected">不限</a>
                                                <a data-value="1" href="#">3D</a>
                                                <a data-value="2" href="#">ITPC多媒体</a>
                                                <a data-value="3" href="#">不动产家庭</a>
                                                <a data-value="4" href="#">当前热门</a>
                                                <a data-value="5" href="#">法律领土</a>
                                                <a data-value="6" href="#">工业建筑</a>
                                                <a data-value="7" href="#">节日庆典</a>
                                                <a data-value="8" href="#">流行时尚</a>
                                                <a data-value="9" href="#">其他</a>
                                                <div class="tags-btn">
                                                    <button type="button" class="btn btn-alpha mlt-select-ok">确定</button>
                                                    <button type="button" class="btn btn-alpha mlt-select-cancel">取消</button>
                                                </div>
                                            </div>
                                            <button type="button" class="btn btn-alpha mlt-more" style="display: none;">更多</button>
                                            <button type="button" class="btn btn-alpha mlt-select">多选</button>
                                        </div>
                                        <div class="mlt-list clearfix">
                                            <h3 class="mlt-title">行业</h3>
                                            <div class="mlt-tags" data-type="templateQuery.type2">
                                                <a data-value="0" href="#" class="selected">不限</a>
                                                <a data-value="1" href="#">互联网</a>
                                                <a data-value="2" href="#">科技</a>
                                                <a data-value="3" href="#">交通</a>
                                                <a data-value="4" href="#">教育</a>
                                                <a data-value="5" href="#">医药</a>
                                                <a data-value="6" href="#">艺术</a>
                                                <a data-value="7" href="#">广告</a>
                                                <a data-value="8" href="#">金融</a>
                                                <a data-value="9" href="#">房地产</a>
                                                <a data-value="10" href="#">党政</a>
                                                <a data-value="11" href="#">影视</a>
                                                <a data-value="12" href="#">能源</a>
                                                <div class="tags-btn">
                                                    <button type="button" class="btn btn-alpha mlt-select-ok">确定</button>
                                                    <button type="button" class="btn btn-alpha mlt-select-cancel">取消</button>
                                                </div>
                                            </div>
                                            <button type="button" class="btn btn-alpha mlt-more" style="display: none;">更多</button>
                                            <button type="button" class="btn btn-alpha mlt-select">多选</button>
                                        </div>
                                        <div class="mlt-list clearfix">
                                            <h3 class="mlt-title">风格</h3>
                                            <div class="mlt-tags" data-type="templateQuery.type3">
                                                <a data-value="0" href="#" class="selected">不限</a>
                                                <a data-value="1" href="#">商务</a>
                                                <a data-value="2" href="#">简约</a>
                                                <a data-value="3" href="#">复古风</a>
                                                <a data-value="4" href="#">创意</a>
                                                <a data-value="5" href="#">设计</a>
                                                <a data-value="6" href="#">欧美风</a>
                                                <a data-value="7" href="#">清新</a>
                                                <a data-value="8" href="#">淡雅</a>
                                                <a data-value="9" href="#">可爱</a>
                                                <a data-value="10" href="#">中国风</a>
                                                <div class="tags-btn">
                                                    <button type="button" class="btn btn-alpha mlt-select-ok">确定</button>
                                                    <button type="button" class="btn btn-alpha mlt-select-cancel">取消</button>
                                                </div>
                                            </div>
                                            <button type="button" class="btn btn-alpha mlt-more" style="display: none;">更多</button>
                                            <button type="button" class="btn btn-alpha mlt-select">多选</button>
                                        </div>
                                        <div class="mlt-list clearfix">
                                            <h3 class="mlt-title">颜色</h3>
                                            <div class="mlt-tags" data-type="templateQuery.type4">
                                                <a data-value="0" href="#" class="selected">不限</a>
                                                <a data-value="1" href="#">绿色</a>
                                                <a data-value="2" href="#">蓝色</a>
                                                <a data-value="3" href="#">紫色</a>
                                                <a data-value="4" href="#">黑色</a>
                                                <a data-value="5" href="#">粉色</a>
                                                <a data-value="6" href="#">红色</a>
                                                <a data-value="7" href="#">黄色</a>
                                                <a data-value="8" href="#">白色</a>
                                                <a data-value="9" href="#">灰色</a>
                                                <a data-value="10" href="#">彩色</a>
                                                <div class="tags-btn">
                                                    <button type="button" class="btn btn-alpha mlt-select-ok">确定</button>
                                                    <button type="button" class="btn btn-alpha mlt-select-cancel">取消</button>
                                                </div>
                                            </div>
                                            <button type="button" class="btn btn-alpha mlt-more" style="display: none;">更多</button>
                                            <button type="button" class="btn btn-alpha mlt-select">多选</button>
                                        </div>
                                    </div>
                                    <div class="detail-type" data-big-type="2" style="display: none;">
                                        <div class="mlt-list clearfix">
                                            <h3 class="mlt-title">用途</h3>
                                            <div class="mlt-tags" data-type="templateQuery.type1">
                                                <a data-value="0" href="#" class="selected">不限</a>
                                                <a data-value="1" href="#">工商税务</a>
                                                <a data-value="2" href="#">合同/协议/法律文书</a>
                                                <a data-value="3" href="#">红头公文</a>
                                                <a data-value="4" href="#">会议类/备忘录</a>
                                                <a data-value="5" href="#">技术文档</a>
                                                <a data-value="6" href="#">简历求职</a>
                                                <a data-value="7" href="#">节日贺卡</a>
                                                <a data-value="8" href="#">论文类</a>
                                                <a data-value="9" href="#">名片卡片</a>
                                                <a data-value="10" href="#">其他类别</a>
                                                <a data-value="11" href="#">人力资源</a>
                                                <a data-value="12" href="#">日历行程</a>
                                                <a data-value="13" href="#">通用文书</a>
                                                <a data-value="14" href="#">通用性行政公文</a>
                                                <a data-value="15" href="#">信封信笺</a>
                                                <a data-value="16" href="#">执行性行政公文</a>
                                                <a data-value="17" href="#">证书奖状</a>
                                                <div class="tags-btn">
                                                    <button type="button" class="btn btn-alpha mlt-select-ok">确定</button>
                                                    <button type="button" class="btn btn-alpha mlt-select-cancel">取消</button>
                                                </div>
                                            </div>
                                            <button type="button" class="btn btn-alpha mlt-more" style="display: inline-block;">更多</button>
                                            <button type="button" class="btn btn-alpha mlt-select">多选</button>
                                        </div>
                                        <div class="mlt-list clearfix">
                                            <h3 class="mlt-title">行业</h3>
                                            <div class="mlt-tags" data-type="templateQuery.type2">
                                                <a data-value="0" href="#" class="selected">不限</a>
                                                <a data-value="1" href="#">互联网</a>
                                                <a data-value="2" href="#">科技</a>
                                                <a data-value="3" href="#">交通</a>
                                                <a data-value="4" href="#">教育</a>
                                                <a data-value="5" href="#">医药</a>
                                                <a data-value="6" href="#">艺术</a>
                                                <a data-value="7" href="#">广告</a>
                                                <a data-value="8" href="#">金融</a>
                                                <a data-value="9" href="#">房地产</a>
                                                <a data-value="10" href="#">党政</a>
                                                <a data-value="11" href="#">影视</a>
                                                <a data-value="12" href="#">能源</a>
                                                <div class="tags-btn">
                                                    <button type="button" class="btn btn-alpha mlt-select-ok">确定</button>
                                                    <button type="button" class="btn btn-alpha mlt-select-cancel">取消</button>
                                                </div>
                                            </div>
                                            <button type="button" class="btn btn-alpha mlt-more" style="display: none;">更多</button>
                                            <button type="button" class="btn btn-alpha mlt-select">多选</button>
                                        </div>
                                        <div class="mlt-list clearfix">
                                            <h3 class="mlt-title">风格</h3>
                                            <div class="mlt-tags" data-type="templateQuery.type3">
                                                <a data-value="0" href="#" class="selected">不限</a>
                                                <a data-value="1" href="#">商务</a>
                                                <a data-value="2" href="#">简约</a>
                                                <a data-value="3" href="#">复古风</a>
                                                <a data-value="4" href="#">创意</a>
                                                <a data-value="5" href="#">设计</a>
                                                <a data-value="6" href="#">欧美风</a>
                                                <a data-value="7" href="#">清新</a>
                                                <a data-value="8" href="#">淡雅</a>
                                                <a data-value="9" href="#">可爱</a>
                                                <a data-value="10" href="#">中国风</a>
                                                <div class="tags-btn">
                                                    <button type="button" class="btn btn-alpha mlt-select-ok">确定</button>
                                                    <button type="button" class="btn btn-alpha mlt-select-cancel">取消</button>
                                                </div>
                                            </div>
                                            <button type="button" class="btn btn-alpha mlt-more" style="display: none;">更多</button>
                                            <button type="button" class="btn btn-alpha mlt-select">多选</button>
                                        </div>
                                        <div class="mlt-list clearfix">
                                            <h3 class="mlt-title">颜色</h3>
                                            <div class="mlt-tags" data-type="templateQuery.type4">
                                                <a data-value="0" href="#" class="selected">不限</a>
                                                <a data-value="1" href="#">绿色</a>
                                                <a data-value="2" href="#">蓝色</a>
                                                <a data-value="3" href="#">紫色</a>
                                                <a data-value="4" href="#">黑色</a>
                                                <a data-value="5" href="#">粉色</a>
                                                <a data-value="6" href="#">红色</a>
                                                <a data-value="7" href="#">黄色</a>
                                                <a data-value="8" href="#">白色</a>
                                                <a data-value="9" href="#">灰色</a>
                                                <a data-value="10" href="#">彩色</a>
                                                <div class="tags-btn">
                                                    <button type="button" class="btn btn-alpha mlt-select-ok">确定</button>
                                                    <button type="button" class="btn btn-alpha mlt-select-cancel">取消</button>
                                                </div>
                                            </div>
                                            <button type="button" class="btn btn-alpha mlt-more" style="display: none;">更多</button>
                                            <button type="button" class="btn btn-alpha mlt-select">多选</button>
                                        </div>
                                    </div>
                                    <div class="detail-type" data-big-type="3" style="display: block;">
                                        <div class="mlt-list clearfix">
                                            <h3 class="mlt-title">用途</h3>
                                            <div class="mlt-tags" data-type="templateQuery.type1">
                                                <a data-value="0" href="#" class="selected">不限</a>
                                                <a data-value="1" href="#">办公范文</a>
                                                <a data-value="2" href="#">表单表格</a>
                                                <a data-value="3" href="#">财务报表</a>
                                                <a data-value="4" href="#">个人理财</a>
                                                <a data-value="5" href="#">工商税务</a>
                                                <a data-value="6" href="#">购销发货</a>
                                                <a data-value="7" href="#">教育文化</a>
                                                <a data-value="8" href="#">经济/贸易/财会</a>
                                                <a data-value="9" href="#">年历月历</a>
                                                <a data-value="10" href="#">其他类别</a>
                                                <a data-value="11" href="#">人力资源</a>
                                                <a data-value="12" href="#">日程安排</a>
                                                <a data-value="13" href="#">医疗卫生</a>
                                                <a data-value="14" href="#">执行性行政公文</a>
                                                <div class="tags-btn">
                                                    <button type="button" class="btn btn-alpha mlt-select-ok">确定</button>
                                                    <button type="button" class="btn btn-alpha mlt-select-cancel">取消</button>
                                                </div>
                                            </div>
                                            <button type="button" class="btn btn-alpha mlt-more" style="display: inline-block;">更多</button>
                                            <button type="button" class="btn btn-alpha mlt-select">多选</button>
                                        </div>
                                        <div class="mlt-list clearfix">
                                            <h3 class="mlt-title">行业</h3>
                                            <div class="mlt-tags" data-type="templateQuery.type2">
                                                <a data-value="0" href="#" class="selected">不限</a>
                                                <a data-value="1" href="#">互联网</a>
                                                <a data-value="2" href="#">科技</a>
                                                <a data-value="3" href="#">交通</a>
                                                <a data-value="4" href="#">教育</a>
                                                <a data-value="5" href="#">医药</a>
                                                <a data-value="6" href="#">艺术</a>
                                                <a data-value="7" href="#">广告</a>
                                                <a data-value="8" href="#">金融</a>
                                                <a data-value="9" href="#">房地产</a>
                                                <a data-value="10" href="#">党政</a>
                                                <a data-value="11" href="#">影视</a>
                                                <a data-value="12" href="#">能源</a>
                                                <div class="tags-btn">
                                                    <button type="button" class="btn btn-alpha mlt-select-ok">确定</button>
                                                    <button type="button" class="btn btn-alpha mlt-select-cancel">取消</button>
                                                </div>
                                            </div>
                                            <button type="button" class="btn btn-alpha mlt-more" style="display: none;">更多</button>
                                            <button type="button" class="btn btn-alpha mlt-select">多选</button>
                                        </div>
                                        <div class="mlt-list clearfix">
                                            <h3 class="mlt-title">风格</h3>
                                            <div class="mlt-tags" data-type="templateQuery.type3">
                                                <a data-value="0" href="#" class="selected">不限</a>
                                                <a data-value="1" href="#">商务</a>
                                                <a data-value="2" href="#">简约</a>
                                                <a data-value="3" href="#">复古风</a>
                                                <a data-value="4" href="#">创意</a>
                                                <a data-value="5" href="#">设计</a>
                                                <a data-value="6" href="#">欧美风</a>
                                                <a data-value="7" href="#">清新</a>
                                                <a data-value="8" href="#">淡雅</a>
                                                <a data-value="9" href="#">可爱</a>
                                                <a data-value="10" href="#">中国风</a>
                                                <div class="tags-btn">
                                                    <button type="button" class="btn btn-alpha mlt-select-ok">确定</button>
                                                    <button type="button" class="btn btn-alpha mlt-select-cancel">取消</button>
                                                </div>
                                            </div>
                                            <button type="button" class="btn btn-alpha mlt-more" style="display: none;">更多</button>
                                            <button type="button" class="btn btn-alpha mlt-select">多选</button>
                                        </div>
                                        <div class="mlt-list clearfix">
                                            <h3 class="mlt-title">颜色</h3>
                                            <div class="mlt-tags" data-type="templateQuery.type4">
                                                <a data-value="0" href="#" class="selected">不限</a>
                                                <a data-value="1" href="#">绿色</a>
                                                <a data-value="2" href="#">蓝色</a>
                                                <a data-value="3" href="#">紫色</a>
                                                <a data-value="4" href="#">黑色</a>
                                                <a data-value="5" href="#">粉色</a>
                                                <a data-value="6" href="#">红色</a>
                                                <a data-value="7" href="#">黄色</a>
                                                <a data-value="8" href="#">白色</a>
                                                <a data-value="9" href="#">灰色</a>
                                                <a data-value="10" href="#">彩色</a>
                                                <div class="tags-btn">
                                                    <button type="button" class="btn btn-alpha mlt-select-ok">确定</button>
                                                    <button type="button" class="btn btn-alpha mlt-select-cancel">取消</button>
                                                </div>
                                            </div>
                                            <button type="button" class="btn btn-alpha mlt-more" style="display: none;">更多</button>
                                            <button type="button" class="btn btn-alpha mlt-select">多选</button>
                                        </div>
                                    </div>

                                    <div class="detail-type" data-big-type="4" style="display: none;">
                                        <div class="mlt-list clearfix">
                                            <h3 class="mlt-title">用途</h3>
                                            <div class="mlt-tags" data-type="templateQuery.type1">
                                                <a data-value="0" href="#" class="selected">不限</a>
                                                <a data-value="1" href="#">444444</a>
                                                <a data-value="2" href="#">表单表格</a>
                                                <a data-value="3" href="#">财务报表</a>
                                                <a data-value="4" href="#">个人理财</a>
                                                <a data-value="5" href="#">工商税务</a>
                                                <a data-value="6" href="#">购销发货</a>
                                                <a data-value="7" href="#">教育文化</a>
                                                <a data-value="8" href="#">经济/贸易/财会</a>
                                                <a data-value="9" href="#">年历月历</a>
                                                <a data-value="10" href="#">其他类别</a>
                                                <a data-value="11" href="#">人力资源</a>
                                                <a data-value="12" href="#">日程安排</a>
                                                <a data-value="13" href="#">医疗卫生</a>
                                                <a data-value="14" href="#">执行性行政公文</a>
                                                <div class="tags-btn">
                                                    <button type="button" class="btn btn-alpha mlt-select-ok">确定</button>
                                                    <button type="button" class="btn btn-alpha mlt-select-cancel">取消</button>
                                                </div>
                                            </div>
                                            <button type="button" class="btn btn-alpha mlt-more" style="display: inline-block;">更多</button>
                                            <button type="button" class="btn btn-alpha mlt-select">多选</button>
                                        </div>
                                        <div class="mlt-list clearfix">
                                            <h3 class="mlt-title">行业</h3>
                                            <div class="mlt-tags" data-type="templateQuery.type2">
                                                <a data-value="0" href="#" class="selected">不限</a>
                                                <a data-value="1" href="#">互联网</a>
                                                <a data-value="2" href="#">科技</a>
                                                <a data-value="3" href="#">交通</a>
                                                <a data-value="4" href="#">教育</a>
                                                <a data-value="5" href="#">医药</a>
                                                <a data-value="6" href="#">艺术</a>
                                                <a data-value="7" href="#">广告</a>
                                                <a data-value="8" href="#">金融</a>
                                                <a data-value="9" href="#">房地产</a>
                                                <a data-value="10" href="#">党政</a>
                                                <a data-value="11" href="#">影视</a>
                                                <a data-value="12" href="#">能源</a>
                                                <div class="tags-btn">
                                                    <button type="button" class="btn btn-alpha mlt-select-ok">确定</button>
                                                    <button type="button" class="btn btn-alpha mlt-select-cancel">取消</button>
                                                </div>
                                            </div>
                                            <button type="button" class="btn btn-alpha mlt-more" style="display: none;">更多</button>
                                            <button type="button" class="btn btn-alpha mlt-select">多选</button>
                                        </div>
                                        <div class="mlt-list clearfix">
                                            <h3 class="mlt-title">风格</h3>
                                            <div class="mlt-tags" data-type="templateQuery.type3">
                                                <a data-value="0" href="#" class="selected">不限</a>
                                                <a data-value="1" href="#">商务</a>
                                                <a data-value="2" href="#">简约</a>
                                                <a data-value="3" href="#">复古风</a>
                                                <a data-value="4" href="#">创意</a>
                                                <a data-value="5" href="#">设计</a>
                                                <a data-value="6" href="#">欧美风</a>
                                                <a data-value="7" href="#">清新</a>
                                                <a data-value="8" href="#">淡雅</a>
                                                <a data-value="9" href="#">可爱</a>
                                                <a data-value="10" href="#">中国风</a>
                                                <div class="tags-btn">
                                                    <button type="button" class="btn btn-alpha mlt-select-ok">确定</button>
                                                    <button type="button" class="btn btn-alpha mlt-select-cancel">取消</button>
                                                </div>
                                            </div>
                                            <button type="button" class="btn btn-alpha mlt-more" style="display: none;">更多</button>
                                            <button type="button" class="btn btn-alpha mlt-select">多选</button>
                                        </div>
                                        <div class="mlt-list clearfix">
                                            <h3 class="mlt-title">颜色</h3>
                                            <div class="mlt-tags" data-type="templateQuery.type4">
                                                <a data-value="0" href="#" class="selected">不限</a>
                                                <a data-value="1" href="#">绿色</a>
                                                <a data-value="2" href="#">蓝色</a>
                                                <a data-value="3" href="#">紫色</a>
                                                <a data-value="4" href="#">黑色</a>
                                                <a data-value="5" href="#">粉色</a>
                                                <a data-value="6" href="#">红色</a>
                                                <a data-value="7" href="#">黄色</a>
                                                <a data-value="8" href="#">白色</a>
                                                <a data-value="9" href="#">灰色</a>
                                                <a data-value="10" href="#">彩色</a>
                                                <div class="tags-btn">
                                                    <button type="button" class="btn btn-alpha mlt-select-ok">确定</button>
                                                    <button type="button" class="btn btn-alpha mlt-select-cancel">取消</button>
                                                </div>
                                            </div>
                                            <button type="button" class="btn btn-alpha mlt-more" style="display: none;">更多</button>
                                            <button type="button" class="btn btn-alpha mlt-select">多选</button>
                                        </div>
                                    </div>
                                    <div class="detail-type" data-big-type="5" style="display: none;">
                                        <div class="mlt-list clearfix">
                                            <h3 class="mlt-title">用途</h3>
                                            <div class="mlt-tags" data-type="templateQuery.type1">
                                                <a data-value="0" href="#" class="selected">不限</a>
                                                <a data-value="1" href="#">5555555</a>
                                                <a data-value="2" href="#">表单表格</a>
                                                <a data-value="3" href="#">财务报表</a>
                                                <a data-value="4" href="#">个人理财</a>
                                                <a data-value="5" href="#">工商税务</a>
                                                <a data-value="6" href="#">购销发货</a>
                                                <a data-value="7" href="#">教育文化</a>
                                                <a data-value="8" href="#">经济/贸易/财会</a>
                                                <a data-value="9" href="#">年历月历</a>
                                                <a data-value="10" href="#">其他类别</a>
                                                <a data-value="11" href="#">人力资源</a>
                                                <a data-value="12" href="#">日程安排</a>
                                                <a data-value="13" href="#">医疗卫生</a>
                                                <a data-value="14" href="#">执行性行政公文</a>
                                                <div class="tags-btn">
                                                    <button type="button" class="btn btn-alpha mlt-select-ok">确定</button>
                                                    <button type="button" class="btn btn-alpha mlt-select-cancel">取消</button>
                                                </div>
                                            </div>
                                            <button type="button" class="btn btn-alpha mlt-more" style="display: inline-block;">更多</button>
                                            <button type="button" class="btn btn-alpha mlt-select">多选</button>
                                        </div>
                                        <div class="mlt-list clearfix">
                                            <h3 class="mlt-title">行业</h3>
                                            <div class="mlt-tags" data-type="templateQuery.type2">
                                                <a data-value="0" href="#" class="selected">不限</a>
                                                <a data-value="1" href="#">互联网</a>
                                                <a data-value="2" href="#">科技</a>
                                                <a data-value="3" href="#">交通</a>
                                                <a data-value="4" href="#">教育</a>
                                                <a data-value="5" href="#">医药</a>
                                                <a data-value="6" href="#">艺术</a>
                                                <a data-value="7" href="#">广告</a>
                                                <a data-value="8" href="#">金融</a>
                                                <a data-value="9" href="#">房地产</a>
                                                <a data-value="10" href="#">党政</a>
                                                <a data-value="11" href="#">影视</a>
                                                <a data-value="12" href="#">能源</a>
                                                <div class="tags-btn">
                                                    <button type="button" class="btn btn-alpha mlt-select-ok">确定</button>
                                                    <button type="button" class="btn btn-alpha mlt-select-cancel">取消</button>
                                                </div>
                                            </div>
                                            <button type="button" class="btn btn-alpha mlt-more" style="display: none;">更多</button>
                                            <button type="button" class="btn btn-alpha mlt-select">多选</button>
                                        </div>
                                        <div class="mlt-list clearfix">
                                            <h3 class="mlt-title">风格</h3>
                                            <div class="mlt-tags" data-type="templateQuery.type3">
                                                <a data-value="0" href="#" class="selected">不限</a>
                                                <a data-value="1" href="#">商务</a>
                                                <a data-value="2" href="#">简约</a>
                                                <a data-value="3" href="#">复古风</a>
                                                <a data-value="4" href="#">创意</a>
                                                <a data-value="5" href="#">设计</a>
                                                <a data-value="6" href="#">欧美风</a>
                                                <a data-value="7" href="#">清新</a>
                                                <a data-value="8" href="#">淡雅</a>
                                                <a data-value="9" href="#">可爱</a>
                                                <a data-value="10" href="#">中国风</a>
                                                <div class="tags-btn">
                                                    <button type="button" class="btn btn-alpha mlt-select-ok">确定</button>
                                                    <button type="button" class="btn btn-alpha mlt-select-cancel">取消</button>
                                                </div>
                                            </div>
                                            <button type="button" class="btn btn-alpha mlt-more" style="display: none;">更多</button>
                                            <button type="button" class="btn btn-alpha mlt-select">多选</button>
                                        </div>
                                        <div class="mlt-list clearfix">
                                            <h3 class="mlt-title">颜色</h3>
                                            <div class="mlt-tags" data-type="templateQuery.type4">
                                                <a data-value="0" href="#" class="selected">不限</a>
                                                <a data-value="1" href="#">绿色</a>
                                                <a data-value="2" href="#">蓝色</a>
                                                <a data-value="3" href="#">紫色</a>
                                                <a data-value="4" href="#">黑色</a>
                                                <a data-value="5" href="#">粉色</a>
                                                <a data-value="6" href="#">红色</a>
                                                <a data-value="7" href="#">黄色</a>
                                                <a data-value="8" href="#">白色</a>
                                                <a data-value="9" href="#">灰色</a>
                                                <a data-value="10" href="#">彩色</a>
                                                <div class="tags-btn">
                                                    <button type="button" class="btn btn-alpha mlt-select-ok">确定</button>
                                                    <button type="button" class="btn btn-alpha mlt-select-cancel">取消</button>
                                                </div>
                                            </div>
                                            <button type="button" class="btn btn-alpha mlt-more" style="display: none;">更多</button>
                                            <button type="button" class="btn btn-alpha mlt-select">多选</button>
                                        </div>
                                    </div>
                                    <div class="detail-type" data-big-type="6" style="display: none;">
                                        <div class="mlt-list clearfix">
                                            <h3 class="mlt-title">用途</h3>
                                            <div class="mlt-tags" data-type="templateQuery.type1">
                                                <a data-value="0" href="#" class="selected">不限</a>
                                                <a data-value="1" href="#">666666</a>
                                                <a data-value="2" href="#">表单表格</a>
                                                <a data-value="3" href="#">财务报表</a>
                                                <a data-value="4" href="#">个人理财</a>
                                                <a data-value="5" href="#">工商税务</a>
                                                <a data-value="6" href="#">购销发货</a>
                                                <a data-value="7" href="#">教育文化</a>
                                                <a data-value="8" href="#">经济/贸易/财会</a>
                                                <a data-value="9" href="#">年历月历</a>
                                                <a data-value="10" href="#">其他类别</a>
                                                <a data-value="11" href="#">人力资源</a>
                                                <a data-value="12" href="#">日程安排</a>
                                                <a data-value="13" href="#">医疗卫生</a>
                                                <a data-value="14" href="#">执行性行政公文</a>
                                                <div class="tags-btn">
                                                    <button type="button" class="btn btn-alpha mlt-select-ok">确定</button>
                                                    <button type="button" class="btn btn-alpha mlt-select-cancel">取消</button>
                                                </div>
                                            </div>
                                            <button type="button" class="btn btn-alpha mlt-more" style="display: inline-block;">更多</button>
                                            <button type="button" class="btn btn-alpha mlt-select">多选</button>
                                        </div>
                                        <div class="mlt-list clearfix">
                                            <h3 class="mlt-title">行业</h3>
                                            <div class="mlt-tags" data-type="templateQuery.type2">
                                                <a data-value="0" href="#" class="selected">不限</a>
                                                <a data-value="1" href="#">互联网</a>
                                                <a data-value="2" href="#">科技</a>
                                                <a data-value="3" href="#">交通</a>
                                                <a data-value="4" href="#">教育</a>
                                                <a data-value="5" href="#">医药</a>
                                                <a data-value="6" href="#">艺术</a>
                                                <a data-value="7" href="#">广告</a>
                                                <a data-value="8" href="#">金融</a>
                                                <a data-value="9" href="#">房地产</a>
                                                <a data-value="10" href="#">党政</a>
                                                <a data-value="11" href="#">影视</a>
                                                <a data-value="12" href="#">能源</a>
                                                <div class="tags-btn">
                                                    <button type="button" class="btn btn-alpha mlt-select-ok">确定</button>
                                                    <button type="button" class="btn btn-alpha mlt-select-cancel">取消</button>
                                                </div>
                                            </div>
                                            <button type="button" class="btn btn-alpha mlt-more" style="display: none;">更多</button>
                                            <button type="button" class="btn btn-alpha mlt-select">多选</button>
                                        </div>
                                        <div class="mlt-list clearfix">
                                            <h3 class="mlt-title">风格</h3>
                                            <div class="mlt-tags" data-type="templateQuery.type3">
                                                <a data-value="0" href="#" class="selected">不限</a>
                                                <a data-value="1" href="#">商务</a>
                                                <a data-value="2" href="#">简约</a>
                                                <a data-value="3" href="#">复古风</a>
                                                <a data-value="4" href="#">创意</a>
                                                <a data-value="5" href="#">设计</a>
                                                <a data-value="6" href="#">欧美风</a>
                                                <a data-value="7" href="#">清新</a>
                                                <a data-value="8" href="#">淡雅</a>
                                                <a data-value="9" href="#">可爱</a>
                                                <a data-value="10" href="#">中国风</a>
                                                <div class="tags-btn">
                                                    <button type="button" class="btn btn-alpha mlt-select-ok">确定</button>
                                                    <button type="button" class="btn btn-alpha mlt-select-cancel">取消</button>
                                                </div>
                                            </div>
                                            <button type="button" class="btn btn-alpha mlt-more" style="display: none;">更多</button>
                                            <button type="button" class="btn btn-alpha mlt-select">多选</button>
                                        </div>
                                        <div class="mlt-list clearfix">
                                            <h3 class="mlt-title">颜色</h3>
                                            <div class="mlt-tags" data-type="templateQuery.type4">
                                                <a data-value="0" href="#" class="selected">不限</a>
                                                <a data-value="1" href="#">绿色</a>
                                                <a data-value="2" href="#">蓝色</a>
                                                <a data-value="3" href="#">紫色</a>
                                                <a data-value="4" href="#">黑色</a>
                                                <a data-value="5" href="#">粉色</a>
                                                <a data-value="6" href="#">红色</a>
                                                <a data-value="7" href="#">黄色</a>
                                                <a data-value="8" href="#">白色</a>
                                                <a data-value="9" href="#">灰色</a>
                                                <a data-value="10" href="#">彩色</a>
                                                <div class="tags-btn">
                                                    <button type="button" class="btn btn-alpha mlt-select-ok">确定</button>
                                                    <button type="button" class="btn btn-alpha mlt-select-cancel">取消</button>
                                                </div>
                                            </div>
                                            <button type="button" class="btn btn-alpha mlt-more" style="display: none;">更多</button>
                                            <button type="button" class="btn btn-alpha mlt-select">多选</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <nav class="order-nav">
                                <ul class="clearfix" data-type="templateQuery.orderBy">
                                    <li class="active" data-value="1">
                                        <a href="#">人气</a>
                                    </li>
                                    <li data-value="2">
                                        <a href="#">时间</a>
                                    </li>
                                    <li data-value="3">
                                        <a href="#">销量</a>
                                    </li>
                                    <li data-value="4">
                                        <a href="#">收藏</a>
                                    </li>
                                </ul>
                            </nav>

                        </section>
                        <section class="category-list" style="width:1200px;margin: 0 auto;margin-bottom:50px;">

                            <div class="content">
                                <ul class="mb-wrap clearfix">
                                    <li class="mb-item" >
                                        <i class="vip">会员免费</i>
                                        <a href="#" target="_blank"><img src="${basepath}/resource/images/yomo/jp01.jpg" alt=""></a>
                                        <div class="mb_content">
                                            <ul class="icon clearfix">
                                                <li><a href="javascript:;" class="tc">加入购物车</a></li>
                                                <li><a href="javascript:;" class="tc">立即购买</a></li>
                                            </ul>
                                        </div>
                                        <h3 title="企业重大会议日程安排提醒表" class="mb-title"><a href="#">企业重大会议日程安排提醒表</a></h3>
                                    </li>
                                    <li class="mb-item" ><a href="#" target="_blank">
                                        <img src="${basepath}/resource/images/yomo/jp01.jpg" alt=""></a>

                                        <div class="mb_content">
                                            <ul class="icon clearfix">
                                                <li><a href="#">加入购物车</a></li>
                                                <li><a href="#">立即购买</a></li>
                                            </ul>
                                        </div>
                                        <h3 title="暑假计划表" class="mb-title"><a href="#">暑假计划表</a></h3>
                                    </li>
                                    <li class="mb-item" ><a href="#" target="_blank">
                                        <img src="${basepath}/resource/images/yomo/jp02.jpg" alt=""></a>

                                        <div class="mb_content">
                                            <ul class="icon clearfix">
                                                <li><a href="#">加入购物车</a></li>
                                                <li><a href="#">立即购买</a></li>
                                            </ul>

                                        </div>
                                        <h3 title="课程表3" class="mb-title"><a href="#">课程表3</a></h3>
                                    </li>
                                    <li class="mb-item" ><a href="#" target="_blank">
                                        <img src="${basepath}/resource/images/yomo/jp03.jpg" alt=""></a>
                                        <div class="mb_content">
                                            <ul class="icon clearfix">
                                                <li><a href="#">加入购物车</a></li>
                                                <li><a href="#">立即购买</a></li>
                                            </ul>
                                        </div>
                                        <h3 title="课程表2" class="mb-title"><a href="#">课程表2</a></h3>
                                    </li>
                                    <li class="mb-item" ><a href="#" target="_blank">
                                        <img src="${basepath}/resource/images/yomo/jp04.jpg" alt=""></a>
                                        <div class="mb_content">
                                            <ul class="icon clearfix">
                                                <li><a href="#">加入购物车</a></li>
                                                <li><a href="#">立即购买</a></li>
                                            </ul>
                                        </div>
                                        <h3 title="课程表2" class="mb-title"><a href="#">课程表2</a></h3>
                                    </li>
                                    <li class="mb-item" >
                                        <a href="#" target="_blank">
                                            <img src="${basepath}/resource/images/yomo/jp01.jpg" alt=""></a>
                                        <div class="mb_content">
                                            <ul class="icon clearfix">
                                                <li><a href="#">加入购物车</a></li>
                                                <li><a href="#">立即购买</a></li>
                                            </ul>
                                        </div>
                                        <h3 title="企业重大会议日程安排提醒表" class="mb-title"><a href="#">企业重大会议日程安排提醒表</a></h3>
                                    </li>
                                    <li class="mb-item" ><a href="#" target="_blank">
                                        <img src="${basepath}/resource/images/yomo/jp01.jpg" alt=""></a>

                                        <div class="mb_content">
                                            <ul class="icon clearfix">
                                                <li><a href="#">加入购物车</a></li>
                                                <li><a href="#">立即购买</a></li>
                                            </ul>
                                        </div>
                                        <h3 title="暑假计划表" class="mb-title"><a href="#">暑假计划表</a></h3>
                                    </li>
                                    <li class="mb-item" ><a href="#" target="_blank">
                                        <img src="${basepath}/resource/images/yomo/jp02.jpg" alt=""></a>

                                        <div class="mb_content">
                                            <ul class="icon clearfix">
                                                <li><a href="#">加入购物车</a></li>
                                                <li><a href="#">立即购买</a></li>
                                            </ul>

                                        </div>
                                        <h3 title="课程表3" class="mb-title"><a href="#">课程表3</a></h3>
                                    </li>
                                    <li class="mb-item" ><a href="#" target="_blank">
                                        <img src="${basepath}/resource/images/yomo/jp03.jpg" alt=""></a>
                                        <div class="mb_content">
                                            <ul class="icon clearfix">
                                                <li><a href="#">加入购物车</a></li>
                                                <li><a href="#">立即购买</a></li>
                                            </ul>
                                        </div>
                                        <h3 title="课程表2" class="mb-title"><a href="#">课程表2</a></h3>
                                    </li>
                                    <li class="mb-item" ><a href="#" target="_blank">
                                        <img src="${basepath}/resource/images/yomo/jp04.jpg" alt=""></a>
                                        <div class="mb_content">
                                            <ul class="icon clearfix">
                                                <li><a href="#">加入购物车</a></li>
                                                <li><a href="#">立即购买</a></li>
                                            </ul>
                                        </div>
                                        <h3 title="课程表2" class="mb-title"><a href="#">课程表2</a></h3>
                                    </li>
                                    <li class="mb-item" >
                                        <a href="#" target="_blank">
                                            <img src="${basepath}/resource/images/yomo/jp01.jpg" alt=""></a>
                                        <div class="mb_content">
                                            <ul class="icon clearfix">
                                                <li><a href="#">加入购物车</a></li>
                                                <li><a href="#">立即购买</a></li>
                                            </ul>
                                        </div>
                                        <h3 title="企业重大会议日程安排提醒表" class="mb-title"><a href="#">企业重大会议日程安排提醒表</a></h3>
                                    </li>
                                    <li class="mb-item" ><a href="#" target="_blank">
                                        <img src="${basepath}/resource/images/yomo/jp01.jpg" alt=""></a>

                                        <div class="mb_content">
                                            <ul class="icon clearfix">
                                                <li><a href="#">加入购物车</a></li>
                                                <li><a href="#">立即购买</a></li>
                                            </ul>
                                        </div>
                                        <h3 title="暑假计划表" class="mb-title"><a href="#">暑假计划表</a></h3>
                                    </li>
                                    <li class="mb-item" ><a href="#" target="_blank">
                                        <img src="${basepath}/resource/images/yomo/jp02.jpg" alt=""></a>

                                        <div class="mb_content">
                                            <ul class="icon clearfix">
                                                <li><a href="#">加入购物车</a></li>
                                                <li><a href="#">立即购买</a></li>
                                            </ul>

                                        </div>
                                        <h3 title="课程表3" class="mb-title"><a href="#">课程表3</a></h3>
                                    </li>
                                    <li class="mb-item" ><a href="#" target="_blank">
                                        <img src="${basepath}/resource/images/yomo/jp03.jpg" alt=""></a>
                                        <div class="mb_content">
                                            <div class="icon clearfix">
                                                <a href="#">下载</a>
                                                <a href="#">QQ分享</a>
                                            </div>
                                        </div>
                                        <h3 title="课程表2" class="mb-title"><a href="#">课程表2</a></h3>
                                    </li>
                                    <li class="mb-item" ><a href="#" target="_blank">
                                        <img src="${basepath}/resource/images/yomo/jp04.jpg" alt=""></a>
                                        <div class="mb_content">
                                            <ul class="icon clearfix">
                                                <li><a href="#">加入购物车</a></li>
                                                <li><a href="#">立即购买</a></li>
                                            </ul>
                                        </div>
                                        <h3 title="课程表2" class="mb-title"><a href="#">课程表2</a></h3>
                                    </li>

                                    <li class="mb-item" ><a href="#" target="_blank">
                                        <img src="${basepath}/resource/images/yomo/jp04.jpg" alt=""></a>
                                        <div class="mb_content">
                                            <ul class="icon clearfix">
                                                <li><a href="#">加入购物车</a></li>
                                                <li><a href="#">立即购买</a></li>
                                            </ul>
                                        </div>
                                        <h3 title="课程表2" class="mb-title"><a href="#">课程表2</a></h3>
                                    </li>
                                    <li class="mb-item" ><a href="#" target="_blank">
                                        <img src="${basepath}/resource/images/yomo/jp04.jpg" alt=""></a>
                                        <div class="mb_content">
                                            <ul class="icon clearfix">
                                                <li><a href="#">加入购物车</a></li>
                                                <li><a href="#">立即购买</a></li>
                                            </ul>
                                        </div>
                                        <h3 title="课程表2" class="mb-title"><a href="#">课程表2</a></h3>
                                    </li>
                                    <li class="mb-item" ><a href="#" target="_blank">
                                        <img src="${basepath}/resource/images/yomo/jp04.jpg" alt=""></a>
                                        <div class="mb_content">
                                            <ul class="icon clearfix">
                                                <li><a href="#">加入购物车</a></li>
                                                <li><a href="#">立即购买</a></li>
                                            </ul>
                                        </div>
                                        <h3 title="课程表2" class="mb-title"><a href="#">课程表2</a></h3>
                                    </li>
                                    <li class="mb-item" ><a href="#" target="_blank">
                                        <img src="${basepath}/resource/images/yomo/jp04.jpg" alt=""></a>
                                        <div class="mb_content">
                                            <ul class="icon clearfix">
                                                <li><a href="#">加入购物车</a></li>
                                                <li><a href="#">立即购买</a></li>
                                            </ul>
                                        </div>
                                        <h3 title="课程表2" class="mb-title"><a href="#">课程表2</a></h3>
                                    </li>
                                    <li class="mb-item" ><a href="#" target="_blank">
                                        <img src="${basepath}/resource/images/yomo/jp04.jpg" alt=""></a>
                                        <div class="mb_content">
                                            <ul class="icon clearfix">
                                                <li><a href="#">加入购物车</a></li>
                                                <li><a href="#">立即购买</a></li>
                                            </ul>
                                        </div>
                                        <h3 title="课程表2" class="mb-title"><a href="#">课程表2</a></h3>
                                    </li>
                                    <li class="mb-item" ><a href="#" target="_blank">
                                        <img src="${basepath}/resource/images/yomo/jp04.jpg" alt=""></a>
                                        <div class="mb_content">
                                            <ul class="icon clearfix">
                                                <li><a href="#">加入购物车</a></li>
                                                <li><a href="#">立即购买</a></li>
                                            </ul>
                                        </div>
                                        <h3 title="课程表2" class="mb-title"><a href="#">课程表2</a></h3>
                                    </li>
                                    <li class="mb-item" ><a href="#" target="_blank">
                                        <img src="${basepath}/resource/images/yomo/jp04.jpg" alt=""></a>
                                        <div class="mb_content">
                                            <ul class="icon clearfix">
                                                <li><a href="#">加入购物车</a></li>
                                                <li><a href="#">立即购买</a></li>
                                            </ul>
                                        </div>
                                        <h3 title="课程表2" class="mb-title"><a href="#">课程表2</a></h3>
                                    </li>
                                    <li class="mb-item" ><a href="#" target="_blank">
                                        <img src="${basepath}/resource/images/yomo/jp04.jpg" alt=""></a>
                                        <div class="mb_content">
                                            <ul class="icon clearfix">
                                                <li><a href="#">加入购物车</a></li>
                                                <li><a href="#">立即购买</a></li>
                                            </ul>
                                        </div>
                                        <h3 title="课程表2" class="mb-title"><a href="#">课程表2</a></h3>
                                    </li>
                                    <li class="mb-item" ><a href="#" target="_blank">
                                        <img src="${basepath}/resource/images/yomo/jp04.jpg" alt=""></a>
                                        <div class="mb_content">
                                            <ul class="icon clearfix">
                                                <li><a href="#">加入购物车</a></li>
                                                <li><a href="#">立即购买</a></li>
                                            </ul>
                                        </div>
                                        <h3 title="课程表2" class="mb-title"><a href="#">课程表2</a></h3>
                                    </li>
                                    <li class="mb-item" ><a href="#" target="_blank">
                                        <img src="${basepath}/resource/images/yomo/jp04.jpg" alt=""></a>
                                        <div class="mb_content">
                                            <ul class="icon clearfix">
                                                <li><a href="#">加入购物车</a></li>
                                                <li><a href="#">立即购买</a></li>
                                            </ul>
                                        </div>
                                        <h3 title="课程表2" class="mb-title"><a href="#">课程表2</a></h3>
                                    </li>
                                    <li class="mb-item" ><a href="#" target="_blank">
                                        <img src="${basepath}/resource/images/yomo/jp04.jpg" alt=""></a>
                                        <div class="mb_content">
                                            <ul class="icon clearfix">
                                                <li><a href="#">加入购物车</a></li>
                                                <li><a href="#">立即购买</a></li>
                                            </ul>
                                        </div>
                                        <h3 title="课程表2" class="mb-title"><a href="#">课程表2</a></h3>
                                    </li>
                                    <li class="mb-item" ><a href="#" target="_blank">
                                        <img src="${basepath}/resource/images/yomo/jp04.jpg" alt=""></a>
                                        <div class="mb_content">
                                            <ul class="icon clearfix">
                                                <li><a href="#">加入购物车</a></li>
                                                <li><a href="#">立即购买</a></li>
                                            </ul>
                                        </div>
                                        <h3 title="课程表2" class="mb-title"><a href="#">课程表2</a></h3>
                                    </li>
                                    <li class="mb-item" ><a href="#" target="_blank">
                                        <img src="${basepath}/resource/images/yomo/jp04.jpg" alt=""></a>
                                        <div class="mb_content">
                                            <ul class="icon clearfix">
                                                <li><a href="#">加入购物车</a></li>
                                                <li><a href="#">立即购买</a></li>
                                            </ul>
                                        </div>
                                        <h3 title="课程表2" class="mb-title"><a href="#">课程表2</a></h3>
                                    </li>
                                    <li class="mb-item" ><a href="#" target="_blank">
                                        <img src="${basepath}/resource/images/yomo/jp04.jpg" alt=""></a>
                                        <div class="mb_content">
                                            <ul class="icon clearfix">
                                                <li><a href="#">加入购物车</a></li>
                                                <li><a href="#">立即购买</a></li>
                                            </ul>
                                        </div>
                                        <h3 title="课程表2" class="mb-title"><a href="#">课程表2</a></h3>
                                    </li>
                                    <li class="mb-item" ><a href="#" target="_blank">
                                        <img src="${basepath}/resource/images/yomo/jp04.jpg" alt=""></a>
                                        <div class="mb_content">
                                            <ul class="icon clearfix">
                                                <li><a href="#">加入购物车</a></li>
                                                <li><a href="#">立即购买</a></li>
                                            </ul>
                                        </div>
                                        <h3 title="课程表2" class="mb-title"><a href="#">课程表2</a></h3>
                                    </li>
                                </ul>
                                <div class="get-more">
                                    <button class="btn btn-lava">点击查看更多</button>
                                </div>

                            </div>
                        </section>
					</div>
				</div>
				<!-- 条件搜索栏 -->
				<div class="row" style="margin: 10px 0px;">
					<div class="col-xs-12">
						<#if catalogChildren??>
							<div>
								<span style="margin:5px;font-weight: bold;">分类</span>
								<#list catalogChildren as item>
									<span class="label ${(catalogCode?? && item.code==catalogCode)?string("label-success","label-info2")}" style="margin:5px;font-size:100%;">
										<a href="${basepath}/catalog/${item.code!""}.html">${item.name!""}</a>
									</span>
								</#list>
							</div>
						</#if>
						
						<#if attrs??>
							
							<div class="panel panel-default" style="margin:10px 0px;">
					              <div class="panel-body" style="font-weight: normal;text-align: center;">
					              	  
<#--<%-- 					              	    <span style="margin:5px;font-weight: bold;">属性</span> --%>-->
										<div style="padding-left: 0px;">
											<#list attrs as item>
												<div class="row" style="margin-bottom: 5px;">
													<div class="col-xs-2" style="text-align: right;">
														${item.name!""}：
													</div>
													<div class="col-xs-10" style="text-align: left;margin-left: -20px;">
														<#if item.attrList??>
														<#list item.attrList as item>
															<#if e.attrID??&&item.id==e.attrID>
																<span class="label label-success attr_css">
																		<a href="${basepath}/catalog/attr/${item.id!""}.html?orderBy=${item.orderBy!0}">${item.name!""}</a>
																</span>
															<#else>
																<span class="label label-info2 attr_css">
																		<a href="${basepath}/catalog/attr/${item.id!""}.html?orderBy=${item.orderBy!0}">${item.name!""}</a>
																</span>
															</#if>
														</#list>
														</#if>
														<br>
													</div>
												</div>
											</#list>
					              	  
						              </div>
					              </div>
							</div>
								
							
						</#if>
					</div>
				</div>
		
				<!-- 排序栏 -->
				<#if productList?? && productList?size gt 0>
					<div class="row" style="margin: 0px;">
						<div class="col-xs-12">
							<span class="attr_css" style="margin:5px;font-weight: bold;">排序</span>
								<span class="label ${(e.orderBy??&&e.orderBy==1)?string('label-success','')} attr_css" style="margin:5px;">
									<a href="${basepath}/catalog/${catalogCode!""}.html?orderBy=1&attrID=${e.attrID!""}">热门</a>
								</span>

								<span class="label ${(e.orderBy??&&e.orderBy==2)?string('label-success','')}  attr_css" style="margin:5px;">
									<a href="${basepath}/catalog/${catalogCode!""}.html?orderBy=2&attrID=${e.attrID!""}">价格</a>
								</span>

								<span class="label ${(e.orderBy??&&e.orderBy==3)?string('label-success','')}  attr_css" style="margin:5px;">
									<a href="${basepath}/catalog/${catalogCode!""}.html?orderBy=3&attrID=${e.attrID!""}">最新</a>
								</span>
						</div>
					</div>
					<div ><hr style="clear: both;"></div>
				</#if>
				
				
				<div class="row">
					<!-- 商品展示 -->
					<div >
						<#if productList?? && productList?size gt 0>
						<#list productList as item>
						<div class="col-xs-3" style="padding: 5px;text-align: center;">
							<div class="thumbnail" style="width: 100%; display: block;">
								<div style="height: 200px;border: 0px solid;text-align: center;">
									<a href="${basepath}/product/${item.id!""}.html" target="_blank">
										<img class="lazy" style="border: 0px;display: block;margin: auto;max-height: 100%;max-width: 100%;"  
										border="0" src="${systemSetting().defaultProductImg!""}"
										data-original="${systemSetting().imageRootPath}${item.picture!""}">
									</a>
								</div>
								<div style="height: 40px;text-align: center;">
									<div class="col-xs-12 left_product">
										<div class="row">
											<a style="cursor: pointer;margin: auto;" href="${basepath}/product/${item.id!""}.html" target="_blank"
											title="${item.name!""}">
												${item.name!""}
											</a>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-xs-6">
										<b style="font-weight: bold;color: #cc0000;">
											￥${item.nowPrice!""}
										</b>
									</div>
									<div class="col-xs-6">
										<b style="text-decoration: line-through;font-weight: normal;font-size: 11px;color: #a5a5a5;">
											￥${item.price!""}
										</b>
									</div>
								</div>
							</div>
						</div>
						</#list>
						</div>
						<#else>
                                抱歉，没有找到<span color='#f40'>${key!""}</span>相关的宝贝!
                                <br>
                                <div class="row">
                                    <div class="col-xs-12" style="font-size: 14px;font-weight: normal;">
                                        <div class="panel panel-default">
                                            <div class="panel-body" style="font-size: 16px;font-weight: normal;text-align: center;">
                                                <div class="panel-body" style="font-size: 16px;font-weight: normal;">
                                                    <span class="glyphicon glyphicon-ok"></span>
                                                    <span class="text-success">您可以尝试换一个关键词或者换一个分类。</span>
                                                </div>
                                            </div>
                                        </div>
                                        <hr>
                                    </div>
                                </div>
						</#if>
				</div>
				<div class="row" style="margin-top: 10px;">
					<div class="col-xs-12" style="border: 0px solid;text-align: right;">
						<#if productList??>
							<#include "pager.ftl"/>
						</#if>
					</div>
				</div>
		
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function() {
	//商品鼠标移动效果
	$("div[class=thumbnail]").hover(function() {
		$(this).addClass("thumbnail_css");
	}, function() {
		$(this).removeClass("thumbnail_css");
	});
});
</script>
<script type="text/javascript" src="${basepath}/resource/js2/yomo.js"></script>
<script>
    $(document).ready(function(){
        $('.tc').on('click', function(){
            layer.open({
                type: 2,
                title: false,
                area: ['980px', '500px'],
                fixed: false, //不固定
                shade: 0.4,
                scrollbar: false,
                closeBtn: 1,
                content: '${basepath}/iframe.ftl'
            });
        });

    })

</script>
</@html.htmlBase>