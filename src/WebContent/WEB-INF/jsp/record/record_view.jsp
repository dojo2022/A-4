<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/sanitize.css" >
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/model.css" >それぞれのcss指定
<title>ページのタイトル</title>
</head>
<body>
<div class="container">
	<%@ include file="../top/common.jsp"%>ヘッダー、ハンバーガーメニューのインクルード
	<main>
	<input type="text" id="recordMonthDay" name="recordMonthDay">
    </main>
</div>

<script defer src="<%= request.getContextPath() %>/js/record/record_view.js"></script>
</body>
</html>