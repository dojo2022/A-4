
'use strict';


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
});
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


function goAjax(){
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
}