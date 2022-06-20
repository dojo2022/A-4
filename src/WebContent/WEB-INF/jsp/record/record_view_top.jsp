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
		</div>
    </main>
</div>

<script src="<%= request.getContextPath() %>/js/model.js">←ここにjavascriptのファイル指定</script>
</body>
</html>