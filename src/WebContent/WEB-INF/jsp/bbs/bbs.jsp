<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/sanitize.css" >
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/bbs/bbs.css" >
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>famiTy 掲示板本文</title>
<link rel="icon" href="<%= request.getContextPath() %>/image/back_botton.png">
</head>
<body>
<div class="container">
	<%@ include file="../top/common.jsp"%>
	<main>
		<div class="posted_bbs">
			<h2>title</h2>
			<h3>nickname</h3>
			<div class ="posted_body">
				<p>body</p>
			</div>

			<div class="heart">
				<input type="button" id="heart">わかるボタン
			</div>
			<div class="useful">
				<input type="button" id="useful">役立つボタン
			</div>
		</div>

		<a href="/MaternityApp/RecordViewTopServlet"><img src="./image/back_botton.png" width="50px" height="50px"></a>
    </main>
</div>


</body>
</html>