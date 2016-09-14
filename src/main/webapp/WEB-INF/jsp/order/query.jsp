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
					<div class="box-header with-border">
						<div class="form-group">
							<form action="query.do" method="post">
								<div class="box-body">
									<table style="width: 100%">
										<tr>
											<td align="center" width="7%">订单编号:</td>
											<td width="18%"><input name="oCode"
												value="${order.oCode}" class="form-control input-sm"></td>
											<td align="center" width="7%">订单状态:</td>
											<td width="18%"><select name="oStatus"
												class="form-control input-sm" id="product">
													<option value="">全部</option>
													<c:forEach var="em" items="${enumList}" varStatus="xh">
														<option
															<c:if test="${order.oStatus==em.enumKey}">selected="selected"</c:if>
															value="<c:out value="${em.enumKey}" />"><c:out
																value="${em.enumValue}" /></option>
													</c:forEach>
											</select></td>
											<td align="center" width="7%">订货时间:</td>
											<td width="18%"><div class='input-group date' >
											                    <input type='text' class="form-control input-sm" id="dp1"/>
											                    <span class="input-group-addon">
											                        <span class="glyphicon glyphicon-calendar"></span>
											                    </span>
											                </div></td>
											<td align="center" width="7%"></td>
											<td width="18%"><span class="glyphicon glyphicon-calendar"></span>
											<span class="glyphicon glyphicon-cog"></span>
											<i class="fa fa-fw fa-credit-card"></i>
											<i class="fa fa-fw fa-file"></i>
											<i class="fa fa-fw fa-cny"></i>
											</td>
										</tr>
									</table>
								</div>
								<div class="col-sm-12">
									<button type="submit" class="btn btn-default btn-sm"><i class="fa fa-fw fa-search"></i>查&nbsp;&nbsp;询</button>
									<button type="button" class="btn btn-default btn-sm"><i class="fa fa-fw fa-refresh"></i>刷&nbsp;&nbsp;新</button>
									<button type="button" onclick="addDialog()"
										class="btn btn-default btn-sm">申请订货</button>
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
									<th>订单名称</th>
									<th>订单编号</th>
									<th>订单状态</th>
									<th>订货人</th>
									<th>申请时间</th>
									<th>订单进度</th>
									<th>操作</th>
								</tr>
								<c:if test="${list== null || fn:length(list) == 0}">
									<tr>
										<td colspan="13" align="center">没有内容</td>
									</tr>
								</c:if>
								<c:if test="${list!=null}">
									<c:forEach var="order" items="${list}" varStatus="xh">
										<tr>
											<td><c:out value="${xh.count}" /></td>
											<td><c:out value="${order.oId}" /></td>
											<td><c:out value="${order.oName}" /></td>
											<td><a href="javascript:void(0)"
												onclick="orderDetail('${order.oCode}','${order.oId}','${order.oStatus}')"><c:out
														value="${order.oCode}" /></a></td>
											<td><c:if test="${order.oStatus==0}">已申请，未处理</c:if> <c:if
													test="${order.oStatus==1}">处理中</c:if> <c:if
													test="${order.oStatus==2}">发货中</c:if> <c:if
													test="${order.oStatus==3}">订单完成</c:if> <c:if
													test="${order.oStatus==4}">已取消</c:if> <c:if
													test="${order.oStatus==5}">审核拒绝</c:if></td>
											<td><c:out value="${order.oCreateId}" /></td>
											<td><fmt:formatDate value="${order.oCreateTime}"
													type="both" dateStyle="default" /></td>
											<td>
												<div class="progress  progress-xs">
													<c:if test="${order.oStatus==0}">
														<div
															class="progress-bar progress-bar-primary progress-bar-striped"
															role="progressbar" aria-valuenow="25" aria-valuemin="0"
															aria-valuemax="100" style="width: 25%"></div>
													</c:if>
													<c:if test="${order.oStatus==1}">
														<div
															class="progress-bar progress-bar-primary progress-bar-striped"
															role="progressbar" aria-valuenow="50" aria-valuemin="0"
															aria-valuemax="100" style="width: 50%"></div>
													</c:if>
													<c:if test="${order.oStatus==2}">
														<div
															class="progress-bar progress-bar-primary progress-bar-striped"
															role="progressbar" aria-valuenow="75" aria-valuemin="0"
															aria-valuemax="100" style="width: 75%"></div>
													</c:if>
													<c:if test="${order.oStatus==3}">
														<div
															class="progress-bar progress-bar-primary progress-bar-striped"
															role="progressbar" aria-valuenow="100" aria-valuemin="0"
															aria-valuemax="100" style="width: 100%"></div>
													</c:if>
												</div>
											</td>
											<td><c:if test="${order.oStatus==0 }">
													<a href="delete.do?id=${order.oId}&page=${page}"><i
														class="fa fa-fw fa-remove"></i>取消订单</a>
												</c:if> <a href="javascript:void(0)"
												onclick="orderDetail('${order.oCode}','${order.oId}','${order.oStatus}')"><i
													class="fa fa-fw fa-edit"></i>详细</a></td>
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
								<li <c:if test="${page==xh.count}">class="active"</c:if>><a href="query.do?page=${xh.count}&oCode=${order.oCode}&oStatus=${order.oStatus}">${xh.count}</a></li>
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
		<div class="modal-dialog" style="width: 800px;" id="ad">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h5 class="modal-title">新增订单详情</h5>
				</div>
				<div class="modal-body">
					<div class="" style="font-size: 12px;">
						<form class="form-horizontal" id="addForm" method="post"
							action="save.do">
							<table>
								<tr>
									<td width="25%" align="center">订单号:&nbsp<span id="orderId"></span></td>
									<td width="7%" align="center">产品:</td>
									<td width="18%"><select class="form-control input-sm"
										id="productId">
											<c:forEach var="pc" items="${pcList}" varStatus="xh">
												<option value="<c:out value="${pc.pcId}" />"><c:out
														value="${pc.pcName}" />/
													<c:out value="${pc.pcXinghao}" /></option>
											</c:forEach>
									</select>
									</td>
									<td width="7%" align="center">数量:</td>
									<td width="18%"><input name="number" id="number"
										type="number" min="1" value="1" class="form-control input-sm"></td>
									<td width="25%" align="left">&nbsp;&nbsp;
										<button type="button" onclick="addProductOrder()"
											class="btn btn-default btn-sm">添加至列表</button>
									</td>
								</tr>
							</table>

						</form>
					</div>
					<div class="box-body">
						<table
							class="table table-bordered table-striped table-hover dataTable">
							<thead>
								<tr>
									<th style="width: 43px">序号</th>
									<th>货品名称</th>
									<th>货品型号</th>
									<th>货品数量</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody id="tt">
							</tbody>
						</table>
					</div>
					<div class="box-footer">
						[温馨提示]选择完产品后，请单击右侧提交按钮
						<button type="button" onclick="refresh()" id="addSubmit"
							data-dismiss="modal" aria-label="Close"
							class="btn btn-info pull-right">提交</button>
					</div>
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
	<script src="../../plugins/datepicker/bootstrap-datepicker.js"></script>
	<script src="../../plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
	<script src="../../bootstrap/js/bootstrap3-validation.js"></script>
	<script type="text/javascript">
		$(function() {
			
			$('#dp1').datepicker({
				language: "zh-CN",
	            autoclose: true,//选中之后自动隐藏日期选择框
	            //clearBtn: true,//清除按钮
	            format: "yyyy-mm-dd",
	            todayBtn: 'linked',
	            weekStart: 1,
	            todayHighlight:true
			});
			
			/* $('#dp1').datepicker({
				language: "zh-CN",
	            autoclose: true,//选中之后自动隐藏日期选择框
	            clearBtn: true,//清除按钮
	            todayBtn: true,//今日按钮
	            format: "yyyy-mm-dd",
			});
			
			$('#dp1').datepicker().on('changeDate', function(ev){
				$('#dp1').datepicker('hide');
			}); */
			

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

			window.location.href = 'query.do?page=${page}';
		}

		function delOd(tr, id) {
			var tbody = $("#tt");
			var ch = $("#" + tr);
			ch.remove();
			$.get('../../api/orderdetail/delete.do?id=' + id, function(data) {
				alert(data.message);
			});
		}

		function orderDetail(orderId, oid, status) {
			//alert(orderId);
			$('#addPcDialog').modal({
				backdrop : 'static',
				keyboard : false
			});
			$("#odoid").html(orderId);
			$("#ids").html(oid);
			if (status == 2) {
				$("#shouhuoBtn").show();
			} else {
				$("#shouhuoBtn").hide();
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
											+ '</td>';
									sum += val.odNumber * val.pc.pcPrice;
								});
								sum = sum.toFixed(2);
								var sumhtml = '<tr><td colspan="5" align="right">总计(￥)：</td><td colspan="1"  align="right"><span style="font-size:16px;"><b>'
										+ sum + '</b></span></td></tr>';
								$("#ttt").html(ht + sumhtml);
							});

			$('#addPcDialog').modal('show');
		}

		function review(type) {
			var ids = $("#ids").html();
			$.post('../../api/orderCorporation/review.do', {
				"oId" : ids,
				"oStatus" : type,
				"oUpdateId" : "${user.uId}"
			}, function(data) {
				//alert(data);
				window.location.href = "query.do";
			});
		}
	</script>
</body>
</html>
