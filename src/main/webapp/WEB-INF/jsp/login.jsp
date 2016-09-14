<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>京汉安驰信息管理系统</title>

<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap/css/font-awesome.min.css">
<link rel="stylesheet" href="bootstrap/css/ionicons.min.css">
<link rel="stylesheet" href="dist/css/AdminLTE.min.css">
<link rel="stylesheet" href="plugins/iCheck/square/blue.css">
<link rel="stylesheet" href="bae/index.css">
<link rel="stylesheet" href="bae/login.css">
<style type="text/css">
.login_box {
	width: 200px;
	height: 500px;
	float: left;
	font-size: 12px;
}

.copyright {
	border-top: 1px solid #E5E5E5;
	font-size: 12px;
	text-align: center;
	padding: 20px;
	color: #A0A0A0;
}
</style>

</head>
<body>
	<header>
	<div class="container">
		<a href="http://bce.baidu.com/"><img width="155" height="44"
			class="logo" src="bae/logo.png" alt="百度开放云"></a> <span
			class="bae-auth-title" style="display: none;">授权管理控制面板</span>
	</div>
	</header>
	<main>
	<div class="bce-login">
		<div class="bce-login-wrap">
			<div class="bce-login-inner">
				<img src="bae/login-banner.png" class="banner">

				<div id="login" class="login-box uc-common-login">
					<div id="common-login" class="login uc-common-login-small">
						<div class="login-shadow"></div>
						<span class="watermark"></span>
						<div id="change-login" class="change-login">
							<div>
								<a href="javascript:void(0);" class="passport-account select">用户登录<span></span></a>
							</div>
						</div>

						<div class="box-body" style="padding: 30px;">
							<div class='input-group'>
								<input type='text' class="form-control input-sm" id="username" />
								<span class="input-group-addon"> <span
									class="glyphicon glyphicon-user"></span>
								</span>
							</div>
							<br>
							<div class='input-group'>
								<input id="password" type='password'
									class="form-control input-sm" /> <span
									class="input-group-addon"> <span
									class="glyphicon glyphicon-lock"></span>
								</span>
							</div>
							<br>
							<div class='input-group'>
								<div class="row">
									<div class="col-xs-8">
										<input id="code" type='text'
											class="form-control input-sm" />
										</span>
									</div>
									<div class="col-xs-1"></div>
									<div class="col-xs-3">
										<img src="image/create.do?nocache=1470813922261" id="CreateCheckCode" align="middle" onclick="reloadPic()">
									</div>
								</div>
							</div>
							<br>
							<button id="checkLoginBtn" type="button"
								class="btn btn-primary btn-block btn-flat">登 录</button>
							<br> <a href="registe.do" class="text-center">注册新用户</a>
						</div>

					</div>
				</div>


			</div>
		</div>
	</div>
	</main>

	<div style="" class="copyright">© 2015 JHAC.COM</div>

	<!-- jQuery 2.2.0 -->
	<script src="plugins/jQuery/jQuery-2.2.0.min.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<!-- iCheck -->
	<script src="plugins/iCheck/icheck.min.js"></script>
	<script src="bootstrap/js/bootstrap3-validation.js"></script>
	<script>
		$(function() {

			if (window != top) {
				top.location.href = location.href;
			}

			/* $('#loginForm').validation();
			$("#checkLoginBtn").on('click', function(event) {
				if ($("#loginForm").valid(this) == false) {
					return false;
				}
			}); */

			/* $('input').iCheck({
				checkboxClass : 'icheckbox_square-blue',
				radioClass : 'iradio_square-blue',
				increaseArea : '20%' // optional
			}); */

			$("#checkLoginBtn").click(function() {
				$.post('checkLogin.do', {
					username : $('#username').val(),
					password : $('#password').val(),
					code : $('#code').val()
				}, function(data) {
					if (data.success == '0') {
						alert(data.message);
						window.location.href = 'mvc/main.do';
					} else {
						alert(data.message);
					}
				});
			});

		});
		
		function reloadPic(){
			document.getElementById("CreateCheckCode").src = document.getElementById("CreateCheckCode").src+"?nocache=" + new Date().getTime();
		}

	</script>
</body>
</html>