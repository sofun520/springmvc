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

</head>
<body class="hold-transition register-page">
	<div class="register-box">
		<div class="register-logo">
			<a href="../../index2.html"><b>JHAC</b> MIS</a>
		</div>

		<div class="register-box-body">
			<p class="login-box-msg">用户登录</p>
				<div class="form-group has-feedback">
					<input type="text" id="username" class="form-control"
						placeholder="用户名" check-type="required">
				</div>
				<div class="form-group has-feedback">
					<input type="password" id="password" class="form-control"
						placeholder="密码" check-type="required">
				</div>
				<div class="row">
					<div class="col-xs-12">
						<button id="checkLoginBtn" type="submit"
							class="btn btn-primary btn-block btn-flat">提交</button>
					</div>
				</div>
			<br> <a href="registe.do" class="text-center">注册新用户</a>
		</div>

		<!-- jQuery 2.2.0 -->
		<script src="plugins/jQuery/jQuery-2.2.0.min.js"></script>
		<!-- Bootstrap 3.3.6 -->
		<script src="bootstrap/js/bootstrap.min.js"></script>
		<!-- iCheck -->
		<script src="plugins/iCheck/icheck.min.js"></script>
		<script src="bootstrap/js/bootstrap3-validation.js"></script>
		<script>
			$(function() {
				
				if(window != top){  
				    top.location.href=location.href;  
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
						password : $('#password').val()
					}, function(data) {
						if (data.success == '0') {
							alert(data.message);
							window.location.href = 'mvc/main.do';
						} else {
							alert('用户名或密码错误');
						}
					});
				});

			});
		</script>
</body>
</html>