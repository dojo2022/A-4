<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="<%= request.getContextPath() %>/image/back_botton.png">
</head>
<body>
<%@ include file="../top/common.jsp"%>
<h2>ヘルプ</h2>
<ul>
	<li><a href="#home">ホーム</a></li>
	<li><a href="#input_record">記録をつける</a></li>
	<li><a href="#record_view">記録閲覧</a></li>
	<li><a href="#quest">育児クエスト</a></li>
	<li><a href="#hurima">フリマ</a></li>
	<li><a href="#column">コラム</a></li>
	<li><a href="#post">掲示板</a></li>
	<li><a href="#mypage">マイページ</a></li>
</ul>
<div align="center">
<h4 id="home">ホーム</h4>
	<p>ホームの操作方法が表示されます。</p>
<hr>

<h4 id="input_record">記録をつける</h4>
	<p>記録入力の操作方法が表示されます。</p>
<hr>

<h4 id="record_view">記録閲覧</h4>
	<p>記録閲覧の操作方法が表示されます。</p>
<hr>

<h4 id="quest">育児クエスト</h4>
	<p>育児クエストの操作方法が表示されます。</p>
<hr>

<h4 id="hurima">フリマ</h4>
	<p>フリマの操作方法が表示されます。</p>
<hr>

<h4 id="column">コラム</h4>
	<p>コラムの操作方法が表示されます。</p>
<hr>

<h4 id="post">掲示板</h4>
	<p>掲示板の操作方法が表示されます。</p>
<hr>

<h4 id="mypage">マイページ</h4>
	<p>マイページの操作方法が表示されます。</p>
<hr>

</div>
</body>
</html>