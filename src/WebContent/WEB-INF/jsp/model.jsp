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
	<%@ include file="top/common.jsp"%>ヘッダー、ハンバーガーメニューのインクルード
	<main>
	メインコンテンツ（ここ書き換えて）
    </main>
</div>

<script src="<%= request.getContextPath() %>/js/model.js">←ここにjavascriptのファイル指定</script>
</body>
</html>