<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/11/21
  Time: 12:01
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java"  import="com.itheima.po.Certification" %>
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
        <a href="/findCertification">凭证</a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="/findCertification" title="刷新">
        <i class="layui-icon" style="line-height:30px">&#xe669;</i></a>
</div>
<div class="x-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so" action="/findCertification" >
            <input class="layui-input" placeholder="请输入凭证编号" name="cid" id="cid">
            <input class="layui-input" placeholder="请输入凭证名称" name="c_name" id="c_name">

            <input class="layui-input" type="hidden" name="pageIndex" value="1">
            <input class="layui-input" type="hidden" name="pageSize" value="3">
            <button class="layui-btn"  lay-submit="" lay-filter="search"><i class="layui-icon">&#xe615;</i></button>
        </form>
    </div>
    <xblock>
        <button id="addCertificationBtn" class="layui-btn layui-btn-normal"> <i class="layui-icon">&#xe61f;</i>添加 </button>
        <button class="layui-btn " lay-filter="toolbarDemo" lay-submit=""><i class="layui-icon ">&#xe601;</i>导出</button>
        <span class="x-right" style="line-height:40px">共有数据：${pi.totalCount} 条</span>
    </xblock>

    <%--添加模态框--%>
    <div class="layui-row" id="test" style="display: none;">
        <div class="layui-col-md10">
            <form class="layui-form" id="addEmployeeForm">
                <div class="layui-form-item">
                    <label class="layui-form-label">凭证编号：</label>
                    <div class="layui-input-block">
                        <input type="text" lay-verify="required" name="cid"   class="layui-input" placeholder="请输入凭证编号">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">凭证名称：</label>
                    <div class="layui-input-block">
                        <input type="text" lay-verify="required" name="cname"  class="layui-input" placeholder="请输入凭证名称">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">提交人</label>
                    <div class="layui-input-block">
                        <input type="text" lay-verify="required" name="cemployee"  class="layui-input" placeholder="请输入提交人">

                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">报销金额：</label>
                    <div class="layui-input-block">
                        <input type="text" name="camount" class="layui-input"  placeholder="请输入报销金额">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">报销日期：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="cdate"  class="layui-input" placeholder="请输入报销日期">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">审核状态：</label>
                    <div class="layui-input-block">
                        <input type="text" name="cstatus" class="layui-input" i placeholder="请输入审核状态">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">备注：</label>
                    <div class="layui-input-block">
                        <input type="text" name="ccomment" class="layui-input" i placeholder="请输入报销备注">
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button type="button" class="layui-btn" id="test1"><i class="layui-icon">&#xe67c;</i>上传文件</button>
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
            <form class="layui-form" action="/updateCertification" method="post"  id="f_auto" accept-charset="UTF-8">

                <div class="layui-form-item">
                    <label class="layui-form-label">凭证编号：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="cid" id="edit_id"  value=""  class="layui-input" placeholder="请输入学号">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">凭证名称：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="cname" id="edit_names"  value="" class="layui-input" placeholder="请输入姓名">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">提交人：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="cemployee" id="edit_employee"  value="" class="layui-input" placeholder="请输入提交人">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">报销金额：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="c_name" id="edit_cost"  value="" class="layui-input" placeholder="请输入报销金额">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">报销日期：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="cdate" id="edit_date"  value="" class="layui-input" placeholder="请输入报销日期">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">审核状态：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="cstatus" id="edit_status"  value="" class="layui-input" placeholder="请输入审核状态">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">报销备注：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="ccomment" id="edit_comment"  value="" class="layui-input" placeholder="请输入报销备注">
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
            <th>凭证编号</th>
            <th>凭证名称</th>
            <th>提交人</th>
            <th>报销金额</th>
            <th>报销日期</th>
            <th>备注</th>
            <th>审核状态</th>
            <th>操作</th>
        </thead>
        <tbody>
        <c:forEach items="${pi.list}" var="certification">
            <tr>
                    <%--<td>--%>
                    <%--<div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i></div>--%>
                    <%--</td>--%>
                <td>${certification.cid}</td>
                <td>${certification.cname}</td>
                <td>${certification.cemployee}</td>
                <td>${certification.camount}</td>
                <td>${certification.cdate}</td>
                        <td>${certification.ccomment}</td>
                        <td>${certification.cstatus}</td>
                <td>
                    <a title="编辑"    id= "updateEdit"    href="/findCertificationById?cid=${certification.cid}">
                        <i class="layui-icon">&#xe642;</i>
                    </a>
                    <a title="删除" onclick="member_del(this,'${certification.cid}')" href="javascript:;">
                        <i class="layui-icon">&#xe640;</i>
                    </a>
                    <a title="审核" onclick="audit(this,'${certification.cid}')" href="javascript:;">
                        <i class="layui-icon">&#xe631;</i>
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
                url: '/exportcertificationlist',
                type: 'post',
                dataType: 'json',
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    console.log(data);

                    // 1. 如果需要调整顺序，请执行梳理函数
                    var dt = excel.filterExportData(data, [
                        'cid'
                        ,'c_name'
                        ,'cemployee'
                        ,'camount'
                        ,'cdate'
                    ]);

                    // 2. 数组头部新增表头
                    dt.unshift({cid: 'ID', c_name: '凭证名称', cemployee: '提交人', camount: '报销金额', cdate: '报销日期'});

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
                    }, '凭证数据.xlsx', 'xlsx', {
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
                    setTimeout(function () {window.location.href='/findCertification';},2000);
                }
            });
        });

        /*添加弹出框*/
        $("#addCertificationBtn").click(function () {
            layer.open({
                type:1,
                title:"添加凭证",
                skin:"myclass",
                area:["50%"],
                anim:2,
                content:$("#test").html()
            });
            $("#addEmployeeForm")[0].reset();
            form.on('submit(formDemo)', function(data) {
                // layer.msg('aaa',{icon:1,time:3000});
                var param=data.field;
                // console.log(JSON.stringify(param));
                $.ajax({
                    url: '/addCertification',
                    type: "post",
                    data:JSON.stringify(param),
                    contentType: "application/json; charset=utf-8",
                    success:function(){
                        layer.msg('添加成功', {icon: 1, time: 3000});
                        setTimeout(function () {window.location.href='/findCertification';},2000);

                    },
                    error:function(){
                        layer.msg('添加失败',{icon:0,time:3000});
                        setTimeout(function () {window.location.href='/findCertification';},2000);
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
            $.get("/deleteCertification",{"cid":cid},function (data) {
                if(data =true){
                    layer.msg('删除成功!',{icon:1,time:2000});
                    setTimeout(function () {window.location.href='/findCertification';},2000);

                }else {
                    layer.msg('删除失败!',{icon:1,time:3000});
                    setTimeout(function () {window.location.href='/findCertification';},2000);
                }
            });
        });
    }

</script>


</body>


</html>

