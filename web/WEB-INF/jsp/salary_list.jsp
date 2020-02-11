<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/11/21
  Time: 12:01
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java"  import="com.itheima.po.Salary" %>
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
        <a href="/findSalary">地区</a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="/findSalary" title="刷新">
        <i class="layui-icon" style="line-height:30px">&#xe669;</i></a>
</div>
<div class="x-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so" action="/findSalary" >
            <input class="layui-input" placeholder="请选择薪资编号" name="sid" id="sid">
            <input class="layui-input" placeholder="请选择用户名称" name="sname" id="sname">

            <input class="layui-input" type="hidden" name="pageIndex" value="1">
            <input class="layui-input" type="hidden" name="pageSize" value="3">
            <button class="layui-btn"  lay-submit="" lay-filter="search"><i class="layui-icon">&#xe615;</i></button>
        </form>
    </div>
    <xblock>
        <button id="addSalaryBtn" class="layui-btn layui-btn-normal"> <i class="layui-icon">&#xe61f;</i>添加 </button>
        <button class="layui-btn " lay-filter="toolbarDemo" lay-submit=""><i class="layui-icon ">&#xe601;</i>导出</button>
        <span class="x-right" style="line-height:40px">共有数据：${pi.totalCount} 条</span>
    </xblock>

    <%--添加模态框--%>
    <div class="layui-row" id="test" style="display: none;">
        <div class="layui-col-md10">
            <form class="layui-form" id="addEmployeeForm">
                <div class="layui-form-item">
                    <label class="layui-form-label">薪资编号：</label>
                    <div class="layui-input-block">
                        <input type="text" lay-verify="required" name="sid"   class="layui-input" placeholder="请输入薪资编号">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">员工姓名：</label>
                    <div class="layui-input-block">
                        <input type="text" lay-verify="required" name="sname"  class="layui-input" placeholder="请输入员工姓名">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">部门</label>
                    <div class="layui-input-block">
                        <input type="text" lay-verify="required" name="sdepart"  class="layui-input" placeholder="请输入部门">
                        <%--<input type="text" name="s_sex" class="layui-input" id="s_sex" placeholder="请输入性别">--%>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">职位：</label>
                    <div class="layui-input-block">
                        <input type="text" name="sjob" class="layui-input" placeholder="请输入职位">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">基本薪资：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="sjiben" id="t1" onkeyup="compute();" class="layui-input" placeholder="请输入基本薪资">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">缴税：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="sjiaoshui" id="t2" onkeyup="compute();" class="layui-input" placeholder="请输入税金">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">加班费：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="sjiaban" id="t3" onkeyup="compute();" class="layui-input" placeholder="请输入加班费">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">奖金：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="sbonus"  id="t4" onkeyup="compute();" class="layui-input" placeholder="请输入奖金">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">罚款：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="sfine" id="t5" onkeyup="compute();" class="layui-input" placeholder="请输入罚款金额">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">预计算：</label>
                    <div class="layui-input-block">
                        <input type="text"   id="t6" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">总计：</label>
                    <div class="layui-input-block">
                        <input type="text"   name="stotal" class="layui-input">
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
            <form class="layui-form" action="/updateSalary" method="post"  id="f_auto" accept-charset="UTF-8">

                <div class="layui-form-item">
                    <label class="layui-form-label">薪资编号：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="sid" id="edit_id"  value=""  class="layui-input" placeholder="请输入薪资编号">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">员工名称：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="sname" id="edit_names"  value="" class="layui-input" placeholder="请输入员工姓名">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">部门：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="sdepart" id="edit_comment"  value="" class="layui-input" placeholder="请输入部门">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">职位：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="sjob" id="edit_cost"  value="" class="layui-input" placeholder="请输入职位">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">基本薪资：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="sjiben" id="edit_jiben"  value="" class="layui-input" placeholder="请输入基本薪资">
                    </div>
                </div>


                <div class="layui-form-item">
                    <label class="layui-form-label">缴税：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="sjiaoshui" id="edit_jiaoshui"  value="" class="layui-input" placeholder="请输入缴税金额">
                    </div>
                </div>


                <div class="layui-form-item">
                    <label class="layui-form-label">加班费：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="sjiaban" id="edit_jiaban"  value="" class="layui-input" placeholder="请输入加班费">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">奖金：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="sbonus" id="edit_bonus"  value="" class="layui-input" placeholder="请输入奖金">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">罚金：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="sfine" id="edit_fine"  value="" class="layui-input" placeholder="请输入罚金">
                    </div>
                </div>


                <div class="layui-form-item">
                    <label class="layui-form-label">总计：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="stotal" id="edit_total"  value="" class="layui-input">
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
            <th>薪资编号</th>
            <th>员工姓名</th>
            <th>部门</th>
            <th>职位</th>
            <th>基本薪资</th>
                <th>缴税</th>
                <th>加班费</th>
                <th>奖金</th>
                <th>罚金</th>
                <th>总计</th>
            <th>操作</th>
        </thead>
        <tbody>
        <c:forEach items="${pi.list}" var="salary">
            <tr>
                    <%--<td>--%>
                    <%--<div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i></div>--%>
                    <%--</td>--%>
                <td>${salary.sid}</td>
                <td>${salary.sname}</td>
                <td>${salary.sdepart}</td>
                <td>${salary.sjob}</td>
                <td>${salary.sjiben}</td>
                        <td>${salary.sjiaoshui}</td>
                        <td>${salary.sjiaban}</td>
                        <td>${salary.sbonus}</td>
                        <td>${salary.sfine}</td>
                        <td>${salary.stotal}</td>
                <td>
                    <a title="编辑"    id= "updateEdit"    href="/findSalaryById?sid=${salary.sid}">
                        <i class="layui-icon">&#xe642;</i>
                    </a>
                    <a title="删除" onclick="member_del(this,'${salary.sid}')" href="javascript:;">
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
<script >

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
                url: '/exportsalarylist',
                type: 'post',
                dataType: 'json',
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    console.log(data);

                    // 1. 如果需要调整顺序，请执行梳理函数
                    var dt = excel.filterExportData(data, [
                        'sid'
                        ,'sname'
                        ,'sdepart'
                        ,'sjob'
                        ,'sjiben'
                    ]);

                    // 2. 数组头部新增表头
                    dt.unshift({sid: 'ID', sname: '员工姓名', sdepart: '部门', sjob: '职位', sjiben: '基本薪资'});

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
                    }, '薪资数据.xlsx', 'xlsx', {
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
                    setTimeout(function () {window.location.href='/findSalary';},2000);
                }
            });
        });

        /*添加弹出框*/
        $("#addSalaryBtn").click(function () {
            layer.open({
                type:1,
                title:"添加薪资",
                skin:"myclass",
                // area:["50%"],
                area: ['100%', '100%'],
                offset:['0px','0px'],
                anim:2,
                content:$("#test").html(),
                success:function compute(){
                    var t1 = document.getElementById("t1").value;
                    var t2 = document.getElementById("t2").value;
                    var t3 = document.getElementById("t3").value;
                    var t4 = document.getElementById("t4").value;
                    var t5 = document.getElementById("t5").value;
                    document.getElementById("t6").value = parseFloat(t1) - parseFloat(t2) + parseFloat(t3) + parseFloat(t4) - parseFloat(t5);

                }
            });


            $("#addEmployeeForm")[0].reset();
            form.on('submit(formDemo)', function(data) {
                // layer.msg('aaa',{icon:1,time:3000});
                var param=data.field;
                // console.log(JSON.stringify(param));
                $.ajax({
                    url: '/addSalary',
                    type: "post",
                    data:JSON.stringify(param),
                    contentType: "application/json; charset=utf-8",
                    success:function(){
                        layer.msg('添加成功', {icon: 1, time: 3000});
                        setTimeout(function () {window.location.href='/findSalary';},2000);

                    },
                    error:function(){
                        layer.msg('添加失败',{icon:0,time:3000});
                        setTimeout(function () {window.location.href='/findSalary';},2000);
                    }
                });
                // return false;
            });
        });


    });

    function compute() {
        var t1 = document.getElementById("t1").value;
        var t2 = document.getElementById("t2").value;
        var t3 = document.getElementById("t3").value;
        var t4 = document.getElementById("t4").value;
        var t5 = document.getElementById("t5").value;
        document.getElementById("t6").value = parseFloat(t1) - parseFloat(t2) + parseFloat(t3) + parseFloat(t4) - parseFloat(t5);
    };


    .

    3










    /*删除*/
    function member_del(obj,sid){
        layer.confirm('确认要删除吗？',function(index){
            //发异步删除数据
            $.get("/deleteSalary",{"sid":sid},function (data) {
                if(data =true){
                    layer.msg('删除成功!',{icon:1,time:2000});
                    setTimeout(function () {window.location.href='/findSalary';},2000);

                }else {
                    layer.msg('删除失败!',{icon:1,time:3000});
                    setTimeout(function () {window.location.href='/findSalary';},2000);
                }
            });
        });
    }

</script>


</body>


</html>

