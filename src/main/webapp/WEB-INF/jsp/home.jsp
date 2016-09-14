<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 2 | Top Navigation</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap/css/font-awesome.min.css">
<link rel="stylesheet" href="bootstrap/css/ionicons.min.css">
<link rel="stylesheet" href="dist/css/AdminLTE.min.css">
<link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">

<style type="text/css">
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
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<header class="main-header"> <a href="index2.html"
			class="logo"> <span class="logo-mini"><b>JHAC</b></span> <span
			class="logo-lg"><b>JHAC</b> MIS</span>
		</a> <nav class="navbar navbar-static-top"> <a href="#"
			class="sidebar-toggle" data-toggle="offcanvas" role="button"> <span
			class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</a>
		<ul class="nav navbar-nav">
			<li class="active"><a href="#">基础数据管理</a></li>
			<li><a href="#">装车业务</a></li>
			<li><a href="#">保险业务</a></li>
			<li><a href="#">订货管理</a></li>
			<li><a href="#">SAAS服务管理</a></li>
			<li><a href="#">报表系统</a></li>

		</ul>

		<div class="navbar-custom-menu">
			<ul class="nav navbar-nav">
				<li class="dropdown user user-menu"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"> <img
						src="dist/img/user2-160x160.jpg" class="user-image"
						alt="User Image"> <span class="hidden-xs">张三</span>
				</a></li>
				<li class="dropdown user user-menu"><a href="test.do"
					style="font-size: 12px;"> 注销 </a></li>
			</ul>
		</div></header>

		<aside class="main-sidebar"> <section class="sidebar">
		<ul class="sidebar-menu">
			<li class="header">客户管理</li>
			<li><a href="#"><i class="fa"></i> <span>客户信息</span></a></li>
			<li><a href="#"><i class="fa"></i> <span>客户审核</span></a></li>
			<li><a href="#"><i class="fa"></i> <span>客户资料</span></a></li>
			<li class="header">车辆管理</li>
			<li><a href="#"><i class="fa"></i> <span>Important</span></a></li>
			<li><a href="#"><i class="fa"></i> <span>Warning</span></a></li>
			<li><a href="#"><i class="fa"></i> <span>Information</span></a></li>
		</ul>
		</section> <!-- /.sidebar --> </aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">

			<!-- Main content -->
			<section class="content">
			<div class="row">
				<div class="col-xs-12">

					<div class="box">
						<div class="box-header with-border">
							<div class="form-group">
								<form action="test.do" method="post">
									<label class="col-sm-1 ll">主机名</label>
									<div class="col-sm-2">
										<input class="form-control input-sm" type="text"
											placeholder="test">
									</div>
									<label class="col-sm-1 ll">主机名</label>
									<div class="col-sm-2">
										<input class="form-control input-sm" type="text"
											placeholder="test">
									</div>
									<label class="col-sm-1 ll">主机名</label>
									<div class="col-sm-2">
										<input class="form-control input-sm" type="text"
											placeholder="test">
									</div>
									<div class="col-sm-3">
										<button type="submit" class="btn btn-default btn-sm">查&nbsp;&nbsp;询</button>
										<button type="button" class="btn btn-default btn-sm">新&nbsp;&nbsp;增</button>
										<button type="button" class="btn btn-default btn-sm">导&nbsp;&nbsp;出</button>
										<button type="button" class="btn btn-default btn-sm">导&nbsp;&nbsp;出</button>
									</div>
								</form>
							</div>
						</div>
						<!-- /.box-header -->
						<div class="box-body">
							<table
								class="table table-bordered 

table-striped table-hover dataTable">
								<tbody>
									<tr>
										<th style="width: 10px">id</th>
										<th>设备类型</th>
										<th>设备数量</th>
										<th>创建时间</th>
										<th>修改时间</th>
										<th>状态</th>
										<th>别名</th>
										<th>操作</th>
									</tr>
									<c:forEach var="user" items="${list}" varStatus="xh">
										<tr>
											<td><c:out value="${xh.count}" /></td>
											<td><c:out value="${user.deviceType}" /></td>
											<td><c:out value="${user.deviceNum}" /></td>
											<td><fmt:formatDate value="${user.createTime}"
													type="both" /></td>
											<td><fmt:formatDate value="${user.lastTime}" type="both" /></td>
											<td><c:out value="${user.state}" /></td>
											<td><c:out value="${user.nickname}" /></td>
											<td><a href=""><i class="fa fa-fw fa-remove"></i>删除</a><a
												href=""><i class="fa fa-fw fa-edit"></i>修改</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<!-- /.box-body -->
						<div class="box-footer clearfix">
							<ul class="pagination pagination-sm no-

margin pull-right">
								<li><a href="#">«</a></li>
								<li><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">»</a></li>
							</ul>
						</div>
					</div>

				</div>
				<!-- /.col -->
			</div>
			<!-- /.row --> </section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		<footer class="main-footer">
		<div class="pull-right hidden-xs">
			<b>Version</b> 2.3.3
		</div>
		<strong>Copyright &copy; 2015-2016 <a href="#">JHAC</a>.
		</strong> All rights reserved. </footer>


	</div>
	<!-- ./wrapper -->

	<script src="plugins/jQuery/jQuery-2.2.0.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="plugins/fastclick/fastclick.js"></script>
	<script src="dist/js/app.min.js"></script>
	<script src="dist/js/demo.js"></script>
</body>
</html>
