<%--
  Created by IntelliJ IDEA.
  User: 杨志豪
  Date: 2019/12/10
  Time: 16:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//UTF-8">
<html>
<head>
    <meta charset="UTF-8">
    <title>课程</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/nav-footer.css">
    <script src="js/jquery-1.12.4.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <style>
        .search-Area{
            padding: 20px 0px;
            background-color: #f0f3f5;
        }
        .search-input{
            padding: 0 15px;
            border: 1px solid #cccccc;
            border-radius: 5px;
            width:450px;
            height: 40px;
        }
        .search-input:focus{
            outline: none;
        }
        .search-button{
            margin: 0;
            padding: 0;
            height:40px;
            width:80px;
            outline: none;
            border: 0;
            background-color: #3399ea;
            color: white;
            transition: all .5s cubic-bezier(.645,.045,.355,1);
            border-radius: 5px;
        }
        .search-button:focus{
            outline: none;
        }
        .search-button:hover{
            background-color: rgba(0, 131, 234, 0.68);
        }
        .search-hint{
            margin: 20px 0px 40px;
        }

        .score{
            color: #e09015;
        }

        #detail th{
            padding: 10px;
            width:100px;
            text-align: center;
            background-color: #037cea;
            color: white;
            border: 4px solid white;
        }
        #detail td{
            text-align: center;
            background-color: whitesmoke;
            border: 4px solid white;
            padding: 5px 0;
        }
        #detail td:last-of-type{
            width:400px;
        }
        #detail a{
            color: #0088cc;
        }
    </style>
</head>
<body>
<header id="navigator">
    <div class="nav-left">
        <span class="nav_name">海大优选</span>
        <span class="nav_list"><a href="${pageContext.request.contextPath}/IndexServlet?method=allInfo&username=${user.username}">首页</a></span>
        <span class="nav_list"><a href="${pageContext.request.contextPath}/CourseServlet?method=list">课程</a></span>
    </div>
    <div class="nav-right">
        <div id="drop-name">
            <img src="${user.profilePhoto}" alt="">
            <span>${user.username}</span>
        </div>
        <div>
            <ul id="drop-list">
                <div class="line"></div>
                <li><a href="${pageContext.request.contextPath}/UserServlet?method=info&username=${user.username}">个人中心</a></li>
                <div class="line"></div>
                <li><a href="${pageContext.request.contextPath}/UserServlet?method=logout">退出</a></li>
            </ul>
        </div>
    </div>

</header>
<div class="search-Area">
    <div class="container">
        <div class="row">
            <div class="m-auto">
                <form action="${pageContext.request.contextPath}/IndexServlet?method=search" method="post">
                    <input type="text" class="search-input" placeholder="请输入您想搜索的课程">
                    <input name="id" type="hidden" value="${user.id}">
                    <input type="submit" class="search-button" value="搜索">
                </form>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <div class="search-hint">
        <input type="button" class="btn btn-primary" value="专业课" onclick="window.location='${pageContext.request.contextPath}/CourseServlet?method=list&type=1'">
        <input type="button" class="btn btn-info" value="公共基础课" onclick="window.location='${pageContext.request.contextPath}/CourseServlet?method=list&type=2'">
        <input type="button" class="btn btn-secondary" value="通识课" onclick="window.location='${pageContext.request.contextPath}/CourseServlet?method=list&type=3'">
    </div>
    <hr>
    <div style="margin: 50px 0">
        <table id="detail" class="m-auto">
            <tr>
                <th>课程名称</th>
                <th>授课老师</th>
                <th>评分</th>
                <th>最新评价</th>
            </tr>
            <c:forEach items="${courseVoList}" var="item">
            <tr>
                <td><a href="${pageContext.request.contextPath}/CourseServlet?method=showCourse&id=${item.id}">${item.name}</a></td>
                <td>${item.teacher}</td>
                <td value="${item.score}" class="score"></td>
                <td>${item.newEva}</td>
            </tr>
            </c:forEach>
        </table>
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
    var wjx_k = "☆";
    var wjx_s = "★";
    var star;
    var score_list = $(".score");
    console.log(score_list.length);
    var value;

    for(var i = 0; i<score_list.length; i++){
        value = Math.floor(score_list[i].getAttribute("value")/2);
        //    console.log(value);
        var stars = "";
        for(var j = 0; j<value; j++){
            stars += wjx_s;
        }

        while(j<5){
            stars += wjx_k;
            j++;
        }
        //      console.log(stars);
        score_list[i].innerText = stars  + " " + score_list[i].getAttribute("value");
    }
</script>
</body>
</html>
