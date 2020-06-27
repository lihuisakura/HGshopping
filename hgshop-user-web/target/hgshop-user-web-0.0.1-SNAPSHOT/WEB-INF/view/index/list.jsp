<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="/resource/css/indexlist.css" type="text/css"
	rel="stylesheet">
<script src="/resource/js/jquery-1.11.3.min.js"></script>
<script src="/resource/js/index.js"></script>

<script type="text/javascript" src="/resource/js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="/resource/js/bootstrap.min.js"></script>
<script type="text/javascript">
/* function initTree() {
	//发送ajax获取树需要的数据
//	alert($.ajaxSettings.async=true)
	$.post("/index/treeData", {},
			function(treeData) {
				//初始化添加的时候分类的树
				$("#catTree").treeview({
					data : treeData,
					levels : 2,
					onNodeSelected : function(event, node) {
						if (node.nodes.length==0) {
							//如果是末级分类，则根据末级分类 查询
							//$("#add_spu_categmoory").val(node.text);
							//$("#add_spu_category_id").val(node.id);
							query(node.id,1)
							
						}
					}
				});

			}, "json");
}
initTree();

function query(catId,page){
	location.href="/index/list?pageNum="+page+"&catId="+catId;
} */
</script>
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
						<a href="/user/">${user.username}</a>
					</c:if>
					</li> 
					<li class="shu"></li>
					<li class="guanzhu bj"><a href="#">我的订单</a></li>
					<li class="shu"></li>
					<li class="guanzhu bj"><a href="#">我的HG</a></li>
					<li class="shu"></li>
					<li class="guanzhu bj"><a href="#">HG会员</a></li>
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
			<a href="/index/list"><img width="200px" height="50px" src="/resource/img/hg02.jpg"><span style="font-weight: 900;font-size: xx-large;">HGshopping</span></a>
		</div>
		<!-- logo结束 -->
		<!-- 搜索开始 -->
		<div class="search">
			<input type="text" value="家电一折抢" class="text" id="textt">
			<button class="button">搜索</button>
		</div>
		<!-- 搜索结束 -->
		<div class="right">
			<i class="gw-left"
				style="background: url(/resource/img/jd2015img.png) 0 -58px no-repeat; width: 24px; height: 24px;"></i>
			<i class="gw-right">></i> <i class="gw-count">0</i> <a href="#">我的购物车</a>
			<div class="dorpdown-layer">
				<img src="/resource/img/settleup-nogoods.png"> 购物车中还没有商品，赶紧选购吧！
			</div>
		</div>
		<div class="hotwords">
			<a href="#" class="red">1元秒杀</a> <a href="#">低至1折</a> <a href="#">1元抢</a>
			<a href="#">时尚鞋靴</a> <a href="#">买一送二</a> <a href="#">乐视乐1</a> <a
				href="#">特步女鞋</a> <a href="#">威士忌</a> <a href="#">婴儿衣服</a>
		</div>
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
		<div class="focus-a">
			<div class="fouc-img1">
				<img src="/resource/img/5689d4ebN19f155a6.jpg" class="nav-img2">
			</div>
			<div class="fouc-font">
				<a href="">全部商品分类</a>
			</div>
		</div>
		<!-- 顶部分类显示 -->
		<div class="focus-b">
			<ul>
				<c:forEach items="${rootCategory}" var="category">
					<li><a href="#">${category.name}</a></li>
				</c:forEach>
			</ul>
		</div>
		
		<!--轮播图左边当行蓝-->
		<div class="bb"></div>
		<div class="dd-inner">
		<c:forEach items="${rootCategory}" var="category">
			<div class="font-item">
				<div class="item fore1">
					<h3>
						<a href="">${category.name}</a>
					</h3>
					<i>></i>
				</div>
				<div class="font-item1">
					<div class="font-lefty">
					<c:forEach items="${category.children}" var="chil">
						<dl class="fore2">
							<dt>
								<a href="" onclick="list()">${chil.name}<i>></i></a>
							</dt>
							<dd>
								<c:forEach items="${chil.children}" var="children">
								<a href="">${children.name}</a>
								</c:forEach>
							</dd>
						</dl>
					</c:forEach>
					</div>
				</div>
				
			</div>
			</c:forEach>
			
			
			
		</div>
		<!------------------------------------轮播图------------------------------------>
		<div id="lunbo">
			<ul id="one">
				<li><a href=""><img src="/resource/img/5690b6dcNd5aaa0f0.jpg"></a></li>
				<li><a href=""><img src="/resource/img/56960e10N27e2d29f.jpg"></a></li>
				<li><a href=""><img src="/resource/img/56a05078N6add136b.jpg"></a></li>
				<li><a href=""><img src="/resource/img/56a09e6aN373313d9.jpg"></a></li>
			</ul>
			
			<!------------------------------------轮播图左右箭头------------------------>
			<div class="slider-page">
				<a href="javascript:void(0)" id="left"><</a> <a
					href="javascript:void(0)" id="right">></a>
			</div>
		</div>

		<!------------------------------------轮播图右侧一栏------------------------>
		<div class="m">
			<div class="mt">
				<h3>京东快报</h3>
				<div class="extra">
					<a href="">更多 ></a>
				</div>
			</div>
			<div class="mc">
				<ul>
					<li><a href=""><span>[特惠]</span>小年备好礼 年货美食满99减50</a></li>
				</ul>
			</div>
			<div class="mc">
				<ul>
					<li><a href=""><span>[公告]</span>华北区因雨雪天气配送延迟</a></li>
				</ul>
			</div>
			<div class="mc">
				<ul>
					<li><a href=""><span>[特惠]</span>京东全球年货节礼盒买一赠一</a></li>
				</ul>
			</div>
			<div class="mc">
				<ul>
					<li><a href=""><span>[公告]</span>品牌+服务 升级茗茶消费体验</a></li>
				</ul>
			</div>
			<div class="mc">
				<ul>
					<li><a href=""><span>[特惠]</span>彪马年终促满300减50</a></li>
				</ul>
			</div>
		</div>
		<div class="ms">
			<div class="mm">
				<h3>京东快报</h3>
				<div class="extra">
					<a href="">更多 ></a>
				</div>
			</div>
			<div class="mmm">
				<ul>
					<li><a href=""> <i class="ci-left"
							style="background: url(/resource/img/568dfdbdN4f7d7ca3.png) no-repeat;"></i>
							<span class="ci-bottom">话费</span>
					</a></li>
					<li><a href=""> <i class="ci-left"
							style="background: url(/resource/img/568dfdbdN4f7d7ca3.png) no-repeat 0 -25px;"></i>
							<span class="ci-bottom">机票</span>
					</a></li>
					<li><a href=""> <i class="ci-left"
							style="background: url(/resource/img/568dfdbdN4f7d7ca3.png) no-repeat 0 -50px;"></i>
							<span class="ci-bottom">电影票</span>
					</a></li>
					<li><a href=""> <i class="ci-left"
							style="background: url(/resource/img/568dfdbdN4f7d7ca3.png) no-repeat 0 -75px;"></i>
							<span class="ci-bottom">游戏</span>
					</a></li>
					<li><a href=""> <i class="ci-left"
							style="background: url(/resource/img/568dfdbdN4f7d7ca3.png) no-repeat -25px -100px;"></i>
							<span class="ci-bottom">彩票</span>
					</a></li>
					<li><a href=""> <i class="ci-left"
							style="background: url(/resource/img/568dfdbdN4f7d7ca3.png) no-repeat -25px -125px;"></i>
							<span class="ci-bottom">团购</span>
					</a></li>
					<li><a href=""> <i class="ci-left"
							style="background: url(/resource/img/568dfdbdN4f7d7ca3.png) no-repeat -25px -150px;"></i>
							<span class="ci-bottom">酒店</span>
					</a></li>
					<li><a href=""> <i class="ci-left"
							style="background: url(/resource/img/568dfdbdN4f7d7ca3.png) no-repeat -25px -175px;"></i>
							<span class="ci-bottom">火车票</span>
					</a></li>
					<li><a href=""> <i class="ci-left"
							style="background: url(/resource/img/568dfdbdN4f7d7ca3.png) no-repeat 0px -250px;"></i>
							<span class="ci-bottom">众筹</span>
					</a></li>
					<li><a href=""> <i class="ci-left"
							style="background: url(/resource/img/568dfdbdN4f7d7ca3.png) no-repeat -25px -200px;"></i>
							<span class="ci-bottom">理财</span>
					</a></li>
					<li><a href=""> <i class="ci-left"
							style="background: url(/resource/img/568dfdbdN4f7d7ca3.png) no-repeat -25px -275px;"></i>
							<span class="ci-bottom">礼品卡</span>
					</a></li>
					<li><a href=""> <i class="ci-left"
							style="background: url(/resource/img/568dfdbdN4f7d7ca3.png) no-repeat -25px -225px;"></i>
							<span class="ci-bottom">白条</span>
					</a></li>
				</ul>

			</div>
		</div>

		<!--*****************轮播下方*****************-->
		<div class="lazy-fn lazy-fn-done" id="lazy-todays">
			<div id="guessyou" class="">
				<div class="mt">
					<h2>商品展示</h2>
				</div>
				<div class="list1">
					<div class="spacer"><i></i></div>
					<ul>   
						<c:forEach items="${spuInfo.list}" var="spu">
						<li class="fore1">            
							<div class="p-img">
								<a href="#" target="_blank">
									<img data-lazy-img="done" width="130" height="130" title="${spu.goodsName}" src="/pic/${spu.smallPic}" class="">
								</a>
							</div>                
							<div class="p-info">                
								<div class="p-name">
									<a href="#" target="_blank" title="${spu.goodsName}">${spu.goodsName}
									</a>
								</div>
								<div class="p-price" data-lazyload-fn="done"><i>¥</i>1598.00</div>            
							</div>        
						</li> 
						</c:forEach>     
						       
						
					</ul>
				</div>
			</div>
			<!--商品展示结束-->
			
			<!--*************网页结尾***************-->
			<div class="lazy-fn lazy-fn-done" id="lazy-footer">
				<div id="service-2014">
					<div class="slogen">
						<img src="/resource/img/duo.png" alt="">
					</div>
					
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
	</div>


</body>
</html>