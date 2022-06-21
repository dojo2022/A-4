<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/sanitize.css" >
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/column/column_top.css" >

<title>コラム　ジャンル一覧</title>
</head>


<body>

<c:forEach var="e" items="${list}" > <%-- list=column.genreというテーブルが入ったarraylist（サーブレットで決めた）　　forEach回るごとに一個づつeに入る--%>
<div class="genre"><a href="ColumnArticleListServlet?colum_genre_id=${e.column_genre_id}">${e.column_genre_id},${e.name}</a></div>

</c:forEach>

</body>

</html>