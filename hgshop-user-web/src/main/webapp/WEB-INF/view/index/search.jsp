<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HGshopping</title>

<link href="/resource/css/indexlist.css" type="text/css"
	rel="stylesheet">
<script src="/resource/js/jquery-1.11.3.min.js"></script>
<script src="/resource/js/index.js"></script>

<script type="text/javascript" src="/resource/js/jquery-3.2.1.js"></script>

<link href="/resource/bootstrap-treeview/css/bootstrap-treeview.css" rel="stylesheet" >
<link href="/resource/css/bootstrap.css" rel="stylesheet" >
<script type="text/javascript" src="/resource/bootstrap-treeview/js/bootstrap-treeview.js"> </script>

<script type="text/javascript">


function goPage(page){
	location.href="/goods/search?pageNum="+page+"&key="+$("[name=key]").val();
}

</script>
<style type="text/css">
 a {
 	text-decoration: none;
 	color: black;
 }
a:hover {text-decoration: none;}
</style>
</head>
<body id="top">
	<header id="header">
			<div class="header-box">
				
				<ul class="header-right">
					<li class="denglu">
					<c:if test="${user==null}" >
						<a href="/user/">您好，请登录</a> 
						<a href="/user/toRegister"  class="red">免费注册</a>
					</c:if>
					<c:if test="${user!=null}">
						<a href="/user/toIndex">${user.username}</a>
					</c:if>
					</li> 
					<li class="shu"></li>
					<li class="guanzhu bj"><a href="/user/toIndex">我的订单</a></li>
					<li class="shu"></li>
					<li class="guanzhu bj"><a href="/user/toIndex">我的HG</a></li>
					<li class="shu"></li>
					<li class="guanzhu bj"><a href="/user/toIndex">HG会员</a></li>
					<li class="shu"></li>
					<li class="guanzhu bj"><a href="#">企业采购</a></li>
					<li class="shu"></li>
					<li class="guanzhu bj">
						<a href="#">关注HG</a>
					</li>
					<li class="shu"></li>
					<li class="kehu bj">
						<a href="#">客户服务</a>
					</li>
					<li class="shu"></li>
					<li class="daohang">
						<a href="#">网站导航</a>
					</li>
				</ul>
			</div>
		</header>
	<!-----------------------------------------顶部-------------->
	<!-- 顶部广告开始 -->
	<div id="top-banner">
		<div class="top-ba">
			<a href=""><img src="/resource/img/js.jpg"></a>
			<div id="xx">
				<a href="">X</a>
			</div>
		</div>
	</div>
	<!-- 顶部广告结束 -->
	
	
	<div class="w">
		<!-- logo开始 -->
		<div class="logo">
			<a href="/index/list"><img width="200px" height="50px" src="/resource/img/hg02.jpg"></a>
		</div>
		<!-- logo结束 -->
		<!-- 搜索开始 -->
		<div class="search">
			<input type="text" name="key" style="height: 36px" value="${key}" placeholder="家电一折抢" class="text">
			<button onclick="search()" class="button">搜索</button>
		</div>
		<!-- 搜索结束 -->
		
	</div>

	<div class="clear"></div>
	<!--轮播图上方导航栏  一栏-->
	<div id="navv">
		<div class="nav-img"
			style="background: url(/resource/img/568a1258N2edec1ab.jpg) repeat-x"></div>
		<div class="nav-imgs"
			style="background: url(/resource/img/568a0a8eNe8f4df82.jpg) no-repeat center top"></div>
	</div>
	<div class="focus">
		
		<div style="height:530px;width:210px;margin-left:1px;margin-top:7px;margin-left:0px;" >
			
			
			
		</div>
		
		<!-- 中间商品显示 -->
		<div style="clear:both;position:absolute;top:63px;left:60px;width:1800px;" >
			<div class="row"> 
				<div class="col-md-8">
					<div class="row">
						<c:forEach items="${search.content}" var="spu">
							<div class="col-md-3" style="margin-top:30px" >
								<div><img src="/pic/${spu.smallPic}" width="160px" height="160px"> </div>
								<div><a href="/goods/detail?id=${spu.id}">${spu.goodsName}</a></div>
								<div><a href="/goods/detail?id=${spu.id}">${spu.caption}</a></div>
							</div>
						</c:forEach>
					</div>
					
				</div>
			</div>
			
		</div>
		<nav aria-label="Page navigation example" style="margin-top:50px">
		  <ul class="pagination justify-content-center">
		    <li class="page-item ">
		      <a class="page-link" href="#" tabindex="-1"  onclick="goPage(1)">首页</a>
		    </li>
		    <c:forEach begin="1" end="${search.totalPages}" var="page">
		      <li class="page-item"><a class="page-link" href="#" onclick="goPage(${page})">${page}</a></li>
		   </c:forEach>
		    <li class="page-item">
		      <a class="page-link" href="#"   onclick="goPage(${search.totalPages})">尾页</a>
		    </li>
		  </ul>
		</nav>
	 

		
		
			
			<!--*************网页结尾***************-->
			<div class="lazy-fn lazy-fn-done" id="lazy-footer">
				<div id="service-2014">
					
					
				<div class="w">
					<div id="footer-2014">
						<div class="links">
							<a rel="nofollow" target="_blank" href="#">关于我们</a>|<a href="#">联系我们</a>|<a
								rel="nofollow" target="_blank" href="#">商家入驻</a>|<a
								rel="nofollow" target="_blank" href="#">营销中心</a>|<a
								rel="nofollow" target="_blank" href="#">手机HG</a>|<a
								target="_blank" href="#">友情链接</a>|<a target="_blank" href="#">销售联盟</a>|<a
								href="#" target="_blank">HG社区</a>|<a href="#" target="_blank">HG公益</a>|<a
								href="#" target="_blank">English Site</a>|<a href="#"
								target="_blank">Contact Us</a>
						</div>
						<div class="copyright">
							<a target="_blank" href="#"><img
								src="/resource/img/56a0a994Nf1b662dc.png"> 京公网安备 11xxxxxx00088号</a>&nbsp;&nbsp;|&nbsp;&nbsp;京ICP证0xxx59号&nbsp;&nbsp;|&nbsp;&nbsp;<a
								target="_blank" href="#">互联网药品信息服务资格证编号(京)-经营性-2020-0xx8</a>&nbsp;&nbsp;|&nbsp;&nbsp;新出发京零&nbsp;字第大12xxxx1号<br>
							<a rel="nofollow" href="#" target="_blank">音像制品经营许可证苏宿批0xx号</a>&nbsp;&nbsp;|&nbsp;&nbsp;出版物经营许可证编号新出发(苏)批字第N-012号&nbsp;&nbsp;|&nbsp;&nbsp;互联网出版许可证编号新出网证(京)字xxx号<br>
							<a href="#" target="_blank">网络文化经营许可证京网文[201x]2xx8-3x8号</a>&nbsp;&nbsp;违法和不良信息举报电话：4006561155&nbsp;&nbsp;Copyright&nbsp;©&nbsp;2004-2016&nbsp;&nbsp;hgshop.com&nbsp;版权所有<br>光辉旗下网站：<a
								target="_blank" href="#">360TOP</a>&nbsp;&nbsp;<a
								href="#" target="_blank">拍拍网</a>&nbsp;&nbsp;<a href="#"
								target="_blank">网银在线</a>
						</div>

						
					</div>
				</div>
			</div>
		</div>
		</div>
	


</body>
</html>