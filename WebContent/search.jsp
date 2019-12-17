<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
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
        .search-list{
            display: flex;
            flex-direction: row;
            padding: 20px 20px;
            border-bottom: 1px solid #dddddd;
        }
        .search-img{
            width:100px;
        }
        .search-detail{
            padding-left: 30px;
            display: flex;
            flex-direction: column;
        }
        .course-name{
            font-size: 18px;
            color: #2878b7;
            padding-left: 5px;
            margin-bottom: 5px;
        }
        .course-detail{
            padding-left: 5px;
            color: gray;
            margin-bottom: 5px;
            font-size: 15px;
        }

        .course-comment{
            padding: 20px;
            background-color: #f8fbfd;
        }
        p{
            margin: 0;
            padding: 0;
        }
    </style>
</head>
<body>
<header id="navigator">
    <div class="nav-left">
        <span class="nav_name">海大优选</span>
        <span class="nav_list"><a href="${pageContext.request.contextPath}/IndexServlet?method=allInfo&username=${user.username}" >首页</a></span>
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
                <form action="${pageContext.request.contextPath}/SearchServlet?method=search" method="post">
                    <input type="text" class="search-input" placeholder="请输入您想搜索的课程" name="keywords">
                    <button type="submit" class="search-button">搜索</button>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="search-result">
    <div class="container">
        <div class="search-hint">
            <h2>搜索</h2>
        </div>
        <hr>
        <c:forEach items="${courseList}" var="item">
            <section class="search-list">
                <a href="${pageContext.request.contextPath}/ReviewPageServlet?method=allInfo&id=${item.id}"><img src="images/temp.jpg" alt=""class="search-img"></a>
                <div class="search-detail">
                    <a href="${pageContext.request.contextPath}/ReviewPageServlet?method=allInfo&id=${item.id}" class="course-name">${item.name}</a>
                    <ul class="star-list">
                        <li><img src="images/评星0.png" alt="" class="star"></li>
                        <li><img src="images/评星0.png" alt="" class="star"></li>
                        <li><img src="images/评星0.png" alt="" class="star"></li>
                        <li><img src="images/评星0.png" alt="" class="star"></li>
                        <li><img src="images/评星0.png" alt="" class="star"></li>
                        <li class="score">${item.score}</li>
                    </ul>
                    <span class="course-detail">老师：${item.teacher}</span>
                    <span class="course-detail" >类别：${item.type}</span>
                </div>
            </section>
        </c:forEach>
    </div>

</div>
<footer>
    <div class="line"></div>
    <div class="copyright">
        Copyright © 2019 大碗宽面 All Rights Reserved
    </div>
</footer>
<script src="js/tools.js"></script>
<script type="text/javascript">
    // 控制评星显示
    var star_lists = document.getElementsByClassName("star-list");
    for(var i = 0; i<star_lists.length; i++) {
        var text_score = star_lists[i].getElementsByClassName("score")[0];
        var score = text_score.innerText / 2;
        var score_int = Math.floor(score);
        if (score_int == 0) {
            text_score.innerText = "暂无评分";
            text_score.style.color = "grey";
            text_score.style.fontSize = "13px";
        } else {
            var star_lis = star_lists[i].getElementsByTagName("img");
            var j = 0;
            while (j < score_int) {
                star_lis[j].src = "images/评星1.png";
                j++;
            }
            if (score > score_int) {
                star_lis[j].src = "images/评星0.5.png";
            }
        }
    }
</script>
</body>
</html>