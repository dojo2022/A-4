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

<title>famiTy パートナー設定</title>

<link rel="icon" href="<%= request.getContextPath() %>/image/back_botton.png">
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
                <li class="partner add_partner btn"><a class="bi bi-person-plus-fill" href="#"></a></li>
            </ul>
            <!--タブを切り替えて表示するコンテンツ-->
            <div class="record-group">
            	<c:forEach var="p" items="${partnerList}" >
                <div class="record ">
                <h2 class="meter_h2">家族メーター設定項目</h2>
                <form class="meter_form" id="meter_form" method="POST" action="/MaternityApp/EditPartnerServlet" style="margin:0px;">
	                <div class="row">
	                <div class="input-group mb-3 " style="width:20em;">
					  <span class="input-group-text" id="basic-addon1">パートナー名</span>
					  <input type="hidden" class="form-control" name="partner_id" id="partner_id" value="${p.partner_id }" >
					  <input type="text" class="form-control" name="partner_name" id="partner_name" value="${p.name }" >
					</div>
					<div class="input-group mb-3 col-md-2" style="width:20em;">
					  <span class="input-group-text" id="basic-addon1">パートナー属性</span>
					  <select class="form-select" aria-label="Default select example" id="partner_attribute">
						<c:forEach var="pa" items="${paList}" >
						  <option <c:if test="${p.attribute == pa.partner_attribute_name}" >selected</c:if> value="${pa.partner_attribute_id }">${pa.partner_attribute_name }</option>
						</c:forEach>
					  </select>
					</div>
					</div>

                	<table class="table table-borderless">
                		<tbody>
						    <tr>
						      <td><div class="form-check form-switch">
						      		  <input class="appetite form-check-input" type="checkbox" value="0" name="appetite" >
									  <input class="appetite form-check-input" type="checkbox" value="1" name="appetite" <c:if test="${p.appetite ==1}" >checked</c:if>>
									  <label  for="appetite">食欲</label>
								  </div></td>
							 <td><div class="form-check form-switch">
									  <input class="sleepiness form-check-input" type="checkbox" value="1" name="sleepiness" <c:if test="${p.sleepiness ==1}" >checked</c:if>>
									  <label  for="sleepiness">眠気</label>
								</div></td>
							 <td><div class="form-check form-switch">
									  <input class="humor form-check-input" type="checkbox" value="1" name="humor" <c:if test="${p.humor ==1}" >checked</c:if>>
									  <label  for="humor">機嫌</label>
								</div></td>
							<td><div class="form-check form-switch">
									  <input class="nausea form-check-input" type="checkbox" value="1" name="nausea" <c:if test="${p.nausea ==1}" >checked</c:if>>
									  <label  for="nausea">吐き気</label>
								</div></td>
						    </tr>
						    <tr>
						      <td><div class="form-check form-switch">
									  <input class="stress form-check-input" type="checkbox" value="1" name="stress" <c:if test="${p.stress ==1}" >checked</c:if>>
									  <label  for="stress">ストレス</label>
								  </div></td>
							 <td><div class="form-check form-switch">
									  <input class="dizziness form-check-input" type="checkbox" value="1" name="dizziness" <c:if test="${p.dizziness ==1}" >checked</c:if>>
									  <label  for="dizziness">めまい</label>
								</div></td>
							 <td><div class="form-check form-switch">
									  <input class="fatigue form-check-input" type="checkbox" value="1" name="fatigue" <c:if test="${p.fatigue ==1}" >checked</c:if>>
									  <label  for="fatigue">疲労</label>
								</div></td>
							<td><div class="form-check form-switch">
									  <input class="stiff_shoulder form-check-input" type="checkbox" value="1" name="stiff_shoulder" <c:if test="${p.stiff_shoulder ==1}" >checked</c:if>>
									  <label  for="stiff_shoulder">肩こり</label>
								</div></td>
						    </tr>
						    <tr>
						      <td><div class="form-check form-switch">
									  <input class="headache form-check-input" type="checkbox" value="1" name="headache" <c:if test="${p.headache ==1}" >checked</c:if>>
									  <label  for="headache">頭痛</label>
								  </div></td>
							 <td><div class="form-check form-switch">
									  <input class="backache form-check-input" type="checkbox" value="1" name="backache" <c:if test="${p.backache ==1}" >checked</c:if>>
									  <label  for="backache">腰痛</label>
								</div></td>
							 <td><div class="form-check form-switch">
									  <input class="stomach_ache form-check-input" type="checkbox" value="1" name="stomach_ache" <c:if test="${p.stomach_ache ==1}" >checked</c:if>>
									  <label  for="stomach_ache">腹痛</label>
								</div></td>
							<td><div class="form-check form-switch">
									  <input class="feeling form-check-input" type="checkbox" value="1" name="feeling" <c:if test="${p.feeling ==1}" >checked</c:if>>
									  <label  for="feeling">気分</label>
								</div></td>
						    </tr>
						    <tr>
						      <td><div class="form-check form-switch">
									  <input class="tidying form-check-input" type="checkbox" value="1" name="tidying" <c:if test="${p.tidying ==1}" >checked</c:if>>
									  <label  for="tidying">お片付け</label>
								  </div></td>
							 <td><div class="form-check form-switch">
									  <input class="self_assertion form-check-input" type="checkbox" value="1" name="self_assertion" <c:if test="${p.self_assertion ==1}" >checked</c:if>>
									  <label  for="self_assertion">イヤイヤ</label>
								</div></td>
							 <td><div class="form-check form-switch">
									  <input class="poop form-check-input" type="radio" value="1" name="poop" <c:if test="${p.poop ==1}" >checked</c:if>>
									  <label  for="poop">うんち</label>
								</div></td>
							<td><div class="form-check form-switch">
									  <input class="tooth_brushing form-check-input" type="checkbox" value="1" name="tooth_brushing" <c:if test="${p.tooth_brushing ==1}" >checked</c:if>>
									  <label  for="tooth_brushing">歯磨き</label>
								</div></td>
						    </tr>
                	</table>
                	<div class="row">
		            	<div class="col text-center" >
		            		<button class="regist_btn btn btn-secondary w-50" id="regist_btn">登録</button>
		            	</div>
		            </div>
                	</form>
                </div>
                </c:forEach>
                <div class="record ">
                <h2 class="meter_h2">家族メーター設定項目</h2>
                <form class="meter_form" id="meter_form" method="POST" action="/MaternityApp/EditPartnerServlet" style="margin:0px;">
	                <div class="row">
	                <div class="input-group mb-3 " style="width:20em;">
					  <span class="input-group-text" id="basic-addon1">パートナー名</span>
					  <input type="text" class="form-control" name="partner_name" id="partner_name" value="" >
					</div>
					<div class="input-group mb-3 col-md-2" style="width:20em;">
					  <span class="input-group-text" id="basic-addon1">パートナー属性</span>
					  <select class="form-select" aria-label="Default select example" id="partner_attribute">
						<c:forEach var="pa" items="${paList}" >
						  <option  value="${pa.partner_attribute_id }">${pa.partner_attribute_name }</option>
						</c:forEach>
					  </select>
					</div>
					</div>

                	<table class="table table-borderless">
                		<tbody>
						    <tr>
						      <td><div class="form-check form-switch">
						      		  <input class="appetite form-check-input" type="checkbox" value="0" name="appetite" >
									  <input class="appetite form-check-input" type="checkbox" value="1" name="appetite" >
									  <label  for="appetite">食欲</label>
								  </div></td>
							 <td><div class="form-check form-switch">
									  <input class="sleepiness form-check-input" type="checkbox" value="1" name="sleepiness" >
									  <label  for="sleepiness">眠気</label>
								</div></td>
							 <td><div class="form-check form-switch">
									  <input class="humor form-check-input" type="checkbox" value="1" name="humor" >
									  <label  for="humor">期限</label>
								</div></td>
							<td><div class="form-check form-switch">
									  <input class="nausea form-check-input" type="checkbox" value="1" name="nausea" >
									  <label  for="nausea">吐き気</label>
								</div></td>
						    </tr>
						    <tr>
						      <td><div class="form-check form-switch">
									  <input class="stress form-check-input" type="checkbox" value="1" name="stress" >
									  <label  for="stress">ストレス</label>
								  </div></td>
							 <td><div class="form-check form-switch">
									  <input class="dizziness form-check-input" type="checkbox" value="1" name="dizziness" >
									  <label  for="dizziness">めまい</label>
								</div></td>
							 <td><div class="form-check form-switch">
									  <input class="fatigue form-check-input" type="checkbox" value="1" name="fatigue">
									  <label  for="fatigue">疲労</label>
								</div></td>
							<td><div class="form-check form-switch">
									  <input class="stiff_shoulder form-check-input" type="checkbox" value="1" name="stiff_shoulder" >
									  <label  for="stiff_shoulder">肩こり</label>
								</div></td>
						    </tr>
						    <tr>
						      <td><div class="form-check form-switch">
									  <input class="headache form-check-input" type="checkbox" value="1" name="headache" >
									  <label  for="headache">頭痛</label>
								  </div></td>
							 <td><div class="form-check form-switch">
									  <input class="backache form-check-input" type="checkbox" value="1" name="backache" >
									  <label  for="backache">腰痛</label>
								</div></td>
							 <td><div class="form-check form-switch">
									  <input class="stomach_ache form-check-input" type="checkbox" value="1" name="stomach_ache" >
									  <label  for="stomach_ache">腹痛</label>
								</div></td>
							<td><div class="form-check form-switch">
									  <input class="feeling form-check-input" type="checkbox" value="1" name="feeling" >
									  <label  for="feeling">気分</label>
								</div></td>
						    </tr>
						    <tr>
						      <td><div class="form-check form-switch">
									  <input class="tidying form-check-input" type="checkbox" value="1" name="tidying" >
									  <label  for="tidying">お片付け</label>
								  </div></td>
							 <td><div class="form-check form-switch">
									  <input class="self_assertion form-check-input" type="checkbox" value="1" name="self_assertion" >
									  <label  for="self_assertion">イヤイヤ</label>
								</div></td>
							 <td><div class="form-check form-switch">
									  <input class="poop form-check-input" type="radio" value="1" name="poop" >
									  <label  for="poop">うんち</label>
								</div></td>
							<td><div class="form-check form-switch">
									  <input class="tooth_brushing form-check-input" type="checkbox" value="1" name="tooth_brushing" >
									  <label  for="tooth_brushing">歯磨き</label>
								</div></td>
						    </tr>
                	</table>
                	<div class="row">
		            	<div class="col text-center" >
		            		<button class="create_btn btn btn-secondary w-50" id="create_btn">登録</button>
		            	</div>
		            </div>
                	</form>
                </div>
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
});
$(document).on("click","#regist_btn",function(e){
	e.preventDefault();
	$form=$(".is-show #meter_form");
	console.log($(".is-show #meter_form [name=partner_name]").val());
	let appetite;
	let sleepiness;
	let humor;
	let nausea;
	let stress;
	let dizziness;
	let fatigue;
	let stiff_shoulder;
	let headache;
	let backache;
	let stomach_ache;
	let feeling;
	let tidying;
	let self_assertion;
	let poop
	let tooth_brushing;
	if($(".is-show #meter_form [name = apptite]").prop("checked") == true){appetite=1}else{appetite=0};
	if($(".is-show #meter_form [name = sleepiness]").prop("checked") == true){sleepiness=1}else{sleepiness=0};
	if($(".is-show #meter_form [name = humor]").prop("checked") == true){humor=1}else{humor=0};
	if($(".is-show #meter_form [name = humor]").prop("checked") == true){humor=1}else{humor=0};
	if($(".is-show #meter_form [name = nausea]").prop("checked") == true){nausea=1}else{nausea=0};
	if($(".is-show #meter_form [name = stress]").prop("checked") == true){stress=1}else{stress=0};
	if($(".is-show #meter_form [name = dizziness]").prop("checked") == true){dizziness=1}else{dizziness=0};
	if($(".is-show #meter_form [name = fatigue]").prop("checked") == true){fatigue=1}else{fatigue=0};
	if($(".is-show #meter_form [name = stiff_shoulder]").prop("checked") == true){stiff_shoulder=1}else{stiff_shoulder=0};
	if($(".is-show #meter_form [name = headache]").prop("checked") == true){headache=1}else{headache=0};
	if($(".is-show #meter_form [name = backache]").prop("checked") == true){backache=1}else{backache=0};
	if($(".is-show #meter_form [name = stomach_ache]").prop("checked") == true){stomach_ache=1}else{stomach_ache=0};
	if($(".is-show #meter_form [name = feeling]").prop("checked") == true){feeling=1}else{feeling=0};
	if($(".is-show #meter_form [name = tidying]").prop("checked") == true){tidying=1}else{tidying=0};
	if($(".is-show #meter_form [name = self_assertion]").prop("checked") == true){self_assertion=1}else{self_assertion=0};
	if($(".is-show #meter_form [name = poop]").prop("checked") == true){poop=1}else{poop=0};
	if($(".is-show #meter_form [name = tooth_brushing]").prop("checked") == true){tooth_brushing=1}else{tooth_brushing=0};

	let data = {
			"process":"update partner",
			"partner_id":$(".is-show #partner_id").val(),
			"partner_name":$(".is-show #meter_form #partner_name").val(),
			"partner_attribute":$(".is-show #partner_attribute").val(),
			"appetite":appetite,
			"sleepiness":sleepiness,
			"humor":humor,
			"nausea":nausea,
			"stress":stress,
			"dizziness":dizziness,
			"fatigue":fatigue,
			"stiff_shoulder":stiff_shoulder,
			"headache":headache,
			"backache":backache,
			"stomach_ache":stomach_ache,
			"feeling":feeling,
			"tidying":tidying,
			"self_assertion":self_assertion,
			"poop":poop,
			"tooth_brushing":tooth_brushing
	}


	$.ajaxSetup({scriptCharset:'utf-8'});
	$.ajax({
		//どのサーブレットに送るか
		//ajaxSampleのところは自分のプロジェクト名に変更する必要あり。
		url: $form.attr('action'),
		//どのメソッドを使用するか
		type:"POST",
		//受け取るデータのタイプ
		dataType:"text",
		//何をサーブレットに飛ばすか（変数を記述）
		data: data,
		//この下の２行はとりあえず書いてる（書かなくても大丈夫？）
		processDate:false,
		timeStamp: new Date().getTime()
	   //非同期通信が成功したときの処理
	}).done(function(data) {

	    alert("登録しました");

	  })
	   //非同期通信が失敗したときの処理
	  .fail(function() {
		//失敗とアラートを出す
		alert("失敗！");
	  });



})

$(document).on("click","#create_btn",function(e){
	e.preventDefault();
	$form=$(".is-show #meter_form");
	console.log($(".is-show #meter_form [name=partner_name]").val());
	let appetite;
	let sleepiness;
	let humor;
	let nausea;
	let stress;
	let dizziness;
	let fatigue;
	let stiff_shoulder;
	let headache;
	let backache;
	let stomach_ache;
	let feeling;
	let tidying;
	let self_assertion;
	let poop
	let tooth_brushing;
	if($(".is-show #meter_form [name = apptite]").prop("checked") == true){appetite=1}else{appetite=0};
	if($(".is-show #meter_form [name = sleepiness]").prop("checked") == true){sleepiness=1}else{sleepiness=0};
	if($(".is-show #meter_form [name = humor]").prop("checked") == true){humor=1}else{humor=0};
	if($(".is-show #meter_form [name = humor]").prop("checked") == true){humor=1}else{humor=0};
	if($(".is-show #meter_form [name = nausea]").prop("checked") == true){nausea=1}else{nausea=0};
	if($(".is-show #meter_form [name = stress]").prop("checked") == true){stress=1}else{stress=0};
	if($(".is-show #meter_form [name = dizziness]").prop("checked") == true){dizziness=1}else{dizziness=0};
	if($(".is-show #meter_form [name = fatigue]").prop("checked") == true){fatigue=1}else{fatigue=0};
	if($(".is-show #meter_form [name = stiff_shoulder]").prop("checked") == true){stiff_shoulder=1}else{stiff_shoulder=0};
	if($(".is-show #meter_form [name = headache]").prop("checked") == true){headache=1}else{headache=0};
	if($(".is-show #meter_form [name = backache]").prop("checked") == true){backache=1}else{backache=0};
	if($(".is-show #meter_form [name = stomach_ache]").prop("checked") == true){stomach_ache=1}else{stomach_ache=0};
	if($(".is-show #meter_form [name = feeling]").prop("checked") == true){feeling=1}else{feeling=0};
	if($(".is-show #meter_form [name = tidying]").prop("checked") == true){tidying=1}else{tidying=0};
	if($(".is-show #meter_form [name = self_assertion]").prop("checked") == true){self_assertion=1}else{self_assertion=0};
	if($(".is-show #meter_form [name = poop]").prop("checked") == true){poop=1}else{poop=0};
	if($(".is-show #meter_form [name = tooth_brushing]").prop("checked") == true){tooth_brushing=1}else{tooth_brushing=0};

	let data = {
			"process":"create partner",
			"partner_name":$(".is-show #meter_form #partner_name").val(),
			"partner_attribute":$(".is-show #meter_form #partner_attribute").val(),
			"appetite":appetite,
			"sleepiness":sleepiness,
			"humor":humor,
			"nausea":nausea,
			"stress":stress,
			"dizziness":dizziness,
			"fatigue":fatigue,
			"stiff_shoulder":stiff_shoulder,
			"headache":headache,
			"backache":backache,
			"stomach_ache":stomach_ache,
			"feeling":feeling,
			"tidying":tidying,
			"self_assertion":self_assertion,
			"poop":poop,
			"tooth_brushing":tooth_brushing
	}


	$.ajaxSetup({scriptCharset:'utf-8'});
	$.ajax({
		//どのサーブレットに送るか
		//ajaxSampleのところは自分のプロジェクト名に変更する必要あり。
		url: $form.attr('action'),
		//どのメソッドを使用するか
		type:"POST",
		//受け取るデータのタイプ
		dataType:"text",
		//何をサーブレットに飛ばすか（変数を記述）
		data: data,
		//この下の２行はとりあえず書いてる（書かなくても大丈夫？）
		processDate:false,
		timeStamp: new Date().getTime()
	   //非同期通信が成功したときの処理
	}).done(function(data) {

	    alert("登録しました");
	    location.reload();

	  })
	   //非同期通信が失敗したときの処理
	  .fail(function() {
		//失敗とアラートを出す
		alert("失敗！");
	  });



})
</script>
</body>
</html>