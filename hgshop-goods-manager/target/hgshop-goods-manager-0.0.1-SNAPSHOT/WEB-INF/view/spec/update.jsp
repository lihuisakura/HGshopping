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
  var num=${spec.optionList.size()};
  function add(){
	  var str="<div class='row'>"+
      "<div class='col-md-6'>"+
      "<div class='form-group row'>"+
        "<label class='col-sm-3 col-form-label'>规格属性</label>"+
        "<div class='col-sm-9'>"+
          "<input type='text' name='optionList["+num+"].optionName' value='${o.optionName}' class='form-control'>"+
          "<input type='hidden' name='optionList["+num+"].specId' value='${spec.id}' class='form-control'>"+
        "</div>"+
      "</div>"+
    "</div>"+
    "<div class='col-md-6'>"+
      "<div class='form-group row'>"+
        "<label class='col-sm-3 col-form-label'>排序</label>"+
       " <div class='col-sm-6'>"+
         " <input type='number' name='optionList["+num+"].orders' value='${o.orders}' class='form-control'>"+
          
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
  function update(){
	  var formData=new FormData($("form")[0]);
	  $.ajax({
		  data:formData,
		  url:"/spec/update",
		  processData:false,
		  contentType:false,
		  type:"post",
		  success:function(re){
			  if(re){
				  alert("修改成功");
				  $("#work").load("/spec/list");
			  }else{
				  alert("修改失败");
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
                  <h4 class="card-title">规格修改</h4>
<form class="form-sample">
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">规格名称</label>
                          <div class="col-sm-9">
                            <input type="text" name="specName" value="${spec.specName}" class="form-control">
                            <input type="hidden" name="id" value="${spec.id}" class="form-control">
                          </div>
                        </div>
                      </div>
                    </div>
                  <c:forEach items="${spec.optionList}" var="o" varStatus="status">
	                  	 <div class="row">
	                      <div class="col-md-6">
	                        <div class="form-group row">
	                          <label class="col-sm-3 col-form-label">规格属性</label>
	                          <div class="col-sm-9">
	                            <input type="text" name="optionList[${status.index}].optionName" value="${o.optionName}" class="form-control">
	                            <input type="hidden" name="optionList[${status.index}].specId" value="${o.specId}" class="form-control">
	                          </div>
	                        </div>
	                      </div>
	                      <div class="col-md-6">
	                        <div class="form-group row">
	                          <label class="col-sm-3 col-form-label">排序</label>
	                          <div class="col-sm-6">
	                            <input type="number" name="optionList[${status.index}].orders" value="${o.orders}" class="form-control">
	                            
	                          </div>
	                          <div class="col-sm-3">
	                          <button type="button" onclick="remove($(this))" class="btn btn-outline-danger btn-fw">删除属性</button>
	                          </div>
	                        </div>
	                    </div> 
	                   </div>
	                   
                  
                  </c:forEach>
                   
		       	</form>
		       </div>
            </div>
            <button type="button" onclick="add()" style="margin-left: 30px" class="btn btn-outline-info btn-fw">新增属性</button>
            <button type="button" onclick="update()" style="margin-left: 50px" class="btn btn-outline-info btn-fw">确认修改</button>
       
  
 
</body>

</html>

