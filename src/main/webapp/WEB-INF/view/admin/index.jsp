<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.springframework.web.servlet.tags.Param"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Thống kê</title>

<!-- Custom fonts for this template-->
<jsp:include page="./common/link-css.jsp" />

<style>
	.chart{
		max-height: 100%;
	}

	.doughnut-chart{
		max-height: 100%;
		margin: auto;
	}
</style>

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<jsp:include page="./common/sidebar.jsp" />
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<jsp:include page="./common/topbar.jsp" />
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">
					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 text-gray-800">Thống kê</h1>
						<div style="display: flex;">
							<!-- <a href="#"
								class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
								class="fas fa-download fa-sm text-white-50"></i> Generate Report</a> -->
							<div>
								<form:form action="${pageContext.request.contextPath}/admin"
									method="GET"
									style="display: flex; margin-left: 20px; align-items: center;">
									<select class="form-control form-control-sm" id="dateRange"
										name="dateType">
										<option value="today" ${dateType == "today" ? "selected": ""}>Hôm
											nay</option>
										<option value="yesterday"
											${dateType == "yesterday" ? "selected": ""}>Hôm qua</option>
										<option value="one_week_ago"
											${dateType == "one_week_ago" ? "selected": ""}>7
											ngày qua</option>
										<option value="one_month_ago"
											${dateType == "one_month_ago" ? "selected": ""}>1
											tháng qua</option>
										<option value="one_year_ago"
											${dateType == "one_year_ago" ? "selected": ""}>1 năm
											qua</option>
										<option value="custom"
											${dateType == "custom" ? "selected": ""}>Tùy chỉnh</option>
									</select>
									<div style="display: flex; align-items: center;"
										id="dateCustom">
										<label style="margin-bottom: 0; margin-left: 10px">Từ</label>
										<input type="date" class="form-control form-control-sm"
											style="margin-left: 10px" name="from"
											data-format="yyyy-MM-dd"
											value="<fmt:formatDate value='${from}' pattern='yyyy-MM-dd' />" />
										<label style="margin-bottom: 0; margin-left: 10px">Tới</label>
										<input type="date" class="form-control form-control-sm"
											style="margin-left: 10px" name="to" data-format="yyyy-MM-dd"
											value="<fmt:formatDate value='${to}' pattern='yyyy-MM-dd' />" />
									</div>
									<input type="submit" value="Thống kê" class="btn btn-primary"
										style="margin-left: 10px" />
								</form:form>
							</div>

						</div>
					</div>

					<!-- Content Row -->
					<div class="row">

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-primary shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-primary text-uppercase mb-1">
												Doanh thu</div>
											<div
												class="h5 mb-0 font-weight-bold text-gray-800 money-format">${tongDoanhThu}</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-calendar fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-success shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-success text-uppercase mb-1">
												Lợi nhuận</div>
											<div
												class="h5 mb-0 font-weight-bold text-gray-800 money-format">${tongLoiNhuan}</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-info shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-info text-uppercase mb-1">Số
												đơn hàng</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">${tongSoDonHang}</div>
											<!-- <div class="row no-gutters align-items-center">
												<div class="col-auto">
													<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
												</div>
												<div class="col">
													<div class="progress progress-sm mr-2">
														<div class="progress-bar bg-info" role="progressbar"
															style="width: 50%" aria-valuenow="50" aria-valuemin="0"
															aria-valuemax="100"></div>
													</div>
												</div>
											</div> -->
										</div>
										<div class="col-auto">
											<i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Pending Requests Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-warning shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-warning text-uppercase mb-1">
												Số thiệp bán</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">${tongSoThiepBan}</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-comments fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- Content Row -->

					<div class="row">

						<!-- Area Chart -->
						<div class="col-xl-8 col-lg-7">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">Doanh thu và
										lợi nhuận</h6>
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<div class="chart-area">
										<%-- <canvas id="myAreaChart"></canvas> --%>
										<canvas class="chart" id="chartDoanhThuVaLoiNhuan"></canvas>
									</div>
								</div>
							</div>
						</div>

						<!-- Pie Chart -->
						<div class="col-xl-4 col-lg-5">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">Danh mục
										thiệp bán ra</h6>
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<div class="chart-pie pt-4 pb-2">
										<canvas class="chart doughnut-chart" id="chartDanhMucThiepBanRa"></canvas>
									</div>
									
								</div>
							</div>
						</div>
					</div>

					<div class="row">

						<!-- Area Chart -->
						<div class="col-xl-8 col-lg-7">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">Số đơn hàng</h6>
									
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<div class="chart-area">
										<canvas class="chart" id="chartSoDonHang"></canvas>
									</div>
								</div>
							</div>
						</div>

						<!-- Pie Chart -->
						<div class="col-xl-4 col-lg-5">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">Thiệp bán ra</h6>
									
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<div class="chart-pie pt-4 pb-2">
										<canvas class="chart doughnut-chart" id="chartSoSanPhamBanRa"></canvas>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<jsp:include page="./common/footer.jsp" />
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>

	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<jsp:include page="./common/logout-model.jsp" />

	<!-- Bootstrap core JavaScript-->
	<jsp:include page="./common/link-js.jsp" />

	<script>
		$(document).ready(function() {
			checkDateType();
			chartDoanhThuVaLoiNhuan();
			chartDanhMucThiepBanRa();
			chartSoDonHang();
			chartSoSanPhamBanRa();
			
			$("#dateRange").change(checkDateType);
			
			function checkDateType(){
				var dateRange = $("#dateRange").val();
				if(dateRange == "custom"){
					$("#dateCustom > input").prop('disabled', false);
				}else{
					$("#dateCustom > input").prop('disabled', true);
				}
			}
			
			function chartDoanhThuVaLoiNhuan(){
				new Chart(document.getElementById("chartDoanhThuVaLoiNhuan"), {
				  type: 'line',
				  data: {
				    labels: ${doanhThuLoiNhuan.datesToString()},
				    datasets: [{ 
				        data: ${doanhThuLoiNhuan.line1},
				        label: "Lợi nhuận",
				        borderColor: "#8e5ea2",
				        fill: false
				      },
				      { 
				        data: ${doanhThuLoiNhuan.line2},
				        label: "Doanh thu",
				        borderColor: "#3e95cd",
				        fill: false
				      }
				    ]
				  },
				  options: {
				    scales: {
				        x: [{
				            type: "time",
				            time: {
				            	unit: "day",
				            	stepSize: 30
				            }
				        }],
				        y: {
				            min: 0
				        }
				    }
				  }
				});
			}
			
			function chartDanhMucThiepBanRa(){
				
				var colors = Array();
				for(var i=0; i<${soDanhMucBanRa.count.size()}; i++){
					colors.push(dynamicColors());
				}
				
				new Chart(document.getElementById("chartDanhMucThiepBanRa"), {
				  type: 'doughnut',
				  data: {
				    labels: ${soDanhMucBanRa.labelToString()},
				    datasets: [{ 
				        data: ${soDanhMucBanRa.count},
				        backgroundColor: colors
				      }
				    ]
				  },
				  options: {
					  plugins:{   
			             legend: {
			                 display: false
	                     },
	                  }
	               }
				});
			}
			
			function chartSoDonHang(){
				new Chart(document.getElementById("chartSoDonHang"), {
				  type: 'line',
				  data: {
				    labels: ${soDonHang.datesToString()},
				    datasets: [{ 
				        data: ${soDonHang.line1},
				        label: "Số đơn hàng",
				        borderColor: "#3e95cd",
				        fill: false
				      }
				    ]
				  },
				  options: {
				    scales: {
				        x: [{
				            type: "time",
				            time: {
				            	unit: "day",
				            	stepSize: 30
				            }
				        }],
				        y: {
				            min: 0
				        }
				    }
				  }
				});
			}
			
			function chartSoSanPhamBanRa(){
				
				var colors = Array();
				for(var i=0; i<${soSanPhamBanRa.count.size()}; i++){
					colors.push(dynamicColors());
				}
				
				new Chart(document.getElementById("chartSoSanPhamBanRa"), {
				  type: 'doughnut',
				  data: {
				    labels: ${soSanPhamBanRa.labelToString()},
				    datasets: [{ 
				        data: ${soSanPhamBanRa.count},
				        backgroundColor: colors
				      }
				    ]
				  },
				  options: {
					  plugins:{   
			             legend: {
			                 display: false
	                     },
	                  }
	               }
				});
			}
			
		});
	</script>
</body>

</html>