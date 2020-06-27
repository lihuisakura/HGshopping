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
 
  
  function update(){
	  var formData=new FormData($("form")[0]);
	  $.ajax({
		  data:formData,
		  url:"/sku/update",
		  processData:false,
		  contentType:false,
		  type:"post",
		  success:function(re){
			  if(re){
				  alert("修改成功");
				  $("#work").load("/sku/list");
			  }else{
				  alert("修改失败");
			  }
		  }
		  
	  })
  }
 function addOption(){
	 $("#div").append($("#spec").html());
 }
 

//用于处理回显 这里存放已经被选中规格属性的数值
	var optionIds=new Array();
	<c:forEach items="${sku.specOptions}" var="op"> 
		optionIds.push(${op.id})
	</c:forEach>
 
		$("[name=specId]").each(function(){
			specc(this);
		})
		
 function specc(obj){
	 var sid= $(obj).val();
	 $.post("/spec/findSpecOptionList",{id:sid},function(re){
		 var option= $(obj).parent().parent().next().children().children()[1];
		 $(option).empty();
		 for ( var i in re) {
			 if(optionIds.indexOf(re[i].id)>-1){
				 $(option).append("<option selected=selected value='"+re[i].id+"'>"+re[i].optionName+"</option>");
			 }else{
				 $(option).append("<option value='"+re[i].id+"'>"+re[i].optionName+"</option>");
			 }
			
		}
	 })
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
                  <h4 class="card-title">修改库存</h4>
                  <form class="forms-sample">
                    <div class="form-group">
                      <label >商品名称</label>
                      <input type="text"  value="${sku.spu.goodsName}" disabled="disabled" class="form-control"  >
                      <input type="hidden" name="id" value="${sku.id}"  class="form-control"  >
                    </div>
                    <div class="form-group">
                      <label >标题</label>
                      <input type="text"  name="title" value="${sku.title }"  class="form-control"  >
                    </div>
                    <div class="form-group">
                      <label >卖点</label>
                      <input type="text"  name="sellPoint" value="${sku.sellPoint }"  class="form-control"  >
                    </div>
                    <div class="form-group">
                      <label >库存数量</label>
                      <input type="text"  name="stockCount" value="${sku.stockCount }"  class="form-control"  >
                    </div>
                    <div class="form-group">
                      <label >在售价格</label>
                      <input type="text"  name="price" value="${sku.price }"  class="form-control"  >
                    </div>
                    <div class="form-group">
                      <label >成本价格</label>
                      <input type="text"  name="costPrice"  value="${sku.costPrice }" class="form-control"  >
                    </div>
                    <div class="form-group">
                      <label >市场价格</label>
                      <input type="text"  name="marketPrice"  value="${sku.marketPrice }" class="form-control"  >
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
                  <div id="div" >
                  <c:forEach items="${sku.specOptions}" var="op">
                  <div class="row" >
                  <div class="col-md-5">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">规格</label>
                         
                            <select name="specId" onchange="spec(this)" class="form-control">
                              <c:forEach items="${spec.list}" var="spec">
                              
                              	<option <c:if test="${op.specId==spec.id }">selected="selected"</c:if>  value="${spec.id}">${spec.specName}</option>
                            
                              
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
                  </c:forEach>
                  </div>
                  </form>
                </div>
            </div>
            <button type="button" onclick="addOption()" style="margin-left: 30px" class="btn btn-outline-danger btn-fw">新增属性</button>
            <button type="button" onclick="update()" style="margin-left: 50px" class="btn btn-outline-danger btn-fw">确认修改</button>
       
  
 
</body>

</html>

