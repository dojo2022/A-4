<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/sanitize.css" >
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/column/column_top.css" >

</head>
<body>
<%-- DBから取ってきたタイトルを表示する --%>

 <c:forEach var="e" items="${title}" > <!-- eていう変数に入れる -->
  ${e.title}<br>

</c:forEach>




<%--本文を表示する。スクロール --%>
<div id="body">
<table class="table" id="body" >




</a></div>
  </table>
  </div>

<%-- 戻るボタン--%>
<%-- --%>
<%-- --%>
<%-- --%>