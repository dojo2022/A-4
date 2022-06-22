<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>famiTy 記録入力</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/record/input_record.css">
<%@ include file="../top/common.jsp"%>
</head>
<body>
<main>

<!-- 今日の日付 -->
<form class="input_record" method="POST" action="<%= request.getContextPath() %>/src/servlet.record/InputRecordServlet">
<span id="today"></span>


<!-- アカウント切り替え -->
<c:forEach var="e" items="${PartnerList}" varStatus="status">
<div class="tab-panel">
 	<ul class="tab-group">
    	<li class="tab " id="${status.index}" onclick="tabClick()">${e.name}</li>
	</ul>
<div class="panel" id="${status.index}">


<!-- 状態文 -->
<div>
	<input type = "text" name = "detail" placeholder = "の状態" class="text">
</div>

<!-- 体温・体重 -->
<div>
	<label>体重(kg)</label><input type = "number" class="number" name = "weight" min = "0" max = "200" step = "0.1" value = "60">
	<label>体温(℃)</label><input type = "number" class="number" name = "body_temparture" min = "30" max = "50" step = "0.1" value = "36">
</div>
<!-- 家族メーター -->
<label id="${e.appetite}">食欲</label>
	<label>
		<input type="radio" name="meter1" value="1" class="radio"><img src="<%= request.getContextPath() %>/image/level1.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter1" value="2" class="radio"><img src="<%= request.getContextPath() %>/image/level2.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter1" value="3" class="radio"><img src="<%= request.getContextPath() %>/image/level3.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter1" value="4" class="radio"><img src="<%= request.getContextPath() %>/image/level4.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter1" value="5" class="radio"><img src="<%= request.getContextPath() %>/image/level5.png" class="radio_image">
	</label><br>

	<label id="${e.partner_id}">眠気${e.sleepiness}</label>
	<label>
		<input type="radio" name="meter2" value="1" class="radio"><img src="<%= request.getContextPath() %>/image/level1.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter2" value="2" class="radio"><img src="<%= request.getContextPath() %>/image/level2.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter2" value="3" class="radio"><img src="<%= request.getContextPath() %>/image/level3.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter2" value="4" class="radio"><img src="<%= request.getContextPath() %>/image/level4.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter2" value="5" class="radio"><img src="<%= request.getContextPath() %>/image/level5.png" class="radio_image">
	</label><br>

	<label id="${e.partner_id}">機嫌${e.humor}</label>
	<label>
		<input type="radio" name="meter3" value="1" class="radio"><img src="<%= request.getContextPath() %>/image/level1.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter3" value="2" class="radio"><img src="<%= request.getContextPath() %>/image/level2.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter3" value="3" class="radio"><img src="<%= request.getContextPath() %>/image/level3.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter3" value="4" class="radio"><img src="<%= request.getContextPath() %>/image/level4.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter3" value="5" class="radio"><img src="<%= request.getContextPath() %>/image/level5.png" class="radio_image">
	</label><br>

	<label id="${e.partner_id}">吐き気${e.nausea}</label>
	<label>
		<input type="radio" name="meter4" value="1" class="radio"><img src="<%= request.getContextPath() %>/image/level1.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter4" value="2" class="radio"><img src="<%= request.getContextPath() %>/image/level2.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter4" value="3" class="radio"><img src="<%= request.getContextPath() %>/image/level3.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter4" value="4" class="radio"><img src="<%= request.getContextPath() %>/image/level4.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter4" value="5" class="radio"><img src="<%= request.getContextPath() %>/image/level5.png" class="radio_image">
	</label><br>

		<label id="${e.partner_id}">ストレス${e.stress}</label>
	<label>
		<input type="radio" name="meter5" value="1" class="radio"><img src="<%= request.getContextPath() %>/image/level1.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter5" value="2" class="radio"><img src="<%= request.getContextPath() %>/image/level2.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter5" value="3" class="radio"><img src="<%= request.getContextPath() %>/image/level3.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter5" value="4" class="radio"><img src="<%= request.getContextPath() %>/image/level4.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter5" value="5" class="radio"><img src="<%= request.getContextPath() %>/image/level5.png" class="radio_image">
	</label><br>

		<label id="${e.partner_id}">めまい${e.dizziness}</label>
	<label>
		<input type="radio" name="meter6" value="1" class="radio"><img src="<%= request.getContextPath() %>/image/level1.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter6" value="2" class="radio"><img src="<%= request.getContextPath() %>/image/level2.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter6" value="3" class="radio"><img src="<%= request.getContextPath() %>/image/level3.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter6" value="4" class="radio"><img src="<%= request.getContextPath() %>/image/level4.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter6" value="5" class="radio"><img src="<%= request.getContextPath() %>/image/level5.png" class="radio_image">
	</label><br>

		<label id="${e.partner_id}">疲労${e.fatigue}</label>
	<label>
		<input type="radio" name="meter7" value="1" class="radio"><img src="<%= request.getContextPath() %>/image/level1.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter7" value="2" class="radio"><img src="<%= request.getContextPath() %>/image/level2.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter7" value="3" class="radio"><img src="<%= request.getContextPath() %>/image/level3.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter7" value="4" class="radio"><img src="<%= request.getContextPath() %>/image/level4.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter7" value="5" class="radio"><img src="<%= request.getContextPath() %>/image/level5.png" class="radio_image">
	</label><br>

		<label id="${e.partner_id}">肩こり${e.stiff_shoulder}</label>
	<label>
		<input type="radio" name="meter8" value="1" class="radio"><img src="<%= request.getContextPath() %>/image/level1.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter8" value="2" class="radio"><img src="<%= request.getContextPath() %>/image/level2.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter8" value="3" class="radio"><img src="<%= request.getContextPath() %>/image/level3.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter8" value="4" class="radio"><img src="<%= request.getContextPath() %>/image/level4.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter8" value="5" class="radio"><img src="<%= request.getContextPath() %>/image/level5.png" class="radio_image">
	</label><br>

		<label id="${e.partner_id}">頭痛${e.headache}</label>
	<label>
		<input type="radio" name="meter9" value="1" class="radio"><img src="<%= request.getContextPath() %>/image/level1.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter9" value="2" class="radio"><img src="<%= request.getContextPath() %>/image/level2.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter9" value="3" class="radio"><img src="<%= request.getContextPath() %>/image/level3.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter9" value="4" class="radio"><img src="<%= request.getContextPath() %>/image/level4.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter9" value="5" class="radio"><img src="<%= request.getContextPath() %>/image/level5.png" class="radio_image">
	</label><br>

		<label id="${e.partner_id}">腰痛${e.backache}</label>
	<label>
		<input type="radio" name="meter10" value="1" class="radio"><img src="<%= request.getContextPath() %>/image/level1.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter10" value="2" class="radio"><img src="<%= request.getContextPath() %>/image/level2.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter10" value="3" class="radio"><img src="<%= request.getContextPath() %>/image/level3.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter10" value="4" class="radio"><img src="<%= request.getContextPath() %>/image/level4.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter10" value="5" class="radio"><img src="<%= request.getContextPath() %>/image/level5.png" class="radio_image">
	</label><br>

		<label id="${e.partner_id}">腹痛${e.stomach_ache}</label>
	<label>
		<input type="radio" name="meter11" value="1" class="radio"><img src="<%= request.getContextPath() %>/image/level1.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter11" value="2" class="radio"><img src="<%= request.getContextPath() %>/image/level2.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter11" value="3" class="radio"><img src="<%= request.getContextPath() %>/image/level3.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter11" value="4" class="radio"><img src="<%= request.getContextPath() %>/image/level4.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter11" value="5" class="radio"><img src="<%= request.getContextPath() %>/image/level5.png" class="radio_image">
	</label><br>

		<label id="${e.partner_id}">気分${e.feeling}</label>
	<label>
		<input type="radio" name="meter12" value="1" class="radio"><img src="<%= request.getContextPath() %>/image/level1.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter12" value="2" class="radio"><img src="<%= request.getContextPath() %>/image/level2.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter12" value="3" class="radio"><img src="<%= request.getContextPath() %>/image/level3.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter12" value="4" class="radio"><img src="<%= request.getContextPath() %>/image/level4.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter12" value="5" class="radio"><img src="<%= request.getContextPath() %>/image/level5.png" class="radio_image">
	</label><br>

		<label id="${e.partner_id}">お片付け${e.tidying}</label>
	<label>
		<input type="radio" name="meter13" value="1" class="radio"><img src="<%= request.getContextPath() %>/image/level1.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter13" value="2" class="radio"><img src="<%= request.getContextPath() %>/image/level2.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter13" value="3" class="radio"><img src="<%= request.getContextPath() %>/image/level3.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter13" value="4" class="radio"><img src="<%= request.getContextPath() %>/image/level4.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter13" value="5" class="radio"><img src="<%= request.getContextPath() %>/image/level5.png" class="radio_image">
	</label><br>

		<label id="${e.partner_id}">イヤイヤ${self_assertion}</label>
	<label>
		<input type="radio" name="meter14" value="1" class="radio"><img src="<%= request.getContextPath() %>/image/level1.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter14" value="2" class="radio"><img src="<%= request.getContextPath() %>/image/level2.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter14" value="3" class="radio"><img src="<%= request.getContextPath() %>/image/level3.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter14" value="4" class="radio"><img src="<%= request.getContextPath() %>/image/level4.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter14" value="5" class="radio"><img src="<%= request.getContextPath() %>/image/level5.png" class="radio_image">
	</label><br>

		<label id="${e.partner_id}">うんち${e.poop}</label>
	<label>
		<input type="radio" name="meter15" value="1" class="radio"><img src="<%= request.getContextPath() %>/image/level1.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter15" value="2" class="radio"><img src="<%= request.getContextPath() %>/image/level2.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter15" value="3" class="radio"><img src="<%= request.getContextPath() %>/image/level3.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter15" value="4" class="radio"><img src="<%= request.getContextPath() %>/image/level4.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter15" value="5" class="radio"><img src="<%= request.getContextPath() %>/image/level5.png" class="radio_image">
	</label><br>

		<label id="${e.partner_id}">歯磨き${e.tooth_brushing}</label>
	<label>
		<input type="radio" name="meter16" value="1" class="radio"><img src="<%= request.getContextPath() %>/image/level1.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter16" value="2" class="radio"><img src="<%= request.getContextPath() %>/image/level2.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter16" value="3" class="radio"><img src="<%= request.getContextPath() %>/image/level3.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter16" value="4" class="radio"><img src="<%= request.getContextPath() %>/image/level4.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter16" value="5" class="radio"><img src="<%= request.getContextPath() %>/image/level5.png" class="radio_image">
	</label><br>

<!-- 記録ボタン -->
<div>
	<input type = "submit" name = "submit" value = "記録する"  onclick="goAjax()" class="record">
</div>
</div>
</div>
</c:forEach>

</form>
</main>
</body>
<script>







'use strict';

if($(.appetite) == 0){
	document.getElementById("appetite").style.display ="none";
}

<!-- 日付 -->
function recalc() {
	  let dayOfWeek = ['日', '月', '火', '水', '木', '金', '土'];
	//現在の日付のオブジェクトを作り、定数「now」に保存
		const now = new Date();
		const month = now.getMonth() +1;
		const date = now.getDate();
		document.getElementById('today').textContent
		=month + '月' + date + '日' + '(' + dayOfWeek[now.getDay()] + ')';
		refresh();
	}
	function refresh() {
		setTimeout(recalc, 1000);
	}
	recalc();
// 選んだタブをアクティブにする
document.getElementById('0').classList.add('is-active');
function tabClick(){
	// タブに対してクリックイベントを適用
	const tabs = document.getElementsByClassName('tab');
	for(let i = 0; i < tabs.length; i++) {
	tabs[i].addEventListener('click', tabSwitch, false);
}

document.getElementById('0').classList.add('is-show')
	// タブをクリックすると実行する関数
	function tabSwitch(){
	// タブのclassの値を変更
	document.getElementsByClassName('is-active')[0].classList.remove('is-active');
	this.classList.add('is-active');
	// コンテンツのclassの値を変更
	document.getElementsByClassName('is-show')[0].classList.remove('is-show');
	const arrayTabs = Array.prototype.slice.call(tabs);
	const index = arrayTabs.indexOf(this);
	document.getElementsByClassName('panel')[index].classList.add('is-show');
	};
}

</script>


</html>