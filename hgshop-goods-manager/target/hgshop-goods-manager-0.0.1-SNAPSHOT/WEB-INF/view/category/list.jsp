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
  <title>分类管理</title>
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
	  function initTree() {
			//发送ajax获取树需要的数据
//			alert($.ajaxSettings.async=true)
			$.post("/category/treeData", {},
					function(treeData) {
						//初始化添加的时候分类的树
						$("#catTree").treeview({
							data : treeData,
							levels : 2,
							onNodeSelected : function(event, node) {
								//用于添加
								$("#parentId").val(node.id);
								$("#parentName").val(node.text);
								$("#parentPath").val(node.path);
								$("#childName").val("")
								
								//显示当前 用于删除或修改
								$("#currentId").val(node.id);
								$("#currentName").val(node.text);
								$("#currentPath").val(node.path);
								$("#btnDel").prop("disabled",node.nodes.length!=0)
								
								/*
								if (node.nodes.length==0) {
									alert("末级")
									$("#add_spu_categmoory").val(node.text);
									$("#add_spu_category_id").val(node.id);
									$("#addCategoryTree").hide();
								}else 
								{
									$("#parentId").val(node.id);
									$("#parentName").val(node.text);
									$("#name").val("")
									
									// 给预备修改的地方赋值
									$("#currentId").val(node.id);
									$("#currentName").val(node.text);
									$("#currentChildLenth").val(node.nodes.length)
									
								}
								*/
								
							}
						});

					}, "json");
		}

		initTree();
  })
 function add(){
	  var parentId=$("#parentId").val();
	  var name=$("#childName").val();
	  var path=$("#parentPath").val()+"/"+$("#childName").val();
	  $.post("/category/add",{parentId:parentId,name:name,path:path},function(re){
		  if(re){
			  alert("添加成功");
			  $("#work").load("/category/list");
		  }else{
			  alert("添加失败");
		  }
	  });
	  
  }
 function update(){
	  var id=$("#currentId").val();
	  var name=$("#currentName").val();
	  var path=$("#currentPath").val();
	  $.post("/category/update",{id:id,name:name,path:path},function(re){
		  if(re){
			  alert("修改成功");
			  $("#work").load("/category/list");
		  }else{
			  alert("修改失败");
		  }
	  });
	  
  }
 function del(){
	 var parentId=$("#currentId").val();
	 $.post("/category/delete",{id:parentId},function(re){
		  if(re){
			  alert("删除成功");
			  $("#work").load("/category/list");
		  }else{
			  alert("删除失败");
		  }
	  });
 }
  </script>
</head>
<body>
         
 <!-- 工作区 -->
   <div class="col-md-12 stretch-card">
   
     <div class="col-md-4">
     		<div class="card-body">
     			<h4 class="card-title">商品分类</h4>
				<div id="catTree"></div>
			</div>
	</div>
		<div class="col-md-8">
		
				<div class="card-body">
                  <h4 class="card-title">添加分类节点</h4>
                  <form id="addForm" class="forms-sample">
                    <div class="form-group row">
                      <label for="exampleInputUsername2" class="col-sm-3 col-form-label">父节点名</label>
                      <div class="col-sm-9">
                        <input type="text" disabled="disabled" id="parentName" class="form-control" id="exampleInputUsername2">
                        <input type="hidden" disabled="disabled" id="parentId" class="form-control" >
                        
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="exampleInputEmail2" class="col-sm-3 col-form-label">上级path</label>
                      <div class="col-sm-9">
                        <input type="text"  id="parentPath" disabled="disabled" class="form-control" id="exampleInputEmail2" >
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="exampleInputMobile" class="col-sm-3 col-form-label">结点名称</label>
                      <div class="col-sm-9">
                        <input type="text"  id="childName" value="" class="form-control" id="exampleInputMobile">
                      </div>
                    </div>
                    <button onclick="add()" type="button" class="btn btn-outline-primary btn-fw">添加</button>
                  </form>
                </div>
				<div class="card-body">
                  <h4 class="card-title">修改/删除分类节点</h4>
                  <form id="addForm" class="forms-sample">
                    <div class="form-group row">
                      <label for="exampleInputUsername2" class="col-sm-3 col-form-label">当前点名</label>
                      <div class="col-sm-9">
                      <input type="hidden" disabled="disabled" id="currentId" class="form-control" >
                        <input type="text"  id="currentName" class="form-control" id="exampleInputUsername2">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="exampleInputEmail2" class="col-sm-3 col-form-label">当前path</label>
                      <div class="col-sm-9">
                        <input type="text"  id="currentPath"  class="form-control" id="exampleInputEmail2" >
                      </div>
                    </div>
                   <button onclick="update()" type="button" class="btn btn-outline-primary btn-fw">修改</button>
                   <button onclick="del()" id="btnDel" disabled="disabled" type="button" class="btn btn-outline-primary btn-fw">删除</button>
                  </form>
                </div>
			
		</div>
     
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

