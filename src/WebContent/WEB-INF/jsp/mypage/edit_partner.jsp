<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://unpkg.com/sanitize.css" >
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/mypage/edit_partner.css" >
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<title>ページのタイトル</title>
</head>
<body>
<div class="container">
	<%@ include file="../top/common.jsp"%>ヘッダー、ハンバーガーメニューのインクルード
	<main>
		 <div class="partner-record">
            <!--タブ-->
            <ul class="partner-group btn-group">
				<c:forEach var="p" items="${partnerList}" >
                <li class="partner partner-A btn btn-secondary">${p.name}</li>
                </c:forEach>
                <li class="partner add_partner btn"><a class="bi bi-person-plus-fill" href="AddPartnerServlet"></a></li>
            </ul>
			<button type="button" class="btn btn-primary">Right</button>
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
	$(".partner:first").addClass('is-active');
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