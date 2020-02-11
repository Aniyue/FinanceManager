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
    <form class="layui-form" action="/updateBudget" method="post"  id="f_auto" accept-charset="UTF-8">
        <input type="hidden" value="${sessionScope.b.bid}" name="bid" id="bid"/>
        <div class="layui-form-item">
            <label for="bid" class="layui-form-label">
                <span class="">*</span>预算编号
            </label>
            <div class="layui-input-inline">
                <input type="text" id="bid" name="bid"
                       autocomplete="off" value="${sessionScope.b.bid}" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="bname" class="layui-form-label">
                <span class="">*</span>预算名称
            </label>
            <div class="layui-input-inline">
                <input type="text" id="bname" name="bname"
                       autocomplete="off" value="${sessionScope.b.bname}" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="bproject" class="layui-form-label">
                <span class="">*</span>项目名称
            </label>
            <div class="layui-input-inline">
                <input type="text" id="bproject" name="bproject"
                       autocomplete="off" value="${sessionScope.b.bproject}" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="bcost" class="layui-form-label">
                <span class="">成本</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="bcost" name="bcost"
                       autocomplete="off" value="${sessionScope.b.bcost}" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="bbenefit" class="layui-form-label">
                <span class="">预期收益</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="bbenefit" name="bbenefit"
                       autocomplete="off" value="${sessionScope.b.bbenefit}" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="bdate" class="layui-form-label">
                <span class="">日期</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="bdate" name="bdate"
                       autocomplete="off" value="${sessionScope.b.bdate}" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="bcomment" class="layui-form-label">
                <span class="">预算备注</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="bcomment" name="bcomment"
                       autocomplete="off" value="${sessionScope.b.bcomment}" class="layui-input">
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
