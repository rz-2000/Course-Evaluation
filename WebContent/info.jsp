<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="UTF-8">
    <title>个人主页</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/nav-footer.css">
    <script src="js/jquery-1.12.4.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <style>
        @font-face {
            font-family: 'cool';
            src:url('font/kanfu.TTF');

        }
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
    </style>
</head>
<body>
<header id="navigator">
    <div class="nav-left">
        <span class="nav_name">海大优选</span>
        <span class="nav_list"><a href="#" >首页</a></span>
        <span class="nav_list"><a href="#">课程</a></span>
    </div>
    <div class="nav-right">
        <div id="drop-name">
            <img src="images/duck.jpg" alt="">
            <span>杨欧牟</span>
        </div>
        <div>
            <ul id="drop-list">
                <div class="line"></div>
                <li><a href="#">个人中心</a></li>
                <div class="line"></div>
                <li><a href="">退出</a></li>
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
                        <span>用户名：Zayn17</span>
                        <span class="mod">修改资料</span>
                    </div>
                    <ul class="self">
                        <li>实名：旺财</li>
                        <li>性别：男</li>
                        <li>学号：17020031011</li>
                        <li>专业：</li>
                        <li>入学时间：2017年</li>
                        <li>手机号码：1008208820</li>
                        <li>邮箱：wangwangwang@163.com</li>
                    </ul>
                </div>
        </div>
        <div class="dialog">
            <div class="dialog_cont">
                <div class="box">
                    <h3 class="title">修改资料</h3>
                    <span class="close">×</span>
                </div>
                <div style="clear: both">
                    <hr>
                </div>
                <form action="">
                    <div class="change_message">
                        <label class="left_input">用户名：</label>
                        <input type="text" minlength="2" maxlength="20" class="right_input" required="required">
                    </div>
                    <div class="change_message">
                        <label class="left_input">实名：</label>
                        <input type="text" minlength="2" maxlength="20" class="right_input" required="required">
                    </div>
                    <div class="change_message">
                        <span class="left_input">性别：</span>
                        <select name="sex" id="sex">
                            <option value="1" selected>男</option>
                            <option value="2">女</option>
                        </select>
                    </div>
                    <div class="change_message">
                        <label class="left_input">学号：</label>
                        <input type="text" minlength="2" maxlength="20" class="right_input" required="required">
                    </div>
                    <div class="change_message">
                        <label class="left_input">专业：</label>
                        <input type="text" minlength="2" maxlength="20" class="right_input">
                    </div>
                    <div class="change_message">
                        <span class="left_input">年级：</span>
                        <select name="grade" id="grade">
                            <option value="1" selected>2015级</option>
                            <option value="2">2016级</option>
                            <option value="3">2017级</option>
                            <option value="4">2018级</option>
                            <option value="5">2019级</option>
                        </select>
                    </div>
                    <div class="change_message">
                        <label class="left_input">手机号码：</label>
                        <input type="tel" minlength="2" maxlength="20" class="right_input">
                    </div>
                    <div class="change_message">
                        <label class="left_input">邮箱：</label>
                        <input type="email" minlength="2" maxlength="20" class="right_input">
                    </div>
                    <div class="dialog_footer">
                        <button class="btn btn-primary" type="submit">保存</button>
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