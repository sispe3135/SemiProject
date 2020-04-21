<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	JSONObject payHistory = (JSONObject)request.getAttribute("payHistory");
	System.out.println("payHistory.jsp에서 받은 payHistory : " + payHistory);	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="resources/css/payHistory.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
		$(function(){
			
			var pay = <%=payHistory%>;
			var partner_order_id = pay.partner_order_id;
			var partner_user_id = pay.partner_user_id;
			var payment_method_type = pay.payment_method_type;
			var amount = pay.amount;
			var amount_total = amount.total;
			var amount_tax_free = amount.tax_free;
			var item_name = pay.item_name;
			var quantity = pay.quantity;
			var created_at = pay.created_at;
			
			
			$("#partner_order_id").val(partner_order_id);
			$("#partner_user_id").val(partner_user_id);
			$("#payment_method_type").val(payment_method_type);
			$("#amount_total").val(amount_total);
			$("#amount_tax_free").val(amount_tax_free);
			$("#item_name").val(item_name);
			$("#quantity").val(quantity+"개");
			$("#created_at").val(created_at);
			
			
		});
	</script>
</head>
<body>

	<%-- <div><%=payHistory %></div> --%>
	
	<div class="list" >가맹점 주문번호 : <input type="text" id = "partner_order_id" readonly = "readonly"/></div>
	<div class="list" >회원 아이디 : <input type="text" id = "partner_user_id" readonly = "readonly"/></div>
	<div class="list" >결제 방법 : <input type="text" id = "payment_method_type" readonly = "readonly"/></div>
	<div class="list" >결제 금액 : <input type="text" id = "amount_total" readonly = "readonly"/></div>
	<div class="list" >부가세 : <input type="text" id = "amount_tax_free" readonly = "readonly"/></div>
	<div class="list" >상품명 : <input type="text" id = "item_name" readonly = "readonly"/></div>
	<div class="list" >상품 수량 : <input type="text" id = "quantity" readonly = "readonly"/></div>
	<div class="list" >결제일 : <input type="text" id = "created_at" readonly = "readonly"/></div>

</body>
</html>