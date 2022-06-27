<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/sanitize.css" >
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/bbs/bbs_top.css" >
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>famiTy 掲示板</title>
</head>
<body>
<div class="container">
	<%@ include file="../top/common.jsp"%>
	<main>
		<h1>掲示板</h1>
		<div class ="bbs">
			<div class="search">
				<form action="/MatnernityApp/BbsServlet" method="POST">
					<input type="search" name="search" placeholder="キーワードを入力">
					<input type="submit" name="submit" value="検索">
				</form>
			</div>

			<div class ="hit_posts">
				<p id="hit">ヒット件数は：</p>
			</div>

			<div class="sort_filter">
				<select id="sort_filter" name="sort_filter">
					<option value="">すべて</option>
					<option value="heart">わかる順</option>
					<option value="useful">ためになった順</option>
					<option value="week">同じ周期のパパママ</option>
					<option value="gender">性別
				</select>
			</div>

			<div class="bbs_table" style=" overflow-y:scroll; overflow-x:hidden;">
				<table border="1">
					<c:forEach var="e" items="${pList}">
					<tr>
						<td rowspan="2">${e.title}</td>
						<td>${e.week}週目の</td>
						<td>${e.gender}</td>
					</tr>
					<tr>
						<td colspan="2">${e.nickname}</td>
					</tr>
					<tr>
						<td colspan="3">${e.body}</td>
					</tr>
					<tr>
						<td></td>
						<td>${e.heart}</td>
						<td>${e.useful}</td>
					</tr>
					</c:forEach>
				</table>
			</div>
			<p>ページネーション</p>
			<a href="/MaternityApp/PostBbsServlet"><img src="./image/postpage_button.png"></a>
		</div>
    </main>
</div>


</body>
</html>