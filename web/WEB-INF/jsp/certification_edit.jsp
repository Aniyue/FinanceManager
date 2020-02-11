<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/12/5
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
    <form class="layui-form" action="/updateCertification" method="post"  id="f_auto" accept-charset="UTF-8">
        <input type="hidden" value="${sessionScope.c.cid}" name="cid" id="cid"/>
        <div class="layui-form-item">
            <label for="cid" class="layui-form-label">
                <span class="f_sp">凭证编号</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="cid" name="cid"
                       autocomplete="off" value="${sessionScope.c.cid}" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="cname" class="layui-form-label">
                <span class="f_sp">*凭证名称</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="cname" name="cname"
                       autocomplete="off" value="${sessionScope.c.cname}" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="cemployee" class="layui-form-label">
                <span class="f_sp">凭证备注</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="cemployee" name="cemployee"
                       autocomplete="off" value="${sessionScope.c.cemployee}" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="camount" class="layui-form-label">
                <span class="f_sp">报销金额</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="camount" name="camount"
                       autocomplete="off" value="${sessionScope.c.camount}" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="cdate" class="layui-form-label">
                <span class="f_sp">报销日期</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="cdate" name="cdate"
                       autocomplete="off" value="${sessionScope.c.cdate}" class="layui-input">
            </div>
        </div>



        <div class="layui-form-item">
            <label for="ccomment" class="layui-form-label">
                <span class="f_sp">报销备注</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="ccomment" name="ccomment"
                       autocomplete="off" value="${sessionScope.c.ccomment}" class="layui-input">
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
