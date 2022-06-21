<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>famiTy | 記録入力</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/record/input_record.css">
<%@ include file="../top/common.jsp"%>
</head>
<main>
<body>
<!-- 今日の日付 -->
<form class="input_record" method="POST" action="<%= request.getContextPath() %>/src/servlet.record/InputRecordServlet">
<span id="today"></span>
<!-- アカウント切り替え -->

<div class="outline">
<!-- 状態文 -->
<div>
	<input type = "text" name = "detail" placeholder = "の状態" class="text">
</div>

<!-- 体温・体重 -->
<div>
	<label>体重(kg)</label><input type = "number" name = "weight" min = "0" max = "200" step = "0.1" value = "60">
	<label>体温(℃)</label><input type = "number" name = "body_temparture" min = "30" max = "50" step = "0.1" value = "36">
</div>
<!-- 家族メーター -->
<c:forEach var="e" items="${PartnerList}" >
<label>項目${e. }</label>
	<label>
		<input type="radio" name="meter" value="1" class="radio"><img src="<%= request.getContextPath() %>/image/level1.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter" value="2" class="radio"><img src="<%= request.getContextPath() %>/image/level2.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter" value="3" class="radio"><img src="<%= request.getContextPath() %>/image/level3.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter" value="4" class="radio"><img src="<%= request.getContextPath() %>/image/level4.png" class="radio_image">
	</label>
	<label>
		<input type="radio" name="meter" value="5" class="radio"><img src="<%= request.getContextPath() %>/image/level5.png" class="radio_image">
	</label>
</c:forEach>

<!-- 記録ボタン -->
<div>
	<input type = "submit" name = "submit" value = "記録する"  onclick="goAjax()" class="record">
</div>

</div>
</form>

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

function goAjax(){
		alert("記録しました");
		//入力値を取得してくる
		let testData1 = document.getElementById('test_data1').value;
		let testData2 = document.getElementById('test_data2').value;
		let testData3 = document.getElementById('test_data3').value;

		//{変数名：中に入れるもの}みたいに書いて、複数の値をpostData変数に格納
		let postData = {data1:testData1,data2:testData2,data3:testData3}


		//非同期通信始めるよ
		$.ajaxSetup({scriptCharset:'utf-8'});
		$.ajax({
			//どのサーブレットに送るか
			//ajaxSampleのところは自分のプロジェクト名に変更する必要あり。
			url: '/sampleProgram/AjaxSampleServlet',
			//どのメソッドを使用するか
			type:"POST",
			//受け取るデータのタイプ
			dataType:"json",
			//何をサーブレットに飛ばすか（変数を記述）
			data: postData,
			//この下の２行はとりあえず書いてる（書かなくても大丈夫？）
			processDate:false,
			timeStamp: new Date().getTime()
		   //非同期通信が成功したときの処理
		}).done(function(data) {
			alert("成功1");
			// 今回は上の<div id="test"></div>の中に返ってきた文字列を入れる
			document.getElementById("test").innerText=data[0].name;
		  })
		   //非同期通信が失敗したときの処理
		  .fail(function() {
			//失敗とアラートを出す
			alert("失敗！");
		  });
	}
</script>
</body>
</main>
</html>