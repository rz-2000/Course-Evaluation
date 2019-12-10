<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//UTF-8">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>海大优选</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/nav-footer.css">
    <script src="js/jquery-1.12.4.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <style>
        /*去除a标签的默认样式*/
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
        .banner{
            background: url(images/index.jpg) no-repeat center;
            margin-bottom: 10px;
        }
        h4{
            padding: 0;
            margin: 0;
        }
        .search{
            display: flex;
            flex-direction: column;
            justify-content: center;
            margin-bottom: 10px;

        }
        table{
            width:100%;
            border-collapse:collapse; /*表格的边框合并，如果相邻，则共用一个边框*/
            border-spacing:0; /*设置行与单元格边框的间距。当表格边框独立（即border-collapse:separate;）此属性才起作用*/
        }

        table td{
            margin: 0;
            padding: 0;
            word-break: break-all; /*允许在字内换行,即单词可分*/
            word-wrap:break-word;/*允许长单词或URL地址换行*/
        }
        .slogan{
            color: white;
            font-size: 50px;
            margin: 30px 0;
        }
        .search-line{
            padding: 0 15px;
            border: 1px solid transparent;
            transition: border-color .2s cubic-bezier(.645,.045,.355,1);
            width:450px;
            height: 40px;
            background-color: rgba(255, 255, 255, 0.3);
            margin-bottom:10px;
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
        }
        .search-button:hover{
            background-color: rgba(0, 131, 234, 0.68);
        }
        input:focus{
            outline: none;
            border-color: #3399ea;
        }
        input::-webkit-input-placeholder{
            color: rgba(255, 255, 255, 0.8);
        }
        #billboard{
            padding: 10px;
            color: white;
            background-color: rgba(0, 0, 0, 0.3);
        }
        #billboard a{
            color: white;
        }
        .billboard-hd{
            padding: 10px 10px 0;
            margin: 0 10px;
            border-bottom: 1px solid gray;
        }
        .billboard-hd h2{
            font-size: 20px;
        }
        #billboard tbody{
            padding: 0 10px;
        }

        #billboard td{
            padding: 7px 0;

        }
        .line{
            border: 1px solid grey;
            height:1px;
            margin: 0 10px;
        }
        .order{
            color: white;
            font-size: 14px;
            text-align: center;
        }
        .title{
            font-size: 16px;;
        }
        .line{
            border: 0.5px solid #c7c7c7;
            height:0.5px;
        }
        .hot-comment-content{
            display: flex;
            flex-direction:row;
            flex-wrap: wrap;

        }
        .hot-comment-card{
            display: flex;
            flex-direction: column;
            align-items: center;
            width:150px;
            margin: 15px;
        }
        .card-hd{
            margin-top: 5px;
        }
        .card-hd:hover{
            color: #3399ea;
        }
        .cover{
            width:150px;
            height:auto;
        }
        .star-list{
            padding-left: 5px;
        }
        .star-list li{
            float: left;
        }
        .star{
            width:13px;
            height:13px;
            margin: 0 1px;
        }
        .score{
            padding-top: 3px;
            margin: 0 6px;
            color: #e09015;
        }
        .hot-comment-title{
            margin: 10px;
        }
        .announcement-title{
            margin: 10px;

        }
    </style>
</head>
<body>
<header id="navigator">
    <div class="nav-left">
        <span class="nav_name">海大优选</span>
        <span class="nav_list"><a href="${pageContext.request.contextPath}/IndexServlet?method=allInfo" >首页</a></span>
        <span class="nav_list"><a href="#">课程</a></span>
    </div>
    <div class="nav-right">
        <div id="drop-name">
            <img src="images/duck.jpg" alt="">
            <span>${username}</span>
        </div>
        <div>
            <ul id="drop-list">
                <div class="line"></div>
                <li><a href="${pageContext.request.contextPath}/IndexServlet?method=info&username=${username}">个人中心</a></li>
                <div class="line"></div>
                <li><a href="${pageContext.request.contextPath}/UserServlet?method=logout">退出</a></li>
            </ul>
        </div>
    </div>

</header>
<section class="banner">
    <div class="container">
        <div class="row">
            <div class="col-md-8 search">
                <h1 class="slogan">海大优选</h1>
                <form action="${pageContext.request.contextPath}/IndexServlet?method=search" method="post">
                    <input name="keywords" type="text" class="search-line" placeholder="请输入您想找的课程">
                    <input name="id" type="hidden" value="${user.id}">
                    <button class="search-button" type="submit">搜索</button>
                </form>
            </div>
            <div class="col-md-4">
                <div id="billboard">
                    <div class="billboard-hd">
                        <h2>课程好评榜</h2>
                    </div>
                    <div class="billboard-bd">
                        <table>
                            <tbody>
                            <c:set var="count" value="0"></c:set>
                            <c:forEach items="${bestCourseList}" var="item">
                                <tr>
                                    <td class="order">${count+1}</td>
                                    <td class="title"><a href="/CourseServlet?">${item.name}</a></td>
                                </tr>
                                <c:set var="count" value="${count+1}"></c:set>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<section>
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <div class="hot-comment">
                    <h4 class="hot-comment-title">正在热评</h4>
                    <div class="line"></div>
                </div>
                <div class="hot-comment-content">
                    <c:set var="count" value="0"></c:set>
                    <c:forEach items="${hotCourseList}" var="item">
                    <c:if test="${count%4==0}"><tr></c:if>
                    <div class="hot-comment-card">
                        <a href="#"><img src="${item.image}" alt="" class="cover"></a>
                        <a href="" class="card-hd">${item.name}</a>
                        <ul class="star-list">
                            <li><img src="images/评星0.png" alt="" class="star"></li>
                            <li><img src="images/评星0.png" alt="" class="star"></li>
                            <li><img src="images/评星0.png" alt="" class="star"></li>
                            <li><img src="images/评星0.png" alt="" class="star"></li>
                            <li><img src="images/评星0.png" alt="" class="star"></li>
                            <li class="score">${item.score}</li>
                        </ul>
                    </div>
                        <c:set var="count" value="${count+1}"></c:set>
                    </c:forEach>
                </div>
            </div>
            <div class="col-md-4">
                <div class="announcement">
                    <h4 class="announcement-title">通知</h4>

                </div>
            </div>
        </div>
    </div>
</section>
<script>
    // 控制评星显示
    var star_lists = document.getElementsByClassName("star-list");
    for(var i = 0; i<star_lists.length; i++){
        var score = star_lists[i].getElementsByClassName("score")[0].innerText / 2;
        var score_int = Math.floor(score);
        var star_lis = star_lists[i].getElementsByTagName("img");
        var j = 0;
        while(j<score_int){
            star_lis[j].src = "images/评星1.png";
            j++;
        }
        if(score > score_int) {
            star_lis[j].src = "images/评星0.5.png";
        }
    }

</script>
<footer>
    <div class="copyright">
        Copyright © 2019 大碗宽面 All Rights Reserved
    </div>
</footer>
<script src="js/tools.js"></script>
</body>
</html>