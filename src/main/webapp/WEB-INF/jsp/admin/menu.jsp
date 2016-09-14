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
<link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../../bootstrap/css/font-awesome.min.css">
<link rel="stylesheet" href="../../bootstrap/css/ionicons.min.css">
<link rel="stylesheet" href="../../dist/css/AdminLTE.min.css">
<link rel="stylesheet" href="../../dist/css/skins/_all-skins.min.css">

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
<body style="background-color: #ECF0F5;">

	<div class="content">
		<!-- Main content -->
		<div class="row">
			<div class="col-xs-12">

				<div class="box">
					<div class="box-header with-border">
						<div class="form-group">
							<form action="test.do" method="post">
								<div class="col-sm-12">
									<button type="button" onclick="addDialog()"
										class="btn btn-default btn-sm">新&nbsp;&nbsp;增</button>
									<button type="button" class="btn btn-default btn-sm">导&nbsp;&nbsp;出</button>
									<button type="button" class="btn btn-default btn-sm">导&nbsp;&nbsp;出</button>
								</div>
							</form>
						</div>
					</div>
					<!-- /.box-header -->
					<div class="box-body row">
						<div class="col-md-3">
							<div class="box box-solid">
								<div class="box-body no-padding">
									<ul class="nav nav-pills nav-stacked table">
										<c:forEach items="${fmenus}" var="fmenu">
											<li
												<c:if test="${menuParent==fmenu.menuId}">class='active'</c:if>><a
												href='query.do?id=<c:out value="${fmenu.menuId}" />'><i
													class="fa fa-file-text-o"></i>
												<c:out value="${fmenu.menuName}" /></a></li>
										</c:forEach>
									</ul>
								</div>
								<!-- /.box-body -->
							</div>
							<!-- /.box -->
						</div>

						<div class="col-md-9">
							<table
								class="table table-bordered 

table-striped table-hover dataTable">
								<tbody>
									<tr>
										<th style="width: 50px">序号</th>
										<th>菜单id</th>
										<th>菜单名称</th>
										<th>菜单链接</th>
										<th>菜单父id</th>
										<th>操作</th>
									</tr>
									<c:forEach var="menu" items="${list}" varStatus="xh">
										<tr>
											<td><c:out value="${xh.count}" /></td>
											<td><c:out value="${menu.menuId}" /></td>
											<td><c:out value="${menu.menuName}" /></td>
											<td><c:out value="${menu.menuUrl}" /></td>
											<td><c:out value="${menu.menuParent}" /></td>
											<td><a href="delete.do?id=${menu.menuId}"><i
													class="fa fa-fw fa-remove"></i>删除</a><a href=""><i
													class="fa fa-fw fa-edit"></i>修改</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<!-- /.box-body -->
					<div class="box-footer clearfix">
						<ul class="pagination pagination-sm no-margin pull-right">
							<!-- <li><a href="#">«</a></li> -->
							<c:forEach var="in" begin="1" end="${pageCount}" varStatus="xh">
								<li><a href="query.do?page=${xh.count}&id=${menuParent}">${xh.count}</a></li>
							</c:forEach>
							<!-- <li><a href="#">»</a></li> -->
						</ul>
					</div>
				</div>

			</div>
			<!-- /.col -->
		</div>

		<div class="modal" id="addDialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
						<h4 class="modal-title">新增菜单</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" id="addForm" method="post"
							action="save.do">
							<div class="box-body">
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-2 control-label">菜单名称</label>
									<div class="col-sm-8">
										<input type="text" name="menuName"
											class="form-control input-sm" id="inputEmail3"
											check-type="required">
									</div>
									<div class="col-sm-2"></div>
								</div>
								<div class="form-group">
									<label for="inputPassword3" class="col-sm-2 control-label">菜单链接</label>
									<div class="col-sm-8">
										<input type="text" name="menuUrl"
											class="form-control input-sm" id="inputPassword3"
											check-type="required">
									</div>
									<div class="col-sm-2"></div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">父菜单</label>
									<div class="col-sm-8">
										<select class="form-control input-sm" name="menuParent">
											<option value="">无</option>
											<c:forEach items="${fmenus}" var="fmenu">
												<option value="<c:out value="${fmenu.menuId}" />"><c:out
														value="${fmenu.menuName}" /></option>
											</c:forEach>
										</select>
									</div>
									<div class="col-sm-2"></div>
								</div>
							</div>
							<div class="box-footer">
								<button type="reset" class="btn btn-default">清空</button>
								<button type="submit" id="addSubmit"
									class="btn btn-info pull-right">提交</button>
							</div>
						</form>
					</div>
					<!-- <div class="modal-footer">
					<button type="button" class="btn btn-default pull-left"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div> -->
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>


		<script src="../../plugins/jQuery/jQuery-2.2.0.min.js"></script>
		<script src="../../bootstrap/js/bootstrap.js"></script>
		<script src="../../plugins/fastclick/fastclick.js"></script>
		<script src="../../dist/js/app.min.js"></script>
		<script src="../../dist/js/demo.js"></script>
		<script src="../../bootstrap/js/bootstrap3-validation.js"></script>
		<script type="text/javascript">
			$(function() {

				$('#addForm').validation();
				$("#addSubmit").on('click', function(event) {
					if ($("#addForm").valid(this) == false) {
						return false;
					}
				});

			});

			function addDialog() {
				$('#addDialog').modal({
					backdrop : 'static',
					keyboard : false
				});
				$('#addDialog').modal('show');
			}
		</script>
</body>
</html>
