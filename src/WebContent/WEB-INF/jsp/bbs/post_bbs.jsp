<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://unpkg.com/sanitize.css" >
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/bbs/post_bbs.css" >
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<title>famiTy 掲示板投稿</title>
</head>
<body>
<div class="container">
	<%@ include file="../top/common.jsp"%>
	<main style="margin-top:50px;">
		<div class="post_bbs">
			<form action="/MaternityApp/PostBbsServlet" method="POST">
				Title<br>
				<input type="text" required="required" class="form-control" id="title" name="title"><br>
				本文<br>
				<textarea required class="form-control"  id="body" name="body" rows="10"></textarea><br>
				<div class="d-grid gap-2 d-md-flex justify-content-md-end">
					<input type="button" id="button" class="btn btn-danger"  value="投稿する" onclick="goAjax()" >
				</div>
			</form>
		</div>
		<a href="/MaternityApp/BbsServlet"><img src="./image/back_botton.png" width="50px" height="50px"></a>
    </main>

</div>

</body>


<script>
function goAjax(){
/* 打ち込んだ情報の取得 */
let title = document.getElementById('title').value;
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
        window.location.href = '/MaternityApp/BbsServlet';
    }else{
    	alert('登録に失敗しました');
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