<%@page pageEncoding="utf-8" contentType="text/html;charset=utf-8"%> 
<!DOCTYPE html>
<html lang="en">

<head>
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
	<!-- /header -->
	
	<main>
		<div class="reviews_summary">
			<div class="wrapper">
				<div class="container">
					<div class="row">
						<div class="col-lg-8">
							<figure>
								<img src="img/computernet.jpg" alt="">
							</figure>
							<small>王老师：专业课</small>
							<h1>计算机网络</h1>

							<span class="rating"><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star empty"></i><em>4.50/5.00 - 基于234 个评分</em></span>
						</div>
						<div class="col-lg-4 review_detail">
							<div class="row">
								<div class="col-lg-9 col-9">
									<div class="progress">
										<div class="progress-bar" role="progressbar" style="width: 90%" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"></div>
									</div>
								</div>
								<div class="col-lg-3 col-3 text-right"><strong>5星</strong></div>
							</div>
							<!-- /row -->
							<div class="row">
								<div class="col-lg-9 col-9">
									<div class="progress">
										<div class="progress-bar" role="progressbar" style="width: 95%" aria-valuenow="95" aria-valuemin="0" aria-valuemax="100"></div>
									</div>
								</div>
								<div class="col-lg-3 col-3 text-right"><strong>4星</strong></div>
							</div>
							<!-- /row -->
							<div class="row">
								<div class="col-lg-9 col-9">
									<div class="progress">
										<div class="progress-bar" role="progressbar" style="width: 60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
									</div>
								</div>
								<div class="col-lg-3 col-3 text-right"><strong>3星</strong></div>
							</div>
							<!-- /row -->
							<div class="row">
								<div class="col-lg-9 col-9">
									<div class="progress">
										<div class="progress-bar" role="progressbar" style="width: 20%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
									</div>
								</div>
								<div class="col-lg-3 col-3 text-right"><strong>2星</strong></div>
							</div>
							<!-- /row -->
							<div class="row">
								<div class="col-lg-9 col-9">
									<div class="progress last">
										<div class="progress-bar" role="progressbar" style="width: 0" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
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
						<div class="rating_submit">
							<div class="form-group">
							<form action="/review.asp">
						<fieldset>
							<label class="d-block">评星</label>
							<span class="rating">
								<input type="radio" class="rating-input" id="5_star" name="rating-input" value="5 Stars"><label for="5_star" class="rating-star"></label>
								<input type="radio" class="rating-input" id="4_star" name="rating-input" value="4 Stars"><label for="4_star" class="rating-star"></label>
								<input type="radio" class="rating-input" id="3_star" name="rating-input" value="3 Stars"><label for="3_star" class="rating-star"></label>
								<input type="radio" class="rating-input" id="2_star" name="rating-input" value="2 Stars"><label for="2_star" class="rating-star"></label>
								<input type="radio" class="rating-input" id="1_star" name="rating-input" value="1 Star"><label for="1_star" class="rating-star"></label>
							</span>
							</div>
						</div>
						<!-- /rating_submit -->
						<div>是否上过该课程:
							<label><input type="radio" name="learned" value="y">上过</label>
							<label><input type="radio" name="learned" value="n">没上过</label>
						<div class="form-group">
							
							<label>评论内容：</label>
							<textarea class="form-control" style="height: 180px;" placeholder="请在这里写在你的评论（300字内）"></textarea>
						</div>
						
						<input type="submit" value="提交">
						</fieldset>
	                    </form>
					</div>
				</div>
			</div>
		</div>
		
		<div class="container margin_60_35">
			<div class="row">
				<div class="col-lg-8">
					<div class="review_card">
						<div class="row">
							<div class="col-md-2 user_info">
								<figure><img src="img/avatar1.jpg" alt=""></figure>
								<h5>张一</h5>
							</div>
							<div class="col-md-10 review_content">
								<div class="clearfix add_bottom_15">
									<span class="rating"><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star empty"></i><em>4.50/5.00</em></span>
									<em>Published 54 minutes ago</em>
								</div>
								<h4>"推荐一本书"</h4>
								<p>强烈建议配合《计算机网络：自顶向下方法》一起看，在老师们讲的不够深的时候可以看书进行补充，而老师们生动地图片演示又让我们能快速理解那些书中长篇大论又很枯燥难以理解的部分，总之在两者之中受益匪浅！在赞这门课的同时，赞一下《自顶向下》，可以说是一本神作了！！</p>
								<ul>
									<li><a href="#0"><i class="icon_like_alt"></i><span>赞</span></a></li>
									<li><a href="#0"><i class="icon_dislike_alt"></i><span>反对</span></a></li>
									
								</ul>
							</div>
						</div>
						<!-- /row -->
						<div class="row reply">
							<div class="col-md-2 user_info">
								<figure><img src="img/avatar.jpg" alt=""></figure>
							</div>
							
						</div>
						<!-- /reply -->
					</div>
					<!-- /review_card -->
					<div class="review_card">
						<div class="row">
							<div class="col-md-2 user_info">
								<figure><img src="img/avatar4.jpg" alt=""></figure>
								<h5>王一</h5>
							</div>
							<div class="col-md-10 review_content">
								<div class="clearfix add_bottom_15">
									<span class="rating"><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i><em>5.00/5.00</em></span>
									<em>55分钟前</em>
								</div>
								<h4>"强烈推荐"</h4>
								<p>我个人对于电脑和网络是很感兴趣的，但由于学习的东西不多，经常是在玩游戏，真正运用到网络的技术性的东西实在少到可怜。象做博客，我只是会一般的做法，也能把它搞得与众不同，但我全然不知道其中的奥秘。象代码之类的东西，我以前只是耳闻，半点也不懂。学了这门课程后，虽然懂的不是很多，但已经不是什么都不知道的了，简单得运用一些代码还是会的，这也就行了。我并不要求学得很精深，毕竟我将来并不是干这行的。而制作网页的知识，学了一点，也会做一些简单的网页了，其实我觉得这就够了，我还没有想做自己的网页发布到网上的念头。但我不是说不要学习计算机网络技术，相反，我们学地越精深越好，我的观点只能代表我个人的想法，毕竟这个时代学得越多，活得更好的可能性就越大。只不过人的精力有限，只能学到你能承受的地步。如果精力旺盛，足够学一切技术，自然也没人反对。网络之中目前我最感兴趣的还是做博客，时不时写些自己的感悟或者转载些别人的好文章，上传一些漂亮的图片和朋友们分享，这让人感觉到难得的愉悦。好东西，大家一起分享才有意思。</p>
								<ul>
									<li><a href="#0"><i class="icon_like_alt"></i><span>赞</span></a></li>
									<li><a href="#0"><i class="icon_dislike_alt"></i><span>反对</span></a></li>
									
								</ul>
							</div>
						</div>
						<!-- /row -->
					</div>
					<!-- /review_card -->
					<div class="review_card">
						<div class="row">
							<div class="col-md-2 user_info">
								<figure><img src="img/avatar6.jpg" alt=""></figure>
								<h5>二狗</h5>
							</div>
							<div class="col-md-10 review_content">
								<div class="clearfix add_bottom_15">
									<span class="rating"><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star empty"></i><em>4.50/5.00</em></span>
									<em>54 分钟前</em>
								</div>
								<h4>"牛"</h4>
								<p>非常非常好！老师讲的很清楚，课件也整理的很好，每个课件中的提问问题也很用心。配合着教材看看的很舒心。虽然有感觉有的地方老师讲的有点简洁明快，挖的不够深。但总体来说非常非常好。比那些国家精品课还要好一些。 //第二次补充评论 越看越觉得这个课件很厉害，老师不仅讲解重点突出，还有做好的思维导图，和导入的问题。</p>
								<ul>
									<li><a href="#0"><i class="icon_like_alt"></i><span>赞</span></a></li>
									<li><a href="#0"><i class="icon_dislike_alt"></i><span>反对</span></a></li>
									
								</ul>
							</div>
						</div>
						<!-- /row -->
						<div class="row reply">
							<div class="col-md-2 user_info">
								<figure><img src="img/avatar.jpg" alt=""></figure>
							</div>
							
						</div>
						<!-- /reply -->
					</div>
					<!-- /review_card -->
					<div class="review_card">
						<div class="row">
							<div class="col-md-2 user_info">
								<figure><img src="img/avatar7.jpg" alt=""></figure>
								<h5>三蛋</h5>
							</div>
							<div class="col-md-10 review_content">
								<div class="clearfix add_bottom_15">
									<span class="rating"><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i><em>5.00/5.00</em></span>
									<em> 54 分钟前</em>
								</div>
								<h4>"安利！"</h4>
								<p>如果对计算机网络有兴趣的同学，我十分推荐这门课程，理由如下： 1，时效性：这门课程非常贴近现代，可以说这是目前MOOC上最新的了，课程不会让你有老旧课本的感觉，而且提供了思科的额外学习补充！ 2，质量性：这门课程的质量很高，老师讲解非常详细，有测验，也有答案解析，而且最重要的是，老师与助教团队会快速响应提问，这是目前我见过最高效的！基本隔天就能收到回复，而且讲解细致入微，不会有不耐烦的感觉。 3，其他：好的课程，不仅能学到知识，还能学到如此做人，如何面对生活的困难。这一点上，请大家在学习中感悟。</p>
								<ul>
									<li><a href="#0"><i class="icon_like_alt"></i><span>赞</span></a></li>
									<li><a href="#0"><i class="icon_dislike_alt"></i><span>反对</span></a></li>
									
								</ul>
							</div>
						</div>
						<!-- /row -->
					</div>
					<!-- /review_card -->
					<div class="pagination__wrapper add_bottom_15">
						<ul class="pagination">
							<li><a href="#0" class="prev" title="previous page">&#10094;</a></li>
							<li><a href="#0" class="active">1</a></li>
							<li><a href="#0">2</a></li>
							<li><a href="#0">3</a></li>
							<li><a href="#0">4</a></li>
							<li><a href="#0" class="next" title="next page">&#10095;</a></li>
						</ul>
					</div>
					<!-- /pagination -->
				</div>
				<!-- /col -->
				<div class="col-lg-4">
					<div class="box_general company_info">
						<h3>课程概述</h3>
						<p> 以层次模型为线索，一层一章（数据链路层两章），将内容有机地串在一起；主要包括网络相关术语和协议（TCP/IP协议栈）、网络标准、OSI参考模型、局域网技术（重点以太网）、物理层、数据链路层、网络层、传输层和应用层的基本功能和基本原理；重点学习网络层内容，包括各种路由协议的工作原理及其特点。在学习理论的基础上，初步培养网络编程、网络抓包工具使用、交换机和路由器操作等实际动手能力。</p>
						<p><strong>授课教师</strong><br>王二<br></p>
						<p><strong>选课号</strong><br>1561321646</p>
					
						
					</div>
				</div>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
		
	</main>
	<!--/main-->
	
	
	</div>
	<!-- page -->
	
	<!-- Sign In Popup -->
	<div id="sign-in-dialog" class="zoom-anim-dialog mfp-hide">
		<div class="small-dialog-header">
			<h3>Sign In</h3>
		</div>
		<form>
			<div class="sign-in-wrapper">
				<a href="#0" class="social_bt facebook">Login with Facebook</a>
				<a href="#0" class="social_bt google">Login with Google</a>
				<div class="divider"><span>Or</span></div>
				<div class="form-group">
					<label>Email</label>
					<input type="email" class="form-control" name="email" id="email">
					<i class="icon_mail_alt"></i>
				</div>
				<div class="form-group">
					<label>Password</label>
					<input type="password" class="form-control" name="password" id="password" value="">
					<i class="icon_lock_alt"></i>
				</div>
				<div class="clearfix add_bottom_15">
					<div class="checkboxes float-left">
						<label class="container_check">Remember me
						  <input type="checkbox">
						  <span class="checkmark"></span>
						</label>
					</div>
					<div class="float-right mt-1"><a id="forgot" href="javascript:void(0);">Forgot Password?</a></div>
				</div>
				<div class="text-center"><input type="submit" value="Log In" class="btn_1 full-width"></div>
				<div class="text-center">
					Don’t have an account? <a href="register.html">Sign up</a>
				</div>
				<div id="forgot_pw">
					<div class="form-group">
						<label>Please confirm login email below</label>
						<input type="email" class="form-control" name="email_forgot" id="email_forgot">
						<i class="icon_mail_alt"></i>
					</div>
					<p>You will receive an email containing a link allowing you to reset your password to a new preferred one.</p>
					<div class="text-center"><input type="submit" value="Reset Password" class="btn_1"></div>
				</div>
			</div>
		</form>
		<!--form -->
	</div>
	<!-- /Sign In Popup -->
	
	<div id="toTop"></div><!-- Back to top button -->
	
	<!-- COMMON SCRIPTS -->
    <script src="js/common_scripts.js"></script>
	<script src="js/functions.js"></script>
	<script src="assets/validate.js"></script>

</body>
<footer>
    <div class="line"></div>
    <div class="copyright">
        Copyright © 2019 大碗宽面 All Rights Reserved
    </div>
</footer>
</html>