<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/11/2
  Time: 13:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/weadmin.css">
    <script src="/lib/layui/layui.js" charset="utf-8"></script>
    <link rel="icon" href="/images/favicon.ico" sizes="32x32" />
    <script src="/js/jquery-1.3.2.min.js"></script>
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>

    <style>
        #canvas {
            float: right;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
    <%--<script src="js/login.js"></script>--%>
</head>
<body class="login-bg">

<div class="login">
    <div class="message">财务管理系统登录</div>
    <div id="darkbannerwrap"></div>

    <form action="/login" method="post">
        <input name="a_username" placeholder="用户名"  type="text" lay-verify="required" class="layui-input" />
        <hr class="hr15">
        <input name="a_password" lay-verify="required" placeholder="密码"  type="password" class="layui-input"/>
        <hr class="hr15">
        <div calss="form-group">
            <input name="a_yzm" lay-verify="required" placeholder="验证码"  style="width:220px;float: left;" type="text" class="layui-input"/>
            <canvas id="canvas" width="100" height="46"></canvas>
        </div>
        <hr class="hr15">
        <input type="submit" value="登录"/>
        <hr class="hr20" >

    </form>
</div>

<div class="footer">
    <span>&nbsp;&nbsp;&nbsp;财务管理系统 © 2019 </span>
</div>
<!-- 底部结束 -->

<script>

    $(function(){
        var show_num = [];
        draw(show_num);

        $("#canvas").on('click',function(){
            draw(show_num);
        })
        // $(".btn").on('click',function(){
        //     var val = $(".layui-input").val().toLowerCase();
        //     var num = show_num.join("");
        //     if(val==''){
        //         alert('请输入验证码！');
        //     }else if(val == num){
        //         alert('提交成功！');
        //         $(".input-val").val('');
        //         draw(show_num);
        //
        //     }else{
        //         alert('验证码错误！请重新输入！');
        //         $(".input-val").val('');
        //         draw(show_num);
        //     }
        // })
    })

    function draw(show_num) {
        var canvas_width=$('#canvas').width();
        var canvas_height=$('#canvas').height();
        var canvas = document.getElementById("canvas");//获取到canvas的对象，演员
        var context = canvas.getContext("2d");//获取到canvas画图的环境，演员表演的舞台
        canvas.width = canvas_width;
        canvas.height = canvas_height;
        var sCode = "A,B,C,E,F,G,H,J,K,L,M,N,P,Q,R,S,T,W,X,Y,Z,1,2,3,4,5,6,7,8,9,0";
        var aCode = sCode.split(",");
        var aLength = aCode.length;//获取到数组的长度

        for (var i = 0; i <= 3; i++) {
            var j = Math.floor(Math.random() * aLength);//获取到随机的索引值
            var deg = Math.random() * 30 * Math.PI / 180;//产生0~30之间的随机弧度
            var txt = aCode[j];//得到随机的一个内容
            show_num[i] = txt.toLowerCase();
            var x = 10 + i * 20;//文字在canvas上的x坐标
            var y = 20 + Math.random() * 8;//文字在canvas上的y坐标
            context.font = "bold 23px 微软雅黑";

            context.translate(x, y);
            context.rotate(deg);

            context.fillStyle = randomColor();
            context.fillText(txt, 0, 0);

            context.rotate(-deg);
            context.translate(-x, -y);
        }
        for (var i = 0; i <= 5; i++) { //验证码上显示线条
            context.strokeStyle = randomColor();
            context.beginPath();
            context.moveTo(Math.random() * canvas_width, Math.random() * canvas_height);
            context.lineTo(Math.random() * canvas_width, Math.random() * canvas_height);
            context.stroke();
        }
        for (var i = 0; i <= 30; i++) { //验证码上显示小点
            context.strokeStyle = randomColor();
            context.beginPath();
            var x = Math.random() * canvas_width;
            var y = Math.random() * canvas_height;
            context.moveTo(x, y);
            context.lineTo(x + 1, y + 1);
            context.stroke();
        }
    }

    function randomColor() {//得到随机的颜色值
        var r = Math.floor(Math.random() * 256);
        var g = Math.floor(Math.random() * 256);
        var b = Math.floor(Math.random() * 256);
        return "rgb(" + r + "," + g + "," + b + ")";
    }
</script>
</body>
</html>