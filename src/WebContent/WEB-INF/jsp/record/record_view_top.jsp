<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/sanitize.css" >
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/model.css" >
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/record/record_view_top.css" >
<title>famiTy 記録閲覧</title>

<link rel="icon" href="<%= request.getContextPath() %>/image/back_botton.png">
</head>
<body>
<div class="container">
	<%@ include file="../top/common.jsp"%>ヘッダー、ハンバーガーメニューのインクルード
	<main>
		<div class="wrapper">
    		<!-- xxxx年xx月を表示 -->
    		<h1 id="header"></h1>

    		<!-- ボタンクリックで月移動 -->
    		<div id="next-prev-button">
        		<button id="prev" onclick="prev()">‹</button>
        		<button id="next" onclick="next()">›</button>
    		</div>

    		<!-- カレンダー -->
    		<div id="calendar"></div>
    		<div id="test"></div>
    		<input type="hidden" id="record_days">
		</div>
    </main>
</div>

</body>
<script defer src="<%= request.getContextPath() %>/js/record/record_view_top.js"></script>

</html>