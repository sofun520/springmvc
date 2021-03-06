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
								<%-- <div class="box-body">
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
								</div> --%>
								<div class="col-sm-12">
									<button type="submit" class="btn btn-default btn-sm"><i class="fa fa-fw fa-search"></i>查&nbsp;&nbsp;询</button>
									<button type="button" class="btn btn-default btn-sm"><i class="fa fa-fw fa-refresh"></i>刷&nbsp;&nbsp;新</button>
									<button type="button" onclick="addDialog()"
										class="btn btn-default btn-sm"><i class="fa fa-fw fa-plus"></i>新增集团</button>
									<button type="button" onclick="addComDialog()"
										class="btn btn-default btn-sm"><i class="fa fa-fw fa-plus"></i>新增4S店</button>
								</div>
							</form>
						</div>
					</div>
					<!-- /.box-header -->

					<div class="col-md-3">
						<div class="box box-solid">
							<div class="box-body no-padding">
								<ul class="nav nav-pills nav-stacked table">
									<li style="margin: 3px 0px 0px 20px; padding-bottom: 10px;">合作集团</li>
									<c:forEach items="${groupList}" var="group">
										<li <c:if test="${groupId==group.gId}">class='active'</c:if>><a
											href='query.do?groupId=<c:out value="${group.gId}" />'><i
												class="fa fa-file-text-o"></i> <c:out value="${group.gName}" /></a></li>
									</c:forEach>
								</ul>
							</div>
							<!-- /.box-body -->
						</div>
					</div>

					<div class="box-body col-md-9">
						<table
							class="table table-bordered 

table-striped table-hover dataTable">
							<tbody>
								<tr>
									<th style="width: 50px">序号</th>
									<th>合作4S店名称</th>
									<th>合作集团ID</th>
									<th>区域代码</th>
									<th>创建人ID</th>
									<th>操作</th>
								</tr>
								<c:if test="${list== null || fn:length(list) == 0}">
									<tr>
										<td colspan="11" align="center">没有内容</td>
									</tr>
								</c:if>
								<c:if test="${list!=null}">
									<c:forEach var="com" items="${list}" varStatus="xh">
										<tr>
											<td><c:out value="${xh.count}" /></td>
											<td><c:out value="${com.comName}" /></td>
											<td><c:out value="${com.comGroupId}" /></td>
											<td><c:out value="${com.comNetworkCode}" /></td>
											<td><c:out value="${com.comAddId}" /></td>
											<td><a href="delete.do?id=${com.comId}"><i
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
								<li <c:if test="${page==xh.count}">class="active"</c:if>><a href="query.do?page=${xh.count}&groupId=${groupId}">${xh.count}</a></li>
							</c:forEach>
							<!-- <li><a href="#">»</a></li> -->
						</ul>
					</div>
				</div>

			</div>
			<!-- /.col -->
		</div>
	</div>



	<div class="modal" id="addGroupDialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title">新增集团信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="addForm" method="post"
						action="../group/save.do">
						<div class="box-body">
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">集团名称</label>
								<div class="col-sm-8">
									<input type="text" name="gName" class="form-control input-sm"
										id="inputEmail3" check-type="required">
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

	<div class="modal" id="addComDialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title">新增合作4S店信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="addForm" method="post"
						action="save.do">
						<div class="box-body">
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">4S店名称</label>
								<div class="col-sm-8">
									<input type="text" name="comName" class="form-control input-sm"
										id="inputEmail3" check-type="required">
								</div>
								<div class="col-sm-2"></div>
							</div>
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">所属集团</label>
								<div class="col-sm-8">
									<select class="form-control input-sm" name="comGroupId">
										<c:forEach items="${groupList}" var="group">
											<option value='<c:out value="${group.gId}" />'><c:out
													value="${group.gName}" /></option>
										</c:forEach>
									</select>
								</div>
								<div class="col-sm-2"></div>
							</div>
						</div>
						<div class="box-footer">
							<button type="reset" class="btn btn-default">清空</button>
							<button type="submit" id="addComSubmit"
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

			$('#addComDialog').validation();
			$("#addComSubmit").on('click', function(event) {
				if ($("#addComDialog").valid(this) == false) {
					return false;
				}
			});

		});

		function addDialog() {
			$('#addGroupDialog').modal({
				backdrop : 'static',
				keyboard : false
			});
			$(".modal-dialog").attr("style", "width:800px;margin:10px auto;");
			$('#addGroupDialog').modal('show');
		}

		function addComDialog() {
			$('#addComDialog').modal({
				backdrop : 'static',
				keyboard : false
			});
			$(".modal-dialog").attr("style", "width:800px;margin:10px auto;");
			$('#addComDialog').modal('show');
		}
	</script>
</body>
</html>
