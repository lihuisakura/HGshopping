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
						   
							<input type="text" class="form-control" id="categoryName" value="${spu.category.name }" disabled="disabled" >
								
                    	
                    </div>
                    <div class="form-group">
                      <label>商品状态</label>
                       <input type="text"  class="form-control" value=" ${spu.isMarketable==1?'上架':'下架' }" name="isMarketable"  >
                     
                      
                      
                    </div>
                  
                    <div class="form-group">
                      <label for="exampleSelectGender">商品品牌</label>
                      <input type="text"  class="form-control"  value=" ${spu.brand.name}" name="isMarketable"  >
                    </div>
                    <div class="form-group">
                      <label for="exampleInputPassword4">商品介绍</label>
                      <input type="text" value="${spu.caption}" name="caption" class="form-control" id="exampleInputPassword4" >
                    </div>
                    
                     
                    <div class="form-group">
                      <label >商品图片</label>
                    	<figure class="figure">
						  <img src="/pic/${spu.smallPic }" width="400px" height="300px" class="figure-img img-fluid rounded" alt="...">
						  <figcaption class="figure-caption"></figcaption>
						</figure>
                    	
                    </div>
                    
                  </form>
                </div>
            </div>
            
       
  
 
</body>

</html>

