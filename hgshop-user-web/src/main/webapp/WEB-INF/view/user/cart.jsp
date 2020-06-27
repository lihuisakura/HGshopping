<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script type="text/javascript" src="/resource/js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="/resource/js/bootstrap.min.js"></script>
<meta name="keywords" content="">
<meta name="description" content="">
		
		<style>
			
		
			progress {
				width: 300px;
				border: 1px solid #ffffff;
				background-color: #e6e6e6;
				color: #0064B4;
				/*IE10*/
			}
			
			progress::-moz-progress-bar {
				background: #FFFFFF;
			}
			
			progress::-webkit-progress-bar {
				background: #ccc;
			}
			
			progress::-webkit-progress-value {
				background: #FF7700;
			}
		</style>
		<script type="text/javascript">
		function jian(obj){
			var num=$(obj).next().val();
			var price= $(obj).parent().next().val();
			$(obj).next().val(num*1-1*1);
			$(obj).parent().next().next().children().html((num*1-1*1)*price);
			var price=0;
			$("[name=check]").each(function(i,val){
				if($(this).prop("checked")){
					price=$(this).parent().next().next().next().next().next().next().children().html()*1+price*1;
				}
			});
			$("#checkPrice").html(price);
		}
		function jia(obj){
			var num=obj.prev().val();
			var price= obj.parent().next().val();
			
			obj.prev().val(num*1+1*1);
			obj.parent().next().next().children().html((num*1+1*1)*price);
			var price=0;
			$("[name=check]").each(function(i,val){
				if($(this).prop("checked")){
					price=$(this).parent().next().next().next().next().next().next().children().html()*1+price*1;
				}
			});
			$("#checkPrice").html(price);
		}
		
		$(function(){
			$("#checkAll").change(function(){
				var num=0;
				var price=0;
				$("[name=check]").each(function(i,val){
					$(this).prop("checked",$("#checkAll").prop("checked"));
					num=num*1+1*1;
					price=$(this).parent().next().next().next().next().next().next().children().html()*1+price*1;
				});
				$("#checkNum").html(num);
				$("#checkPrice").html(price);
				
			})
			$("[name=check]").change(function(){
				var num=0;
				var price=0;
				$("[name=check]").each(function(i,val){
					if($(this).prop("checked")){
						num=num*1+1*1;
						price=$(this).parent().next().next().next().next().next().next().children().html()*1+price*1;
					}
				});
				$("#checkNum").html(num);
				$("#checkPrice").html(price);
			})
			
		})
		function order(){
			var ids= new Array();
			$("[name=check]").each(function(i,val){
				if($(this).prop("checked")){
					ids.push($(this).val());
				}
			});
			if(ids.length<=0){
				alert("请选择商品");
				return;
			}
			var address=$("[name=address]").val();
			if(null==address || address==""){
				alert("请输入您的收货地址");
				return;
			}
			var sumtotal=$("#checkPrice").html();
			if(confirm("确定进行结算，生成订单？")){
				$.post("/user/createOrder",{ids:ids,address:address,sumtotal:sumtotal},function(re){
					if(re){
						alert("订单生成成功！");
						$("#centent").load("/user/toOrder");
					}else{
						alert("订单生成失败！");
					}
				})
			}
			
		}
		
		function del(id){
			var ids=new Array();
			ids.push(id);
			if(confirm("确定将该商品移出购物车么？")){
				$.post("/user/deleteCart",{ids:ids},function(re){
					if(re){
						alert("删除成功");
						$("#centent").load("/user/toCart");
					}else{
						alert("删除失败");
					}
				})
			}
		}
		
		function delAll(){
			var ids= new Array();
			$("[name=check]").each(function(i,val){
				if($(this).prop("checked")){
					ids.push($(this).val());
				}
			});
			if(confirm("确定将选中的商品全部移出购物车么？")){
				$.post("/user/deleteCart",{ids:ids},function(re){
					if(re){
						alert("删除成功");
						$("#centent").load("/user/toCart");
					}else{
						alert("删除失败");
					}
				})
			}
		}
		
		</script>
</head>
<body >
	<div  style="width: 980px;background-color: #fff;padding: 10px">
		<div style="margin-top: 20px;width: 980px;" >
			<font style="font-size: 16px;color:#EE0000;font-weight: bold;border-bottom: 1px #F88600 solid;   padding-bottom: 14px;">全部商品 ${fn:length(cart)}</font>
			<font style="font-size: 16px;color: #060606; font-weight:bold;margin-left:10px;">|</font>
			<font style="font-size: 16px;color: #060606; font-weight:bold;margin-left:10px;">降价商品 0</font>
			<font style="font-size: 16px;color: #060606; font-weight:bold;margin-left:10px;">|</font>
			<font style="font-size: 16px;color: #060606; font-weight:bold;margin-left:10px;">库存紧张  0</font>
			<font style="font-size: 12px;color: #949494; font-weight:bold;margin-left:10px;">已选商品(不含运费)</font>
			
             <hr style=" border-style:solid;width: 980px;border-color:#DEDEDE;margin-top: 12px;"/> 
             
             <div style="margin-left: 30px;height: 25px;margin-bottom: 20px" >
				<input  type="text" name="address"  placeholder="输入您的地址进行邮寄 " style="width: 200px;height: 25px;font-size: 12px;" />
				
			</div>
             
             <font style="font-size: 12px;color: #212121;margin-left: 30px;font-weight: bold;">商品信息</font> 
             <font style="font-size: 12px;color: #212121;margin-left: 300px;font-weight: bold;">单价(元)</font> 
             <font style="font-size: 12px;color: #212121;margin-left: 100px;font-weight: bold;">数量</font>
             <font style="font-size: 12px;color: #212121;margin-left: 100px;font-weight: bold;">金额(元)</font>
             <font style="font-size: 12px;color: #212121;margin-left: 100px;font-weight: bold;">操作</font>			
             <br />
                     
			<c:forEach items="${cart}" var="ca">
			<div style="border:1px solid #ccc;height: 150px;margin-top: 20px;">
		    	<div style="float: left;width: 40px;margin-left: 20px;margin-top: 25px">
		    		<input type="checkbox" name="check" value="${ca.id}">
		    	</div>
		    	<div style="float: left;width: 100px;margin-left: 10px;margin-top: 25px">
		    		<img alt="" src="/pic/${ca.sku.cartThumbnail}" width="100px" height="100px">
		    	</div>
		    	<div style="float: left;width: 200px;margin-left: 20px;margin-top: 40px;text-align: left;">
		    		<font style="font-size: 15px;color: #1f1f1f;">${ca.sku.title}</font><br>
		    		<font style="font-size: 12px;color: #1f1f1f; ">${ca.sku.sellPoint}</font>
		    	</div>
		    	<div style="float: left;width: 150px;margin-left: 20px;margin-top: 40px;text-align: left;">
		    		<font style="font-size: 12px;color: #949494;margin-left:40px;TEXT-DECORATION: line-through; ">${ca.sku.marketPrice}</font><br>
		    		<font style="font-size: 12px;color: #1f1f1f;margin-left:40px;font-weight: bold;">${ca.sku.price}</font>
		    	</div>
		    	<div style="float: left;width: 140px;margin-left: 20px;margin-top: 40px;text-align: left;">
		    		<input type="button" onclick="jian(this)" value="-" style=" color:#333333;height:30px;width:20px;border-style:solid;margin-left:10px;"></input>
		    		<input  type="text" value="${ca.pnum}" style=" color:#333333;height:30px;width:30px;text-align:center;"></input>
		    		<input type="button" onclick="jia($(this))" value="+" style=" color:#333333;height:30px;width:20px;border-style:solid;"></input>
		    	</div>
		    	<input type="hidden" value="${ca.sku.price}">
		    	<div style="float: left;width: 100px;margin-left: 20px;margin-top: 50px;text-align: left;">
		    		<font style="font-size: 14px;color: #FD3C0D;font-weight: bold;  ">${ca.sumTotal}</font>
		    	</div>
		    	<div style="float: left;width: 100px;margin-left: 20px;margin-top: 50px;text-align: left;">
		    		<span style="float: left;"><a style="text-decoration: none;font-size: 14px;color: #1E1E1E;">移入收藏夹</a>
                          <br/><a style="text-decoration: none;font-size: 14px;color: #1E1E1E;" onclick="del(${ca.id})" >删除</a>
					</span>
		    	</div>
		   
		  	</div>
			
			</c:forEach>
		   
		  <br />
                    
		   
		  </div>
		   
		<div style="margin-top: 10px;background:#E5E5E5;height:50px;width:980px;">
				<table class="uiTable" >
								<tr >
							        <th  style="line-height:50px;" >
							        	<input id="checkAll" type="checkbox"  style="height: 14px;width: 14px;float: left;margin-top: 19px;margin-left: 10px"   />
							        <font style="font-size: 12px;color: #333333;margin-left: 20px;font-weight: bold;display: flex;">全选</font> 
									<th  style="line-height:50px;" onclick="delAll()"><font style="font-size: 12px;margin-left:20px;color: #333333; " >删除</font></th>
									<th  style="line-height:50px;"><font style="font-size: 12px;margin-left:20px;color: #333333;  ">消除失效宝贝</font></th>
									<th  style="line-height:50px;" ><font style="font-size: 12px;margin-left:20px; color: #333333;">移入收藏夹</font></th>
									<th  style="line-height:50px; " ><font style="font-size: 12px;margin-left:20px;color: #333333; ">分享</font></th>
									<th class="lastTd" colspan="2" style="line-height:50px; "><font style="font-size: 12px;margin-left:300px; ">已选商品</font><font id="checkNum" style="font-size: 18px;color:#FD3C0D;">0</font><font style="font-size: 12px;color:#333333;">件</font></th>
									<th  style="line-height:50px; " ><span style="font-size: 12px;margin-left:40px;color: #949494; ">合计(不含运费):</span>
										</th>
										<th  style="line-height:50px; " ><span style="font-size: 18px;color:#FD3C0D;" >￥</span>
										<span style="font-size: 18px;color:#FD3C0D;" id="checkPrice">0</span></th>
                                             <th  style="line-height:50px; " ><font onclick="order()" style="font-size: 20px;margin-left:23px;color: #949494; ">结算</font></th>
								</tr>

							</table>
			</div>
		
	</div>
				
		
		<div class="clear "></div>
		<div class="ng-footer ">
			<textarea class="footer-dom " id="footer-dom-02 ">
			</textarea>
			<div class="ng-fix-bar "></div>
		</div>
		
		
	</body>
</html>