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
  <title>规格管理</title>
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
  
	function remove(obj){
	  obj.parent().parent().parent().parent().remove();
  }
  var num=0;
  function addOption(){
	  var str="<div class='row'>"+
      "<div class='col-md-6'>"+
      "<div class='form-group row'>"+
        "<label class='col-sm-3 col-form-label'>规格属性</label>"+
        "<div class='col-sm-9'>"+
          "<input type='text' name='optionList["+num+"].optionName'  class='form-control'>"+
        "</div>"+
      "</div>"+
    "</div>"+
    "<div class='col-md-6'>"+
      "<div class='form-group row'>"+
        "<label class='col-sm-3 col-form-label'>排序</label>"+
       " <div class='col-sm-6'>"+
         " <input type='number' name='optionList["+num+"].orders'  class='form-control'>"+
          
       " </div>"+
       " <div class='col-sm-3'>"+
       " <button type='button' onclick='remove($(this))' class='btn btn-outline-danger btn-fw'>删除属性</button>"+
      "  </div>"+
      "</div>"+
 " </div> "+
 "</div>";
 	$("form").append(str);
 	num+=1;
  }
  function add(){
	  var formData=new FormData($("form")[0]);
	  $.ajax({
		  data:formData,
		  url:"/spec/add",
		  processData:false,
		  contentType:false,
		  type:"post",
		  success:function(re){
			  if(re){
				  alert("添加成功");
				  $("#work").load("/spec/list");
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
            <div class="col-md-12 stretch-card">
              <div class="card-body">
                  <h4 class="card-title">添加规格</h4>
<form class="form-sample">
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">规格名称</label>
                          <div class="col-sm-9">
                            <input type="text" name="specName"  class="form-control">
                          </div>
                        </div>
                      </div>
                    </div>
                  
		       	</form>
		       </div>
            </div>
            <button type="button" onclick="addOption()" style="margin-left: 30px" class="btn btn-outline-info btn-fw">新增属性</button>
            <button type="button" onclick="add()" style="margin-left: 50px" class="btn btn-outline-info btn-fw">确认添加</button>
       
  
 
</body>

</html>

