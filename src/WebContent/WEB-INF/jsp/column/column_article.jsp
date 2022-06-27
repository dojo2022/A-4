<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<title>famiTy コラム記事</title>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/sanitize.css" >
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/column/column_article.css" >

</head>
<body>
<%-- DBから取ってきたタイトルを表示する --%>
 <div class="title"> ${article.title}</div>


<%--本文を表示する。スクロール --%>
<div class="scroller">
  ${article.body}

</div>

<%-- 戻るボタン--%>
<a href="ColumnArticleListServlet?column_genre_id=${article.genre_id}"><img src="image/back_botton.png" width="90px" height="90px"></a>


</body>
</html>