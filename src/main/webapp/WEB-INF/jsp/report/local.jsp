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
					<%-- <div class="box-header with-border">
						<div class="form-group">
							<form action="query.do" method="post">
								<div class="box-body">
									<table style="width: 75%">
										<tr>
											<td align="center">区域代码:</td>
											<td><input type="text" value="${network.nCode}"
												name="nCode" class="form-control input-sm"></td>
											<td align="center">区域负责人:</td>
											<td><input type="text" value="${network.nLeader }"
												name="nLeader" class="form-control input-sm"></td>
											<td align="center">负责人电话:</td>
											<td><input type="text"
												value="${network.nLeaderTelphone }" name="nLeaderTelphone"
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
					</div> --%>
					<!-- /.box-header -->
					<div class="box-body row">
						<div class="col-md-3">
							<div class="box box-primary">
								<div class="box-body no-padding">
									<ul class="nav nav-pills nav-stacked table">
										<li style="margin: 3px 0px 0px 20px; padding-bottom: 10px;">报表</li>
										<li><a href=''><i class="fa fa-file-text-o"></i>2016年7月月装车统计单</a></li>
										<li class='active'><a href=''><i
												class="fa fa-file-text-o"></i>2016年6月月装车统计单</a></li>
									</ul>
								</div>
								<!-- /.box-body -->
							</div>
						</div>
						<div class="col-md-9">
							<div class="box box-primary">
								<div class="box-header with-border">
									<div style="text-align: center">
										<h3 class="box-title">2016年6月月装车统计单</h3>
									</div>

									<div class="box-tools pull-right">
										<a href="#" class="btn btn-box-tool" data-toggle="tooltip"
											title="" data-original-title="Previous"><i
											class="fa fa-chevron-left"></i></a> <a href="#"
											class="btn btn-box-tool" data-toggle="tooltip" title=""
											data-original-title="Next"><i class="fa fa-chevron-right"></i></a>
									</div>
								</div>
								<!-- /.box-header -->
								<div class="box-body no-padding">
									<!-- /.mailbox-read-info -->

									<!-- /.mailbox-controls -->
									<div class="mailbox-read-message">

										<div class="box-body">
											<div class="chart">
												<canvas id="barChart" height="152" width="372"></canvas>
												<p style="text-align: center">2016年6月月装车统计图</p>
												<canvas id="lineChart" height="152" width="372"></canvas>
												<p style="text-align: center">2016年6月月装车走势图</p>
											</div>

										</div>


									</div>
									<!-- /.mailbox-read-message -->
								</div>
								<!-- /.box-body -->
								<div class="box-footer"></div>
								<!-- /.box-footer -->
								<div class="box-footer">
									<div class="pull-right">
										<button type="button" class="btn btn-default">
											<i class="fa fa-reply"></i> Reply
										</button>
										<button type="button" class="btn btn-default">
											<i class="fa fa-share"></i> Forward
										</button>
									</div>
									<button type="button" class="btn btn-default">
										<i class="fa fa-trash-o"></i> Delete
									</button>
									<button type="button" class="btn btn-default">
										<i class="fa fa-print"></i> Print
									</button>
								</div>
								<!-- /.box-footer -->
							</div>
						</div>
					</div>
					<!-- /.box-body -->

				</div>

			</div>
			<!-- /.col -->
		</div>
	</div>


	<script src="../../plugins/jQuery/jQuery-2.2.0.min.js"></script>
	<script src="../../bootstrap/js/bootstrap.min.js"></script>
	<script src="../../plugins/chartjs/Chart.min.js"></script>
	<script src="../../plugins/fastclick/fastclick.js"></script>
	<script src="../../dist/js/app.min.js"></script>
	<script src="../../dist/js/demo.js"></script>

	<script src="../../plugins/chartjs/Chart.bundle.js"></script>

	<script type="text/javascript">
		$(function() {
			var ctx = document.getElementById("barChart");
			var myChart = new Chart(ctx, {
				type : 'bar',
				data : {
					labels : [ "1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月",
							"9月", "10月", "11月", "12月" ],
					datasets : [ {
						label : '装车量',
						data : [ 12, 19, 3, 5, 2, 3, 12, 19, 3, 5, 2, 50 ],
						backgroundColor : [ 'rgba(255, 99, 132, 0.5)',
								'rgba(54, 162, 235, 0.2)',
								'rgba(255, 206, 86, 0.2)',
								'rgba(75, 192, 192, 0.2)',
								'rgba(153, 102, 255, 0.2)',
								'rgba(255, 159, 64, 0.2)' ],
						borderColor : [ 'rgba(255,99,132,1)',
								'rgba(54, 162, 235, 1)',
								'rgba(255, 206, 86, 1)',
								'rgba(75, 192, 192, 1)',
								'rgba(153, 102, 255, 1)',
								'rgba(255, 159, 64, 1)', 'rgba(255,99,132,1)',
								'rgba(54, 162, 235, 1)',
								'rgba(255, 206, 86, 1)',
								'rgba(75, 192, 192, 1)',
								'rgba(153, 102, 255, 1)',
								'rgba(255, 159, 64, 1)' ],
						borderWidth : 1
					} ]
				},
				options : {
					scales : {
						yAxes : [ {
							ticks : {
								beginAtZero : true
							}
						} ]
					}
				}
			});

			var ctx_line = document.getElementById("lineChart");
			var line_chart = new Chart(ctx_line, {
				type : 'line',
				data : {
					labels : [ "1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月",
							"9月", "10月", "11月", "12月" ],
					datasets : [ {
						label : '装车量',
						data : [ 12, 19, 3, 5, 2, 3, 12, 19, 3, 5, 2, 3 ],
						backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
								'rgba(54, 162, 235, 0.2)',
								'rgba(255, 206, 86, 0.2)',
								'rgba(75, 192, 192, 0.2)',
								'rgba(153, 102, 255, 0.2)',
								'rgba(255, 159, 64, 0.2)' ],
						borderColor : [ 'rgba(255,99,132,1)',
								'rgba(54, 162, 235, 1)',
								'rgba(255, 206, 86, 1)',
								'rgba(75, 192, 192, 1)',
								'rgba(153, 102, 255, 1)',
								'rgba(255, 159, 64, 1)', 'rgba(255,99,132,1)',
								'rgba(54, 162, 235, 1)',
								'rgba(255, 206, 86, 1)',
								'rgba(75, 192, 192, 1)',
								'rgba(153, 102, 255, 1)',
								'rgba(255, 159, 64, 1)' ],
						borderWidth : 1
					} ]
				},
				options : {
					scales : {
						yAxes : [ {
							ticks : {
								beginAtZero : true
							}
						} ]
					}
				}
			});

		});
	</script>
</body>
</html>
