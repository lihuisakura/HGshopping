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
  <title>商品管理</title>
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
  $(function(){
	  var brandid="${spu.brandId}";
	  $.post("/brand/findBrandAll",function(re){
		  for ( var i in re) {
			  if(brandid==re[i].id){
				  $("[name=brandId]").append("<option selected=selected value='"+re[i].id+"'>"+re[i].name+"</option>");
			  }else{
				  $("[name=brandId]").append("<option value='"+re[i].id+"'>"+re[i].name+"</option>");
			  }
		}
	  })
  })
	
  
  function update(){
	  var formData=new FormData($("form")[0]);
	  $.ajax({
		  data:formData,
		  url:"/spu/update",
		  processData:false,
		  contentType:false,
		  type:"post",
		  success:function(re){
			  if(re){
				  alert("修改成功");
				  $("#work").load("/spu/list");
			  }else{
				  alert("修改失败");
			  }
		  }
		  
	  })
  }
  function showCategory(){
	  var cateid=${spu.categoryId};
	  $('#addCategoryTree').show()
			//发送ajax获取树需要的数据
//			alert($.ajaxSettings.async=true)
			$.post("/category/treeData", {},
					function(treeData) {
						//初始化添加的时候分类的树
						$("#addCategoryTree").treeview({
							data : treeData,
							levels : 2,
							onNodeSelected : function(event, node) {
								
								if(node.nodes.length==0){
									$("#categoryId").val(node.id);
									$("#categoryName").val(node.text);
									$("#addCategoryTree").hide();
								}
								
							}
						});

					}, "json");
		

	
  }
  </script>
</head>
<body>
         
          <!-- 工作区 -->
            <div class="col-md-12 stretch-card">
             <div class="card-body">
                  <h4 class="card-title">修改商品</h4>
                  <form class="forms-sample">
                    <div class="form-group">
                      <label for="exampleInputName1">商品名称</label>
                      <input type="text" name="goodsName"  value="${spu.goodsName}" class="form-control" id="exampleInputName1" >
                      <input type="hidden" name="id" value="${spu.id}" class="form-control"  >
                    </div>
                    <div class="form-group">
                      <label for="exampleSelectGender">商品分类</label>
						    <input type="hidden" name="categoryId" id="categoryId">
						    <div>
							    <div class="col-sm-10" style="float: left;">
							    <input type="text" class="form-control" id="categoryName" value="${spu.category.name }" disabled="disabled" >
								</div>
							    <div class="col-sm-2" style="float: left;">
							    	<button type="button" class="btn btn-secondary" onclick="showCategory()">。。。。</button>
							    </div>
						    </div>
						   <div id="addCategoryTree"
								style="display: none; position: absolute;z-index: 1010; background-color: white; width: 96%">
							</div>
                    	
                    </div>
                    <div class="form-group">
                      <label>商品状态</label>
                       <input type="radio" ${spu.isMarketable==1?'checked=checked':'' } name="isMarketable" value="1" style="margin-left: 50px" >上架
                     
                      <input type="radio" ${spu.isMarketable==0?'checked=checked':'' } name="isMarketable" value="0" style="margin-left: 50px" >下架
                      
                    </div>
                  
                    <div class="form-group">
                      <label for="exampleSelectGender">商品品牌</label>
                      <select name="brandId" class="form-control" id="exampleSelectGender">
                          
                        </select>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputPassword4">商品介绍</label>
                      <input type="text" value="${spu.caption}" name="caption" class="form-control" id="exampleInputPassword4" >
                    </div>
                    
                     
                    <div class="form-group">
                      <label >商品图片</label>
                        <input type="file" name="file" class="form-control "  >
                    
                    </div>
                    
                  </form>
                </div>
            </div>
            
            <button type="button" onclick="update()" style="margin-left: 50px" class="btn btn-outline-warning btn-fw">确认修改</button>
       
  
 
</body>

</html>

