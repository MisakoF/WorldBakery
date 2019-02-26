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
<%
	for(int i = 0; i < cart.size(); i++) {
		Item item = cart.get(i);
		total = total + item.getItemPrice();
	}
%>
	<h2>Total: ¥<%=total %></h2>
	<p>
		Fill your name, address, phone number and mail address in the empty boxies below and click "ODER" button.<br />
		下のフォームにお客様のお名前、ご住所、電話番号、メールアドレスを入力して、<br />
		よろしければ「注文する」ボタンを押してください。<br />
	</p>
	<form action="world-bakery" method="post" onsubmit="return check();">
	<table border='1' summary='個人情報登録'>
		<tr>
			<td align="center">Name<br />
			お名前</td>
			<td><input type="text" name="name" size="30" value="" /><br />
			e.g.: Ichiro Suzuki</td>
		</tr>
		<tr>
			<td align="center">Zip Code<br />
			郵便番号</td>
			<td><input type="text" name="zipcode" size="10"  maxlength="8" value="" />
  			<font size="-1">（郵便番号検索は <a href="http://www.post.japanpost.jp/zipcode/index.html" target="_blank">検索</a>）</font><br />
			e.g.: 123-4567</td>
		</tr>
		<tr>
			<td align="center">Address<br />
			住所</td>
			<td><input type="text" name="address" size="80" value="" /><br />
			e.g.: 1-1-1, ●●●, ●●●, Tokyo, Japan</td>
		</tr>
		<tr>
			<td align="center">Phone number<br />
			電話番号</td>
			<td><input type="text" name="phone" size="20" maxlength="13" value="" /><br />
			e.g.: 090-1234-5678</td>
		</tr>
		<tr>
			<td align="center">Mail address<br />
			メールアドレス</td>
			<td><input type="text" name="mail" size="70" value="" /></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			Please check your order carefully before finalize it.<br />
			↓↓上記の内容で問題なければ、注文を確定いたします↓↓<br />
			<input type="submit" value="ORDER"/>
			<input type='hidden' name = 'act' value='order' />
			</td>
		</tr>
		</table>
	</form>
	<p></p>
	<p><a href="world-bakery?act=check">Return to Shopping Cart</a></p>
</div>
</body>
</html>