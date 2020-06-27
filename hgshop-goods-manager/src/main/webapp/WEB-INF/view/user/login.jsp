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
  <title>Login</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="/resource/vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="/resource/vendors/base/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="/resource/css/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="/resource/images/favicon.png" />

<script type="text/javascript" src="/resource/js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="/resource/js/bootstrap.min.js"></script>
<script type="text/javascript">
function login(){
	var username=$("[name=username]").val();
	var password=$("[name=password]").val();
	if(null==username || username==""){
		alert("请输入用户名");
		return ;
	}
	if(null==password || password==""){
		alert("请输入密码");
		return ;
	}
	$.post("/login",{username:username,password:password},function(re){
		if(re){
			alert("登录成功！");
			location="/admin";
		}else{
			alert("登录失败!");
		}
	})
}

</script>
</head>

<body>
  <div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="content-wrapper d-flex align-items-center auth px-0">
        <div class="row w-100 mx-0">
          <div class="col-lg-4 mx-auto">
            <div class="auth-form-light text-left py-5 px-4 px-sm-5">
              <div  class="brand-logo">
                <img src="/resource/images/hg01.jpg" alt="logo">
              </div>
              
              	<h4 style="padding-left:30px">欢迎进入  HG</h4>
              
              <form class="pt-3">
                <div class="form-group">
                  <input type="text" name="username" class="form-control form-control-lg" id="exampleInputEmail1" placeholder="用户名">
                </div>
                <div class="form-group">
                  <input type="password" name="password" class="form-control form-control-lg" id="exampleInputPassword1" placeholder="密码">
                </div>
                <div class="mt-3">
                  <a class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" onclick="login()" href="#">登录</a>
                </div>
                <div class="my-2 d-flex justify-content-between align-items-center">
                  <div class="form-check">
                    <label class="form-check-label text-muted">
                      <input type="checkbox" class="form-check-input">
                      	保持登录状态
                    </label>
                  </div>
                  <a href="#" class="auth-link text-black">忘记密码?</a>
                </div>
                
                 <div class="text-center mt-4 font-weight-light">
                  	还没有账号? <a href="#" class="text-primary">创建</a>
                </div> 
              </form>
            </div>
          </div>
        </div>
      </div>
      <!-- content-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->
  <!-- plugins:js -->
  <script src="/resource/vendors/base/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- inject:js -->
  <script src="/resource/js/off-canvas.js"></script>
  <script src="/resource/js/hoverable-collapse.js"></script>
  <script src="/resource/js/template.js"></script>
  <!-- endinject -->
</body>

</html>