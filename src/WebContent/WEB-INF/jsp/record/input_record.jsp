<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>famiTy 記録入力</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/record/input_record.css">
<%@ include file="../top/common.jsp"%>
</head>
<body>
<main>

<!-- 今日の日付 -->
<form class="input_record" method="POST" action="<%= request.getContextPath() %>/src/servlet.record/InputRecordServlet">
<strong><span id="today"></span></strong><br>

<!-- アカウント切り替え -->

<c:forEach var="e" items="${PartnerList}" varStatus="status">
<%-- 	<div style="float:left">
   <!--  顔の表示 -->
	<img src="<%= request.getContextPath() %>/image/level1.png">
	<!-- ダーリン・ハニー -->
	${e.name}
	</div> --%>
 <table class="tab-panel" align="left">
	<input type="hidden" class="partner_id" id="partner_id${status.index}" value="${e.partner_id}">


	<tr class="tab-group">
		<td class="tab" id="${status.index}" onclick="tabClick()" >
	    	<img src="<%= request.getContextPath() %>/image/level1.png"><br>${e.name}
		</td>
	</tr>

</table>

<div class="panel" id="${status.index}">
<input type="hidden" id="today"  value="${count}" onclick="todayRecord()">


<!-- 状態文 -->
<div>
	<input type = "text" id="text" name = "detail" placeholder = "${e.name}の状態 ex) 妊婦健診いってきたよ！" class="text" value="">
</div>

<!-- 体温・体重 -->
<div>
	<label>体重(kg)</label><input type = "number" class="number" id="weight" name = "weight" min = "0" max = "200" step = "0.1" value = "60">
	<label>体温(℃)</label><input type = "number" class="number" id="body_temparture" name = "body_temparture" min = "30" max = "50" step = "0.1" value = "36">
</div>
<!-- 家族メーター -->
<table id="family-meter">
	<tr id="appetite" class="view${e.appetite}">
		<td>食欲</td>
		<td class="hidden">
			<label><input type="radio" name="meter1" value="0" class="radio" checked></label>
		</td>
		<td>
			<label><input type="radio" name="meter1" value="1" class="radio"><img src="<%= request.getContextPath() %>/image/level1.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter1" value="2" class="radio"><img src="<%= request.getContextPath() %>/image/level2.png" class="radio_image">
			</label>
			</td>
		<td>
			<label><input type="radio" name="meter1" value="3" class="radio"><img src="<%= request.getContextPath() %>/image/level3.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter1" value="4" class="radio"><img src="<%= request.getContextPath() %>/image/level4.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter1" value="5" class="radio"><img src="<%= request.getContextPath() %>/image/level5.png" class="radio_image">
			</label>
		</td>
	</tr>
	<tr id="sleepiness" class="view${e.sleepiness}">
		<td>眠気</td>
		<td class="hidden">
			<label><input type="radio" name="meter2" value="0" class="radio" checked></label>
		</td>
		<td>
			<label><input type="radio" name="meter2" value="1" class="radio"><img src="<%= request.getContextPath() %>/image/level1.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter2" value="2" class="radio"><img src="<%= request.getContextPath() %>/image/level2.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter2" value="3" class="radio"><img src="<%= request.getContextPath() %>/image/level3.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter2" value="4" class="radio"><img src="<%= request.getContextPath() %>/image/level4.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter2" value="5" class="radio"><img src="<%= request.getContextPath() %>/image/level5.png" class="radio_image">
			</label>
		</td>
	</tr>
	<tr id="humor" class="view${e.humor}">

		<td>機嫌</td>
		<td class="hidden">
			<label><input type="radio" name="meter3" value="0" class="radio" checked></label>
		</td>
		<td>

			<label><input type="radio" name="meter3" value="1" class="radio"><img src="<%= request.getContextPath() %>/image/level1.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter3" value="2" class="radio"><img src="<%= request.getContextPath() %>/image/level2.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter3" value="3" class="radio"><img src="<%= request.getContextPath() %>/image/level3.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter3" value="4" class="radio"><img src="<%= request.getContextPath() %>/image/level4.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter3" value="5" class="radio"><img src="<%= request.getContextPath() %>/image/level5.png" class="radio_image">
			</label>
		</td>
	</tr>
	<tr id="nausea" class="view${e.nausea}">
		<td>吐き気</td>
		<td class="hidden">
			<label><input type="radio" name="meter4" value="0" class="radio" checked></label>
		</td>
		<td>
			<label><input type="radio" name="meter4" value="1" class="radio"><img src="<%= request.getContextPath() %>/image/level1.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter4" value="2" class="radio"><img src="<%= request.getContextPath() %>/image/level2.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter4" value="3" class="radio"><img src="<%= request.getContextPath() %>/image/level3.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter4" value="4" class="radio"><img src="<%= request.getContextPath() %>/image/level4.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter4" value="5" class="radio"><img src="<%= request.getContextPath() %>/image/level5.png" class="radio_image">
			</label>
		</td>
	</tr>
	<tr id="stress" class="view${e.stress}">
		<td>ストレス</td>
		<td class="hidden">
			<label><input type="radio" name="meter5" value="0" class="radio" checked></label>
		</td>
		<td>
			<label><input type="radio" name="meter5" value="1" class="radio"><img src="<%= request.getContextPath() %>/image/level1.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter5" value="2" class="radio"><img src="<%= request.getContextPath() %>/image/level2.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter5" value="3" class="radio"><img src="<%= request.getContextPath() %>/image/level3.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter5" value="4" class="radio"><img src="<%= request.getContextPath() %>/image/level4.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter5" value="5" class="radio"><img src="<%= request.getContextPath() %>/image/level5.png" class="radio_image">
			</label>
		</td>
	</tr>
	<tr id="dizziness" class="view${e.dizziness}">
		<td>めまい</td>
		<td class="hidden">
			<label><input type="radio" name="meter6" value="0" class="radio" checked></label>
		</td>
		<td>
			<label><input type="radio" name="meter6" value="1" class="radio"><img src="<%= request.getContextPath() %>/image/level1.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter6" value="2" class="radio"><img src="<%= request.getContextPath() %>/image/level2.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter6" value="3" class="radio"><img src="<%= request.getContextPath() %>/image/level3.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter6" value="4" class="radio"><img src="<%= request.getContextPath() %>/image/level4.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter6" value="5" class="radio"><img src="<%= request.getContextPath() %>/image/level5.png" class="radio_image">
			</label>
		</td>
	</tr>
	<tr id="fatigue" class="view${e.fatigue}">
		<td>疲労</td>
		<td class="hidden">
			<label><input type="radio" name="meter7" value="0" class="radio" checked></label>
		</td>
		<td>
			<label><input type="radio" name="meter7" value="1" class="radio"><img src="<%= request.getContextPath() %>/image/level1.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter7" value="2" class="radio"><img src="<%= request.getContextPath() %>/image/level2.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter7" value="3" class="radio"><img src="<%= request.getContextPath() %>/image/level3.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter7" value="4" class="radio"><img src="<%= request.getContextPath() %>/image/level4.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter7" value="5" class="radio"><img src="<%= request.getContextPath() %>/image/level5.png" class="radio_image">
			</label>
		</td>
	</tr>
	<tr id="stiff_shoulder" class="view${e.stiff_shoulder}">
		<td>肩こり</td>
		<td class="hidden">
			<label><input type="radio" name="meter8" value="0" class="radio" checked></label>
		</td>
		<td>
			<label><input type="radio" name="meter8" value="1" class="radio"><img src="<%= request.getContextPath() %>/image/level1.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter8" value="2" class="radio"><img src="<%= request.getContextPath() %>/image/level2.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter8" value="3" class="radio"><img src="<%= request.getContextPath() %>/image/level3.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter8" value="4" class="radio"><img src="<%= request.getContextPath() %>/image/level4.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter8" value="5" class="radio"><img src="<%= request.getContextPath() %>/image/level5.png" class="radio_image">
			</label>
		</td>
	</tr>
	<tr id="headache" class="view${e.headache}">
		<td>頭痛</td>
		<td class="hidden">
			<label><input type="radio" name="meter9" value="0" class="radio" checked></label>
		</td>
		<td>
			<label><input type="radio" name="meter9" value="1" class="radio"><img src="<%= request.getContextPath() %>/image/level1.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter9" value="2" class="radio"><img src="<%= request.getContextPath() %>/image/level2.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter9" value="3" class="radio"><img src="<%= request.getContextPath() %>/image/level3.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter9" value="4" class="radio"><img src="<%= request.getContextPath() %>/image/level4.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter9" value="5" class="radio"><img src="<%= request.getContextPath() %>/image/level5.png" class="radio_image">
			</label>
		</td>
	</tr>
	<tr id="backache" class="view${e.backache}">
		<td>腰痛</td>
		<td class="hidden">
			<label><input type="radio" name="meter10" value="0" class="radio" checked></label>
		</td>
		<td>
			<label><input type="radio" name="meter10" value="1" class="radio"><img src="<%= request.getContextPath() %>/image/level1.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter10" value="2" class="radio"><img src="<%= request.getContextPath() %>/image/level2.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter10" value="3" class="radio"><img src="<%= request.getContextPath() %>/image/level3.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter10" value="4" class="radio"><img src="<%= request.getContextPath() %>/image/level4.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter10" value="5" class="radio"><img src="<%= request.getContextPath() %>/image/level5.png" class="radio_image">
			</label>
		</td>
	</tr>
	<tr id="stomach_ache" class="view${e.stomach_ache}">
		<td>腹痛</td>
		<td class="hidden">
			<label><input type="radio" name="meter11" value="0" class="radio" checked></label>
		</td>
		<td>
			<label><input type="radio" name="meter11" value="1" class="radio"><img src="<%= request.getContextPath() %>/image/level1.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter11" value="2" class="radio"><img src="<%= request.getContextPath() %>/image/level2.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter11" value="3" class="radio"><img src="<%= request.getContextPath() %>/image/level3.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter11" value="4" class="radio"><img src="<%= request.getContextPath() %>/image/level4.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter11" value="5" class="radio"><img src="<%= request.getContextPath() %>/image/level5.png" class="radio_image">
			</label>
		</td>
	</tr>
	<tr id="feeling" class="view${e.feeling}">
		<td>気分</td>
		<td class="hidden">
			<label><input type="radio" name="meter12" value="0" class="radio" checked></label>
		</td>
		<td>
			<label><input type="radio" name="meter12" value="1" class="radio"><img src="<%= request.getContextPath() %>/image/level1.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter12" value="2" class="radio"><img src="<%= request.getContextPath() %>/image/level2.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter12" value="3" class="radio"><img src="<%= request.getContextPath() %>/image/level3.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter12" value="4" class="radio"><img src="<%= request.getContextPath() %>/image/level4.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter12" value="5" class="radio"><img src="<%= request.getContextPath() %>/image/level5.png" class="radio_image">
			</label>
		</td>
	</tr>
	<tr id="tidying" class="view${e.tidying}">
		<td>お片付け</td>
		<td class="hidden">
			<label><input type="radio" name="meter13" value="0" class="radio" checked></label>
		</td>
		<td>
			<label><input type="radio" name="meter13" value="1" class="radio"><img src="<%= request.getContextPath() %>/image/level1.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter13" value="2" class="radio"><img src="<%= request.getContextPath() %>/image/level2.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter13" value="3" class="radio"><img src="<%= request.getContextPath() %>/image/level3.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter13" value="4" class="radio"><img src="<%= request.getContextPath() %>/image/level4.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter13" value="5" class="radio"><img src="<%= request.getContextPath() %>/image/level5.png" class="radio_image">
			</label>
		</td>
	</tr>
	<tr id="self_assertion" class="view${e.self_assertion}">
		<td>イヤイヤ</td>
		<td class="hidden">
			<label><input type="radio" name="meter14" value="0" class="radio" checked></label>
		</td>
		<td>
			<label><input type="radio" name="meter14" value="1" class="radio"><img src="<%= request.getContextPath() %>/image/level1.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter14" value="2" class="radio"><img src="<%= request.getContextPath() %>/image/level2.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter14" value="3" class="radio"><img src="<%= request.getContextPath() %>/image/level3.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter14" value="4" class="radio"><img src="<%= request.getContextPath() %>/image/level4.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter14" value="5" class="radio"><img src="<%= request.getContextPath() %>/image/level5.png" class="radio_image">
			</label>
		</td>
	</tr>
	<tr id="poop" class="view${e.poop}">
		<td>うんち</td>
		<td class="hidden">
			<label><input type="radio" name="meter15" value="0" class="radio" checked></label>
		</td>
		<td>
			<label><input type="radio" name="meter15" value="1" class="radio"><img src="<%= request.getContextPath() %>/image/level1.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter15" value="2" class="radio"><img src="<%= request.getContextPath() %>/image/level2.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter15" value="3" class="radio"><img src="<%= request.getContextPath() %>/image/level3.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter15" value="4" class="radio"><img src="<%= request.getContextPath() %>/image/level4.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter15" value="5" class="radio"><img src="<%= request.getContextPath() %>/image/level5.png" class="radio_image">
			</label>
		</td>
	</tr>
	<tr id="tooth_brushing" class="view${e.tooth_brushing}">
		<td>歯磨き</td>
		<td class="hidden">
			<label><input type="radio" name="meter16" value="0" class="radio" checked></label>
		</td>
		<td>
			<label><input type="radio" name="meter16" value="1" class="radio"><img src="<%= request.getContextPath() %>/image/level1.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter16" value="2" class="radio"><img src="<%= request.getContextPath() %>/image/level2.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter16" value="3" class="radio"><img src="<%= request.getContextPath() %>/image/level3.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter16" value="4" class="radio"><img src="<%= request.getContextPath() %>/image/level4.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter16" value="5" class="radio"><img src="<%= request.getContextPath() %>/image/level5.png" class="radio_image">
			</label>
		</td>
	</tr>
</table>
<div id="test"></div>
<!-- 記録ボタン -->
<div>
	<input type = "button" id="submit" name = "submit" value = "記録する"  onclick="goAjax()" class="record" >
</div>
</div>
</div>
</div>
</c:forEach>
</form>
</main>
</body>
<script>


'use strict';


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

<!-- アカウント切り替え -->
// 選んだタブをアクティブにする
document.getElementById('0').classList.add('is-active');
let index=0;
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
		index = arrayTabs.indexOf(this);
		document.getElementsByClassName('panel')[index].classList.add('is-show');
	};
}

var num = document.getElementById('today').value;
function todayRecord(){
	if (num <= 1){
		alert("今日の記録は登録されています。確認は「記録閲覧」からできます。");
	}else{
		alert("");
	}
}



<!-- ラジオボタンの値をゲット！  -->
$('input:radio[name="meter1"]').change(function() {
	const appatite = $('input:radio[name="meter1"]:checked').val();
});
$('input:radio[name="meter2"]').change(function() {
	const sleepiness = $('input:radio[name="meter2"]:checked').val();
});
$('input:radio[name="meter3"]').change(function() {
	const humor = $('input:radio[name="meter3"]:checked').val();
});
$('input:radio[name="meter4"]').change(function() {
	const nausea = $('input:radio[name="meter4"]:checked').val();
});
$('input:radio[name="meter5"]').change(function() {
	const stress = $('input:radio[name="meter5"]:checked').val();
});
$('input:radio[name="meter6"]').change(function() {
	const dizziness = $('input:radio[name="meter6"]:checked').val();
});
$('input:radio[name="meter7"]').change(function() {
	const fatigue = $('input:radio[name="meter7"]:checked').val();
});
$('input:radio[name="meter8"]').change(function() {
	const stiff_shoulder = $('input:radio[name="meter8"]:checked').val();
});
$('input:radio[name="meter9"]').change(function() {
	const headache = $('input:radio[name="meter9"]:checked').val();
});
$('input:radio[name="meter10"]').change(function() {
	const backache = $('input:radio[name="meter10"]:checked').val();
});
$('input:radio[name="meter11"]').change(function() {
	const stomach_ache = $('input:radio[name="meter11"]:checked').val();
});
$('input:radio[name="meter12"]').change(function() {
	const feeling = $('input:radio[name="meter12"]:checked').val();
});
$('input:radio[name="meter13"]').change(function() {
	const tidying = $('input:radio[name="meter13"]:checked').val();
});
$('input:radio[name="meter14"]').change(function() {
	const self_assertion = $('input:radio[name="meter14"]:checked').val();
});
$('input:radio[name="meter15"]').change(function() {
	const poop = $('input:radio[name="meter15"]:checked').val();
});
$('input:radio[name="meter16"]').change(function() {
	const tooth_brushing = $('input:radio[name="meter16"]:checked').val();
});

<!-- Post Ajax -->
function goAjax(){
	var num = document.getElementById('today').value;
	if (num == 0){
	//入力値を取得してくる
	let recordData1 = document.getElementById('partner_id'+index).value;
	let recordData2 = document.getElementById('text').value;
	let recordData3 = document.getElementById('weight').value;
	let recordData4 = document.getElementById('body_temparture').value;
	let recordData5 = $('input:radio[name="meter1"]:checked').val();
	let recordData6 = $('input:radio[name="meter2"]:checked').val();
	let recordData7 = $('input:radio[name="meter3"]:checked').val();
	let recordData8 = $('input:radio[name="meter4"]:checked').val();
	let recordData9 = $('input:radio[name="meter5"]:checked').val();
	let recordData10 = $('input:radio[name="meter6"]:checked').val();
	let recordData11 = $('input:radio[name="meter7"]:checked').val();
	let recordData12 = $('input:radio[name="meter8"]:checked').val();
	let recordData13 = $('input:radio[name="meter9"]:checked').val();
	let recordData14 = $('input:radio[name="meter10"]:checked').val();
	let recordData15 = $('input:radio[name="meter11"]:checked').val();
	let recordData16 = $('input:radio[name="meter12"]:checked').val();
	let recordData17 = $('input:radio[name="meter13"]:checked').val();
	let recordData18 = $('input:radio[name="meter14"]:checked').val();
	let recordData19 = $('input:radio[name="meter15"]:checked').val();
	let recordData20 = $('input:radio[name="meter16"]:checked').val();

	//{変数名：中に入れるもの}みたいに書いて、複数の値をpostData変数に格納
	let postData = {
			"partner_id":recordData1,
			"text":recordData2,
			"weight":recordData3,
			"body_temparture":recordData4,
			"appetite":recordData5,
			"sleepiness":recordData6,
			"humor":recordData7,
			"nausea":recordData8,
			"stress":recordData9,
			"dizziness":recordData10,
			"fatigue":recordData11,
			"stiff_shoulder":recordData12,
			"headache":recordData13,
			"backache":recordData14,
			"stomach_ache":recordData15,
			"feeling":recordData16,
			"tidying":recordData17,
			"self_assertion":recordData18,
			"poop":recordData19,
			"tooth_brushing":recordData20
			}
console.log(postData);

	//非同期通信始めるよ
	$.ajaxSetup({scriptCharset:'utf-8'});
	$.ajax({
		//どのサーブレットに送るか
		//ajaxSampleのところは自分のプロジェクト名に変更する必要あり。
		url: '/MaternityApp/InputRecordServlet',
		//どのメソッドを使用するか
		type:"POST",
		//受け取るデータのタイプ
		dataType:"text",
		//何をサーブレットに飛ばすか（変数を記述）
		data: postData,
	   //非同期通信が成功したときの処理
	}).done(function(data) {
		alert("記録しました");
	  })
	   //非同期通信が失敗したときの処理
	  .fail(function(data) {
		//失敗とアラートを出す
		alert("記録できませんでした"+data);
	  });
	}else{
		alert("今日の記録は登録されています。確認は「記録閲覧」からできます。");
		location.href = '/MaternityApp/RecordViewTopServlet';
	}
}

</script>


</html>