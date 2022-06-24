<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/sanitize.css" >
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/model.css" >
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/record/record_view.css">
<title>famiTy 記録詳細画面</title>
</head>
<body>
<div class="container">
	<%@ include file="../top/common.jsp"%>
	<main>
		<strong><span id="today"></span></strong><br>

		<c:forEach var="e" items="${ucList}" varStatus="status">
			<table class="tab-panel" align="left">
			<input type="hidden" class="partner_id" id="partner_id${status.index}" value="${e.partner_id}">

				<tr class="tab-group">
					<td class="tab" id="${status.index}" onclick="tabClick()" >
	    			<img src="<%= request.getContextPath() %>/image/level1.png"><br>${e.name}
					</td>
				</tr>
			</table>

			<div class="panel" id="${status.index}">
			<input type="hidden" id="today"  value="${count}" onclick="todayRecord()">

			<!-- 状態文 -->
			<div>
				<input type = "text" id="text" name = "detail" placeholder = "${e.name}の状態 ex) 妊婦健診いってきたよ！" class="text" value="">
			</div>

			<!-- 体温・体重 -->
			<div>
				<label>体重(kg)</label><input type = "number" class="number" id="weight" name = "weight" min = "0" max = "200" step = "0.1" value =" ${e.weight}">
				<label>体温(℃)</label><input type = "number" class="number" id="body_temparture" name = "body_temparture" min = "30" max = "50" step = "0.1" value ="${e.body_temparture }">
			</div>
			</div>
		</c:forEach>
    </main>
</div>

<script defer src="<%= request.getContextPath() %>/js/record/record_view.js"></script>
</body>
</html>