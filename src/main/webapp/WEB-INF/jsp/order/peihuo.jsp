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
								aria-valuemax="100" style="width: 50%"></div>
						</div>
						<table style="width: 500px; margin-bottom: 10px; font-size: 12px;">
							<tr>
								<td width="100px" style="color: #ccc">未处理</td>
								<td width="100px" style="color: #ccc">审核</td>
								<td width="100px">配货</td>
								<td width="100px" style="color: #ccc">发货</td>
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
								<form class="form-horizontal" id="addForm" method="post"
						action="save.do">
						<div class="box-body">
							<div class="form-group row">
								
								<div class="col-md-5">
								库存货物
									<select id="notSelfMenu" multiple="" class="form-control"
										style="height: 350px;">
										<c:forEach items="${kclist}" var="kc" varStatus="xh">
										<option value="${kc.pId}">(${xh.count})${kc.pName}/${kc.pclass.pcXinghao}[${kc.pSerialno}]</option>
										</c:forEach>
									</select> 
								</div>
								<div class="col-md-2">
									<div style="margin-top: 100px;"></div>
									<button type="button" onclick="fenpei()"
										class="btn btn-block btn-default btn-xs">分配=》</button>
									<br />
									<button type="button" onclick="cancleFenpei()" class="btn btn-block btn-default btn-xs">《=收回</button>
								</div>
								<div class="col-md-5">
								已分配
									<select id="selfMenu" multiple="" class="form-control"
										style="height: 350px;">

									</select> 
								</div>
							</div>
						</div>
					</form>
							</div>
							<div class="col-xs-4">

								<table
									class="table table-bordered table-striped table-hover dataTable">
									<thead>
										<tr>
											<th colspan="4">订货申请信息</th>
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
							<a data-dismiss="modal" onclick="submitForm()" href="javascript:void(0)"
								aria-label="Close" class="btn btn-primary btn-sm">配货完成，发货</a>
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
		
		function submitForm(){
			var roleId=$("#roleId").html();
			var pcId='';
			var obj=document.getElementById("selfMenu");
			var options = obj.options;
			for(var i=0,len=options.length;i<len;i++){
			    if(i==options.length-1){
			    	pcId+=options[i].value;
			    }else{
			    	pcId+=options[i].value+',';
			    }
			}
			//alert(pcId);
			$.post('peihuoPc.do',{'pcId':pcId,'orderId':'${orderId}','network':'${od.oNetwork}','id':'${id}'},function(data){
				if(data.success=='0'){
					alert('配货完成');
					window.location.href="fahuo.do?orderId=${orderId}&id=${id}";
				}else{
					alert('配货失败');
					window.location.href="query.do";
				}
			});
		}
	</script>
</body>
</html>
