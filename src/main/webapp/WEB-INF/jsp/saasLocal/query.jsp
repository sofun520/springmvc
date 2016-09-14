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
											<td align="center" width="7%">客户姓名:</td>
											<td width="18%"><input name="cName"
												value="<c:out value="${customer.cName}" />"
												class="form-control input-sm"></td>
											<td align="center" width="7%">身份证号:</td>
											<td width="18%"><input name="cIdentity"
												value="<c:out value="${customer.cIdentity}" />"
												class="form-control input-sm"></td>
											<td align="center" width="7%">电话号码:</td>
											<td width="18%"><input name="cTelephone"
												value="<c:out value="${customer.cTelephone}" />"
												class="form-control input-sm"></td>
											<td align="center" width="7%"></td>
											<td width="18%"></td>
										</tr>
									</table>
								</div>
								<div class="col-sm-12">
									<button type="submit" class="btn btn-default btn-sm">查&nbsp;&nbsp;询</button>
									<button type="button" class="btn btn-default btn-sm">刷&nbsp;&nbsp;新</button>
									<button type="button" onclick="addDialog()" class="btn btn-default btn-sm">续&nbsp;&nbsp;费</button>
								</div>
							</form>
						</div>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<table class="table table-bordered">
							<tr>
								<td width="13%" align="center" style="background-color: #f9f9f9">区域代码</td>
								<td width="20%"><c:out value="${jhacsaas.sNetwork}" /></td>
								<td width="13%" align="center" style="background-color: #f9f9f9">服务状态</td>
								<td width="20%">正常</td>
								<td width="13%" align="center" style="background-color: #f9f9f9">SAAS服务ID</td>
								<td width="20%"><c:out value="${jhacsaas.sId}" /></td>
							</tr>
							<tr>
								<td align="center" style="background-color: #f9f9f9">服务开始时间</td><td><fmt:formatDate value="${jhacsaas.sBeginDate}"
													type="both" dateStyle="default" /></td>
								<td align="center" style="background-color: #f9f9f9">服务结束时间</td><td><fmt:formatDate value="${jhacsaas.sExpireDate}"
													type="both" dateStyle="default" /></td>
								<td></td>
								<td></td>
							</tr>
						</table>
					
						<h6>缴费记录:</h6>
						<table
							class="table table-bordered 
table-striped table-hover dataTable">
							<tbody>
								<tr>
									<th style="width: 50px">序号</th>
									<th>单号</th>
									<th>购买类型</th>
									<th>购买数量</th>
									<th>开始时间</th>
									<th>结束时间</th>
									<th>审核人</th>
									<th>审核时间</th>
									<th>审核结果</th>
									<th>理由</th>
									<th>操作</th>
								</tr>
								<c:if test="${saasLogList== null || fn:length(saasLogList) == 0}">
									<tr>
										<td colspan="11" align="center">没有内容</td>
									</tr>
								</c:if>
								<c:if test="${saasLogList!=null}">
									<c:forEach var="sl" items="${saasLogList}" varStatus="xh">
										<tr>
											<td><c:out value="${xh.count}" /></td>
											<td><c:out value="${sl.slOrder}" /></td>
											<td>
												<c:if test="${sl.slTimeType==1}">按天</c:if><c:if test="${sl.slTimeType==2}">按月</c:if>
											</td>
											<td><c:out value="${sl.slTimeNum}" /></td>
											<td><fmt:formatDate value="${sl.slNewBegindate}"
													type="both" dateStyle="default" /></td>
											<td><fmt:formatDate value="${sl.slNewExpiredate}"
													type="both" dateStyle="default" /></td>
											<td>
											<c:if test="${sl.user.uTruename !=null}">
												<c:out value="${sl.user.uTruename}" />(<c:out value="${sl.user.uName}" />[<c:out value="${sl.user.uTelephone}" />])</td>
											</c:if>
											<c:if test="${sl.user.uTruename ==null}">----</c:if>
											<td><fmt:formatDate value="${sl.slCreateTime}"
													type="both" dateStyle="default" /></td>
											<td><c:if test="${sl.slReviewResult==1}">通过</c:if><c:if test="${sl.slReviewResult==0}">不通过</c:if><c:if test="${sl.slReviewResult==2}">未审核</c:if></td>
											<td><c:out value="${sl.slReviewReason}" /></td>
											<td>
											<c:if test="${sl.slReviewResult == 2}">
											<a href="delete.do?id=<c:out value="${sl.slId}" />">删除</a>
											</c:if></td>
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
		<div class="modal-dialog" style="width: 800px;" id="apd">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title">
						<h5>
							SAAS服务续费
						</h5>
					</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="addForm" method="post"
						action="save.do">
						<div class="box-body">
							<form class="form-horizontal" id="addForm" method="post"
								action="save.do">
								<div class="box-body">
									<div class="form-group">
										<label for="inputEmail3" class="col-sm-2 control-label">区域代码</label>
										<div class="col-sm-8">
											<input type="hidden" name="page" value="${page}">
											<input type="text" name="slNetwork" class="form-control input-sm" disabled="disabled"
												id="inputEmail3" check-type="required" value="<c:out value="${user.uNetworkCode}" />">
										</div>
										<div class="col-sm-2"></div>
									</div>
									<div class="form-group">
										<label for="" class="col-sm-2 control-label">时间类型</label>
										<div class="col-sm-8">
											<select class="form-control input-sm" name="slTimeType">
												<c:forEach items="${enumList}" var="em">
													<option value='<c:out value="${em.enumKey}" />'><c:out
															value="${em.enumValue}" /></option>
												</c:forEach>
											</select>
										</div>
										<div class="col-sm-2"></div>
									</div>
									<div class="form-group">
										<label for="" class="col-sm-2 control-label">数量</label>
										<div class="col-sm-8">
											<input type="number" name="slTimeNum" class="form-control input-sm" min="1" value="1">
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
					</form>
				</div>
			</div>
		</div>
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

	</script>
</body>
</html>
