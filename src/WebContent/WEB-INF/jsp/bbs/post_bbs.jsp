<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/sanitize.css" >
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/bbs/post_bbs.css" >
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>famiTy 掲示板投稿</title>
</head>
<body>
<div class="container">
	<%@ include file="../top/common.jsp"%>ヘッダー、ハンバーガーメニューのインクルード
	<main>
		<div class="post_bbs">
			<form action="/MaternityApp/PostBbsServlet" method="POST">
				Title<br>
				<input type="text" class="title" id="title" name="title"><br>
				本文<br>
				<textarea class="body" id="body" name="body" rows="4" cols="40"></textarea><br>

				<input type="submit" id="submit" value="投稿する" onclick="goAjax()">
			</form>
		</div>
		<a href="/MaternityApp/RecordViewTopServlet"><img src="./image/back_botton.png" width="50px" height="50px"></a>
    </main>
</div>


</body>

<script>
/* 打ち込んだ情報の取得 */
let titlel = document.getElementById('title').value;
let body = document.getElementById('body').value;
let postData = {title:title,
				body:body}

/*非同期処理開始*/

$.ajaxSetup({scriptCharset:'utf-8'});
$.ajax({

    /*どのサーブレットに送るか*/
    url: '/MaternityApp/PostBbsServlet',

    /*どのメソッドを使用するか*/
    type:"POST",

   /* 受け取るデータのタイプ*/
    dataType:"text",

   /* 何をサーブレットに飛ばすか（変数を記述）*/
    data: postData,

    /*この下の２行はとりあえず書いてる（書かなくても大丈夫？）*/
    processDate:false,
    timeStamp: new Date().getTime()

/*非同期通信が成功したときの処理*/
}).done(function(data) {

	/*成功した時の処理を書く*/
    if (data=='success'){
        alert('登録に成功しました。');
    }else{
    	alert('登録に失敗しました')}
    }
})
 /* 非同期通信が失敗したときの処理*/
     .fail(function() {
        /*失敗した時の処理を書く*/
        alert('失敗');
      });
}


</script>
</html>