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
        .banner{
            background: url(images/index.jpg) no-repeat center;
            margin-bottom: 10px;
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
                <form action="">
                    <input type="text" class="search-line" placeholder="请输入您想找的课程">
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
                                    <td class="title"><a href="#">${item.name}</a></td>
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
<footer>
    <div class="copyright">
        Copyright © 2019 大碗宽面 All Rights Reserved
    </div>
</footer>
<script src="js/tools.js"></script>
</body>
</html>