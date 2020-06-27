<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resource/css/base.css">
<link rel="stylesheet" type="text/css" href="/resource/css/login.css">
<script src="/resource/js/jquery-3.1.1.min.js"></script>
<script src="/resource/js/checkcode.js"></script>

<script type="text/javascript" src="/resource/js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="/resource/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<!-- 引入bootstrap样式 -->
<script type="text/javascript">
function update(){
	var username=$("[name=username]").val();
	var password=$("[name=password]").val();
 	if(username==null || username==""){
		alert("请输入用户名");
		return ;
	} 
 	if(password==null || password==""){
		alert("请输入密码");
		return ;
	} 
 	var form = $("#formlogin").serialize();
 	$.post("/user/register",form,function(re){
		if(re){
			alert("注册成功");
			location="/user/";
		}else{
			alert("注册失败");
		}
	}) 
}
function er(){
	alert("该设备不支持快捷注册");
}
function register(){
	location="/user/toRegister";
}
</script>
</head>
<body>
<!-- **************头部页面开始****** -->
<div style="margin-top: 30px" class="w">
	<div id="logo">
		<a href="/user/">
			<img src="/resource/img/hg02.jpg" alt="">
		</a>
		<b style="font-size: xx-large;font-weight: 800;">HGshop</b>
	</div>
	<!-- 左边登录logo结束 -->
	<a href="/user/" class="q_link fr">
		<b class="fl"></b>
		注册页面，调查问卷
	</a>
</div>
<!-- ************头部页面结束********** -->
<div id="content">
   <!-- login-wrapk开始 -->
  <div class="login-wrap">
    <!-- w开始 -->
  	<div class="w">
           <!-- *****************登录页面开始************ -->
  		<div class="login-form">
  			
  			<div class="login-tab login-tab-l" >
  				<a href="javascript:;">账号注册</a>
  			</div>
  			<div class="login-tab login-tab-r" >
  				<a href="javascript:;" onClick="er()">快捷注册</a>
  			</div>
  			<!-- login-box开始（账户登录） -->
  			<div class="login-box" style="visibility: visible; display:block">
  			  <div class="mt tab-h"></div>
  			  
  			  <div class="mc">
  			  	<div class="form">
  			  		<form  id="formlogin" method="post" >
  			  			<!-- 用户名输入框fore1 -->
  			  			<div class="item item-fore1 item-error">
  			  				<label for="loginname" class="login-label name-label"></label>
  			  				<input type="text" name="username" id="loginname" class="itxt" tabindex="1" autocomplete="off" placeholder="用户名">
  			  				<span class="clear-btn" style="display:inline;"></span>
  			  			</div>
  			  			<!-- 密码输入框fore2 -->
  			  			<div id="entry" class="item item-fore2" style="visibility: visible">
  			  				<label class="login-label pwd-label" for="nloginpwd"></label>
  			  				<input type="password" name="password" id="nloginpwd" name="nloginpwd" class="itxt itxt-error" tabindex="2" autocomplete="off" placeholder="密码">
  			  				<span class="clear-btn" style="display: inline;"></span>
  			  				<span class="capslock" style="display: none;">
  			  					<b></b>
  			  					大小写锁定已打开
  			  				</span>
  			  			</div>
  			  			
                        
                        <!-- 注册按钮开始 -->
                        <div class="item item-fore5">
                        	<div class="login-btn">
                        		<a href="javascript:;" class="btn-img btn-entry" id="loginsubmit" tabindex="6" onClick="update()">注&nbsp;&nbsp;&nbsp;&nbsp;册</a>
                        	</div>
                        </div>
  			  		</form>
  			  	</div>
  			  </div>
  			  <!-- mc结束 2input+自动登录+登录按钮-->
  				
  			</div>
  			<!-- login-box结束（账户登录） -->
  			
  			
  		</div>
  		  <!-- ************ 登录页面login-form结束************  -->
  	</div>
  	<!-- w结束 -->
  	<!-- 中间广告部分开始 -->
  	<div class="login-banner" style="background-color: #683ac6">
  		<div class="w">
  			<div id="banner-bg" class="i-inner" style="background: url(//img12.360buyimg.com/da/jfs/t1/86422/5/17113/99650/5e840b43Ed0923675/23e1e9d274094a01.jpg);"></div>
  			
  		</div>
  	</div>
  	<!-- 中间背景广告结束 -->
  </div>
	<!-- login-wrap结束 -->
</div>
<!-- 内容部分结束 -->
<!-- 底部页面开始 -->
<div style="margin-bottom: 50px" class="w">
	<div id="footer-2013">
		<div class="links">
			<a href="#">关于我们</a>
			|
			<a href="#">联系我们</a>
			|
			<a href="#">人才招聘</a>
			|
			<a href="#">商家入驻</a>
			|
			<a href="#">广告服务</a>
			|
			<a href="#">手机HG</a>
			|
			<a href="#">友情链接</a>
			|
			<a href="#">销售联盟</a>
			|
			<a href="#">HG社区</a>
			|
			<a href="#">HG公益</a>
			|
			<a href="#">English site</a>
		</div>
		
	</div>
	<div style="align-content: center;text-align: center;margin-top: 15px">
            Copyright&nbsp;©&nbsp;2004-2020&nbsp;&nbsp;光辉.com&nbsp;版权所有
    </div>
</div>
<!-- 底部页面结束 -->
	
</body>


</body>
</html>