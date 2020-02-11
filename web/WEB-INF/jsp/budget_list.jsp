<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/11/21
  Time: 12:01
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java"  import="com.itheima.po.Budget" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <title>后台登录</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <%--<meta http-equiv="Cache-Control" content="no-siteapp" />--%>

    <link rel="icon" href="/images/favicon.ico" sizes="32x32" />
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <script type="text/javascript" src="./js/jquery-1.3.2.min.js"></script>
    <script src="lib/layui/layui.js"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
    <script src="/layui_exts/excel.js"></script>
    <script type="text/javascript" src="./js/ajaxfileupload.js"></script>

    <style type="text/css">
        .layui-table{
            text-align: center;
        }
        .layui-table th{
            text-align: center;
        }
    </style>
</head>

<body>
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="/findBudget">预算</a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="/findBudget" title="刷新">
        <i class="layui-icon" style="line-height:30px">&#xe669;</i></a>
</div>
<div class="x-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so" action="/findBudget" >
            <input class="layui-input" placeholder="请输入预算编号" name="bid" id="bid">
            <input class="layui-input" placeholder="请输入预算名称" name="bname" id="bname">

            <input class="layui-input" type="hidden" name="pageIndex" value="1">
            <input class="layui-input" type="hidden" name="pageSize" value="3">
            <button class="layui-btn"  lay-submit="" lay-filter="search"><i class="layui-icon">&#xe615;</i></button>
        </form>
    </div>
    <xblock>
        <button id="addBudgetBtn" class="layui-btn layui-btn-normal"> <i class="layui-icon">&#xe61f;</i>添加 </button>
        <button class="layui-btn" lay-filter="toolbarDemo" lay-submit=""><i class="layui-icon ">&#xe601;</i>导出</button>
        <button class="layui-btn" lay-filter="toolbarDemo" lay-submit=""><i class="layui-icon ">&#xe716;</i>系统校正</button>
        <button type="button" class="layui-btn" id="test1"><i class="layui-icon">&#xe67c;</i>上传文件</button>
        <span class="x-right" style="line-height:40px">共有数据：${pi.totalCount} 条</span>
    </xblock>

    <%--添加模态框--%>
    <div class="layui-row" id="test" style="display: none;">
        <div class="layui-col-md10">
            <form class="layui-form" id="addEmployeeForm">
                <div class="layui-form-item">
                    <label class="layui-form-label">预算编号：</label>
                    <div class="layui-input-block">
                        <input type="text" lay-verify="required" name="bid"   class="layui-input" placeholder="请输入预算编号">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">预算名称：</label>
                    <div class="layui-input-block">
                        <input type="text" lay-verify="required" name="bname"  class="layui-input" placeholder="请输入预算名称">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">项目名</label>
                    <div class="layui-input-block">
                        <input type="text" lay-verify="required" name="bproject"  class="layui-input" placeholder="请输入项目名">
                        <%--<input type="text" name="s_sex" class="layui-input" id="s_sex" placeholder="请输入性别">--%>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">部门：</label>
                    <div class="layui-input-block">
                        <input type="text" name="bdepart" class="layui-input" i placeholder="请输入部门">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">成本：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="bcost"  class="layui-input" placeholder="请输入成本">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">预期收益：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="bbenefit"  class="layui-input" placeholder="请输入收益">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">预算日期：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="bdate"  class="layui-input" placeholder="请输入日期">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">预算备注：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="bcomment"  class="layui-input" placeholder="请输入备注">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button type="button" class="layui-btn layui-btn-normal" lay-submit lay-filter="formDemo">提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </div>
    </div>



    <%--编辑模态框--%>

    <div class="layui-row" id="updteDiv" style="display: none;">
        <div class="layui-col-md10">
            <form class="layui-form" action="/updateBudget" method="post"  id="f_auto" accept-charset="UTF-8">

                <div class="layui-form-item">
                    <label class="layui-form-label">预算编号：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="bid" id="edit_id"  value=""  class="layui-input" placeholder="请输入预算编号">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">预算名称：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="bname" id="edit_names"  value="" class="layui-input" placeholder="请输入预算名称">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">项目名：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="bproject" id="edit_project"  value="" class="layui-input" placeholder="请输入项目名">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">部门：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="bdepart" id="edit_depart"  value="" class="layui-input" placeholder="请输入部门">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">成本：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="bcost" id="edit_cost"  value="" class="layui-input" placeholder="请输入成本">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">预期收益：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="bbenenfit" id="edit_benefit"  value="" class="layui-input" placeholder="请输入成本">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">预算日期：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="bdate" id="edit_date"  value="" class="layui-input" placeholder="请输入备注">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">预算备注：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="bcomment" id="edit_comment"  value="" class="layui-input" placeholder="请输入备注">
                    </div>
                </div>


                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button type="button" class="layui-btn layui-btn-normal" lay-submit lay-filter="updateForm">更新</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </div>
    </div>


    <%--表格数据--%>
    <table class="layui-table">
        <thead>
        <tr>
            <%--<th>--%>
            <%--<div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>--%>
            <%--</th>--%>
            <th>预算编号</th>
            <th>预算名称</th>
            <th>项目名</th>
            <th>部门</th>
            <th>预计成本</th>
                <th>销售属性</th>
                <th>适用性别</th>
                <th>品种</th>
                <th>销售时段</th>
                <th>销售渠道</th>
                <th>预计收益</th>
                <th>起始日期</th>
                <th>预算备注</th>
            <th>操作</th>
        </thead>
        <tbody>
        <c:forEach items="${pi.list}" var="budget">
            <tr>
                    <%--<td>--%>
                    <%--<div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i></div>--%>
                    <%--</td>--%>
                <td>${budget.bid}</td>
                <td>${budget.bname}</td>
                <td>${budget.bproject}</td>
                <td>${budget.bdepart}</td>
                <td>${budget.bcost}</td>
                        <td>时尚款</td>
                        <td>女性</td>
                        <td>裤子</td>
                        <td>2019.10.20-2019.12.20</td>
                        <td>自营店铺</td>
                <td>${budget.bbenefit}</td>
                <td>${budget.bdate}</td>
                <td>${budget.bcomment}</td>

                <td>
                    <a title="编辑"    id= "updateEdit"    href="/findBudgetById?bid=${budget.bid}">
                        <i class="layui-icon">&#xe642;</i>
                    </a>
                    <a title="删除" onclick="member_del(this,'${budget.bid}')" href="javascript:;">
                        <i class="layui-icon">&#xe640;</i>
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div class="" >
        <input type="hidden" id="totalPageCount" value="${pi.pageTotalCount}"/>
        <c:import url="pageBtn.jsp">
            <c:param name="totalCount" value="${pi.totalCount}"/>
            <c:param name="currentPageNo" value="${pi.pageIndex}"/>
            <c:param name="totalPageCount" value="${pi.pageTotalCount}"/>
        </c:import>
    </div>
</div>
<script>

    layui.config({
        base: 'layui_exts/',
    }).extend({
        excel: 'excel',
    });

    layui.use(['jquery', 'excel','form','layer','laydate'], function(){
        var form = layui.form,
            $ = layui.jquery,
            laydate = layui.laydate;
        var excel = parent.layui.excel;

        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });

        form.on('submit(toolbarDemo)', function(){

            $.ajax({
                url: '/exportbudgetlist',
                type: 'post',
                dataType: 'json',
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    console.log(data);

                    // 1. 如果需要调整顺序，请执行梳理函数
                    var dt = excel.filterExportData(data, [
                        'bid'
                        ,'bname'
                        ,'bproject'
                        ,'bdepart'
                        ,'bcost'
                    ]);

                    // 2. 数组头部新增表头
                    dt.unshift({bid: 'ID', bname: '预算名称', bproject: '项目名', bdepart: '部门', bcost: '成本'});

                    // 意思是：A列40px，B列60px(默认)，C列120px，D、E、F等均未定义
                    var colConf = excel.makeColConfig({
                        'B': 90,
                        'C': 80,
                        'F': 90
                    }, 60);

                    var timestart = Date.now();
                    // 3. 执行导出函数，系统会弹出弹框
                    excel.exportExcel({
                        sheet1: dt
                    }, '预算数据.xlsx', 'xlsx', {
                        extend: {
                            '!cols': colConf
                        }
                    });
                    var timeend = Date.now();

                    var spent = (timeend - timestart) / 1000;
                    layer.alert('导出耗时 '+spent+' s');
                    //setTimeout(function () {window.location.href='/findAdmin';},2000);
                },

                error: function () {
                    //console.log(data);
                    setTimeout(function () {window.location.href='/findBudget';},2000);
                }
            });
        });

        /*添加弹出框*/
        $("#addBudgetBtn").click(function () {
            layer.open({
                type:1,
                title:"添加预算",
                skin:"myclass",
                // area:["50%"],
                area: ['100%', '100%'],
                offset:['0px','0px'],
                anim:2,
                content:$("#test").html()
            });
            $("#addEmployeeForm")[0].reset();
            form.on('submit(formDemo)', function(data) {
                // layer.msg('aaa',{icon:1,time:3000});
                var param=data.field;
                // console.log(JSON.stringify(param));
                $.ajax({
                    url: '/addBudget',
                    type: "post",
                    data:JSON.stringify(param),
                    contentType: "application/json; charset=utf-8",
                    success:function(){
                        layer.msg('添加成功', {icon: 1, time: 3000});
                        setTimeout(function () {window.location.href='/findBudget';},2000);

                    },
                    error:function(){
                        layer.msg('添加失败',{icon:0,time:3000});
                        setTimeout(function () {window.location.href='/findBudget';},2000);
                    }
                });
                // return false;
            });
        });


    });

    /*删除*/
    function member_del(obj,s_id){
        layer.confirm('确认要删除吗？',function(index){
            //发异步删除数据
            $.get("/deleteBudget",{"bid":bid},function (data) {
                if(data =true){
                    layer.msg('删除成功!',{icon:1,time:2000});
                    setTimeout(function () {window.location.href='/findBudget';},2000);

                }else {
                    layer.msg('删除失败!',{icon:1,time:3000});
                    setTimeout(function () {window.location.href='/findBudget';},2000);
                }
            });
        });
    }

    // 上传文件

    layui.use('upload', function(){
        var $ = layui.jquery
            ,upload = layui.upload;

        //普通图片上传
        var uploadInst = upload.render({
            elem: '#test1'
            ,url: '${pageContext.request.contextPath}/upload/add'
            ,accept: 'file'
            ,acceptMime: 'file/*'
            ,size: '1024*5'
            ,before: function(obj){
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    $('#demo1').attr('src', result); //图片链接（base64）
                });
            }
            ,done: function(json){
                //如果上传失败
                if(json.code == 0){
                    return layer.msg('上传失败');
                }
                //上传成功
                if(json.code > 0){
                    return layer.msg('上传成功');
                }
            }
        });
    });

</script>


</body>


</html>

