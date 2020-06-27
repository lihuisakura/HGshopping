<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	$("#checkAll").change(function(){
		$("[name=check]").each(function(i,val){
			$(this).prop("checked",$("#checkAll").prop("checked"));
		});
	})
	
})
function page(){
	var pageNum=$("#page").val();
	$("#centent").load("/user/toOrder?pageNum="+pageNum);
}
</script>
</head>
<body>
<div class="cont-main" style="background-color: #fff;padding: 10px">
    <ul class="sui-nav nav-tabs" style="margin-top:0px;width: 1000px;margin-left: 30px;">
	  <li  class="active"  style="margin-left: -5px;"><a href="#" data-toggle="tab">所有订单${order.total}<span style="margin-left: 20px;color: #ccc;">|</span></a></li>
	  <li ><a href="#" data-toggle="tab">待付款<span style="margin-left: 20px;color: #ccc;">|</span></a></li>
	   <li ><a href="#" data-toggle="tab">待发货<span style="margin-left: 20px;color: #ccc;">|</span></a></li>
	    <li><a href="#" data-toggle="tab">待评价<span style="margin-left: 20px;color: #ccc;">|</span></a></li>
	</ul>
		<div class="profile-info">
			<div class="control-group clearfix " style="width: 1020px;margin-bottom: 0px;">
				<div style="margin-top: -60px";>
                                   <div style="float:right;display: inline;margin-left:60px;display: inline-block;height: 25px;margin-right: -5px;padding-top: 10px;"> 
				    <img src="img/trash-拷贝.png"  style="height: 10px;width: 10px;" />
				           <font style="">订单回收站</font>
                                   </div> 
				 </div>
				
			</div>
		</div>
		
						<div style="margin-left: 30px;height: 25px;" >
							<input  type="text"  placeholder="输入商品标题或者订单号进行搜索 " style="width: 200px;height: 25px;font-size: 12px;" />
							<button style="height: 100%;margin-left: -5px;border: 1px #ccc solid;font-size: 12px;color:#353535;background-color: #f2f2f2;width: 100px;">订单搜索</button>
						    <span style="margin-left: 5px;">更多搜索条件</span>
						</div>
							
							<div class="tab-content" style="width: 1000px;margin-top: 10px;border:1px #fff solid; border-top:transparent;margin-left: 30px;">
								  <div id="index" class="tab-pane " style="padding: 40px 30px;">
								  </div>
								 <div id="profile" class="tab-pane active" style="padding: 00px 00px;">
								 <div style="width: 100%;height: 50px;border: 1px #ccc solid;line-height: 50px;background-color: #fdfdfd;">
								 	<span style="color: #858585;margin-left: 140px;">宝贝</span>
								 	<span style="color: #858585;margin-left: 140px;">单价(元)</span>
								 	<span style="color: #858585;margin-left: 32px;">数量</span>
								 	<span style="color: #858585;margin-left: 60px;">商品操作</span>
								 	<span style="color: #858585;margin-left: 100px;">实付款(元)</span>
								 	<span style="color: #858585;margin-left: 45px;">交易状态</span>
								 	<span style="color: #858585;margin-left: 45px;">交易操作</span>
								 </div>
								 
								
								 
					<c:forEach items="${order.list}" var="ord">
								 
								 
								<c:if test="${fn:length(ord.details)==1}">
									<div style="margin-top: 30px;width: 100%;height:150px;border: 1px #addff8 solid;">
										<!-- 订单头 -->
										 <div style="width: 100%;height: 50px;background-color: #eaf9ff;vertical-align: middle;font-size: 12px;">
												<input type="checkbox" name="check" style="line-height: 50px;margin-left: 20px;"/>
												<span style="line-height: 50px;">
												<fmt:formatDate value="${ord.createTime}" pattern="yyyy-MM-dd"/>
												
												</span>
												<span style="line-height: 50px;margin-left: 20px;">订单号：10000202000${ord.oid}</span>
										 </div>	
										<!-- 订单信息 -->
											 <div >
													 <div style="float: left;width: 65%;height: 100px;">
													 <div style="float: left;width: 150px;height:100px;">
													 	<img alt="" style="width: 85px;height: 85px;margin-top: 7px" src="/pic/${ord.details[0].cartThumbnail}">
													 </div>
													 <div style="float: left;width: 200px;height:100px;">
													 	<span style="font-weight: bold;margin-top: 20px;display: block;text-align: left;">${ord.details[0].title}</span>
													 	<span style="font-weight:bold;margin-top: 10px;display: block;text-align: left;">${ord.details[0].sellPoint}</span>
													 </div>
													 <div style="float: left;width: 100px;height:100px;">
													 	<span style="font-weight: bold;margin-top: 30px;display: block;">${ord.details[0].price}</span>
													 </div>
													 <div style="float: left;width: 40px;height:100px;">
													 	<span style="font-weight: bold;margin-top: 30px;display: block;">${ord.details[0].pnum}</span>
													 </div>
													 <div style="float: left;width:150px;height:100px;">
													 	<dl style="float: right;margin-right: 50px;margin-top: 20px;">退款/退货<br />投诉卖家<br>退运保险</dl>
													 </div>
											 </div>	
										<!-- 订单后缀 -->	 
											 <div style="float: left;border-left: 1px #addff8 solid;width: 11%;height:100px;text-align: center;">
											 	<span style="font-weight: bold;margin-top: 30px;display: block;">${ord.sumtotal}</span>
											 	<dl>(含运费:00)</dl>
											 </div>
											 <div style="float: left;border-left: 1px #addff8 solid;width: 11%;height:100px;text-align: center ;">
											 	<dl style="margin-top: 30px;">卖家已发货</dl>
											 	<dl>订单详情</dl>
											 	<dl>查看物流</dl>
											 </div>
											 <div style="float: left;border-left: 1px #addff8 solid;width: 11%;height:100px;text-align: center ;">
											 	<dl style="margin-top: 30px;">还有9天10时4分</dl>
											 	<button style="color:#fff;background-color: #65b5ff;border: 0px;padding: 4px;margin-top: 5px;margin-top: 5px;">确认收货</button>
											 </div>
											</div>
									</div>
								</c:if>
								 
							 <c:if test="${fn:length(ord.details)>1}">
							 	<c:forEach items="${ord.details}" var="de" varStatus="status">
							 	
									<div style="${status.index==0?'margin-top:30px;':''}width: 100%;${status.index==0?'height:150px;':'height:100px;'}border: 1px #addff8 solid;">
										<!-- 订单头 -->
										<c:if test="${status.index==0}">
										<div style="width: 100%;height: 50px;background-color: #eaf9ff;vertical-align: middle;font-size: 12px;">
												<input type="checkbox" name="check" style="line-height: 50px;margin-left: 20px;"/>
												<span style="line-height: 50px;">
												<fmt:formatDate value="${ord.createTime}" pattern="yyyy-MM-dd"/>
												
												</span>
												<span style="line-height: 50px;margin-left: 20px;">订单号：10000202000${ord.oid}</span>
										 </div>	
										</c:if>
										 
										<!-- 订单信息 -->
											 <div >
													 <div style="float: left;width: 65%;height: 100px;">
													 <div style="float: left;width: 150px;height:100px;">
													 	<img alt="" style="width: 85px;height: 85px;margin-top: 7px" src="/pic/${de.cartThumbnail}">
													 </div>
													 <div style="float: left;width: 200px;height:100px;">
													 	<span style="font-weight: bold;margin-top: 20px;display: block;text-align: left;">${de.title}</span>
													 	<span style="font-weight:bold;margin-top: 10px;display: block;text-align: left;">${de.sellPoint}</span>
													 </div>
													 <div style="float: left;width: 100px;height:100px;">
													 	<span style="font-weight: bold;margin-top: 30px;display: block;">${de.price}</span>
													 </div>
													 <div style="float: left;width: 40px;height:100px;">
													 	<span style="font-weight: bold;margin-top: 30px;display: block;">${de.pnum}</span>
													 </div>
													 <div style="float: left;width:150px;height:100px;">
													 	<dl style="float: right;margin-right: 50px;margin-top: 20px;">退款/退货<br />投诉卖家<br>退运保险</dl>
													 </div>
											 </div>	
										<!-- 订单后缀 -->	 
											 <c:if test="${status.index==0}">
											 <div style="float: left;border-left: 1px #addff8 solid;width: 11%;height:100px;text-align: center;">
											 	<span style="font-weight: bold;margin-top: 30px;display: block;">${ord.sumtotal}</span>
											 	<dl>(含运费:00)</dl>
											 </div>
											 </c:if>
											 <c:if test="${status.index>0}">
											 <div style="float: left;border-left: 1px #addff8 solid;width: 11%;height:100px;text-align: center;">
											 	
											 </div>
											 </c:if>
											 <div style="float: left;border-left: 1px #addff8 solid;width: 11%;height:100px;text-align: center ;">
											 	<dl style="margin-top: 30px;">卖家已发货</dl>
											 	<dl>订单详情</dl>
											 	<dl>查看物流</dl>
											 </div>
											 <div style="float: left;border-left: 1px #addff8 solid;width: 11%;height:100px;text-align: center ;">
											 	<dl style="margin-top: 30px;">还有9天10时4分</dl>
											 	<button style="color:#fff;background-color: #65b5ff;border: 0px;padding: 4px;margin-top: 5px;margin-top: 5px;">确认收货</button>
											 </div>
											 
											</div>
									</div>
							 	</c:forEach>
							 </c:if>
					 </c:forEach>
								 
								 
								 
								
								
								 <div style="width: 100%;height: 0px;padding: 10px;">
								 	<input type="checkbox" id="checkAll">
								 	<span style="line-height: 20px;">全选</span>
								 	<input type="button" value="批量确认收货"  style="padding: 2px;border: 1px #ccc solid;background-color: #fff;color: #ccc;margin-left: 20px;"/>
								 		
								 </div>		<p style="text-align:right;margin-top: 10px;width: 100%;">
							    	<span class="fenye"> </span>共${order.pages}页，到<input type="number" min="1" max="${order.pages}" value="${order.pageNum}" id="page" style="width: 20px;margin-left: 10px;margin-right: 10px;" />页
							    	<button onclick="page()"  style="background-color: #f95555;padding: 3px;border: 0px;color: #fff;margin-left: 10px;width: 50px;border-radius:4px;">确认</button>
							    		</p>
								 </div>
						    </div>
						    </div>
</body>
</html>