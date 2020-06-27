<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Home</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="/resource/vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="/resource/vendors/base/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- plugin css for this page -->
  <link rel="stylesheet" href="/resource/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="/resource/css/style.css">
  <!-- 引入bootstrap样式 -->
	
<script type="text/javascript" src="/resource/js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="/resource/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  $(function(){
	  $(".nav-link").click(function(){
		  var url= $(this).attr("data-target");
		  var title=$(this).text();
		  $("#title").text(title);
		  $("#work").load(url);
	  });
	 
  })
  
  </script>
</head>
<body>
  <div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
            <div class="navbar-brand-wrapper d-flex justify-content-center">
        <div class="navbar-brand-inner-wrapper d-flex justify-content-between align-items-center w-100">  
          <a class="navbar-brand brand-logo" href="/admin"><img src="/resource/images/hg03.jpg" alt="logo"/>HG</a>
         
         
        </div>  
      </div>
      <!-- 头像框，设置，登出 -->
      <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
        <c:if test="${admin!=null}">
        	<ul class="navbar-nav navbar-nav-right">
	          <li class="nav-item nav-profile dropdown">
	            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown">
	              <img src="/resource/images/faces/face16.jpg" alt="profile"/>
	              <span class="nav-profile-name">${admin}</span>
	            </a>
	            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
	              <a class="dropdown-item">
	                <i class="mdi mdi-settings text-primary"></i>
	                设置
	              </a>
	              <a href="/logout" class="dropdown-item">
	                <i class="mdi mdi-logout text-primary"></i>
	                登出
	              </a>
	            </div>
	          </li>
	        </ul>
	        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
	          <span class="mdi mdi-menu"></span>
	        </button>
        </c:if>
        <c:if test="${admin==null}">
        	<button onclick="location='/user/toLogin'" type="button" class="btn btn-outline-secondary btn-md">Login</button>
        </c:if>
      </div>
    </nav>
    
    <!-- 侧边框 显示管理模块 -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:partials/_sidebar.html -->
      <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav">
          <li class="nav-item">
            <a class="nav-link" href="#" data-target="/brand/list" >
              <i class="mdi mdi-home menu-icon"></i>
              <span class="menu-title">品牌管理</span>
            </a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link"  href="#" data-target="/spec/list">
              <i class="mdi mdi-circle-outline menu-icon"></i>
              <span class="menu-title">规格管理</span>
            </a>
            
          </li>
          <li class="nav-item">
            <a class="nav-link"  href="#" data-target="/category/list">
              <i class="mdi  mdi-apps menu-icon"></i>
              <span class="menu-title">分类管理</span>
            </a>
            
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#" data-target="/spu/list">
              <i class="mdi mdi-view-headline menu-icon"></i>
              <span class="menu-title">商品管理</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#" data-target="/sku/list">
              <i class="mdi mdi-chart-pie menu-icon"></i>
              <span class="menu-title">库存管理</span>
            </a>
          </li>
         </ul>
      </nav>
      
      <!-- 中间显示 -->
      <!-- partial -->
      <div  class="main-panel">
        <div class="content-wrapper">
          <!-- 页面标题 -->
          <div class="row">
            <div class="col-md-12 grid-margin">
              <div class="d-flex justify-content-between flex-wrap">
                <div class="d-flex align-items-end flex-wrap">
                  <div class="mr-md-3 mr-xl-5">
                    <h2 style="padding-left: 20px" id="title">Welcome HG</h2>
                  </div>
                </div>
              </div>
            </div>
          </div>
         
           <div  id="work" class="row">
           
           </div>
          
           
          
       </div>
        
        <!-- 结束 -->
        <footer class="footer">
          <div class="d-sm-flex justify-content-center justify-content-sm-between">
            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright &copy; 2020 - 光辉制作 </span>
            <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center"></span>
          </div>
        </footer>
        
        <!-- partial -->
      </div>
      <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
</div>
<!-- endinject -->
  <!-- 头像设置登出的js-->
  <script src="/resource/vendors/chart.js/Chart.min.js"></script>
  <script src="/resource/vendors/datatables.net/jquery.dataTables.js"></script>
  <script src="/resource/vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
  <!-- End plugin js for this page-->
  <!-- 侧边栏隐藏js -->
  <script src="/resource/js/off-canvas.js"></script>
  <script src="/resource/js/hoverable-collapse.js"></script>
  <script src="/resource/js/template.js"></script>
  <!-- endinject -->
  <!-- 表格点击排序 -->
  <script src="/resource/js/dashboard.js"></script>
  <script src="/resource/js/data-table.js"></script>
  <script src="/resource/js/jquery.dataTables.js"></script>
  <script src="/resource/js/dataTables.bootstrap4.js"></script>
  <!-- End custom js for this page-->
</body>

</html>

