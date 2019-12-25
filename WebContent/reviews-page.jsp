<%@page pageEncoding="utf-8" contentType="text/html;charset=utf-8"%> 
<!DOCTYPE html>
<html lang="en">

</head>
    <meta charset="utf-8">

  
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/nav-footer.css">
    <script src="js/jquery-1.12.4.js"></script>
    <script src="js/bootstrap.min.js"></script>

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="VANNO - Premium directory consumer reviews and listings template by Ansonika">
    <meta name="author" content="Ansonika">
      <title>海大优选|公共课课程评价系统</title>
    <!-- Favicons-->
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" type="image/x-icon" href="img/apple-touch-icon-57x57-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="img/apple-touch-icon-72x72-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="img/apple-touch-icon-114x114-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="img/apple-touch-icon-144x144-precomposed.png">

    <!-- GOOGLE WEB FONT -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">

    <!-- BASE CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
	<link href="css/vendors.css" rel="stylesheet">

    <!-- YOUR CUSTOM CSS -->
    <link href="css/custom.css" rel="stylesheet">

</head>

<body>
		
	<div id="page">
		
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
	<!-- /header -->
	
	<main>
		<div class="reviews_summary">
			<div class="wrapper">
				<div class="container">
					<div class="row">
						<div class="col-lg-8">
							<figure>
								<img src="${course.image}" alt="">
							</figure>
							<small>${course.teacher}:${course.type}</small>
							<h1>${course.name}</h1>

							<span class="rating"><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star empty"></i><em>${course.score}/10.0 - 基于${course.total} 个评分</em></span>
						</div>
						<div class="col-lg-4 review_detail">
							<div class="row">
								<div class="col-lg-9 col-9">
									<div class="progress">
										<div class="progress-bar" role="progressbar" style="width: ${course.fiveStar*100/course.total}%" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"></div>
									</div>
								</div>
								<div class="col-lg-3 col-3 text-right"><strong>5星</strong></div>
							</div>
							<!-- /row -->
							<div class="row">
								<div class="col-lg-9 col-9">
									<div class="progress">
										<div class="progress-bar" role="progressbar" style="width: ${course.fourStar*100/course.total}%" aria-valuenow="95" aria-valuemin="0" aria-valuemax="100"></div>
									</div>
								</div>
								<div class="col-lg-3 col-3 text-right"><strong>4星</strong></div>
							</div>
							<!-- /row -->
							<div class="row">
								<div class="col-lg-9 col-9">
									<div class="progress">
										<div class="progress-bar" role="progressbar" style="width: ${course.threeStar*100/course.total}%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
									</div>
								</div>
								<div class="col-lg-3 col-3 text-right"><strong>3星</strong></div>
							</div>
							<!-- /row -->
							<div class="row">
								<div class="col-lg-9 col-9">
									<div class="progress">
										<div class="progress-bar" role="progressbar" style="width: ${course.twoStar*100/course.total}%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
									</div>
								</div>
								<div class="col-lg-3 col-3 text-right"><strong>2星</strong></div>
							</div>
							<!-- /row -->
							<div class="row">
								<div class="col-lg-9 col-9">
									<div class="progress last">
										<div class="progress-bar" role="progressbar" style="width: ${course.oneStar*100/course.total}%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
									</div>
								</div>
								<div class="col-lg-3 col-3 text-right"><strong>1星</strong></div>
							</div>
							<!-- /row -->
						</div>
					</div>
				</div>
				<!-- /container -->
			</div>
		</div>
		<!-- /reviews_summary -->
		
		<div class="container margin_60_35">
			<div class="row">
				<div class="col-lg-8">
					
					<div class="box_general write_review">
						<h1>写课程评论</h1>
						<form action="${pageContext.request.contextPath}/EvaluationServlet?method=add" method="post">
							</fieldset>
						<div class="rating_submit">
							<div class="form-group">
							<label class="d-block">评星</label>
							<span class="rating">
								<input type="radio" class="rating-input" id="5" name="star" value="5"><label for="5" class="rating-star"></label>
								<input type="radio" class="rating-input" id="4" name="star" value="4"><label for="4" class="rating-star"></label>
								<input type="radio" class="rating-input" id="3" name="star" value="3"><label for="3" class="rating-star"></label>
								<input type="radio" class="rating-input" id="2" name="star" value="2"><label for="2" class="rating-star"></label>
								<input type="radio" class="rating-input" id="1" name="star" value="1"><label for="1" class="rating-star"></label>
							</span>
								</div>
						</div>
							<!-- /rating_submit -->
							<div class="form-group">
								<label class="radio">是否上过该课程:</label>
								<label><input type="radio" name="learned" value="1">上过</label>
								<label><input type="radio" name="learned" value="0">没上过</label>
							</div>

							<div class="form-group">
								<label>评论内容：</label>
								<textarea class="form-control" style="height: 180px;" placeholder="请在这里写在你的评论（300字内）"name = "content"></textarea>
							</div>

							<div class="dialog_footer">
								<input name="userId" type="hidden" value="${user.id}">
								<input name="courseId" type="hidden" value="${course.id}">
								<input type="submit" name="submit" class="btn_1 rounded full-width" value="提交"/>
							</div>
						</fieldset>
	                    </form>
					</div>
				</div>
			</div>
		</div>


		<div class="m-auto">
			<form action="${pageContext.request.contextPath}/EvaluationServlet?method=showEvaluation" method="post">
				<input name="id" value="${course.id}" type="hidden">
				<input name="userId" value="${user.id}" type="hidden">
			</form>
		</div>
		<div class="container margin_60_35">
			<div class="row">
				<c: class="col-lg-8">
					<div class="review_card">
						<c:forEach items="${evaluationList}" var="item" >
						<div class="row">
							<div class="col-md-2 user_info">
									<figure><img src="img/avatar1.jpg" alt=""></figure>
								<h5><a href="${pageContext.request.contextPath}/EvaluationServlet?method=allInfo&id=${item.id}}">${item.userId}</a></h5>
							</div>
							<div class="col-md-10 review_content">
								<div class="clearfix add_bottom_15">
									<span class="rating">
										<i class="icon_star"></i>
										<i class="icon_star"></i>
										<i class="icon_star"></i>
										<i class="icon_star"></i>
										<i class="icon_star"></i>
										<em>${item.star}</em>
									</span>
                                    <em>Published ${item.time}</em>
								</div>
								<p>${item.content}</p>
								<ul>
									<li><a href="${pageContext.request.contextPath}/EvaluationServlet?method=addSupport&id=${item.id}"><i class="icon_like_alt"></i><span>赞</span></a></li>
								</ul>
							</div>
						</div>
						</c:forEach>
					</div>

					<!-- /row -->
					<!-- /review_card -->
				</c:>
					<!-- /pagination -->
				</div>
			</div>
			<!-- /row -->

		<!-- /container -->

	</main>
	<!--/main-->
	
	
	</div>
	<!-- page -->

	
	<div id="toTop"></div><!-- Back to top button -->
	
	<!-- COMMON SCRIPTS -->
    <script src="js/common_scripts.js"></script>
	<script src="js/functions.js"></script>
	<script src="assets/validate.js"></script>
	<script src="js/tools.js"></script>
</body>
<footer>
    <div class="line"></div>
    <div class="copyright">
        Copyright © 2019 大碗宽面 All Rights Reserved
    </div>
</footer>
</html>
