<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

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
			<p class="login-box-msg">注册新用户</p>

			<form action="registeDo.do" method="post" id="addForm">
				<div class="form-group has-feedback">
					<input type="text" name="uName" class="form-control" check-type="required"
						placeholder="用户名"> <span
						class="glyphicon glyphicon-user form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="email" name="uEmail" class="form-control" check-type="required"
						placeholder="邮箱"> <span
						class="glyphicon glyphicon-envelope form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="password" name="uPassword" class="form-control" check-type="required"
						placeholder="密码"> <span
						class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="password" name="" class="form-control" check-type="required"
						placeholder="确认密码"> <span
						class="glyphicon glyphicon-log-in form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="text" name="uTelephone" class="form-control" check-type="required"
						placeholder="手机号码"> <span
						class="glyphicon glyphicon-log-in form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback row">
					<div class="col-md-6">
						<input type="text" maxlength="4" class="form-control"
							placeholder="验证码">
					</div>
					<div class="col-md-6">
						<input type="button" id="sendCodeBtn" check-type="required"
							onclick="sendCode(this)"
							class="btn btn-block btn-default btn-flat" value="获取验证码">
					</div>
				</div>
				<div class="form-group has-feedback">
					<input type="text" name="uTruename" class="form-control" check-type="required"
						placeholder="真实姓名"> <span
						class="glyphicon glyphicon-log-in form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<select class="form-control input-sm" name="uNetworkCode">
						<c:forEach var="n" items="${netList}" varStatus="xh">
							<option value='<c:out value="${n.nCode}" />'><c:out
									value="${n.nName}" /></option>
						</c:forEach>
					</select>
				</div>


				<div class="row">
					<!-- /.col -->
					<div class="col-xs-12">
						<button type="submit" id="addSubmit"
							class="btn btn-primary btn-block btn-flat">注册</button>
					</div>
					<!-- /.col -->
				</div>
			</form>
			<br> <a href="login.do" class="text-center">已有账号</a>
		</div>

		<!-- jQuery 2.2.0 -->
		<script src="plugins/jQuery/jQuery-2.2.0.min.js"></script>
		<!-- Bootstrap 3.3.6 -->
		<script src="bootstrap/js/bootstrap.min.js"></script>
		<!-- iCheck -->
		<script src="plugins/iCheck/icheck.min.js"></script>
		<!-- <script src="common/common.js"></script> -->
		<script src="bootstrap/js/bootstrap3-validation.js"></script>
		<script>
			$(function() {

				$('#addForm').validation();
				$("#addSubmit").on('click', function(event) {
					if ($("#addForm").valid(this) == false) {
						return false;
					}
				});

				/* $('input').iCheck({
					checkboxClass : 'icheckbox_square-blue',
					radioClass : 'iradio_square-blue',
					increaseArea : '20%' // optional
				}); */
			});

			function RndNum(n) {
				var rnd = "";
				for (var i = 0; i < n; i++)
					rnd += Math.floor(Math.random() * 10);
				return rnd;
			}

			var countdown = 60;
			var flag = 0;
			var code;

			function sendSms(val) {
				code = parseInt(RndNum(4));
				alert(code);
				$.get("smsCode/send.do?code=" + code, function(data) {

				});
				sendCode(val);
			}

			function sendCode(val) {
				if (flag == 0) {
					code = parseInt(RndNum(4));
					alert(code);
					//$.get("smsCode/send.do?code=" + code, function(data) {

					//});
				}
				if (countdown == 0) {
					val.removeAttribute("disabled");
					val.value = "免费获取验证码";
					countdown = 60;
					flag = 0;
				} else {
					flag = 1;
					val.setAttribute("disabled", true);
					val.value = "重新发送(" + countdown + ")";
					countdown--;
				}
				setTimeout(function() {
					if (countdown != 60) {
						sendCode(val)
					}
				}, 1000)
			}
		</script>
</body>
</html>