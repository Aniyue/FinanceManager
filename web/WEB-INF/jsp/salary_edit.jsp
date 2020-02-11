<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/11/21
  Time: 12:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>修改信息</title>
    <link rel="icon" href="/images/favicon.ico" sizes="32x32" />
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <link rel="stylesheet" href="/css/pg_btn.css">
    <script type="text/javascript" src="./js/jquery-1.3.2.min.js"></script>
    <script src="lib/layui/layui.js"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
</head>

<body>

<div class="x-body">
    <form class="layui-form" action="/updateSalary" method="post"  id="f_auto" accept-charset="UTF-8">
        <input type="hidden" value="${sessionScope.s.sid}" name="sid" id="sid"/>
        <%--<div class="layui-form-item">--%>
            <%--<label for="sid" class="layui-form-label">--%>
                <%--<span class="">*</span>薪资编号--%>
            <%--</label>--%>
            <%--<div class="layui-input-inline">--%>
                <%--<input type="text" id="sid" name="sid"--%>
                       <%--autocomplete="off" value="${sessionScope.s.sid}" class="layui-input">--%>
            <%--</div>--%>
        <%--</div>--%>

        <div class="layui-form-item">
            <label for="sname" class="layui-form-label">
                <span class="">*</span>员工姓名
            </label>
            <div class="layui-input-inline">
                <input type="text" id="sname" name="sname"
                       autocomplete="off" value="${sessionScope.s.sname}" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="sdepart" class="layui-form-label">
                <span class="f_sp">部门</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="sdepart" name="sdepart"
                       autocomplete="off" value="${sessionScope.s.sdepart}" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="sjob" class="layui-form-label">
                <span class="f_sp">职位</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="sjob" name="sjob"
                       autocomplete="off" value="${sessionScope.s.sjob}" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="sjiben" class="layui-form-label">
                <span class="f_sp">基本薪资</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="sjiben" name="sjiben" id="t1" onkeyup="compute();"
                       autocomplete="off" value="${sessionScope.s.sjiben}" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="sjiaoshui" class="layui-form-label">
                <span class="f_sp">缴费(含税)</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="sjiaoshui" name="sjiaoshui" id="t2" onkeyup="compute();"
                       autocomplete="off" value="${sessionScope.s.sjiaoshui}" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="sjiaban" class="layui-form-label">
                <span class="f_sp">加班费</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="sjiaban" name="sjiaban" id="t3" onkeyup="compute();"
                       autocomplete="off" value="${sessionScope.s.sjiaban}" class="layui-input">
            </div>
        </div>


        <div class="layui-form-item">
            <label for="sbonus" class="layui-form-label">
                <span class="f_sp">奖金</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="sbonus" name="sbonus" id="t4" onkeyup="compute();"
                       autocomplete="off" value="${sessionScope.s.sbonus}" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="sfine" class="layui-form-label">
                罚金
            </label>
            <div class="layui-input-inline">
                <input type="text" id="sfine" name="sfine" id="t5" onkeyup="compute();"
                       autocomplete="off" value="${sessionScope.s.sfine}" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">预计算：</label>
            <div class="layui-input-block">
                <input type="text"   id="t6" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="stotal" class="layui-form-label">
                <span class="f_sp">总计</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="stotal" name="stotal"
                       autocomplete="off" value="${sessionScope.s.stotal}" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item" id="btn_xg">
            <button  class="layui-btn"  id="btn_on" lay-filter="updateForm" lay-submit="">
                修改
            </button>
        </div>
    </form>
</div>

<script>
    function compute() {
        var t1 = document.getElementById("t1").value;
        var t2 = document.getElementById("t2").value;
        var t3 = document.getElementById("t3").value;
        var t4 = document.getElementById("t4").value;
        var t5 = document.getElementById("t5").value;
        document.getElementById("t6").value = parseFloat(t1) - parseFloat(t2) + parseFloat(t3) + parseFloat(t4) - parseFloat(t5);
    };

</script>
</body>
</html>
