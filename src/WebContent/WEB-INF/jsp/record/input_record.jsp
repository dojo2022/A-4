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
<input type="hidden" id="partner_id" value="${e.partner_id}">
<table class="tab-panel">
	<td>
 		<ul class="tab-group">
    		<li class="tab" id="${status.index}" onclick="tabClick()"><img src="<%= request.getContextPath() %>/image/level1.png"><br>${e.name}</li>
		</ul>
	</td>
</table>

<div class="panel" id="${status.index}">


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
			</label><br>
		</td>
	</tr>
	<tr id="sleepiness" class="view${e.sleepiness}">
		<td>眠気(確認)</td>
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

<!-- Post Ajax -->
function goAjax(){
	alert("functionはいったよ！");
	//入力値を取得してくる
	let recordData1 = document.getElementById('partner_id').value;
	let recordData1 = document.getElementById('text').value;
	let recordData2 = document.getElementById('weight').value;
	let recordData3 = document.getElementById('body_temparture').value;
	let recordData4 = document.getElementById('appetite').value;
	let recordData5 = document.getElementById('sleepiness').value;
	let recordData6 = document.getElementById('humor').value;
	let recordData7 = document.getElementById('nausea').value;
	let recordData8 = document.getElementById('stress').value;
	let recordData9 = document.getElementById('dizziness').value;
	let recordData10 = document.getElementById('fatigue').value;
	let recordData11 = document.getElementById('stiff_shoulder').value;
	let recordData12 = document.getElementById('headache').value;
	let recordData13 = document.getElementById('backache').value;
	let recordData14 = document.getElementById('stomach_ache').value;
	let recordData15 = document.getElementById('feeling').value;
	let recordData16 = document.getElementById('tidying').value;
	let recordData17 = document.getElementById('self_assertion').value;
	let recordData18 = document.getElementById('poop').value;
	let recordData19 = document.getElementById('tooth_brushing').value;

	//{変数名：中に入れるもの}みたいに書いて、複数の値をpostData変数に格納
	let postData = {
			data1:recordData1,
			data2:recordData2,
			data3:recordData3,
			data4:recordData4,
			data5:recordData5,
			data6:recordData6,
			data7:recordData7,
			data8:recordData8,
			data9:recordData9,
			data10:recordData10,
			data11:recordData11,
			data12:recordData12,
			data13:recordData13,
			data14:recordData14,
			data15:recordData15,
			data16:recordData16,
			data17:recordData17,
			data18:recordData18,
			data19:recordData19
			}


	//非同期通信始めるよ
	$.ajaxSetup({scriptCharset:'utf-8'});
	$.ajax({
		//どのサーブレットに送るか
		//ajaxSampleのところは自分のプロジェクト名に変更する必要あり。
		url: '/MaternityApp/InputRecordServlet',
		//どのメソッドを使用するか
		type:"POST",
		//受け取るデータのタイプ
		dataType:"json",
		//何をサーブレットに飛ばすか（変数を記述）
		data: postData,
	   //非同期通信が成功したときの処理
	}).done(function(data) {
		alert("記録しました");
		// 今回は上の<div id="test"></div>の中に返ってきた文字列を入れる
		document.getElementById("test").innerText=data[0].name;
	  })
	   //非同期通信が失敗したときの処理
	  .fail(function() {
		//失敗とアラートを出す
		alert("登録しました");
	  });
}

</script>


</html>