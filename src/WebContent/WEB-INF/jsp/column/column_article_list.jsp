<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../top/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/sanitize.css" >
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/column/column_article_list.css" >
<title>famiTy コラム一覧</title>
</head>


<body>

<h2><span></span></h2>

<c:forEach var="e" items="${list}" >
<div class="title"><a href="ColumnArticleServlet?column_id=${e.column_id}">${e.title}</a></div>
</c:forEach>

<a href="ColumnServlet"><img src="image/back_botton.png" width="50px" height="50px" style="margin-left:100px;"></a>


</body>
</html>