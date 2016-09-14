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
						处理订单[订单编号：${orderId}，订单ID：${id}]</div>
					<!-- /.box-header -->
					<div class="box-body">
						<div class="progress progress-xs"
							style="width: 400px; margin-bottom: 5px; margin-left: 20px; margin-top: 10px;">
							<div
								class="progress-bar progress-bar-success progress-bar-striped"
								role="progressbar" aria-valuenow="60" aria-valuemin="0"
								aria-valuemax="100" style="width: 85%"></div>
						</div>
						<table style="width: 500px; margin-bottom: 10px; font-size: 12px;">
							<tr>
								<td width="100px" style="color: #ccc">未处理</td>
								<td width="100px" style="color: #ccc">审核</td>
								<td width="100px" style="color: #ccc">配货</td>
								<td width="100px">发货</td>
								<td width="100px" style="color: #ccc">收货</td>
							</tr>
						</table>
						<div class="row">
							<div class="col-xs-8">
								<table class="table table-bordered  table-hover dataTable">
									<tr>
										<td>订单编号：</td>
										<td>${orderId}</td>
										<td>订货区域：</td>
										<td>${od.oNetwork}</td>
									</tr>
									<tr>
										<td>订货人：</td>
										<td>${od.network.nLeader}</td>
										<td>手机号码：</td>
										<td>${od.network.nLeaderTelphone}</td>
									</tr>
								</table>
								<table
									class="table table-bordered table-striped table-hover dataTable">
									<thead>
										<tr>
											<th style="width: 43px">序号</th>
											<th>货品名称</th>
											<th>货品型号</th>
											<th>产品序列号</th>
											<th>单价(￥)</th>
										</tr>
									</thead>
									<tbody>
										<c:set var="sum" value="0"></c:set>
										<c:forEach items="${pList}" var="p" varStatus="xh">
											<tr>
												<td><c:out value="${xh.count}" /></td>
												<td><c:out value="${p.pName}" /></td>
												<td><c:out value="${p.pclass.pcXinghao}" /></td>
												<td><c:out value="${p.pSerialno}" /></td>
												<td align="right"><c:out value="${p.pclass.pcPrice}" /></td>
											</tr>
											<c:set var="sum" value="${sum+p.pclass.pcPrice}"></c:set>
										</c:forEach>
										<tr>
											<td colspan="4" align="right">总计(￥)：</td>
											<td align="right"><span style="font-size: 16px;"><b><c:out
															value="${sum}"></c:out></b></span></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="col-xs-4">

								<table
									class="table table-bordered table-striped table-hover dataTable">
									<thead>
										<tr>
											<th colspan="3">订货申请信息</th>
										</tr>
										<tr>
											<th style="width: 43px">序号</th>
											<th>货名</th>
											<th>型号</th>
											<th>数量</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${odList}" var="od" varStatus="xh">
											<tr>
												<td><c:out value="${xh.count}" /></td>
												<td><c:out value="${od.pc.pcName}" /></td>
												<td><c:out value="${od.pc.pcXinghao}" /></td>
												<td><c:out value="${od.odNumber}" /></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>


					</div>
					<!-- /.box-body -->
					<div class="box-footer">
						<div id="shenheBtn">
							<a type="button" href="query.do" data-dismiss="modal"
								aria-label="Close" class="btn btn-primary btn-sm"> 完成 </a>
							<a type="button" target="_blank" href="javascript:void(0)" onclick="print()" data-dismiss="modal"
								aria-label="Close" class="btn btn-default btn-sm"><i class="fa fa-fw fa-print"></i>打印货单</a>
						</div>
					</div>


				</div>
			</div>

		</div>
		<!-- /.col -->
	</div>
	</div>


	<div class="modal" id="addPcDialog">
		<div class="modal-dialog" style="width: 900px;" id="apd">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h5 class="modal-title">
						订单[订单编号：<span id="odoid"></span>，订单ID：<span id="ids"></span>]详情
					</h5>
				</div>
				<div class="modal-body">
					<iframe id="reviewFrame" scrolling="auto" width="100%"
						height="500px" style="border: 0px;"></iframe>

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
			$("#ad").attr("style", "width:800px;margin:10px auto;");
			$('#addDialog').modal('show');
		}

		function addPcDialog() {
			$('#addPcDialog').modal({
				backdrop : 'static',
				keyboard : false
			});
			$('#addPcDialog').modal('show');
		}

		function addProductOrder() {

			var orderId = $("#orderId").html();
			var product = $("#productId").val();
			var number = $("#number").val();

			if (orderId == null || orderId == '') {
				$
						.get(
								'../../api/code/query.do?code=OD',
								function(data) {
									orderId = data.code;
									$("#orderId").html(data.code);
									$
											.post(
													'../../api/orderdetail/save.do',
													{
														"odOrderId" : data.code,
														"odPcId" : product,
														"odNumber" : number
													},
													function(data) {
														var ht = '';
														$
																.each(
																		data.data,
																		function(
																				i,
																				val) {
																			ht += '<tr id="tr'+val.odId+'"><td>'
																					+ (i + 1)
																					+ '</td><td>'
																					+ val.pc.pcName
																					+ '</td><td>'
																					+ val.pc.pcXinghao
																					+ '</td><td>'
																					+ val.odNumber
																					+ '</td><td><a href="javascript:void(0)" onclick="delOd(\'tr'
																					+ val.odId
																					+ '\','
																					+ val.odId
																					+ ')">删除</a></td></tr>';
																		});
														$("#tt").html(ht);
													});

								});
			} else {
				$
						.post(
								'../../api/orderdetail/save.do',
								{
									"odOrderId" : orderId,
									"odPcId" : product,
									"odNumber" : number
								},
								function(data) {
									var ht = '';
									$
											.each(
													data.data,
													function(i, val) {
														ht += '<tr id="tr'+val.odId+'"><td>'
																+ (i + 1)
																+ '</td><td>'
																+ val.pc.pcName
																+ '</td><td>'
																+ val.pc.pcXinghao
																+ '</td><td>'
																+ val.odNumber
																+ '</td><td><a href="javascript:void(0)" onclick="delOd(\'tr'
																+ val.odId
																+ '\','
																+ val.odId
																+ ')">删除</a></td></tr>';
													});
									$("#tt").html(ht);
								});
			}
		}

		function refresh() {
			var name = "${user.network.nName}订货申请";
			var code = $("#orderId").html();
			$.post('save.do', {
				"oName" : name,
				"oCode" : code
			}, function(data) {

			});

			window.location.href = 'query.do';
		}

		function delOd(tr, id) {
			var tbody = $("#tt");
			var ch = $("#" + tr);
			ch.remove();
			$.get('../../api/orderdetail/delete.do?id=' + id, function(data) {
				alert(data.message);
			});
		}

		function orderDetail(orderId, ids, status) {
			//alert(orderId);
			$('#addPcDialog').modal({
				backdrop : 'static',
				keyboard : false
			});

			if (status == '0') {
				//去审核
				$("#reviewFrame").attr('src',
						"review.do?orderId=" + orderId + "&id=" + ids);
			} else if (status == '1') {
				//配货
				$("#reviewFrame").attr(
						'src',
						"peihuo.do?orderId=" + orderId + "&status=" + status
								+ "&id=" + ids);
			} else if (status == '2') {
				//已发货
				$("#reviewFrame").attr('src', "fahuo.do?orderId=" + orderId);
			} else if (status == '3') {
				//完成
				$("#reviewFrame").attr('src', "finish.do?orderId=" + orderId);
			}

			$("#odoid").html(orderId);
			$("#ids").html(ids);
			/* 
			if(status==1){
				$("#shenheBtn").hide();
				$("#fahuoBtn").show();
			}else if(status==0){
				$("#shenheBtn").show();
				$("#fahuoBtn").hide();
			}else{
				$("#shenheBtn").hide();
				$("#fahuoBtn").hide();
			}
			$("#apd").attr("style", "width:800px;margin:10px auto;");
			$
					.get(
							'../../api/orderdetail/query.do?odOrderId='
									+ orderId,
							function(data) {
								var ht = '';
								var sum = 0;
								$.each(data.data, function(i, val) {
									ht += '<tr id="tr'+val.odId+'"><td>'
											+ (i + 1) + '</td><td>'
											+ val.pc.pcName + '</td><td>'
											+ val.pc.pcXinghao + '</td><td>'
											+ val.odNumber
											+ '</td><td align="right">'
											+ val.pc.pcPrice
											+ '</td><td align="right">'
											+ val.odNumber * val.pc.pcPrice
											+ '</td></tr>';
									sum += val.odNumber * val.pc.pcPrice;
								});
								sum=sum.toFixed(2);
								var sumhtml = '<tr><td colspan="5" align="right">总计(￥)：</td><td colspan="1"  align="right"><span style="font-size:16px;"><b>'+sum+'</b></span></td></tr>';
								$("#ttt").html(ht + sumhtml);
							}); */

			$('#addPcDialog').modal('show');
		}

		function review(type) {
			var ids = $("#ids").html();
			$
					.post(
							'../../api/orderCorporation/review.do',
							{
								"oId" : ids,
								"oStatus" : type,
								"oUpdateId" : "${user.uId}"
							},
							function(data) {
								//alert(data);
								window.location.href = "query.do?page=${page}&oStatus=${order.oStatus}";
							});
		}
		
		function print(){
			window.open ('print.do?orderId=${orderId}&id=${id}','打印','height=600,width=900,top=0,left=0,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
		}
	</script>
</body>
</html>
