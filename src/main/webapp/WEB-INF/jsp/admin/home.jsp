<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>京汉安驰信息系统管理后台</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../bootstrap/css/font-awesome.min.css">
<link rel="stylesheet" href="../bootstrap/css/ionicons.min.css">
<link rel="stylesheet" href="../dist/css/AdminLTE.min.css">
<link rel="stylesheet" href="../dist/css/skins/_all-skins.min.css">

<style type="text/css">

/*用来隐藏html的滚动条*/
html {
	overflow: scroll;
	overflow-y: hidden;
	overflow-x: hidden
} 

.form-group {
	font-size: 12px;
}

.main-sidebar {
	font-size: 12px;
}

.ll {
	margin-top: 5px;
	text-align: right;
}

.table {
	font-size: 12px;
}
</style>

</head>
<body class="hold-transition skin-blue layout-top-nav">
	<div class="wrapper">

		<header class="main-header"> 
		<a href="index2.html"
			class="logo"> <span class="logo-mini"><b>JHAC</b></span> <span
			class="logo-lg"><b>JHAC</b> MIS</span>
		</a> 
		<nav class="navbar navbar-static-top"><a href="#"
			class="sidebar-toggle" data-toggle="offcanvas" role="button"> <span
			class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</a>
		<ul class="nav navbar-nav" id="menus">
			<!-- <li class="active"><a href="#">管理主页</a></li>
			<li><a href="menu/query.do">菜单管理</a></li>
			<li><a href="role/query.do">角色管理</a></li>
			<li><a href="roleUrl/query.do">角色菜单管理</a></li> -->
		</ul>

		<div class="navbar-custom-menu">
			<ul class="nav navbar-nav">
				<li class="dropdown user user-menu open"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true"> <img
						src="../dist/img/user2-160x160.jpg" class="user-image"
						alt="User Image"> <span class="hidden-xs">管理员：${jhacAdmin.adminUsername}</span>
				</a></li>
				<li class="dropdown user user-menu"><a href="logout.do"
					style="font-size: 12px;"> 注销 </a></li>
			</ul>
		</div></header>

		<!-- <aside class="main-sidebar"> <section class="sidebar">
		<ul class="sidebar-menu">
			<li class="header"></li>
			<li><a href="#"><i class="fa"></i> <span>客户信息</span></a></li>
		</ul>
		</section> </aside> -->

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper"
			style="height: 100%; background-color: #ecf0f5">
			<iframe id="subFrame" src="menu/query.do"
				style="border: 0px; width: 100%; height: 600px; background-color: #ecf0f5"></iframe>
		</div>
		<!-- /.content-wrapper -->
		<!-- <footer class="main-footer">
		<div class="pull-right hidden-xs">
			<b>Version</b> 2.3.3
		</div>
		<strong>Copyright &copy; 2015-2016 <a href="#">JHAC</a>.
		</strong> All rights reserved. </footer> -->


	</div>
	<!-- ./wrapper -->

	<script src="../plugins/jQuery/jQuery-2.2.0.min.js"></script>
	<script src="../bootstrap/js/bootstrap.min.js"></script>
	<script src="../plugins/fastclick/fastclick.js"></script>
	<script src="../dist/js/app.min.js"></script>
	<script src="../dist/js/demo.js"></script>
	<script src="../data/admin_menu.js"></script>
	<script type="text/javascript">
		$(function() {

			$("#subFrame").css('height', document.body.clientHeight - 50);

			var lis_html = '';
			var sub_menu= '';
			for (var i = 0; i < menus.length; i++) {
				//alert(menus[i]["id"]);
				lis_html = lis_html
						+ '<li><a href="javascript:void()" onclick="loadFrame(\''
						+ menus[i]["url"] + '\')">' + menus[i]["name"]
						+ '</a></li>';
			}
			$("#menus").html(lis_html);
			loadFrame("menu/query.do");
		});

		function loadFrame(url) {
			$("#subFrame").attr('src', url);
		}
	</script>
</body>
</html>
