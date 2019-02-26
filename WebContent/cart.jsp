<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bakery.bean.Item"%>
<%@ page import="java.util.ArrayList"%>
<%
	@SuppressWarnings("unchecked")
	ArrayList<Item> cart = (ArrayList<Item>)session.getAttribute("cart");

	int total = 0;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>World Bakery</title>
</head>
<body>
<div align="center">
	<h1><img src="img/TopImg.png" width="800" height="400" alt="logo" /></h1>
	<h2>ORDER SUMARRY</h2>
		<table width="650" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd" summary="カート一覧">
			<tr>
				<th width="150" bgcolor="#000000"><font color="#FFFFFF">BREAD</font></th>
				<th width="150" bgcolor="#000000"></th>
				<th width="120"align="center" bgcolor="#000000"><font color="#FFFFFF">PRICE ¥</font></th>
				<th width="120" bgcolor="#000000"></th>
			</tr>
<%
	for(int i = 0; i < cart.size(); i++){
	    Item item = cart.get(i);
	    total = total + item.getItemPrice();
%>
			<tr>
				<td align="center"><img src="<%=item.getItemImage()%>" width="200" height="200" alt="<%=item.getItemEnglishName()%>" /></td>
				<td align="center"><%=item.getItemEnglishName() %><br /><%=item.getItemJapaneseName() %></td>
				<td align="center"><%=item.getItemPrice() %></td>
				<td align="center"><form action="world-bakery" method="post">
				<input type="submit" value="Remove" />
				<input type="hidden" name="act" value="remove" />
				<input type="hidden" name="remove" value="<%=i %>" />
				</form></td>
			</tr>
<%
	}
%>
		<tr>
			<th width="150" bgcolor="#000000"><font color="#FFFFFF">TOTAL</font></th>
			<th width="150" bgcolor="#000000"></th>
			<th width="120" align="center" bgcolor="#000000"><font color="#FFFFFF"><strong>¥ <%=total %></strong></font></th>
			<th width="120" bgcolor="#000000"></th>
		</tr>
		</table>
		<form action="world-bakery" method="post">
			<p>Press the button below to proceed to purchase↓↓<br />
			購入手続きに進む↓↓</p>
			<input type="submit" value = "Proceed to Purchase" />
			<input type="hidden" name="act" value="for_order" />
		</form>
		<p>Press the button below to continue shopping↓↓<br />
		買い物を続ける↓↓</p>
		<a href="world-bakery">Continue Shopping</a>
</div>
</body>
</html>