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
<link rel="stylesheet" href="../../plugins/datepicker/datepicker3.css">

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
					<div class="box-body">
						<div class="form-group">
							<div class="box-body">
								<table style="width: 100%">
									<tr>
										<td align="center" width="7%">装车年月:</td>
										<td width="18%">
											<div class='input-group date'>
												<input type='text' class="form-control input-sm" id="monthSale_date" />
												<span class="input-group-addon"> <span
													class="glyphicon glyphicon-calendar"></span>
												</span>
											</div>
										</td>
										<td align="center" width="7%">装车地点:</td>
										<td width="18%"><select class="form-control input-sm"
											name="address" id="address">
												<option value="">全部</option>
												<c:forEach items="${comList}" var="com">
													<option
														<c:if test="${out.oAddress==com.comId}">selected="selected"</c:if>
														value='<c:out value="${com.comId}" />'><c:out
															value="${com.comName}" /></option>
												</c:forEach>
										</select></td>
										<td align="center" width="7%"></td>
										<td width="18%"></td>
										<td width="7%"></td>
										<td width="18%">
											<button type="button" onclick="monthSalePrint()" class="btn btn-default btn-sm">
												<i class="fa fa-fw fa-print"></i>打印
											</button>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>

				<div class="box">
					<div class="box-body">
						<div class="form-group">
							<div class="box-body">
								<table style="width: 100%">
									<tr>
										<td align="center" width="7%">装车年月:</td>
										<td width="18%">
											<div class='input-group date'>
												<input type='text' class="form-control input-sm" id="dp1" />
												<span class="input-group-addon"> <span
													class="glyphicon glyphicon-calendar"></span>
												</span>
											</div>
										</td>
										<td align="center" width="7%">装车地点:</td>
										<td width="18%"><select class="form-control input-sm"
											name="oAddress">
												<option value="">全部</option>
												<c:forEach items="${comList}" var="com">
													<option
														<c:if test="${out.oAddress==com.comId}">selected="selected"</c:if>
														value='<c:out value="${com.comId}" />'><c:out
															value="${com.comName}" /></option>
												</c:forEach>
										</select></td>
										<td align="center" width="7%"></td>
										<td width="18%"></td>
										<td width="7%"></td>
										<td width="18%">
											<button type="submit" class="btn btn-default btn-sm">
												<i class="fa fa-fw fa-print"></i>打印
											</button>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>


			</div>
			<!-- /.col -->
		</div>
	</div>





	<div class="modal" id="addPcDialog">
		<div class="modal-dialog" style="width: 800px;" id="apd">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title">
						<h5>
							订单[订单编号：<span id="odoid"></span>，订单ID：<span id="ids"></span>]详情
						</h5>
					</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="addForm" method="post"
						action="save.do">
						<div class="box-body">
							<table
								class="table table-bordered table-striped table-hover dataTable">
								<thead>
									<tr>
										<th style="width: 43px">序号</th>
										<th>货品名称</th>
										<th>货品型号</th>
										<th>货品数量</th>
										<th>单价(￥)</th>
										<th>小计(￥)</th>
									</tr>
								</thead>
								<tbody id="ttt">
									<tr>
										<td colspan="5" align="center">没有数据</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="box-footer">
							<div id="shouhuoBtn">
								<button type="button" onclick="review('3')" data-dismiss="modal"
									aria-label="Close" class="btn btn-default btn-sm">确认收货</button>
							</div>
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
	<script src="../../plugins/datepicker/bootstrap-datepicker.js"></script>
	<script
		src="../../plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
	<script type="text/javascript">
		$(function() {

			$('#monthSale_date').datepicker({
				language : "zh-CN",
				autoclose : true,
				format : "yyyy-mm",
				minViewMode:1
			});

			$('#addForm').validation();
			$("#addSubmit").on('click', function(event) {
				if ($("#addForm").valid(this) == false) {
					return false;
				}
			});

		});

		function monthSalePrint(){
			var strs=$("#monthSale_date").val().split("-");
			var address=$("#address").val();
			//window.location.href='monthSale.do?year='+strs[0]+'&month='+strs[1]+"&address="+address;
			window.open ('monthSale.do?year='+strs[0]+'&month='+strs[1]+"&address="+address,'打印','height=600,width=900,top=0,left=0,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');			
		}

		
	</script>
</body>
</html>
