<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>个人中心</title>
<meta name="keywords" content="">
		<meta name="description" content="">
		<link rel="stylesheet" href="/resource/css/safe/css.css" />
		<link rel="stylesheet" href="/resource/css/safe/common.min.css" />
		<link rel="stylesheet" href="/resource/css/safe/ms-style.min.css" />
		<link rel="stylesheet" href="/resource/css/safe/personal_member.min.css" />
		<link rel="stylesheet" href="/resource/css/safe/Snaddress.min.css" />
		<link rel="stylesheet" href="/resource/css/sui.css" />
		<script type="text/javascript" src="/resource/js/jquery-1.9.1.min.js" ></script>
		<script type="text/javascript" src="/resource/js/sui.js" ></script>


<style type="text/css">
		.nav-manage .list-nav-manage {
			position: absolute;
			padding: 15px 4px 10px 15px;
			left: 0;
			top: -15px;
			width: 90px;
			background: #FFF;
			box-shadow: 1px 1px 2px #e3e3e3, -1px 1px 2px #e3e3e3;
			z-index: 10;
		}
		
		.ms-nav li {
			float: left;
			position: relative;
			padding: 0 20px;
			height: 44px;
			font: 14px/26px "Microsoft YaHei";
			color: #FFF;
			cursor: pointer;
			z-index: 10;
		}
		.personal-member .main-wrap {
		    width: 1068px;
		    margin: 15px 0 30px 180px;
		    padding: 0 0 39px 0;
		    border: 1px solid #ddd;
		    background: none;
		}
			

		body {
		    background: #f5f5f5;
		}
			.sui-table th{
		    padding: 16px 8px;
		    line-height: 18px;
		    text-align: center;
		    vertical-align: middle;
		    border-top: 1px solid #e6e6e6;
		    font-weight: normal;
		    font-size: 14px;
		    color: #333333;
		   }
		   .sui-table td {
		    padding: 16px 8px;
		    line-height: 18px;
		    text-align: center;
		    vertical-align: middle;
		    border-top: 1px solid #e6e6e6;
		    font-weight: normal;
		    font-size: 12px;
		    color: #333333;
		   }
	img {
	    max-width: 100%;
	    height: auto;
	    /*vertical-align: bottom;*/
	    border: 0;
	    -ms-interpolation-mode: bicubic;
	    margin-left: -10px;
	}
			a{
				color: #000000;
			}
			.ng-footer {
				height: 130px;
				margin-top: 0;
			}
		
			
			.ng-s-footer {
				height: 130px;
				background: none;
				text-align: center;
			}
			
			.ng-s-footer p.ng-url-list {
				height: 25px;
				line-height: 25px;
			}
			
			.ng-s-footer p.ng-url-list a {
				color: #666666;
			}
			
			.ng-s-footer p.ng-url-list a:hover {
				color: #f60;
			}
			
			.ng-s-footer .ng-authentication {
				float: none;
				margin: 0 auto;
				height: 25px;
				width: 990px;
				margin-top: 5px;
			}
			
			.ng-s-footer p.ng-copyright {
				float: none;
				width: 100%;
			}
			
			.root1200 .ng-s-footer p.ng-copyright {
				width: 100%;
			}

		</style>
<script type="text/javascript">
function cart(){
	$("#centent").load("/user/toCart");
}
$(function(){
	$(".aaa").click(function(){
		var url=$(this).attr("data-target");
		$("#centent").load(url);
	})
})
</script>
</head>
<body class="ms-body">
		<div id="" class="ng-top-banner"></div>
		<div class="ng-toolbar">
			<div class="ng-toolbar-con wrapper">
				<div class="ng-toolbar-left">
					<a href="/index/list" class="ng-bar-node ng-bar-node-backhome" id="ng-bar-node-backhome" style="display: block;">
						<span>返回HG首页</span>
					</a>
					<div class="ng-bar-node-box ng-site-nav-box">
						<a href="#" class="ng-bar-node ng-bar-node-site">
							<span>网站导航</span>
						</a>
					</div>

				</div>
				<div class="ng-toolbar-right">
					
					<div class="ng-bar-node-box username-handle" id="" style="display: block;">
						<a href="/user/logout" rel="nofollow" class="ng-bar-node username-bar-node username-bar-node-noside">
							<span id="">退出登录</span>
						</a>
					</div>
					<div class="ng-bar-node-box username-handle" id="" style="display: block;">
						<a href="/user/toIndex" rel="nofollow" class="ng-bar-node username-bar-node username-bar-node-noside">
							<span id="">我的HG</span>
						</a>
					</div>
					<div class="ng-bar-node-box username-handle" id="" style="display: block;">
						<a href="/user/toCart" rel="nofollow" class="ng-bar-node username-bar-node username-bar-node-noside">
							<span id="">购物车</span>
						</a>
					</div>
					<div class="ng-bar-node-box username-handle" id="" style="display: block;">
						<a href="/user/toIndex" rel="nofollow" class="ng-bar-node username-bar-node username-bar-node-noside">
							<span id="">收藏夹</span>
						</a>
					</div>
					<div class="ng-bar-node-box username-handle" id="" style="display: block;">
						<a href="/user/toIndex" rel="nofollow" class="ng-bar-node username-bar-node username-bar-node-noside">
							<span id="">关注HG</span>
						</a>
					</div>
					<div class="ng-bar-node-box username-handle" id="" style="display: block;">
						<a href="/user/toIndex" rel="nofollow" class="ng-bar-node username-bar-node username-bar-node-noside">
							<span id="">卖家中心</span>
						</a>
					</div>
					<div class="ng-bar-node-box username-handle" id="" style="display: block;">
						<a href="/user/toIndex" rel="nofollow" class="ng-bar-node username-bar-node username-bar-node-noside">
							<span id="">联系我们</span>
						</a>
					</div>
					
						<div class="ng-down-box ng-d-box service-center-child ng-ser-list" style="display:none;">
						</div>
					</div>
				</div>
				<div id="ng-minicart-slide-box"></div>
			</div>
		
		<header class="ms-header ms-header-inner ms-head-position">
			<article class="ms-header-menu" style="background-color: #EE0000">
				
				<div class="header-menu" >
					<div class="ms-logo">
						<a class="ms-head-logo" style="text-decoration: none;" name="Myyigou_index_none_daohangLogo"><span style="font-size: 30px;color: #fff;font-weight: bold;    line-height: 28px;;">我的HG</span></a>

					</div>
					<nav class="ms-nav">
						<ul>
							<li class=""><a href="" data-url=""  style="    padding-bottom: 17px;border-bottom: 3px #fff solid;">首页</a><i class="nav-arrow"></i></li>
							<li class="nav-manage selected">
								<a href="" data-url="">账户管理</a><i class="nav-arrow" hidden></i>
								
							</li>
							<li class="ms-nav-msg"><a>消息</a><i class="nav-arrow"></i></li>
						</ul>
						<div class="ms-search">
							<form>
								<input id="" placeholder="搜索" type="text" >
								<img src="/resource/img/搜索.png"  style="height: 10px;width: 10px;float: right;margin-right: 10px;" />
							</form>
						</div>
					</nav>
				</div>

			</article>

			<article class="ms-useinfo">
				<div class="header-useinfo" id="">
					<div class="ms-avatar">
						<div class="useinfo-avatar">
							<img src="/resource/img/222.jpg">
							<div class="edit-avatar"></div>
							<a class="text-edit-avatar">修改</a>
						</div>
						<a>${user.username}</a>
					</div>
				</div>

			</article>
		</header>
		<div id="ms-center" class="personal-member">
			<div class="cont">
				<div class="cont-side">
					<div class="side-neck" style="margin-top: 20px;">
						<i></i>
					</div>
					<div class="ms-side" style="margin-top: 20px;">
						<article class="side-menu side-menu-off">
							<dl class="side-menu-tree" style="padding-left: 50px;">
								<dt onclick="cart()">
									<img src="/resource/img/左侧/我的购物车.png"  style="margin-right: 10px;margin-left: -20px;"/>我的购物车
								</dt>
								<dt><img src="/resource/img/左侧/file.png"  style="margin-right: 10px;margin-left: -20px;"/>订单管理</dt>
								<dd>
									<a href="javascript:void(0);" class="aaa" data-target="/user/toOrder">我的订单</a>
								</dd>
								<dd>
									<a href="javascript:void(0);">我的收藏</a>

								</dd>
								<dd>
									<a href="javascript:void(0);">我的评价</a>

								</dd>
								<dd>
									<a href="javascript:void(0);">我的足迹</a>

								</dd>
								<dd>
									<a href="javascript:void(0);">我的拍卖</a>

								</dd>
								<dd>
									<a href="javascript:void(0);">我的优惠券</a>

								</dd>
								<dt><img src="/resource/img/左侧/我的买啦.png"  style="margin-right: 10px;margin-left: -20px;"/>我的HG</dt>
								<dd>
									<a href="javascript:void(0);">我的推荐</a>

								</dd>
								<dd>
									<a href="javascript:void(0);">我的钱包</a>

								</dd>
								<dd>
									<a href="javascript:void(0);">我要提现</a>

								</dd>
								<dd>
									<a href="javascript:void(0);">我的买豆</a>

								</dd>
								<dd>
									<a href="javascript:void(0);">邀请管理</a>

								</dd>
								<dt><img src="/resource/img/左侧/v-card-3.png"  style="margin-right: 10px;margin-left: -20px;"/>售后服务</dt>
								<dd>
									<a href="javascript:void(0);">退换货</a>

								</dd>
								<dd>
									<a href="javascript:void(0);">意见/投诉</a>

								</dd>
							</dl>

							<a ison="on" class="switch-side-menu icon-up-side"><i></i></a>
						</article>
					</div>
				</div>
				</div>
				
				<div  class="cont-main">
					<div class="main-wrap mt15" style="border: 0px;">
						<!--<h3>
	                        <strong>我的会员等级</strong>
	                    </h3>-->
						<div  class="server-wrapper">
							<div  class="server-tab" style="margin-top: 26px;">
								
								<!-- 中间显示区域 -->
								
								<div id="centent" style=" float: left;vertical-align: bottom;text-align: center;">
									
								<div  style="width: 980px;padding: 10px;float: left;background-color: #fff;height: 50px;">
								<div  style="border-top:1px #ccc solid;width: 940px;position: absolute;margin-top: 10px;margin-left: 20px;float: left;"></div>
								<div  style="position: absolute;margin-top:25px;font-size: 14px;color: #686868;float: left;">
									<span style="margin-left: 90px;">待付款</span>
									<font style="color: #CF2D27;">0</font>
									<span style="margin-left: 60px;margin-right: 60px;">|</span>
									<span >待发货</span>
									<font style="color: #CF2D27;">0</font>
									<span style="margin-left: 60px;margin-right: 60px;">|</span>
									<span>待收货</span>
									<font style="color: #CF2D27;">0</font>
									<span style="margin-left: 60px;margin-right: 60px;">|</span>
									<span>待评价</span>
									<font style="color: #CF2D27;">0</font>
									<span style="margin-left: 60px;margin-right: 60px;">|</span>
									<span>退款</span>
								</div>
								</div>
							
								
								<div  style="width: 980px;padding:10px;display: inline-block; float: left;margin-top: 10px;background-color: #fff;">
									<div style="border-bottom: 1px #ccc solid;">
										<p style="font-size: 20px;text-align: left;">我的物流</p>
									</div>
									
									
									<div style="padding: 20px 20px;border-bottom: 1px #F5F5F5 solid;height: 150px;">
										<div style="float: left;margin-top: 10px;">
											<img src="img/宝贝收藏/组-58.png" />
										</div>
										<div style="float: left;margin-top: 20px;">
											<p>在浙江临安市公司市区北方扫描，快件已被签收</p>
											<p>2016-04-10 12:20:30  <strong>查看物流信息</strong> </p>
										</div>
										<div style="float: right;margin-right: 20px;margin-top: 50px;">
											<button style="border: 1px #ccc solid;padding: 5px;background-color: #fff;">确认收货</button>
										</div>
										
									</div>
									<div style="padding: 20px 20px;border-bottom: 1px #F5F5F5 solid;height: 150px;">
										<div style="float: left;margin-top: 10px;">
											<img src="img/宝贝收藏/组-56.png" />
										</div>
										<div style="float: left;margin-top: 20px;">
											<p>在浙江临安市公司市区北方扫描，快件已被签收</p>
											<p>2016-04-10 12:20:30  <strong>查看物流信息</strong> </p>
										</div>
										<div style="float: right;margin-right: 20px;margin-top: 50px;">
											<button style="border: 1px #ccc solid;padding: 5px;background-color: #fff;">确认收货</button>
										</div>
										
									</div>
									<div style="padding: 20px 20px;border-bottom: 1px #F5F5F5 solid;height: 150px;">
										<div style="float: left;margin-top: 10px;">
											<img src="img/宝贝收藏/组-57.png" />
										</div>
										<div style="float: left;margin-top: 20px;">
											<p>在浙江临安市公司市区北方扫描，快件已被签收</p>
											<p>2016-04-10 12:20:30  <strong>查看物流信息</strong> </p>
										</div>
										<div style="float: right;margin-right: 20px;margin-top: 50px;">
											<button style="border: 1px #ccc solid;padding: 5px;background-color: #fff;">确认收货</button>
										</div>
										
									</div>
									<p style="text-align: center;margin-top: 30px;">展开全部信息</p>
									 
								</div>
								
							<!-- 中间显示区域结束 -->	
								
							
						</div>
					</div>
				</div>
				
			</div>
		</div>
		</div>
		
		<div  style="text-align: center;" >
				<div >
					<div  >
						<img src="/resource/img/duo.png" alt="">
					</div>
				</div>	
				<div  style="margin-top: 20px;margin-bottom: 60px">
					<div>
						<div >
							<a rel="nofollow" target="_blank" href="#">关于我们</a>|<a href="#">联系我们</a>|<a
								rel="nofollow" target="_blank" href="#">商家入驻</a>|<a
								rel="nofollow" target="_blank" href="#">营销中心</a>|<a
								rel="nofollow" target="_blank" href="#">手机HG</a>|<a
								target="_blank" href="#">友情链接</a>|<a target="_blank" href="#">销售联盟</a>|<a
								href="#" target="_blank">HG社区</a>|<a href="#" target="_blank">HG公益</a>|<a
								href="#" target="_blank">English Site</a>|<a href="#"
								target="_blank">Contact Us</a>
						</div>
						<div >
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
		
		
		
		
	</body>

</html>