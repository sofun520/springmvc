<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:useBean id="now" class="java.util.Date" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>京汉安驰撞车统计单(${networkName.nName}(${networkCode})${year}-${month})</title>
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

.tb {
	font-size: 12px;
	border-collapse:collapse;
	border:#000 solid 1px;
}
.tb td,th{
border:#000 solid 1px; padding:5px;
}

.tb th{
text-align: center;
}
</style>

</head>
<body onload="window.print();">
<div class="wrapper">
  <!-- Main content -->
  <section class="invoice">
    <!-- title row -->
    <div class="row">
      <div class="col-xs-12">
        <h2 class="page-header" style="border-bottom: 1px solid #000;">
          <i class="fa fa-globe"></i> JHAC, Inc.
          <small class="pull-right">*版本:v1.0.1*</small>
        </h2>
      </div>
      <!-- /.col -->
    </div>
    <!-- info row -->
 
    <!-- Table row -->
    <div class="row">
      <div class="col-xs-12 table-responsive">
        <table width="100%"><tr><td align="center"><h4><u>京汉安驰装车统计单</u></h4></td></tr></table>
        <table width="100%" style="font-size:12px;">
									
									<tr>
										<td width="10%">统计年月：</td>
										<td  style="border-bottom: 1px #000 solid;" width="14%">${year}年${month}月</td>
										<td width="9%">区域：</td>
										<td style="border-bottom: 1px #000 solid;" width="15%">${networkName.nName}(${networkCode})</td>
										<td width="9%">打印人：</td>
										<td style="border-bottom: 1px #000 solid;" width="16%">${user.uTruename}</td>
										<td width="10%">打印时间：</td>
										<td style="border-bottom: 1px #000 solid;" width="17%"><fmt:formatDate value="${now}" type="both" dateStyle="long" pattern="yyyy-MM-dd HH:mm:ss" /></td>
									</tr>
								</table><br>
								<table
									class="tb" width="100%">
									<thead>
										<tr>
											<th style="width: 43px">序号</th>
									<th>车架号</th>
									<th>产品序列号</th>
									<th>车型</th>
									<th>装车人</th>
									<th>安装时间</th>
									<th>安装地址</th>
										</tr>
									</thead>
									<tbody>
										<c:set var="sum" value="0"></c:set>
										<c:forEach items="${list}" var="out" varStatus="xh">
											<tr>
												<td><c:out value="${xh.count}" /></td>
											<td><c:out value="${out.oFrameno}" /></td>
											<td><c:out value="${out.oSerialno}" /></td>
											<td><c:out value="${out.carClass.ccName}" /></td>
											<td><c:out value="${out.user.uTruename}" />(<c:out
													value="${out.user.uName}" />)</td>
											<td><fmt:formatDate value="${out.oCreateTime}"
													type="date" dateStyle="default" /></td>
											<td><c:out value="${out.com.comName}" /></td>
											</tr>
											<c:set var="sum" value=""></c:set>
										</c:forEach>
									</tbody>
								</table>
								<table width="100%" style="margin-top: 5px;font-size: 12px;">
									<tr>
										<td width="10%">经办人：</td>
										<td width="15%"  style="border-bottom: 1px #000 solid;">${od.user.uTruename}</td>
										<td width="5%"></td>
										<td width="10%">审核人：</td>
										<td width="15%" style="border-bottom: 1px #000 solid;"></td>
										<td width="10%"></td>
										<td width="10%"></td>
										<td width="10%"></td>
										<td width="10%"></td>
										<td width="10%"></td>
										<td width="10%"></td>
									</tr>
								</table>
        
      </div>
      <!-- /.col -->
    </div>
    <!-- /.row -->

    <div class="row">
      <!-- accepted payments column -->
      <!-- /.col -->
      <!-- /.col -->
    </div>
    <!-- /.row -->
  </section>
  <!-- /.content -->
</div>
<!-- ./wrapper -->



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

		
	</script>
</body>
</html>
