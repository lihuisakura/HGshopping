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

<script type="text/javascript" src="/resource/js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="/resource/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  $(function(){
	  $("#check").change(function(){
		  $("[name=check]").each(function(i,val){
			  $(this).prop("checked",$("#check").prop("checked"));
		  });
	  });
  })
  function goPage(page){
	  $("#work").load("/sku/list?pageNum="+page+"&title="+$("[name=title]").val());
  }
  function update(id){
	  $("#work").load("/sku/toUpt?id="+id);
  }
  function show(id){
	  $("#work").load("/sku/toShow?id="+id);
  }
  function deleteOne(id){
	  var ids=new Array();
		ids.push(id);
		 
		 if(confirm("确认删除？")){
			 $.post("/sku/delete",{ids:ids},function(re){
				 if(re){
					  alert("删除成功");
					  $("#work").load("/sku/list");
				  }else{
					  alert("删除失败");
				  }
			 })
		 }
  }
 
  function deleteAll(){
	  var id=new Array();
	  $("[name=check]:checked").each(function(i,val){
		  id.push($(this).val());
	  });
	  if(id.length<=0){
		  alert("请选择数据后再删除");
		  return;
	  }
	 if(confirm("确认删除？")){
		 $.post("/sku/delete",{ids:id},function(re){
			 if(re){
				  alert("删除成功");
				  $("#work").load("/sku/list");
			  }else{
				  alert("删除失败");
			  }
		 })
	 }
  }
  </script>
</head>
<body>

          <!-- 工作区 -->
         
            <div class="col-md-12 stretch-card">
              <div class="card">
               <!-- 搜索框 -->
	               <div class="input-group">
		              <div class="input-group-prepend">
		                <span class="input-group-text" id="search">
		                  <i class="mdi mdi-magnify"></i>
		                </span>
		              </div>
		              <input type="text" name="title" value="${con.title}" class="form-control" placeholder="请输入搜索内容" >
		              <button type="button" onclick="goPage(1)" style="width:100px;font-weight: 600;" class="btn btn-inverse-danger btn-fw">搜索</button>
		              
		            </div>
	             <!-- 结束搜索框 -->
	             <div class="card-body">
                  <h4 class="card-title">库存浏览</h4>
                 
                  <div class="table-responsive pt-3">
                    <table  class="table table-striped">
                      <thead>
                        <tr align="center">
                            <th><input type="checkbox" id="check"></th>
                            <th>图片</th>
                            <th>商品名称</th>
                            <th>标题</th>
                            <th>卖点</th>
                            <th>价格</th>
                            <th>库存</th>
                            <th style="width: 150px">操作</th>
                        </tr>
                      </thead>
                      <c:forEach items="${info.list}" var="b" varStatus="status">
                      	<tr align="center">
                            <th><input type="checkbox" name="check" value="${b.id}"></th>
                           <td>
                            	<img style="border-radius: 0;width: 100px;height: 100px"  alt="商品图片" src="/pic/${b.image}">
                            </td>
                            <td>${b.spu.goodsName}</td>
                            <td>${b.title}</td>
                            <td>${b.sellPoint}</td>
                            <td>${b.price}</td>
                            <td>${b.stockCount}</td>
                            <td>
                            	<button type="button" onclick="show(${b.id})" class="btn btn-outline-danger btn-fw">详情</button>
                            	<button type="button" onclick="update(${b.id})" class="btn btn-outline-danger btn-fw">修改</button>
                            	<button type="button" onclick="deleteOne(${b.id})" class="btn btn-outline-danger btn-fw">删除</button>
                            	
                            </td>
                        </tr>
                      </c:forEach>
                    </table>
                  </div>
                  <nav style="margin-top: 20px;" aria-label="Page navigation example">
					  <ul class="pagination">
					    <li class="page-item">
					      <a class="page-link" href="javascript:goPage(${n==0?'1':info.prePage})" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
					     <c:forEach items="${info.navigatepageNums}" var="n">
					    	 <li class="page-item"><a class="page-link" href="javascript:goPage(${n})">${n}</a></li>
					    </c:forEach> 
					   
					    
					    <li class="page-item">
					      <a class="page-link" href="javascript:goPage(${n==0?info.pages:info.nextPage})" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
					  </ul>
					</nav>
					
					<button type="button"   onclick="deleteAll()" class="btn btn-inverse-danger btn-fw">批量删除</button>
                </div>
               
              </div>
            </div>
  

  <!-- 头像设置登出的js-->
  <script src="/resource/vendors/chart.js/Chart.min.js"></script>
  <script src="/resource/vendors/datatables.net/jquery.dataTables.js"></script>
  <script src="/resource/vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
  <!-- End plugin js for this page-->
</body>

</html>

