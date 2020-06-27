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
function login(){
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
 	$.post("/user/login",form,function(re){
		if(re){
			alert("登录成功");
			location="/index/list"
		}else{
			alert("登录失败");
		}
	}) 
}
function er(){
	alert("该设备不支持二维码登录");
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
		<b style="font-size: x-large;font-weight: 800;">欢迎登录</b>
	</div>
	<!-- 左边登录logo结束 -->
	<a href="/user/" class="q_link fr">
		<b class="fl"></b>
		登录页面，调查问卷
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
  				<a href="javascript:;">账号登录</a>
  			</div>
  			<div class="login-tab login-tab-r" >
  				<a href="javascript:;" onClick="er()">二维码登录</a>
  			</div>
  			<!-- login-box开始（账户登录） -->
  			<div class="login-box" style="visibility: visible; display:block">
  			  <div class="mt tab-h"></div>
  			  <!-- 登录提示信息开始 -->
  			  <div class="msg-wrap">
  			  	  <div class="msg-warn">
  					  <b></b>
  					公共场所不建议自动登录，以防账号丢失
  				  </div>
  				  <div class="msg-error hide">
  					  <b></b>
  				  </div>
  			  </div>
  			  <!-- 登录提示信息结束 -->
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
  			  			
                        <!-- 自动登录开始fore4 -->
                        <div class="item item-fore4">
                        	<div class="safe">
                        		<span>
                        			<input type="checkbox"  id="autologin" tabindex="3">
                        			<label for>自动登录</label>
                        		</span>
                        		<span class="forget-pw-safe">
                        			<a href="#">忘记密码</a>
                        		</span>
                        	</div>
                        </div>
                        <!-- 登录按钮开始 -->
                        <div class="item item-fore5">
                        	<div class="login-btn">
                        		<a href="javascript:;" class="btn-img btn-entry" id="loginsubmit" tabindex="6" onClick="login()">登&nbsp;&nbsp;&nbsp;&nbsp;录</a>
                        	</div>
                        </div>
  			  		</form>
  			  	</div>
  			  </div>
  			  <!-- mc结束 2input+自动登录+登录按钮-->
  				
  			</div>
  			<!-- login-box结束（账户登录） -->
  			
  			<!-- 登录框底部登录方式 开始qq,微信-->
  			<div class="coagent" id="kbCoagent">
  				<ul>
  					<li>
  						<a href="javascript:void(0)" onClick="return false;" class="pdl">
  							
  							<span>QQ</span>
  						</a>
  						<span class="line">|</span>
  					</li>
  					<li>
  						<a href="javascript:void(0)" onClick="return false;" class="pdl">
  							
  							<span>微信</span>
  						</a>
  						<span class="line">|</span>
  					</li>
  					<li>
  						<a href="javascript:void(0)" onClick="return false;">
  							HG钱包
  						</a>
  						<span class="line">|</span>
  					</li>
  					<li class="extra-r">
  					   <div class="regist-link">
  						<a href="javascript:void(0)" onClick="register()" class="">
  							<b></b>立即注册
  						</a>
  					   </div>
  					</li>
  				</ul>
  			</div>
  			<!-- 登录框底部登录方式 结束qq,微信-->
  		</div>
  		  <!-- ************ 登录页面login-form结束************  -->
  	</div>
  	<!-- w结束 -->
  	<!-- 中间广告部分开始 -->
  	<div class="login-banner" style="background-color: #ffd123">
  		<div class="w">
  			<div id="banner-bg" class="i-inner" style="background: url(//img10.360buyimg.com/da/jfs/t1/85085/15/17512/30010/5e86dfa4Ee69eb048/f8c53b07ce5a5546.jpg);"></div>
  			
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