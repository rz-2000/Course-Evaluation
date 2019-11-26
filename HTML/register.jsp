<%
out.println("<!DOCTYPE html>");
out.println("html lang=\"en\">");
out.println("<head>");
out.println("   <meta charset=\"utf-8\">");
out.println("   <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">");
out.println("   <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">");
out.println("   <meta name=\"description\" content=\"海大优选|公共课课程评价系统\">");
out.println("   <meta name=\"author\" content=\"大碗宽面\">");
out.println("   <title>海大优选|公共课课程评价系统</title>");
out.println("    <!-- Favicons-->");
out.println("   <link rel=\"shortcut icon\" href=\"img/favicon.ico\" type=\"image/x-icon\">");
out.println("   <link rel=\"apple-touch-icon\" type=\"image/x-icon\" href=\"img/apple-touch-icon-57x57-precomposed.png\">");
out.println("   <link rel=\"apple-touch-icon\" type=\"image/x-icon\" sizes=\"72x72\" href=\"img/apple-touch-icon-72x72-precomposed.png\">");
out.println("   <link rel=\"apple-touch-icon\" type=\"image/x-icon\" sizes=\"114x114\" href=\"img/apple-touch-icon-114x114-precomposed.png\">");
out.println("   <link rel=\"apple-touch-icon\" type=\"image/x-icon\" sizes=\"144x144\" href=\"img/apple-touch-icon-144x144-precomposed.png\">");
out.println("    <!-- GOOGLE WEB FONT -->");
out.println("   <link href=\"https://fonts.googleapis.com/css?family=Roboto:300,400,500,700\" rel=\"stylesheet\">");
out.println("    <!-- BASE CSS -->");
out.println("   <link href=\"css/bootstrap.min.css\" rel=\"stylesheet\">");
out.println("   <link href=\"css/style.css\" rel=\"stylesheet\">");
out.println("<link href=\"css/vendors.css\" rel=\"stylesheet\">");
out.println("    <!-- YOUR CUSTOM CSS -->");
out.println("   <link href=\"css/custom.css\" rel=\"stylesheet\">");
out.println("");
out.println("/head>");
out.println("<body id=\"register_bg\">");
out.println("");
out.println("<nav id=\"menu\" class=\"fake_menu\"></nav>");
out.println("");
out.println("<div id=\"login\">");
out.println("	<aside>");
out.println("		<figure>");
out.println("			<a href=\"index.html\"><h3>海大优选</h3></a>");
out.println("		</figure>");
out.println("		");
out.println("		<form autocomplete=\"off\">");
out.println("			<div class=\"form-group\">");
out.println("				<input class=\"form-control\" name=\"user_id\" type=\"text\" placeholder=\"账号(用户ID)\">");
out.println("				<i class=\"ti-user\"></i>");
out.println("			</div>");
out.println("			<div class=\"form-group\">");
out.println("				<input class=\"form-control\" name=\"name\" type=\"text\" placeholder=\"真实姓名\">");
out.println("				<i class=\"ti-user\"></i>");
out.println("			</div>");
out.println("			<div class=\"form-group\">");
out.println("				<input type=\"text\" class=\"form-control\" name=\"student_id\" type=\"text\" placeholder=\"学号\">");
out.println("				<i class=\"ti-user\"></i>");
out.println("			</div>");
out.println("			");
out.println("			<div class=\"form-group\">");
out.println("				<input class=\"form-control\" type=\"password\" id=\"password1\" placeholder=\"密码\">");
out.println("				<i class=\"icon_lock_alt\"></i>");
out.println("			</div>");
out.println("			<div class=\"form-group\">");
out.println("				<input class=\"form-control\" type=\"password\" id=\"password2\" placeholder=\"确认密码\">");
out.println("				<i class=\"icon_lock_alt\"></i>");
out.println("			</div>");
out.println("			<div id=\"pass-info\" class=\"clearfix\"></div>");
out.println("			<a href=\"#0\" class=\"btn_1 rounded full-width\">注册!</a>");
out.println("			<div class=\"text-center add_top_10\">已经有账号了? <strong><a href=\"login.html\">登录</a></strong></div>");
out.println("		</form>");
out.println("		<div class=\"copy\">© 2019 海大优选</div>");
out.println("	</aside>");
out.println("</div>");
out.println("<!-- /login -->");
out.println("");
out.println("<!-- COMMON SCRIPTS -->");
out.println("   <script src=\"js/common_scripts.js\"></script>");
out.println("<script src=\"js/functions.js\"></script>");
out.println("<script src=\"assets/validate.js\"></script>");
out.println("");
out.println("<!-- SPECIFIC SCRIPTS -->");
out.println("<script src=\"js/pw_strenght.js\"></script>	");
out.println(" ");
out.println("/body>");
out.println("/html>");
%>