<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://unpkg.com/sanitize.css" >
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/bbs/bbs_top.css" >
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>famiTy 掲示板</title>
</head>
<body>
<%@ include file="../top/common.jsp"%>
<main style="margin-top:50px;">
	<div class="container">
		<h1>掲示板</h1>
		<div class ="bbs">
			<div class="search">
				<form action="/MatnernityApp/BbsServlet" method="POST">
					<input type="text" name="search" id="searchtext" placeholder="キーワードを入力"  style="width:400px; height:50px;">
					<input type="button" name="button"  value="検索" onclick="goAjax()" style="width:70px; height:50px; margin-left:1rem;">
				</form>
			</div>

			<!-- <div class ="hit_posts">
				<p id="hit">ヒット件数は：</p>
			</div> -->

			<div class="sort_filter">
				<select id="sort_filter" name="sort_filter" style="margin-left:930px;">
					<option value="">すべて</option>
					<option value="heart">わかる順</option>
					<option value="useful">ためになった順</option>
					<option value="week">同じ周期のパパママ</option>
					<option value="gender">性別
				</select>
			</div>

			<div id="p_table" style="width:1100px; height:300px; overflow-y:scroll; overflow-x:hidden;">
				<c:forEach var="e" items="${pList}" varStatus="status" >
					<table class ="table table-borderless" id ="table" border="1">
						<tr>
							<td rowspan="2"><big><Strong>${e.title}</Strong></big></td>
							<td colspan="2" style="text-align:right;">${e.week}週目の${e.gender}</td>
						</tr>
						<tr>
							<td colspan="2"  style="text-align:right;"><big><Strong>${e.nickname}</Strong></big></td>
						</tr>
						<tr>
							<td colspan="3"><big>${e.body}</big></td>
						</tr>
						<tr>
							<td class="heart_useful"  style="text-align:right;"><img src="./image/heart.png" style="width:20px; height:20px;">${e.heart}</td>
							<td class="heart_useful"  style="text-align:center;"><img src="./image/useful.png" style="width:30px; height:30px;">${e.useful}</td>
						</tr>
					</table>

				</c:forEach>
			</div>
			<p></p>
			<a href="/MaternityApp/PostBbsServlet" style="width:20px; height:20px; margin-left:950px;"><img src="./image/postpage_button.png" class="rounded float-end"></a>
		</div>
	</div>
</main>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</body>

<script type="text/javascript">

function goAjax(){
/* 打ち込んだ情報の取得 */
let searchtext = document.getElementById('searchtext').value;
$('table').empty()

let postData = {"process":"search",
				"searchtext":searchtext}

/*非同期処理開始*/

$.ajaxSetup({scriptCharset:'utf-8'});
$.ajax({

    /*どのサーブレットに送るか*/
    url: '/MaternityApp/BbsServlet',

    /*どのメソッドを使用するか*/
    type:"POST",

   /* 受け取るデータのタイプ*/
    dataType:"json",

   /* 何をサーブレットに飛ばすか（変数を記述）*/
    data: postData,

    /*この下の２行はとりあえず書いてる（書かなくても大丈夫？）*/
    processDate:false,
    timeStamp: new Date().getTime()

/*非同期通信が成功したときの処理*/
}).done(function(data) {

	/*成功した時の処理を書く*/
	$.each(data, function(index, value){
		var tableJQ = $('#p_table');
		let $table=$('<table class ="table table-borderless" id ="table" border="1" />');
		$table.append("<tr><td rowspan='2'><big><Strong>"+value.title +"</Strong></big></td>")
		.append("<td colspan='2' style='text-align:right;'>"+value.week+"週目の"+value.gender+"</td></tr>")
		.append("<tr><td colspan='2'  style='text-align:right;'><big><Strong>" + value.nickname + "</Strong></big></td></tr>")
		.append("<tr><td colspan='3'><big>"+value.body+"</big></td></tr>")
		.append("<td  class='heart_useful'  style='text-align:right;'><img src='./image/heart.png' style='width:20px; height:20px;'>" + value.heart+"</td>")
		.append("<td  class='heart_useful'  style='text-align:center;'><img src='./image/useful.png' style='width:30px; height:30px;'>" + value.useful+"</td>")
		tableJQ.append($table)
	})

})
 /* 非同期通信が失敗したときの処理*/
     .fail(function() {
        /*失敗した時の処理を書く*/
        alert('失敗');
      });
}

</script>
</html>