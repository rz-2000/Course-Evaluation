<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="海大优选|公共课课程评价系统">
    <meta name="author" content="大碗宽面">
    <title>海大优选|公共课课程评价系统</title>

    <!-- Favicons-->
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" type="image/x-icon" href="img/apple-touch-icon-57x57-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" size="72x72" href="img/apple-touch-icon-72x72-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" size="114x114" href="img/apple-touch-icon-114x114-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" size="144x144" href="img/apple-touch-icon-144x144-precomposed.png">

    <!-- GOOGLE WEB FONT -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">

    <!-- BASE CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
	<link href="css/vendors.css" rel="stylesheet">

    <!-- YOUR CUSTOM CSS -->
    <link href="css/custom.css" rel="stylesheet">

	<script type="text/javascript">
		//验证用户名和密码是否为空
		function verifyLogin() {
			if (!verifyNotNull(document.form1.username.value)) {
				alert("用户名不能为空！");
				return false;
			}

			if (!verifyNotNull(document.form1.password.value)) {
				alert("密码不能为空！");
				return false;
			}
		}
	</script>

</head>

<body id="login_bg">
	
	<nav id="menu" class="fake_menu"></nav>
	
	<div id="preloader">
		<div data-loader="circle-side"></div>
	</div>
	<!-- End Preload -->
	
	<div id="login">
		<aside>
			<figure>
				<a href="index.jsp"><h3>海大优选</h3></a>
			</figure>
			  <form method="post" action="${pageContext.request.contextPath}/UserServlet?method=login" name="form1" onsubmit="return verifyLogin()">
				<table>
				<div class="form-group">
					<input type="text" class="form-control" name="username" id="email" placeholder="账号">
					<i class="icon_mail_alt"></i>
				</div>
				<div class="form-group">
					<input type="password" class="form-control" name="password" id="password" placeholder="密码">
					<i class="icon_lock_alt"></i>
				</div>
				<div class="clearfix add_bottom_30">
					<div class="checkboxes float-left">
						<label class="container_check">记住我
						  <input type="checkbox">
						  <span class="checkmark"></span>
						</label>
					</div>
					<div class="float-right mt-1"><a id="forgot" href="javascript:void(0);">忘记密码</a></div>
				</div>
			<input name="Submit" type="submit" class="btn_1 rounded full-width" id="Submit" value="登录">
				<div class="text-center add_top_10">没有账号？ <strong><a href="register.jsp">注册</a></strong></div>
				</table>
			</form>
			<div class="copy">© 2019 海大优选</div>
		</aside>
	</div>
	<!-- /login -->
		
	<!-- COMMON SCRIPTS -->
    <script src="js/common_scripts.js" type="text/javascript"></script>
	<script src="js/functions.js" type="text/javascript"></script>
	<script src="assets/validate.js" type="text/javascript"></script>
  
</body>
</html>