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
  <title>sku管理</title>
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
<link href="/resource/bootstrap-treeview/css/bootstrap-treeview.css" rel="stylesheet" >
<link href="/resource/css/bootstrap.css" rel="stylesheet" >
<script type="text/javascript" src="/resource/bootstrap-treeview/js/bootstrap-treeview.js"> </script>
  <script type="text/javascript">
 
  
  function add(){
	  var formData=new FormData($("form")[0]);
	  $.ajax({
		  data:formData,
		  url:"/sku/add",
		  processData:false,
		  contentType:false,
		  type:"post",
		  success:function(re){
			  if(re){
				  alert("添加成功");
				  $("#work").load("/sku/list");
			  }else{
				  alert("添加失败");
			  }
		  }
		  
	  })
  }
 function addOption(){
	 $("#div").append($("#spec").html());
 }
 function spec(obj){
	 var sid= $(obj).val();
	 $.post("/spec/findSpecOptionList",{id:sid},function(re){
		 var option= $(obj).parent().parent().next().children().children()[1];
		 $(option).empty();
		 for ( var i in re) {
			$(option).append("<option value='"+re[i].id+"'>"+re[i].optionName+"</option>");
		}
	 })
 }
 function remove(obj){
	 $(obj).parent().parent().parent().remove();
	 
 }
  </script>
</head>
<body>
         
          <!-- 工作区 -->
            <div class="col-md-12 stretch-card">
             <div class="card-body">
                  <h4 class="card-title">添加库存</h4>
                  <form class="forms-sample">
                    <div class="form-group">
                      <label >商品名称</label>
                      <input type="text"  value="${spu.goodsName}" disabled="disabled" class="form-control"  >
                      <input type="hidden" name="spuId" value="${spu.id}"  class="form-control"  >
                    </div>
                    <div class="form-group">
                      <label >标题</label>
                      <input type="text"  name="title"  class="form-control"  >
                    </div>
                    <div class="form-group">
                      <label >卖点</label>
                      <input type="text"  name="sellPoint"  class="form-control"  >
                    </div>
                    <div class="form-group">
                      <label >库存数量</label>
                      <input type="text"  name="stockCount"  class="form-control"  >
                    </div>
                    <div class="form-group">
                      <label >在售价格</label>
                      <input type="text"  name="price"  class="form-control"  >
                    </div>
                    <div class="form-group">
                      <label >成本价格</label>
                      <input type="text"  name="costPrice"  class="form-control"  >
                    </div>
                    <div class="form-group">
                      <label >市场价格</label>
                      <input type="text"  name="marketPrice"  class="form-control"  >
                    </div>
                    <div class="form-group">
                      <label >大图</label>
                      <input type="file"  name="bigFile"  class="form-control"  >
                    </div>
                    <div class="form-group">
                      <label >小图</label>
                      <input type="file"  name="smFile"  class="form-control"  >
                    </div>
                  <div hidden="true" id="spec">
                  <div class="row" >
                  <div class="col-md-5">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">规格</label>
                         
                            <select name="specId" onchange="spec(this)" class="form-control">
                              <c:forEach items="${spec.list}" var="s">
                              	<option value="${s.id}">${s.specName}</option>
                              </c:forEach>
                            </select>
                         
                        </div>
                      </div>
                   		<div class="col-md-5">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">属性</label>
                          
                            <select  name="optionId" class="form-control">
                              
                            </select>
                         	
                        </div>
                      	</div>
                      	<div class="col-md-2">
                      	<div class="form-group row">
                      		
                      		<button type="button" onclick="remove(this)" style="margin-left: 30px" class="btn btn-outline-danger btn-fw">移除属性</button>
                      	</div>
                      	</div>
                  </div>
                </div>
                  <div id="div" ></div>
                  </form>
                </div>
            </div>
            <button type="button" onclick="addOption()" style="margin-left: 30px" class="btn btn-outline-danger btn-fw">新增属性</button>
            <button type="button" onclick="add()" style="margin-left: 50px" class="btn btn-outline-danger btn-fw">确认添加</button>
       
  
 
</body>

</html>

