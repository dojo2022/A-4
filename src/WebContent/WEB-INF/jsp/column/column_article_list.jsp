<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:forEach var="e" items="${list}" >
<div class="genre"><a href="ColumnArticleServlet?column_id=${e.column_id}">${e.title}</a></div>

</c:forEach>

<a href="column_top.jsp"><img src="back_botton.png" width="100px" height="100px"></a>

</body>
</html>