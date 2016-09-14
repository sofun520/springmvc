<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<body class="hold-transition skin-blue sidebar-mini"
	style="background-color: #ECF0F5;">
	<div class="content">
		<div class="row">
			<div class="col-xs-12">

				<div class="box">
					<div class="box-header with-border">
						<div class="form-group">
							<form action="query.do" method="post">
								<div class="box-body">
									<table style="width: 100%">
										<tr>
											<td align="center">员工姓名:</td>
											<td><input name="user.uTruename"
												value="${userinfo.user.uTruename}"
												class="form-control input-sm"></td>
											<td align="center">电话号码:</td>
											<td><input name="user.uTelephone"
												value="${userinfo.user.uTelephone }"
												class="form-control input-sm"></td>
											<td align="center">email邮箱:</td>
											<td><input name="user.uEmail"
												value="${userinfo.user.uEmail }"
												class="form-control input-sm"></td>
											<td align="center">上级领导:</td>
											<td><input name="uiLeader" value="${userinfo.uiLeader }"
												class="form-control input-sm"></td>
										</tr>
									</table>
								</div>
								<div class="col-sm-12">
									<button type="submit" class="btn btn-default btn-sm">查&nbsp;&nbsp;询</button>
									<button type="button" class="btn btn-default btn-sm">刷&nbsp;&nbsp;新</button>
									<button type="button" onclick="addDialog()"
										class="btn btn-default btn-sm">新&nbsp;&nbsp;增</button>
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
									<th style="width: 50px">序号</th>
									<th>ID</th>
									<th>姓名</th>
									<th>出生年月</th>
									<th>性别</th>
									<th>电话</th>
									<th>email</th>
									<th>入职时间</th>
									<th>部门</th>
									<th>上级</th>
									<th>职位</th>
									<th>联系地址</th>
									<th>操作</th>
								</tr>
								<c:if test="${list== null || fn:length(list) == 0}">
									<tr>
										<td colspan="13" align="center">没有内容</td>
									</tr>
								</c:if>
								<c:if test="${list!=null}">
									<c:forEach var="userinfo" items="${list}" varStatus="xh">
										<tr>
											<td><c:out value="${xh.count}" /></td>
											<td><c:out value="${userinfo.uiUserId}" /></td>
											<td><c:out value="${userinfo.user.uTruename}" /></td>
											<td><c:out value="${userinfo.uiBirthday}" /></td>
											<td><c:out value="${userinfo.uiSex}" /></td>
											<td><c:out value="${userinfo.user.uTelephone}" /></td>
											<td><c:out value="${userinfo.user.uEmail}" /></td>
											<td><fmt:formatDate value="${userinfo.uiEntryDate}"
													type="date" dateStyle="long" /></td>
											<td><c:out value="${userinfo.uiDepartment}" /></td>
											<td><c:out value="${userinfo.uiLeader}" /></td>
											<td><c:out value="${userinfo.uiJob}" /></td>
											<td><c:out value="${userinfo.uiAddress}" /></td>
											<td><a href="delete.do?id=${userinfo.uiId}"><i
													class="fa fa-fw fa-remove"></i>删除</a><a href=""><i
													class="fa fa-fw fa-edit"></i>修改</a></td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>
					<!-- /.box-body -->
					<div class="box-footer clearfix">
						<ul class="pagination pagination-sm no-margin pull-right">
							<!-- <li><a href="#">«</a></li> -->
							<c:forEach var="in" begin="1" end="${pageCount}" varStatus="xh">
								<li <c:if test="${page==xh.count}">class="active"</c:if>><a href="query.do?page=${xh.count}">${xh.count}</a></li>
							</c:forEach>
							<!-- <li><a href="#">»</a></li> -->
						</ul>
					</div>
				</div>

			</div>
			<!-- /.col -->
		</div>
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
								<label for="inputEmail3" class="col-sm-2 control-label">角色名称</label>
								<div class="col-sm-8">
									<input type="text" name="roleName"
										class="form-control input-sm" id="inputEmail3"
										check-type="required">
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


	<div class="modal" id="addRoleMenuDialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title">
						为角色[<span id="roleValue"></span>(roleId=<span id="roleId"></span>)]配置菜单
					</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="addForm" method="post"
						action="save.do">
						<div class="box-body">
							<div class="form-group row">

								<div class="col-md-5">
									暂未分配的菜单 <select id="notSelfMenu" multiple=""
										class="form-control" style="height: 300px;">

									</select>
								</div>
								<div class="col-md-2">
									<div style="margin-top: 100px;"></div>
									<button type="button" onclick="fenpei()"
										class="btn btn-block btn-default btn-xs">分配=》</button>
									<br />
									<button type="button" onclick="cancleFenpei()"
										class="btn btn-block btn-default btn-xs">《=收回</button>
								</div>
								<div class="col-md-5">
									已分配的菜单 <select id="selfMenu" multiple="" class="form-control"
										style="height: 300px;">

									</select>
								</div>
							</div>
						</div>
						<div class="box-footer">
							<button type="button" onclick="submitForm()" id="fenpeiSubmit"
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
			$(".modal-dialog").attr("style", "width:800px;margin:10px auto;");
			$('#addDialog').modal('show');
		}

		function matchMenu(id, name) {
			$
					.get(
							'../menu/notSelfMenu.do?roleId=' + id,
							function(data) {
								var notSelfMenu = '';
								$
										.each(
												data.data,
												function(i, item) {
													notSelfMenu = notSelfMenu
															+ '<option style="font-size:12px" value='+item["menuId"]+'>'
															+ item["menuName"]
															+ '</option>';
												});
								$("#notSelfMenu").html(notSelfMenu);
							});

			$
					.get(
							'../menu/selfMenu.do?roleId=' + id,
							function(data) {
								var notSelfMenu = '';
								$
										.each(
												data.data,
												function(i, item) {
													notSelfMenu = notSelfMenu
															+ '<option style="font-size:12px" value='+item["menuId"]+'>'
															+ item["menuName"]
															+ '</option>';
												});
								$("#selfMenu").html(notSelfMenu);
							});

			$("#roleValue").text(name);
			$("#roleId").text(id);

			$('#addRoleMenuDialog').modal({
				backdrop : 'static',
				keyboard : false
			});
			$('#addRoleMenuDialog').modal('show');
		}

		function fenpei() {
			var id = $("#notSelfMenu").val();
			var name = $("#notSelfMenu").find("option:selected").text();
			$("#selfMenu").append('<option value='+id+'>' + name + '</option>');
			var objSelect = document.getElementById("notSelfMenu");
			delSelect(objSelect, id)
		}

		function cancleFenpei() {
			var id = $("#selfMenu").val();
			var name = $("#selfMenu").find("option:selected").text();
			$("#notSelfMenu").append(
					'<option value='+id+'>' + name + '</option>');
			var objSelect = document.getElementById("selfMenu");
			delSelect(objSelect, id)
		}

		function delSelect(objSelect, itemValue) {
			for (var i = 0; i < objSelect.options.length; i++) {
				if (objSelect.options[i].value == itemValue) {
					objSelect.options.remove(i);
					break;
				}
			}
		}

		function submitForm() {
			var roleId = $("#roleId").html();
			var menuId = '';
			var obj = document.getElementById("selfMenu");
			var options = obj.options;
			for (var i = 0, len = options.length; i < len; i++) {
				if (i == options.length - 1) {
					menuId += options[i].value;
				} else {
					menuId += options[i].value + ',';
				}
			}
			//alert(menuId);
			$.post('../roleMenu/addRoleMenu.do', {
				roleId : roleId,
				rmMenuIds : menuId
			}, function(data) {
				if (data.success == '0') {
					alert('配置成功');
				} else {
					alert('配置失败');
				}
			});
			$('#addRoleMenuDialog').modal('hide');
		}
	</script>
</body>
</html>
