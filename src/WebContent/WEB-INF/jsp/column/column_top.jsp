<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ include file="../top/common.jsp"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/sanitize.css" >
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/column/column_top.css" >

<title>famiTy コラムジャンル一覧</title>
</head>

<body>

<div class="genreitiran">コラム ジャンル一覧 </div>


<div class="siro">
<span>
<br>
</span>
<c:forEach var="e" items="${list}" > <%-- list=column.genreというテーブルが入ったarraylist（サーブレットで決めた）　　forEach回るごとに一個づつeに入る--%>
<div class="genre"><a href="ColumnArticleListServlet?column_genre_id=${e.column_genre_id}">${e.column_genre_id},${e.name}</a></div>
</c:forEach>
</div>

</body>

</html>