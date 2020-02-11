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
    <form class="layui-form" action="/updateRegion" method="post"  id="f_auto" accept-charset="UTF-8">
        <input type="hidden" value="${sessionScope.r.r_regionkey}" name="r_regionkey" id="r_regionkey"/>
        <div class="layui-form-item">
            <label for="r_regionkey" class="layui-form-label">
                <span class="f_sp">地区编号</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="r_regionkey" name="r_regionkey"
                       autocomplete="off" value="${sessionScope.r.r_regionkey}" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="r_name" class="layui-form-label">
                <span class="f_sp">地区名称</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="r_name" name="r_name"
                       autocomplete="off" value="${sessionScope.r.r_name}" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="r_comment" class="layui-form-label">
                <span class="f_sp">地区备注</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="r_comment" name="r_comment"
                       autocomplete="off" value="${sessionScope.r.r_comment}" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="ps_supplycost" class="layui-form-label">
                <span class="f_sp">零件供应花费</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="ps_supplycost" name="ps_supplycost"
                       autocomplete="off" value="${sessionScope.r.ps_supplycost}" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="ps_comment" class="layui-form-label">
                <span class="">*</span>零件供应备注
            </label>
            <div class="layui-input-inline">
                <input type="text" id="ps_comment" name="ps_comment"
                       autocomplete="off" value="${sessionScope.r.ps_comment}" class="layui-input">
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
</script>
</body>
</html>
