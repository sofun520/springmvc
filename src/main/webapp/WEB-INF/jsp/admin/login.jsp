<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>京汉安驰信息系统管理后台</title>

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
			<p class="login-box-msg">管理员登录</p>

			<div class="form-group has-feedback">
				<input type="text" id="username" class="form-control"
					placeholder="用户名" value="admin"> <span
					class="glyphicon glyphicon-user form-control-feedback"></span>
			</div>
			<div class="form-group has-feedback">
				<input type="password" id="password" class="form-control"
					placeholder="密码" value="admin"> <span
					class="glyphicon glyphicon-lock form-control-feedback"></span>
			</div>
			<div class="form-group has-feedback row">
				<div class="col-md-6">
					<input type="text" id="codeInput" class="form-control"
						placeholder="验证码">
				</div>
				<div class="col-md-6">
					<input type="button" id="sendCodeBtn" onclick="sendCode(this)"
						class="btn btn-block btn-default btn-flat" value="获取验证码">
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12">
					<a id="checkLoginBtn" onclick="doSubmit()"
						class="btn btn-primary btn-block btn-flat">提交</a>
				</div>
			</div>
			<br> <br>
		</div>

		<!-- jQuery 2.2.0 -->
		<script src="plugins/jQuery/jQuery-2.2.0.min.js"></script>
		<!-- Bootstrap 3.3.6 -->
		<script src="bootstrap/js/bootstrap.min.js"></script>
		<!-- iCheck -->
		<script src="plugins/iCheck/icheck.min.js"></script>
		<script>
			$(function() {
				
				if(window != top){  
				    top.location.href=location.href;  
				}

				
				$('input').iCheck({
					checkboxClass : 'icheckbox_square-blue',
					radioClass : 'iradio_square-blue',
					increaseArea : '20%' // optional
				});

				/* $("#checkLoginBtn").click(function() {
					$.post('admin/login.do', {
						username : $('#username').val(),
						password : $('#password').val()
					}, function(data) {
						if (data.success == '0') {
							//alert(data.message);
							window.location.href = 'admin/home.do';
						} else {
							alert('用户名或密码错误');
						}
					});
				}); */


			});

			var countdown = 60;
			var i = 0;
			var code;
			function sendCode(val) {

				if (i == 0) {
					code=parseInt(RndNum(4));
					alert(code);
					$("#codeInput").val(code);
					/* $.get("smsCode/send.do?code="+code,function(data){
						
					}); */
				}

				if (countdown == 0) {

					val.removeAttribute("disabled");
					val.value = "免费获取验证码";
					countdown = 60;
				} else {
					i = 1;
					val.setAttribute("disabled", true);
					val.value = "重新发送(" + countdown + ")";
					countdown--;
				}
				setTimeout(function() {
					sendCode(val)
				}, 1000)
			}

			function doSubmit() {
				if (code == $('#codeInput').val()) {
					$.post('adminLoginProcess.do', {
						username : $('#username').val(),
						password : $('#password').val()
					}, function(data) {
						if (data.success == '0') {
							//alert(data.message);
							window.location.href = 'admin/home.do';
						} else {
							alert('用户名或密码错误');
						}
					});

				} else {
					alert('验证码错误');
				}
			}

			function RndNum(n) {
				var rnd = "";
				for (var i = 0; i < n; i++)
					rnd += Math.floor(Math.random() * 10);
				return rnd;
			}
		</script>
</body>
</html>