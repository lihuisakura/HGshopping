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
  $(function(){
	  $("#check").change(function(){
		  $("[name=check]").each(function(i,val){
			  $(this).prop("checked",$("#check").prop("checked"));
		  });
	  });
  })
  function goPage(page){
	  $("#work").load("/spec/list?pageNum="+page+"&name="+$("[name=name]").val());
  }
  
  function update(id){
	  $("#work").load("/spec/toUpdate?id="+id);
  }
  function add(){
	  $("#work").load("/spec/toAdd");
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
		 $.post("/spec/delete",{ids:id},function(re){
			 if(re){
				  alert("删除成功");
				  $("#work").load("/spec/list");
			  }else{
				  alert("删除失败");
			  }
		 })
	 }
	 
	  
  }
  function deleteOne(id){
	 var ids=new Array();
	ids.push(id);
	 
	 if(confirm("确认删除？")){
		 $.post("/spec/delete",{ids:ids},function(re){
			 if(re){
				  alert("删除成功");
				  $("#work").load("/spec/list");
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
	              <input type="text" name="name" value="${name}" class="form-control" placeholder="请输入搜索内容" >
	              <button type="button" onclick="goPage(1)" style="width:100px;font-weight: 600;" class="btn btn-inverse-info btn-fw">搜索</button>
	              
	            </div>
	             <!-- 结束搜索框 -->
                <div class="card-body">
                  <p class="card-title">规格浏览</p>
                  <div class="table-responsive">
                    <table id="recent-purchases-listing" class="table">
                      <thead>
                        <tr>
                            <th><input type="checkbox" id="check"></th>
                            <th>规格编号</th>
                            <th>规格名称</th>
                            <th>规格数值</th>
                            <th>操作</th>
                        </tr>
                      </thead>
                      <c:forEach items="${info.list}" var="s" varStatus="status">
                      	<tr>
                            <td><input type="checkbox" name="check" value="${s.id}"></td>
                            <td>${status.index+1}</td>
                            <td>${s.specName}</td>
                            <td>
                            	<c:forEach items="${s.optionList}" var="o">
                            		[&nbsp;${o.optionName}&nbsp;]&nbsp;&nbsp;&nbsp;&nbsp;
                            	</c:forEach>
                            </td>
                            <td>
                            	
                            	<button type="button" onclick="update(${s.id})" class="btn btn-outline-info btn-fw">修改</button>
                            	<button type="button" onclick="deleteOne(${s.id})" class="btn btn-outline-info btn-fw">删除</button>
                            </td>
                        </tr>
                      </c:forEach>
                    </table>
                    
                  </div>
                  <nav style="margin-top: 10px" aria-label="Page navigation example" >
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
                  <button type="button"  onclick="deleteAll()" class="btn btn-inverse-info btn-fw">批量删除</button>
       				<button type="button" style="margin-left: 20px" onclick="add()" class="btn btn-inverse-info btn-fw">添加规格</button>
                </div>
                
              </div>
              
            </div>
       
   <!-- plugins:js -->
  <script src="/resource/vendors/base/vendor.bundle.base.js"></script>
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

