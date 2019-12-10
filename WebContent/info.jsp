<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="UTF-8">
    <title>个人中心</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/nav-footer.css">
    <script src="js/jquery-1.12.4.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <style>
        a {
            color: black;
            text-decoration: none;
        }
        /*正常的未被访问过的链接*/
        a:link {
            text-decoration: none;
        }
        /*已经访问过的链接*/
        a:visited {
            text-decoration: none;
        }
        /*鼠标划过(停留)的链接*/
        a:hover {
            text-decoration: none;

        }
        /* 正在点击的链接*/
        a:active {
            text-decoration: none;
        }
        ul, li{
            list-style: none;
            margin: 0;
            padding: 0;
        }
        footer{
            background-color: whitesmoke;
            position: fixed;
            bottom: 0;
            width:100%;
        }
        body{
            background-color: rgba(159, 159, 159, 0.04);
        }
        ul,li{
            list-style: none;
            padding: 0;
            margin: 0;
        }
        #profile{
            position: fixed;
            background-color: white;
            margin-top: 50px;
            padding: 30px;
            left: -1200px;
        }
        .modify{
            margin-top: 5px;;
            color: #3399ea;
            cursor: pointer;
        }
        .modify:hover{
            color: #0983ea;
        }
        .mod{
            float: right;
            color: #3399ea;
            cursor: pointer;
        }
        .left_c{
            padding: 0 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .right_c{
            padding: 0 20px;
        }
        .right_c li:first-child{
            margin-top: 8px;
        }
        .right_c li{
            padding:8px 0;
        }
        .dialog{
            display: none;
            position: fixed;
            top:0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.6);
            z-index: 999;
        }
        .dialog_cont{
            width:400px;
            background-color: white;
            margin: 100px auto;
            padding: 30px;
        }
        .title{
            font-size: 16px;
            float: left;
            height:24px;
            line-height: 24px;
            color: #3d3d3d;
        }
        .close{
            color: #999;
            font-size: 16px;
            float: right;
            cursor: pointer;
            width:24px;
            height:24px;
            text-align: center;
        }
        .change_message{
            display: flex;
            flex-direction: row;
            margin: 10px 0;
        }
        .left_input{
            width:80px;
            text-align: center;
            font-size: 14px;
            height:32px;
            line-height:32px;
            color: #3d3d3d;
        }

        .right_input{
           padding: 0 15px;
            border-radius: 5px;
            border: 1px solid #dcdfe6;
            transition: border-color .2s cubic-bezier(.645,.045,.355,1);
            width:200px;
            height: 30px;
        }
        *:focus {
            outline: none;
        }
        input:focus{
            border-radius: 5px;
            border-color: #3399ea;
        }
        #sex,#grade{
            padding: 0 10px;
            border-radius: 5px;
            border: 1px solid #dcdfe6;
            transition: border-color .2s cubic-bezier(.645,.045,.355,1);
            margin: 2px;
            width: 100px;
        }
        #sex:focus,#grade:focus{
            border-radius: 5px;
            border-color: #3399ea;
        }
        .btn_gray{
            color:#3d3d3d;
            border-color: #e0e0e0;
            background-color:#e0e0e0;
            cursor: pointer;
            margin: 0 16px;
        }
        .btn_gray:hover{
            color:#3d3d3d;
            background-color: #cbcbcb;
            border-color: #a2a2a2;
        }
        .modify-img{
            display: none;
            position: fixed;
            top:0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.6);
            z-index: 999;
        }
        #submit-img{
            display: flex;
            flex-direction: column;
        }
        #submit-img #img{
            margin: 15px auto;
            width:150px;
            height:150px;
        }
        #img img{
            width:150px;
            height:150px;
        }
        .close-img{
            color: #999;
            font-size: 16px;
            float: right;
            cursor: pointer;
            width:24px;
            height:24px;
            text-align: center;
        }
    </style>
</head>
<body>
<header id="navigator">
    <div class="nav-left">
        <span class="nav_name">海大优选</span>
        <span class="nav_list"><a href="index.jsp" >首页</a></span>
        <span class="nav_list"><a href="#">课程</a></span>
    </div>
    <div class="nav-right">
        <div id="drop-name">
            <img src="images/duck.jpg" alt="">
            <span>${user.username}</span>
        </div>
        <div>
            <ul id="drop-list">
                <div class="line"></div>
                <li><a href="#">个人中心</a></li>
                <div class="line"></div>
                <li><a href="login.jsp">退出</a></li>
            </ul>
        </div>
    </div>

</header>
<div class="container " id="profile">
        <div class="row">
            <div class="col-md-12">
                <h3>个人资料</h3>
                <hr>
            </div>
        </div>
        <div class="row">
                <div class="col-md-2 left_c">
                    <img src="images/duck.jpg" alt="duck" class="img-responsive" width="150" height="150">
                    <p class="modify">修改头像</p>
                </div>
                <div class="col-md-10 right_c">
                    <div class="nick">
                        <span>用户名：${user.username}</span>
                        <span class="mod">修改资料</span>
                    </div>
                    <ul class="self">
                        <li>实名：${user.realName}</li>
                        <c:if test="${user.sex eq 1}">
                        <li>性别：男</li>
                        </c:if>
                        <c:if test="${user.sex eq 2}">
                        <li>性别：女</li>
                        </c:if>
                        <li>学号：${user.number}</li>
                        <li>专业：${user.major}</li>
                        <li>入学时间：${user.grade}年</li>
                        <li>手机号码：${user.phoneNumber}</li>
                        <li>邮箱：${user.email}</li>
                    </ul>
                </div>
        </div>
    <!--修改头像弹窗-->
    <div class="modify-img">
        <div class="dialog_cont">
            <div class="box">
                <h3 class="title">修改头像</h3>
                <span class="close-img">×</span>
            </div>
            <div style="clear: both">
             <hr>
             </div>
            <form action="" id="submit-img">
                <input type="file" onchange="showImg(this)">
                <img src="images/add.png" alt="" id="img">
                <button class="btn btn-primary" type="submit">上传</button>
            </form>
        </div>
    </div>
    <!--修改资料弹窗-->
        <div class="dialog">
            <div class="dialog_cont">
                <div class="box">
                    <h3 class="title">修改资料</h3>
                    <span class="close">×</span>
                </div>
                <div style="clear: both">
                    <hr>
                </div>
                <form action="${pageContext.request.contextPath}/UserServlet?method=update" method="post">
                    <div class="change_message">
                        <label class="left_input">用户名：</label>
                        <input type="text" minlength="2" maxlength="20" class="right_input" required="required" name="username" value="${user.username}">
                    </div>
                    <div class="change_message">
                        <label class="left_input">实名：</label>
                        <input type="text" minlength="2" maxlength="20" class="right_input" required="required" name="realName" value="${user.realName}">
                    </div>
                    <div class="change_message">
                        <span class="left_input">性别：</span>
                        <select name="sex" id="sex">
                            <c:if test="${user.sex eq 1}">
                                <option value="1" selected>男</option>
                                <option value="2">女</option>
                            </c:if>
                            <c:if test="${user.sex eq 2}">
                                <option value="1" >男</option>
                                <option value="2" selected>女</option>
                            </c:if>
                        </select>
                    </div>
                    <div class="change_message">
                        <label class="left_input">学号：</label>
                        <input type="text" minlength="2" maxlength="20" class="right_input" required="required" name="number" value="${user.number}">
                    </div>
                    <div class="change_message">
                        <label class="left_input">专业：</label>
                        <input type="text" minlength="2" maxlength="20" class="right_input" name="major" value="${user.major}">
                    </div>
                    <div class="change_message">
                        <span class="left_input">年级：</span>
                        <select name="grade" id="grade">
                        <c:if test="${user.grade eq 2015}">
                                <option value="1" selected>2015级</option>
                                <option value="2">2016级</option>
                                <option value="3">2017级</option>
                                <option value="4">2018级</option>
                                <option value="5">2019级</option>
                        </c:if>
                        <c:if test="${user.grade eq 2016}">
                                <option value="1">2015级</option>
                                <option value="2" selected>2016级</option>
                                <option value="3">2017级</option>
                                <option value="4">2018级</option>
                                <option value="5">2019级</option>
                        </c:if>
                        <c:if test="${user.grade eq 2017}">
                                <option value="1">2015级</option>
                                <option value="2">2016级</option>
                                <option value="3" selected>2017级</option>
                                <option value="4">2018级</option>
                                <option value="5">2019级</option>
                        </c:if>
                        <c:if test="${user.grade eq 2018}">
                                <option value="1">2015级</option>
                                <option value="2">2016级</option>
                                <option value="3">2017级</option>
                                <option value="4" selected>2018级</option>
                                <option value="5">2019级</option>
                        </c:if>
                        <c:if test="${user.grade eq 2019}">
                                <option value="1">2015级</option>
                                <option value="2">2016级</option>
                                <option value="3">2017级</option>
                                <option value="4">2018级</option>
                                <option value="5" selected>2019级</option>
                        </c:if>
                        </select>
                    </div>
                    <div class="change_message">
                        <label class="left_input">手机号码：</label>
                        <input type="tel" minlength="2" maxlength="20" class="right_input" name="phoneNumber" value="${user.phoneNumber}">
                    </div>
                    <div class="change_message">
                        <label class="left_input">邮箱：</label>
                        <input type="email" minlength="2" maxlength="20" class="right_input" name="email" value="${user.email}">
                    </div>
                    <div class="dialog_footer">
                        <input type="hidden" name="id" value="${user.id}">
                        <input type="hidden" name="password" value="${user.password}">
                        <input class="btn btn-primary" type="submit" value="修改">
                        <span class = "btn btn_gray" id="cancel">取消</span>
                    </div>
                </form>
            </div>
        </div>

    </div>
<footer>
    <div class="line"></div>
    <div class="copyright">
        Copyright © 2019 大碗宽面 All Rights Reserved
    </div>
</footer>
<script src="js/tools.js"></script>
<script>
    window.onload = function () {
        var window_length =document.body.clientWidth;
        var profile = document.getElementById("profile");
        var profile_length = profile.offsetWidth;
        var left = window_length/2 - profile_length/2;
        console.log(window_length);
        $("#profile").animate({left: left},1500,"swing");
    };
    $(window).resize(function () {
        var window_length =document.body.clientWidth;
        var profile = document.getElementById("profile");
        var profile_length = profile.offsetWidth;
        var left = window_length/2 - profile_length/2;
        $("#profile").animate({left: left},500,"swing");
    });
    // 修改头像操作
    var modify = document.getElementsByClassName("modify")[0];
    var modify_img = document.getElementsByClassName("modify-img")[0];
    var close_img = document.getElementsByClassName("close-img")[0];
    modify.onclick = function () {
        console.log("click");
        modify_img.style.display = "block";
    };
    close_img.onclick = closeModify;
    function closeModify() {
    modify_img.style.display = "none";
    }
    // 预览图片
    function showImg(obj) {
    var file=$(obj)[0].files[0];    //获取文件信息
    if(file)
    {
    var reader=new FileReader();  //调用FileReader
    reader.readAsDataURL(file); //将文件读取为 DataURL(base64)
    reader.onload=function(evt){   //读取操作完成时触发。
    $("#img").attr('src',evt.target.result);  //将img标签的src绑定为DataURL
    };
    }
    else{
    alert("上传失败");
    }
    }
    // 修改资料操作
    var mod = document.getElementsByClassName("mod")[0];
    var dialog =document.getElementsByClassName("dialog")[0];
    mod.onclick = function () {
    dialog.style.display  = "block";
    };

    var close = document.getElementsByClassName("close")[0];
    var cancel = document.getElementById("cancel");
    close.onclick = closeDialog;
    cancel.onclick = closeDialog;
    function closeDialog() {
    dialog.style.display = "none";
    }

</script>
</body>
</html>