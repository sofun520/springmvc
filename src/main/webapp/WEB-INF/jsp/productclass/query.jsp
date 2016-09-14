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
											<td width="8%" align="center">产品类别:</td>
											<td width="17%"><select class="form-control input-sm"
												name="pClass">
													<option value="">全部</option>
													<c:forEach items="${enumList}" var="em">
														<option
															<c:if test="${product.pClass==em.enumKey}">selected="selected"</c:if>
															value='<c:out value="${em.enumKey}" />'><c:out
																value="${em.enumValue}" /></option>
													</c:forEach>
											</select></td>
											<td width="8%" align="center">产品序列号:</td>
											<td width="17%"><input name="pSerialno"
												value="${product.pSerialno}" class="form-control input-sm"></td>
											<td width="8%" align="center">产品名称:</td>
											<td width="17%"><input name="pName"
												value="${product.pName}" class="form-control input-sm"></td>
											<td width="8%" align="center">是否使用:</td>
											<td width="17%" align="center"><select
												class="form-control input-sm" name="pUse">
													<option value="">全部</option>
													<option value="0">未使用</option>
													<option value="1">已使用</option>
											</select></td>
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
									<th>名称</th>
									<th>型号</th>
									<th>单价</th>
									<th>创建人</th>
									<th>创建时间</th>
									<th>操作</th>
								</tr>
								<c:if test="${list== null || fn:length(list) == 0}">
									<tr>
										<td colspan="13" align="center">没有内容</td>
									</tr>
								</c:if>
								<c:if test="${list!=null}">
									<c:forEach var="pc" items="${list}" varStatus="xh">
										<tr>
											<td><c:out value="${xh.count}" /></td>
											<td><c:out value="${pc.pcId}" /></td>
											<td><c:out value="${pc.pcName}" /></td>
											<td><c:out value="${pc.pcXinghao}" /></td>
											<td><c:out value="${pc.pcPrice}" /></td>
											<td><c:out value="${pc.pcCreateId}" /></td>
											<td><fmt:formatDate value="${pc.pcCreateDate}"
													type="date" dateStyle="long" /></td>
											<td><a href="delete.do?id=${pc.pcId}"><i
													class="fa fa-fw fa-remove"></i>删除</a><a href="javascript:void(0)" onclick="edit('${pc.pcId}')"><i
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
								<li><a href="query.do?pClass=${product.pClass}&pSerialno=${product.pSerialno}&pName=${product.pName}&pSerialno=${product.pSerialno}&page=${xh.count}">${xh.count}</a></li>
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
					<h5 class="modal-title" id="form_title">新增产品类别</h5>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="addForm" method="post"
						action="save.do">
						<div class="box-body">
							<div class="form-group">
								<label for="pcName" class="col-sm-2 control-label">类别名称</label>
								<div class="col-sm-8">
									<input type="text" name="pcName" class="form-control input-sm"
										id="pcName" check-type="required">
									<input type="hidden" name="pcId" id="pcId">
								</div>
								<div class="col-sm-2"></div>
							</div>
							<div class="form-group">
								<label for="pcXinghao" class="col-sm-2 control-label">类别型号</label>
								<div class="col-sm-8">
									<input type="text" name="pcXinghao"
										class="form-control input-sm" id="pcXinghao"
										check-type="required">
								</div>
								<div class="col-sm-2"></div>
							</div>
							<div class="form-group">
								<label for="pcPrice" class="col-sm-2 control-label">类别单价</label>
								<div class="col-sm-8">
									<input type="text" name="pcPrice" class="form-control input-sm"
										id="pcPrice" check-type="required">
								</div>
								<div class="col-sm-2"></div>
							</div>
						</div>
						<div class="box-footer">
							<button type="reset" class="btn btn-default btn-sm">清空</button>
							<button type="submit" id="addSubmit"
								class="btn btn-info pull-right btn-sm">提交</button>
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
			$("#form_title").html("新增产品类别");
			$('#addDialog').modal({
				backdrop : 'static',
				keyboard : false
			});
			$("#addForm")[0].reset();
			$('#addDialog').modal('show');
		}
		
		function edit(id){
			$("#form_title").html("修改产品类别");
			$("#addForm")[0].reset();
			$.get("../../api/productclass/find.do?id="+id,function(data){
				$("#pcId").val(data.data.pcId);
				$("#pcName").val(data.data.pcName);
				$("#pcXinghao").val(data.data.pcXinghao);
				$("#pcPrice").val(data.data.pcPrice);
			});
			$('#addDialog').modal({
				backdrop : 'static',
				keyboard : false
			});
			$('#addDialog').modal('show');
		}
	</script>
</body>
</html>
