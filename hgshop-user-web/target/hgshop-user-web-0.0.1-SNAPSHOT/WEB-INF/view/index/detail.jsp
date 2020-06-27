<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品详情</title>
<link href="/resource/css/shopdetail.css" rel="stylesheet" type="text/css">
<!-- 引入bootstrap样式 -->

<script type="text/javascript" src="/resource/js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="/resource/js/bootstrap.min.js"></script>
<script src="/resource/js/jquery-1.9.1.min.js"></script>
<script src="/resource/js/common.js"></script>
<style type="text/css">

	.selectedDiv {
		border: solid 2px #EE2C2C;
	}
	
	.noselectedDiv {
		border: solid 1px #AAAAAA;
	}
</style>
<script type="text/javascript">

function alt(){
	alert("此功能尚未开发完成，请耐心等待……");
}
  $(document).ready(function(){
	  var showproduct = {
		  "boxid":"showbox",
		  "sumid":"showsum",
		  "boxw":400,
		  "boxh":550,
		  "sumw":60,//列表每个宽度,该版本中请把宽高填写成一样
		  "sumh":60,//列表每个高度,该版本中请把宽高填写成一样
		  "sumi":7,//列表间隔
		  "sums":5,//列表显示个数
		  "sumsel":"sel",
		  "sumborder":1,//列表边框，没有边框填写0，边框在css中修改
		  "lastid":"showlast",
		  "nextid":"shownext"
		  };//参数定义	  
	 $.ljsGlasses.pcGlasses(showproduct);//方法调用，务必在加载完后执行
	 
	 $(function(){

		$('.tabs a').click(function(){
			
			var $this=$(this);
			$('.panel').hide();
			$('.tabs a.active').removeClass('active');
			$this.addClass('active').blur();
			var panel=$this.attr("href");
			$(panel).show();				
			return fasle;  //告诉浏览器  不要纸箱这个链接
			})//end click
			
			
			$(".tabs li:first a").click()   //web 浏览器，单击第一个标签吧
	

		
		})//end ready
		
		$(".centerbox li").click(function(){
			$("li").removeClass("now");
			$(this).addClass("now")
			
			});
		
			
});
	
	function check(id,obj){
			$.post("/goods/findSkuById",{id:id},function(re){
				$("#price").html("￥"+re.price);
				$("#marketPrice").html("￥"+re.marketPrice);
				$("#stockCount").html(re.stockCount+"件");
				$("[name=price]").val(re.price);
			})
			$(".sku").each(function(){
				$(this).removeClass("selectedDiv");
				$(this).addClass("noselectedDiv");
			})
			
			obj.removeClass("noselectedDiv");
			obj.addClass("selectedDiv");
			
			
	}		
		
	function addCart(){
		var uid="${user.uid}";
		if(null==uid || uid==""){
			alert("请先登录……");
		}
		
		var pnum=$("[name=pnum]").val();
		var sumTotal=$("[name=price]").val()*pnum;
		
		var skuId = $(".selectedDiv").children().val();
		
		$.post("/user/addCart",{uid:uid,skuid:skuId,pnum:pnum,sumTotal:sumTotal},function(re){
			if(re){
				alert("商品添加购物车成功，可在【我的购物车】中查看");
			}else{
				alert("商品添加购物车失败");
			}
		})
	}	
</script>
</head>

<body>
<!-----header部分------->
<div class="header" style="background-color: white;">
<div class="top" style="background:url(/resource/img/header_bg.jpg) repeat-x;" >
	<div class="top1">
		<c:if test="${user==null}">
		<a href="/user/">登录</a>
        <a href="/user/toRegister">注册</a>
		</c:if>
		<c:if test="${user!=null}">
		<a href="/user/toIndex">${user.username}</a>
		</c:if>
		<a href="#"><img src="/resource/img/top1.jpg">我的购物车</a>
		<a href="#"><img src="/resource/img/top3.jpg">联系我们</a>
	</div>
</div>
<!-----logo_search部分------->
<div class="logobg">
	<div class="center">
		<div class="logo" style="margin-left: 0px">
			<a href="/index/list"><img width="550px" height="70px" src="/resource/img/hg04.jpg"></a>
		</div>
	
     	<form id="searchForm" style="background: red">
     	<input type="text" id="searchTxt" >
     	<input type="submit" value="搜  索" id="search_btn" style="background-color: red">
     	</form>
	</div>
</div>

<hr size="5px" color="red">
<!-----主导航部分------->
	<div class="bottom">
    		
		
	</div>
    
    
</div>
<!-----header结束------->
<!-----商品详情部分------->
<div class="shopdetails">
	<!-------放大镜-------->
	<div id="leftbox">
	<div id="showbox">
  		<img src="/pic/${spu.smallPic}" width="400" height="550" />
  		<img src="/pic/${spu.smallPic}" width="400" height="550" />
  		<img src="/pic/${spu.smallPic}" width="400" height="550" />
  		<img src="/pic/${spu.smallPic}" width="400" height="550" />
  		<img src="/pic/${spu.smallPic}" width="400" height="550" />
  		<img src="/pic/${spu.smallPic}" width="400" height="550" />
  		<img src="/pic/${spu.smallPic}" width="400" height="550" />

	</div><!--展示图片盒子-->
		<div id="showsum"></div><!--展示图片里边-->
		<p class="showpage">
 		 <a href="javascript:void(0);" id="showlast"> < </a>
  		 <a href="javascript:void(0);" id="shownext"> > </a>
		</p>
        
	</div>
    <!----中间----->

    <div class="centerbox">
    	<p class="imgname">${spu.goodsName}</p>
    	<p class="Aprice">价格：<samp id="marketPrice">￥${sku[0].marketPrice}</samp></p>
    	<p class="price">促销价：<samp id="price" >￥${sku[0].price}</samp></p>
    	<input type="hidden" name="price" value="${sku[0].price}">
    	<p class="youhui">店铺优惠：<samp>购物满两件打八折</samp></p>
    	<p class="youhui">当前库存：<samp id="stockCount">${sku[0].stockCount}件</samp></p>
    	<p class="kefu" style="background-image:url(/resource/img/tell03.png);">客服：</p>
        
        
		<p class="kefu" >规格：</p>
        <c:forEach items="${sku}" var="sku">
        	<div style="margin-left: 85px;margin-bottom: 5px">
	       			<a href="javascript:void(0);" onclick="check(${sku.id},$(this))" class="sku" title="${sku.sellPoint}" style="display: block;background-color:#EDEDED">
                           <input type="hidden" value="${sku.id}">
                           <img data-img="1" src="/pic/${sku.cartThumbnail}" width="40" height="40" >
                           <c:forEach items="${sku.specOptions}" var="ca">
					       			<span>&nbsp;&nbsp;&nbsp;&nbsp;${ca.specName}:${ca.optionName}&nbsp;&nbsp;&nbsp;&nbsp;</span>
					       			
					       	</c:forEach>
                    </a>
	       	</div>
	       	
	       </c:forEach>
	       
        

        
        <p class="kefu" >购买数量：</p>                                                                                                
        
        	<input type="number" placeholder="1" name="pnum" style="margin-left: 88px;margin-top: 5px;width: 410px;height: 30px">
        	
        
        
        <p class="buy">
        	
	        <a href="javascript:void(0);" onclick="alt()" style="margin-left: 50px" id="firstbuy">立即购买</a>

	        <a href="javascript:void(0);" onclick="addCart()" >加入购物车</a>
        </p>
   		<div class="clear"></div>
        
        <p class="fuwu" style="background-image:url(/resource/img/tell08.png);">服务承诺：</p>
        <p class="pay" style="background-image:url(/resource/img/tell09.png);">支付方式：</p>
    </div>
 
	
   
            
</div>
<!-----商品详情部分结束------->


<!----bottom_页脚部分----->
<div class="backf">
<div id="footer">
	 <ul>
  <li class="sy">支付方式</li>
  <li><a href="#">在线支付</a></li>
  <li><a href="#">货到付款</a></li>
  <li><a href="#">发票说明</a></li>
  <li><a href="#">余额宝</a></li>
  
  </ul>
    <ul>
  <li class="sy">购物指南</li>
  <li><a href="#">免费注册</a></li>
  <li><a href="#">申请会员</a></li>
  <li><a href="#">开通支付宝</a></li>
  <li><a href="#">支付宝充值</a></li>
  </ul>
  <ul>
  <li class="sy">商家服务</li>
  <li><a href="#">联系我们</a></li>
  <li><a href="#">客服服务</a></li>
  <li><a href="#">物流服务</a></li>
  <li><a href="#">缺货赔付</a></li>
  </ul>
    <ul>
  <li class="sy">关于我们</li>
  <li><a href="#">知识产权</a></li>
  <li><a href="#">网站合作</a></li>
  <li><a href="#">规则意见</a></li>
  <li><a href="#">帮助中心</a></li>
  </ul>
    <ul>
  <li class="sy">其他服务</li>
  <li><a href="#">诚聘英才</a></li>
  <li><a href="#">法律声明</a></li>

  </ul><div class="clear"></div>
</div>	
    <div class="foot">
    	 <p>使用本网站即表示接受 HG用户协议</p>
       <p>Copyright © 2004-2020  光辉.com 版权所有</p>
    
	</div>
</div>

</body>
</html>