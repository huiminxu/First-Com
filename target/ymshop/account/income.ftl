<#import "/resource/common_html_front.ftl" as html>
<#import "/indexMenu.ftl" as menu>
<#import "/account/accountMenu.ftl" as accountMenu>
<@html.htmlBase>
    <@menu.menu selectMenu=""/>
<!------灰色区域------>
<div class="grayline"></div>
<link rel="stylesheet" href="${basepath}/resource/css2/usercenter.css" type="text/css"/>
<link rel="stylesheet" href="${basepath}/resource/jquery-pagination/css/pagination.css" />
<div class="container distable mt20 mb45">
    <div class="usercenter-box ">
        <aside class="usercenter-menu">
            <@accountMenu.accountMenu currentMenu="income"/>
        </aside>
        <div class="main income-box">
            <div class="breadcrumbBox"></div>
              <div class="myPurse-box">
                  <div class="myPurse-info">
                       <div class="money">
                           <h3>${wallet?string("0.00")}<sup><span class="glyphicon glyphicon-question-sign " data-toggle="tooltip" data-placement="top" title="我的钱包不少于200.00才能申请提现"></span></sup></h3>
                           <P>我的钱包（元）</P>
                       </div>
                      <#if status==1>
                          <button  class="btn" id="withdraw" >我要提现</button>
                      <#elseif status==2>
                          <button  class="btn" id="withdraw" disabled="true">提现申请中</button>
                      <#else>
                          <button  class="btn" id="withdraw" disabled="true" >我要提现</button>
                      </#if>

                  </div>
                  <ul class="incomeGather clearfix">
                      <li>
                          <h3>${allIncome!"0.00"}</h3>
                          <p>累计收入(元)</p>
                      </li>
                      <li>
                          <h3>${templateCount!"0"}</h3>
                          <p>作品销量（次）</p>
                      </li>
                      <li>
                          <h3>${customizeCount!"0"}</h3>
                          <p>定制销量（次）</p>
                      </li>
                  </ul>
              </div>
            <div class="breadcrumbBox">收入明细</div>
            <div class="tresult-box">

                <table class="table incomeTable">
                    <thead>
                        <tr>
                            <th>购买时间</th>
                            <th>作品名称</th>
                            <th>价格（元）</th>
                            <th>收入（元）</th>
                        </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>

                <div class="pages">
                    <div id="incomePagination" class="Pagination"></div>
                </div>
            </div>
            <div class="breadcrumbBox">提现记录</div>
            <div class="tresult-box">
                <table class="table withdrawTable" >
                    <thead>
                        <tr>
                            <th>订单号</th>
                            <th>提现时间</th>
                            <th>提现金额（元）</th>
                        </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>

                <div class="pages">
                    <div id="withdrawPagination" class="Pagination"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="${basepath}/resource/jquery-pagination/js/jquery.pagination-ajax.js" ></script>
<script type="text/javascript">
    $(document).ready(function () {
        //提现
        $("#withdraw").click(function (event) {
            event.preventDefault();
            var _this=this;
            layer.open({
                type: 2,
                title: false,
                area: ['540px', '315px'],
                content: '${basepath}/auth/account/chooseAccount', //这里content是一个普通的String

            });

        })

        //分页
        Init(0,"incomePage",$(".incomeTable"));
        $("#incomePagination").pagination(${pager1.total}, {//收入分页
            callback: Page1Callback,
            items_per_page: ${pager1.pageSize}
        });

        function Page1Callback(index, jq) {     //前一个表示您当前点击的那个分页的页数索引值，后一个参数表示装载容器。
            Init(index*5,"incomePage",$(".incomeTable"));
        }

        Init(0,"enchashmentPage",$(".withdrawTable"));
        $("#withdrawPagination").pagination(${pager2.total}, {//提现分页
            callback: Page2Callback,
            items_per_page: ${pager2.pageSize}
        });
        function Page2Callback(index, jq) {     //前一个表示您当前点击的那个分页的页数索引值，后一个参数表示装载容器。
               Init(index*5,"enchashmentPage",$(".withdrawTable"));
        }
        //tiptool 初始化
        $('[data-toggle="tooltip"]').tooltip();
    })

    function Init(offset,url,ele) {
        $.ajax({
            type: "GET",
            url: "/auth/account/"+url+"?offset="+offset,
            success: function (data) {
                var html="";
                if(data.list.length==0){
                    if(url=="incomePage"){
                        html="<div class='tresult-no'> &nbsp;亲，你还没有任何收入信息！赶紧去赚钱吧！</div>"
                    } else if(url=="enchashmentPage"){
                        html="<div class='tresult-no'>&nbsp;亲，你还没有任何提现信息！赶紧去提现吧！</div>"
                    }
                    ele.after(html);
                }else{
                $.each(data.list,function (index,item) {
                    if(url=="incomePage"){
                        html+="<tr>"+
                                "<td>"+item.finishTime+"</td>";
                        if(item.templateName){
                            html+="<td>"+item.templateName+"</td>";
                        }else{
                            html+="<td>定制服务</td>";
                        };
                         if(item.nowPrice){
                             html+="<td>"+item.nowPrice+"</td>";
                         }else{
                             html+="<td>0.00</td>";
                         };
                         html+="<td>"+item.amount+"</td></tr>";

                    }
                    else if(url=="enchashmentPage"){
                        html+="<tr>"+
                                "<td>"+item.no+"</td>"+
                                "<td>"+item.createdTime+"</td>"+
                                "<td>"+item.amount+"</td>"+
                                "</tr>";
                    }
                });
                    ele.find("tbody").html("").append(html);
                }


            },
            error:function (data) {
                alert("请求超时，请重试！");
            }
        });
    }

</script>
</@html.htmlBase>