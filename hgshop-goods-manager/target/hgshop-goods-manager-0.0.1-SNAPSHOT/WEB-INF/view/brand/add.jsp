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
  <title>品牌管理</title>
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
  

  function add(){
	  var formData=new FormData($("form")[0]);
	  $.ajax({
		  data:formData,
		  url:"/brand/add",
		  processData:false,
		  contentType:false,
		  type:"post",
		  success:function(re){
			  if(re){
				  alert("添加成功");
				  $("#work").load("/brand/list");
			  }else{
				  alert("添加失败");
			  }
		  }
		  
	  })
  }
  
  </script>
</head>
<body>
         
          <!-- 工作区 -->
          <div style="margin-left: 15px" class="card-body">
                  <h4 class="card-title">品牌添加</h4>
                  <form class="forms-sample">
                    <div class="form-group">
                      <label for="exampleInputName1">品牌名称</label>
                      <input type="text" class="form-control" name="name" id="exampleInputName1" >
                    </div>
                    <div class="form-group">
                      <label for="exampleInputEmail3">品牌首字母</label>
                      <input type="text" class="form-control" name="firstChar"  id="exampleInputEmail3" >
                    </div>
                  </form>
                   <button type="button" onclick="add()" style="width: 1200px" class="btn btn-outline-success btn-fw">确认添加</button>
                </div>
 
</body>

</html>

