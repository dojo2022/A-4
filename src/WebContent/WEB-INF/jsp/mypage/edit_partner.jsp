<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/sanitize.css" >
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/mypage/edit_partner.css" >
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<title>ページのタイトル</title>
</head>
<body>
<div class="container">
	<%@ include file="../top/common.jsp"%>ヘッダー、ハンバーガーメニューのインクルード
	<main>
		 <div class="partner-record">
            <!--タブ-->
            <ul class="partner-group">
                <li class="partner partner-A is-active">partner-A</li>
                <li class="partner partner-B">partner-B</li>
                <li class="partner partner-C">partner-C</li>
            </ul>

            <!--タブを切り替えて表示するコンテンツ-->
            <div class="record-group">
                <div class="record partner-A is-show">Content-A</div>
                <div class="record partner-B">Content-B</div>
                <div class="record partner-C">Content-C</div>
            </div>
         </div>
    </main>
</div>

<script defer src="<%= request.getContextPath() %>/js/mypage/edit_partner.js"></script>
<script>
jQuery(function($){
	$('.partner').click(function(){
		$('.is-active').removeClass('is-active');
		$(this).addClass('is-active');
		$('.is-show').removeClass('is-show');
        // クリックしたタブからインデックス番号を取得
		const index = $(this).index();
        // クリックしたタブと同じインデックス番号をもつコンテンツを表示
		$('.record').eq(index).addClass('is-show');
	});
});</script>
</body>
</html>