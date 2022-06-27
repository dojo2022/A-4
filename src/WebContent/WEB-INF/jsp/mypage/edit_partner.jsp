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
            <ul class="partner-group nav-tabs">
				<c:forEach var="p" items="${partnerList}" >
                <li class="partner nav-item">${p.name}</li>
                </c:forEach>
                <li class="partner add_partner btn"><a class="bi bi-person-plus-fill" href="AddPartnerServlet"></a></li>
            </ul>
            <!--タブを切り替えて表示するコンテンツ-->
            <div class="record-group">
            	<c:forEach var="p" items="${partnerList}" >
                <div class="record ">
                <h2 class="meter_h2">家族メーター設定項目</h2>
                <form style="margin:0px;">
	                <div class="row">
	                <div class="input-group mb-3 " style="width:20em;">
					  <span class="input-group-text" id="basic-addon1">パートナー名</span>
					  <input type="text" class="form-control" name="partner_name" id="partner_name" placeholder="パパ" >
					</div>
					<div class="input-group mb-3 col-md-2" style="width:20em;">
					  <span class="input-group-text" id="basic-addon1">パートナー属性</span>
					  <input type="text" class="form-control" name="partner_name" id="partner_name" placeholder="パパ" >
					</div>
					</div>

                	<table class="table table-borderless">
                		<tbody>
						    <tr>
						      <td><div class="form-check form-switch">
									  <input class="appetite form-check-input" type="checkbox" value="" id="appetite" <c:if test="${p.appetite ==1}" >checked</c:if>>
									  <label  for="appetite">食欲</label>
								  </div></td>
							 <td><div class="form-check form-switch">
									  <input class="sleepiness form-check-input" type="checkbox" value="" id="sleepiness" <c:if test="${p.sleepiness ==1}" >checked</c:if>>
									  <label  for="sleepiness">眠気</label>
								</div></td>
							 <td><div class="form-check form-switch">
									  <input class="humor form-check-input" type="checkbox" value="" id="humor" <c:if test="${p.humor ==1}" >checked</c:if>>
									  <label  for="humor">期限</label>
								</div></td>
							<td><div class="form-check form-switch">
									  <input class="nausea form-check-input" type="checkbox" value="" id="nausea" <c:if test="${p.nausea ==1}" >checked</c:if>>
									  <label  for="nausea">吐き気</label>
								</div></td>
						    </tr>
						    <tr>
						      <td><div class="form-check form-switch">
									  <input class="stress form-check-input" type="checkbox" value="" id="stress" <c:if test="${p.stress ==1}" >checked</c:if>>
									  <label  for="stress">ストレス</label>
								  </div></td>
							 <td><div class="form-check form-switch">
									  <input class="dizziness form-check-input" type="checkbox" value="" id="dizziness" <c:if test="${p.dizziness ==1}" >checked</c:if>>
									  <label  for="dizziness">めまい</label>
								</div></td>
							 <td><div class="form-check form-switch">
									  <input class="fatigue form-check-input" type="checkbox" value="" id="fatigue" <c:if test="${p.fatigue ==1}" >checked</c:if>>
									  <label  for="fatigue">疲労</label>
								</div></td>
							<td><div class="form-check form-switch">
									  <input class="stiff_shoulder form-check-input" type="checkbox" value="" id="stiff_shoulder" <c:if test="${p.stiff_shoulder ==1}" >checked</c:if>>
									  <label  for="stiff_shoulder">肩こり</label>
								</div></td>
						    </tr>
						    <tr>
						      <td><div class="form-check form-switch">
									  <input class="headache form-check-input" type="checkbox" value="" id="headache" <c:if test="${p.headache ==1}" >checked</c:if>>
									  <label  for="headache">頭痛</label>
								  </div></td>
							 <td><div class="form-check form-switch">
									  <input class="backache form-check-input" type="checkbox" value="" id="backache" <c:if test="${p.backache ==1}" >checked</c:if>>
									  <label  for="backache">腰痛</label>
								</div></td>
							 <td><div class="form-check form-switch">
									  <input class="stomach_ache form-check-input" type="checkbox" value="" id="stomach_ache" <c:if test="${p.stomach_ache ==1}" >checked</c:if>>
									  <label  for="stomach_ache">腹痛</label>
								</div></td>
							<td><div class="form-check form-switch">
									  <input class="feeling form-check-input" type="checkbox" value="" id="feeling" <c:if test="${p.feeling ==1}" >checked</c:if>>
									  <label  for="feeling">気分</label>
								</div></td>
						    </tr>
						    <tr>
						      <td><div class="form-check form-switch">
									  <input class="tidying form-check-input" type="checkbox" value="" id="tidying" <c:if test="${p.tidying ==1}" >checked</c:if>>
									  <label  for="tidying">お片付け</label>
								  </div></td>
							 <td><div class="form-check form-switch">
									  <input class="self_assertion form-check-input" type="checkbox" value="" id="self_assertion" <c:if test="${p.self_assertion ==1}" >checked</c:if>>
									  <label  for="self_assertion">イヤイヤ</label>
								</div></td>
							 <td><div class="form-check form-switch">
									  <input class="poop form-check-input" type="checkbox" value="" id="poop" <c:if test="${p.poop ==1}" >checked</c:if>>
									  <label  for="poop">うんち</label>
								</div></td>
							<td><div class="form-check form-switch">
									  <input class="tooth_brushing form-check-input" type="checkbox" value="" id="tooth_brushing" <c:if test="${p.tooth_brushing ==1}" >checked</c:if>>
									  <label  for="tooth_brushing">歯磨き</label>
								</div></td>
						    </tr>
                	</table>
                	</form>
                </div>
                </c:forEach>
            </div>
         </div>
    </main>
</div>

<script defer src="<%= request.getContextPath() %>/js/mypage/edit_partner.js"></script>
<script>
jQuery(function($){
	$(".partner:first").addClass('is-active');
	$(".record:first").addClass('is-show');
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