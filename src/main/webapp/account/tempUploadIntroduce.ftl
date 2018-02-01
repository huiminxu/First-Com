<#import "/resource/common_html_front.ftl" as html>
<#import "/indexMenu.ftl" as menu>
<#import "/account/accountMenu.ftl" as accountMenu>
<@html.htmlBase>
	<@menu.menu selectMenu=""/>
<!------灰色区域------>
<div class="grayline"></div>
<link rel="stylesheet" href="${basepath}/resource/css2/usercenter.css" type="text/css"/>
<div class="container distable mt20 mb45">
    <div class="usercenter-box ">
        <aside class="usercenter-menu">
			<@accountMenu.accountMenu currentMenu="tempUploadIntroduce"/>
        </aside>
        <div class="main" >
           <div class="upintro">
               <div class="breadcrumbBox">上传</div>
               <div class="upintro_nav clearfix">
                   <ul>
                       <li class="active">
                           <a href="#upoffice" role="tab" data-toggle="tab"> 上传Office模板</a>
                       </li>
                       <li>
                           <a href="#upae" role="tab" data-toggle="tab"> 上传AE模板</a>
                       </li>
                       <li>
                           <a href="#upemotion" role="tab" data-toggle="tab"> 上传表情包</a>
                       </li>
                       <li>
                           <a href="#upcustom" role="tab" data-toggle="tab"> 上传定制服务</a>
                       </li>
                   </ul>
               </div>

               <div class=" upintBody tab-content clearfix">
                   <div class="tab-pane active" role="tabpanel" id="upoffice">
                       <div class="upofficetop">
                          <p>您需要准备office模板的详情图和预览图用于详情查看以及首页预览</p>
                       </div>
                       <div class="upofficecen">
                           <div class="officecenlef">
                               <div class="imgDetail">
                                   <img src="${basepath}/resource/images/officedetail.png"/>
                                   <div>详情图</div>
                                   <div>(852px*1767px)</div>
                                   <div>建议尺寸</div>
                                </div>
                               <div class="imgScan">
                                   <img src="${basepath}/resource/images/officescan.png"/>
                                   <div>预览图</div>
                                   <div>(218px*430px)</div>
                               </div>

                           </div>
                           <div class="officecenrit">
                              <h3>注意事项</h3>
                               <p>1、每一个Office模板文档内容的大小不超过20M</p>
                               <p> 2、Office文档中不得出现公司名称、二维码、 </p>
                               <p>微信、微博、QQ、电话等信息</p>
                               <p> 3、预览图只能上传宽218px，高 430px，格式为</p>
                                <p>png 或jpg，大小在200K以内的图片 </p>
                               <div class="buton">
                                 <#--<span>我已准备好，点击</span>-->
                                     <div  class="btnagree">
                                         <input type="checkbox" name="protocaln"  class="checkedbox" checked="checked" />&nbsp;&nbsp;我已认真阅读并同意
                                         <br/>
                                         <a href="${basepath}/resource/protocal/Officenorm.pdf" style="" target="_black">《Office模板上传规范》</a><br/>
                                     <a href="${basepath}/resource/protocal/yomoerUploadProtocal.pdf" style=""  target="_black">《柚墨平台数字作品上传发布使用协议》</a>
                                     </div>
                                    <a href="${basepath}/auth/account/templateUpload/officeUpload" class="btn btn-sm upload">立即上传</a>
                               </div>

                           </div>
                       </div>

                   </div>
                   <div class="tab-pane" role="tabpanel"  id="upae">
                       <div class="upaetop">
                           <p>您需要准备AE模板的预览图用于首页预览</p>
                           <p>您还需要为ae文件导出一部mp4格式的视频</p>
                       </div>
                       <div class="upaecen">
                           <div class="aecenlef">
                            <div class="aeimg">
                                  <img src="${basepath}/resource/images/aescan.png"/>
                                  <div>预览图</div>
                                  <div>(290px*162px)</div>
                              </div>

                            </div>

                           <div class="aecenrit">
                               <h3>注意事项</h3>
                               <p>1、请将AE原文件压缩上传大小不要超过200M，</p>
                               <p>只支持zip、rar和7z格式 </p>
                               <p>2、请将 AE 模板导出为 MP4 格式，用于模板详</p>
                               <p>情展示， 视频大小不要超过50M</p>
                               <p>3、AE预览图尺寸为：290*162，格式为png或</p>
                               <p>jpg，大小在200K以内的图片</p>
                               <div class="buton">
                               <#--<span>我已准备好，点击</span>-->
                                   <div  class="btnagree">
                                       <input type="checkbox" name="protocaln"  class="checkedbox" checked="checked" />&nbsp;&nbsp;我已认真阅读并同意
                                       <br/>
                                       <a href="${basepath}/resource/protocal/AEnorm.pdf" style="" target="_black">《AE模板上传规范》</a><br/>
                                       <a href="${basepath}/resource/protocal/yomoerUploadProtocal.pdf" style=""  target="_black">《柚墨平台数字作品上传发布使用协议》</a>
                                   </div>
                                   <a href="${basepath}/auth/account/templateUpload/aeUpload" class="btn btn-sm upload">立即上传</a>
                               </div>

                           </div>
                       </div>
                   </div>
                   <div class="tab-pane" role="tabpanel"  id="upemotion">
                       <div class="upemtop">
                           <p>您需要准备表情包的九宫格预览图用于首页预览</p>
                       </div>
                       <div class="upemcen">
                           <div class="emcenlef">
                               <div class="emimg">
                                   <img src="${basepath}/resource/images/emotionscan.png"/>
                                   <div>预览图</div>
                                   <div>(270px*270px)</div>
                               </div>

                           </div>

                           <div class="emcenrit">
                               <h3>注意事项</h3>
                               <p>1、请将表情包图片打包压缩上传，大小 </p>
                               <p>不要超过50M。支持zip、rar和7z格式</p>
                               <p>2、表情包预览图尺寸为：270*270，格式为png  </p>
                               <p>或jpg， 大小在200K以内的图片 </p>

                               <div class="buton">
                               <#--<span>我已准备好，点击</span>-->
                                   <div  class="btnagree">
                                       <input type="checkbox" name="protocaln"  class="checkedbox" checked="checked" />&nbsp;&nbsp;我已认真阅读并同意<br/>
                                       <a href="${basepath}/resource/protocal/Emotionnorm.pdf" style="" target="_black">《表情包上传规范》</a><br/>
                                       <a href="${basepath}/resource/protocal/yomoerUploadProtocal.pdf" style=""  target="_black">《柚墨平台数字作品上传发布使用协议》</a>
                                   </div>
                                   <a href="${basepath}/auth/account/templateUpload/bqUpload" class="btn btn-sm upload">立即上传</a>
                               </div>

                           </div>
                       </div>
                   </div>
                   <div class="tab-pane" role="tabpanel"  id="upcustom">
                       <#if isDesigner!='n' >
                       <div class="upcustomtop">
                           <p>注意事项</p>
                           <p>1、上传定制服务前，请确保与定制客户已完成需求确认</p>
                           <p>2、定制客户未付款前，定制需求仍可修改；定制客户一旦付款，定制需求不可更改</p>
                           <p>3、若在订单过程中，您与定制客户发生纠纷，申请客服仲裁，定制需求将作为重要评判依据</p>
                       </div>
                      <div class="upcustombody">
                          <img src="${basepath}/resource/images/complain.gif">
                      </div>
                       <div class="upcustombottom">
                        <a href="${basepath}/auth/designer/UploadcustomIntro">查看流程详情</a>
                           <a class="btn" href="${basepath}/auth/designer/customizationUpload">立即上传</a>
                       </div>
                        <#else>
                            <div class="desginer-no">
                                <div class="desginerno-text">
                                    不好意思哦<br/>
                                    您还是不是Yomoer设计师<br/>
                                    <a class="btn" href="${basepath}/auth/designer/toBeDesigner">立即认证</a>
                                </div>

                            </div>
                       </#if>
                   </div>
               </div>
		    </div>


		 </div>
	</div>
</div>
<script>
    $(document).ready(
        function(){
            $(".upload").click(
                function(){
                    var _this=$(this);
                    if((_this.closest(".buton").find(".checkedbox")).is(':checked')) {
                        return true;
                    }else{
                        event.preventDefault();
                        layer.alert('请同意我们的协议!', {
                            closeBtn: 0
                        });

                      return false;
        }

                    }
    )
                }



            );


</script>
</@html.htmlBase>