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
							<form action="recored.do" method="post">
								<div class="box-body">
									<table style="width: 100%">
										<tr>
											<td align="center" width="7%">区域代码:</td>
											<td width="18%"><input name="slNetwork"
												value="<c:out value="${saaslog.slNetwork}" />"
												class="form-control input-sm"></td>
											<td align="center" width="7%">单号:</td>
											<td width="18%"><input name="slOrder"
												value="<c:out value="${saaslog.slOrder}" />"
												class="form-control input-sm"></td>
											<td align="center" width="7%">审核状态</td>
											<td width="18%"><select name="slReviewResult"
												class="form-control input-sm" id="product">
													<option value="">全部</option>
													<option value="2"
														<c:if test="${saaslog.slReviewResult==2}">selected="selected"</c:if>>未审核</option>
													<option value="1"
														<c:if test="${saaslog.slReviewResult==1}">selected="selected"</c:if>>审核通过</option>
													<option value="0"
														<c:if test="${saaslog.slReviewResult==0}">selected="selected"</c:if>>审核不通过</option>
											</select></td>
											<td align="center" width="7%"></td>
											<td width="18%"></td>
										</tr>
									</table>
								</div>
								<div class="col-sm-12">
									<button type="submit" class="btn btn-default btn-sm">查&nbsp;&nbsp;询</button>
									<button type="button" class="btn btn-default btn-sm">刷&nbsp;&nbsp;新</button>

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
									<th>单号</th>
									<th>区域代码</th>
									<th>购买类型</th>
									<th>购买数量</th>
									<th>开始时间</th>
									<th>结束时间</th>
									<th>申请时间</th>
									<th>审核人</th>
									<th>审核时间</th>
									<th>审核结果</th>
									<th>理由</th>
									<th>操作</th>
								</tr>
								<c:if test="${list== null || fn:length(list) == 0}">
									<tr>
										<td colspan="13" align="center">没有内容</td>
									</tr>
								</c:if>
								<c:if test="${list!=null}">
									<c:forEach var="sl" items="${list}" varStatus="xh">
										<tr>
											<td><c:out value="${xh.count}" /></td>
											<td><c:out value="${sl.slOrder}" /></td>
											<td><c:out value="${sl.slNetwork}" /></td>
											<td><c:if test="${sl.slTimeType==1}">按天</c:if> <c:if
													test="${sl.slTimeType==2}">按月</c:if></td>
											<td><c:out value="${sl.slTimeNum}" /></td>
											<td><fmt:formatDate value="${sl.slNewBegindate}"
													type="both" dateStyle="default" /></td>
											<td><fmt:formatDate value="${sl.slNewExpiredate}"
													type="both" dateStyle="default" /></td>
											<td><fmt:formatDate value="${sl.slCreateTime}"
													type="both" dateStyle="default" /></td>
											<td><c:out value="${sl.slReviewId}" /></td>
											<td><fmt:formatDate value="${sl.slUpdateTime}"
													type="both" dateStyle="default" /></td>
											<td><c:if test="${sl.slReviewResult==0}">审核不通过</c:if> <c:if
													test="${sl.slReviewResult==1}">审核通过</c:if></td>
											<td><c:out value="${sl.slReviewReason}" /></td>
											<td><c:if test="${sl.slReviewResult==2}">
													<a href="javascript:void(0)" onclick="addDialog('<c:out value="${sl.slId}" />','<c:out value="${sl.slNetwork}" />','<c:out value="${sl.slOrder}" />')"><i class="fa fa-fw fa-edit"></i>审核</a>
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
								<li <c:if test="${page==xh.count}">class="active"</c:if>><a href="recored.do?slReviewResult=${saaslog.slReviewResult}&slOrder=${saaslog.slOrder}&slNetwork=${saaslog.slNetwork}&page=${xh.count}">${xh.count}</a></li>
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
						<h5>缴费审核</h5>
					</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="addForm" method="post"
						action="review.do">
						<div class="box-body">
							<div class="form-group">
								<label for="" class="col-sm-2 control-label">审核结果</label>
								<div class="col-sm-8">
									<select class="form-control input-sm" name="slReviewResult">
										<option value="1">通过</option>
										<option value="0">不通过</option>
									</select>
								</div>
								<div class="col-sm-2"></div>
							</div>
							<div class="form-group">
								<label for="" class="col-sm-2 control-label">理由</label>
								<div class="col-sm-8">
									<textarea name="slReviewReason" rows="5"
										class="form-control input-sm" ></textarea>
										<input type="hidden" name="slNetwork" id="slNetwork">
									<input type="hidden" name="slId" id="slId">
									<input type="hidden" name="slOrder" id="slOrder">
									<input type="hidden" name="page" value="${page}">
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

		function addDialog(id,network,order) {
			$('#addDialog').modal({
				backdrop : 'static',
				keyboard : false
			});
			$("#ad").attr("style", "width:800px;margin:10px auto;");
			$("#slId").val(id);
			$("#slOrder").val(order);
			$("#slNetwork").val(network);
			$('#addDialog').modal('show');
		}
	</script>
</body>
</html>
