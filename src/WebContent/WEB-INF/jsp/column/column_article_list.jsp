<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/sanitize.css" >
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/column/column_article_list.css" >
<title>famiTy コラム一覧</title>
</head>
<body>

<c:forEach var="e" items="${list}" >
<div class="title"><a href="ColumnArticleServlet?column_id=${e.column_id}">${e.title}</a></div>
</c:forEach>

<a href="ColumnSevlet"><img src="image/back_botton.png" width="90px" height="90px"></a>

</body>
</html>