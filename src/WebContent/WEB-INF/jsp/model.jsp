<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/sanitize.css" >
<link rel="stylesheet" href="../css/weekle_report.css" >
<title>ページのタイトル</title>
</head>
<body>
<div class="container">
	<%@ include file="top/common.jsp"%>ヘッダー、ハンバーガーメニューのインクルード
	<main>
		<div class="mother_report">

		</div>
		<div class="baby_report">
		</div>
    </main>
</div>

<script src="<%= request.getContextPath() %>/js/model.js">←ここにjavascriptのファイル指定</script>
</body>
</html>