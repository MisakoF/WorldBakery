<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bakery.bean.Item"%>
<%@ page import="java.util.ArrayList"%>
<%
	@SuppressWarnings("unchecked")
	ArrayList<Item> table_items = (ArrayList<Item>)session.getAttribute("table_items");
	@SuppressWarnings("unchecked")
	ArrayList<Item> cart_items = (ArrayList<Item>)session.getAttribute("cart");

	int cart_size = 0;
	if (cart_items != null) {
		cart_size = cart_items.size();
	}
	String message = "";
	if (request.getAttribute("no_item") != null) {
		message = "No item";
	}
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
<p>
You can search for breads by country and purchase them right then!<br />
Select a country from below<br />
世界のパンを検索、購入できます。<br />
国名を選択してください。↓↓↓
</p>
	<form action="world-bakery" method="post">
	<table summary="検索">
		<tr>
			<td>Country</td>
			<td>
				<select name="country">
					<option value="austria" selected="selected">Austria</option>
					<option value="denmark">Denmark</option>
					<option value="france">France</option>
					<option value="germany">Germany</option>
					<option value="india">India</option>
					<option value="italy">Italy</option>
					<option value="japan">Japan</option>
					<option value="russia">Russia</option>
					<option value="uk">UK</option>
					<option value="usa">USA</option>
				</select>
			</td>
			<td>Keyword</td>
			<td><input type="text" name="keyword" size="20" value="" /></td>
			<td>
				<input type="submit" name="search" value="Search" />
				<input type="hidden" name="act" value="search" />
			</td>
		</tr>
	</table>
	</form>
	<h2>ITEMS</h2>
	<table width="540" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd" summary="選択カテゴリー商品">
		<tr>
			<th width="120" bgcolor="#000000"></th>
			<th align="center" bgcolor="#000000"><font color="#FFFFFF">BREAD ・ PRICE ¥</font></th>
			<th width="120" bgcolor="#000000"></th>
		</tr>
<%
	if(table_items != null){
		for(int i=0; i < table_items.size(); i++){
			Item item = table_items.get(i);
%>
		<tr>
			<td><img src="<%=item.getItemImage()%>" width="200" height="200" alt="<%=item.getItemEnglishName()%>" /></td>
			<td align="center"><%=item.getItemEnglishName() %><br />
			<%=item.getItemJapaneseName()%><br />
			<%=item.getItemPrice()%></td>
			<td align="center"><form action="world-bakery" method="post">
			<input type="submit" value="Add to cart"  />
			<input type="hidden" name="act" value="add" />
			<input type="hidden" name="id" value="<%=item.getItemID() %>" />
			<input type="hidden" name="ename" value="<%=item.getItemEnglishName() %>" />
			<input type="hidden" name="jname" value="<%=item.getItemJapaneseName() %>" />
			<input type="hidden" name="price" value="<%=item.getItemPrice() %>" />
			<input type="hidden" name="image" value="<%=item.getItemImage() %>" />
			</form></td>
		</tr>
<%
		}
	}
%>
	</table>
	<p></p>
	<table width="400" border="0" cellpadding="0" cellspacing="0" summary="カート確認">
		<tr>
			<td><font size="5"><%= cart_size %> items in your cart</font></td>
			<td width="160" align="right">
				<form action="world-bakery" method="post">
					<input type="submit" value="check your shopping cart" />
					<input type="hidden" name="act" value="check" />
				</form>
			</td>
		</tr>
	</table>
	</div>
</body>
</html>