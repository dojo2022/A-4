$(function(){

	getTodayLaborCount();
	inLabor();

});
function inLabor(){
		  var data = {"process":"inLabor"};
	$.ajaxSetup({scriptCharset:'utf-8'});
	$.ajax({
		//どのサーブレットに送るか
		//ajaxSampleのところは自分のプロジェクト名に変更する必要あり。
		url: '/MaternityApp/LaborPainServlet',
		//どのメソッドを使用するか
		type:"GET",
		//受け取るデータのタイプ
		dataType:"json",
		//何をサーブレットに飛ばすか（変数を記述）
		data: data,
		//この下の２行はとりあえず書いてる（書かなくても大丈夫？）
		processDate:false,
		timeStamp: new Date().getTime()
	   //非同期通信が成功したときの処理
	}).done(function(data) {
		console.log(data);
		if(data == false){
			$("#labor_btn").val("陣痛きた！");
		}
		else{
			$("#labor_btn").val("陣痛収まった！");
		}
	  })
	   //非同期通信が失敗したときの処理
	  .fail(function() {
		//失敗とアラートを出す
		alert("失敗！");
	  });
}



function getTodayLaborCount(){
	var data = {"process":"today_labor_count"};
	$.ajaxSetup({scriptCharset:'utf-8'});
	$.ajax({
		//どのサーブレットに送るか
		//ajaxSampleのところは自分のプロジェクト名に変更する必要あり。
		url: '/MaternityApp/LaborPainServlet',
		//どのメソッドを使用するか
		type:"GET",
		//受け取るデータのタイプ
		dataType:"json",
		//何をサーブレットに飛ばすか（変数を記述）
		data: data,
		//この下の２行はとりあえず書いてる（書かなくても大丈夫？）
		processDate:false,
		timeStamp: new Date().getTime()
	   //非同期通信が成功したときの処理
	}).done(function(data) {
		console.log(data);
		$('#today_labor_count').text(data+'回');
	  })
	   //非同期通信が失敗したときの処理
	  .fail(function() {
		//失敗とアラートを出す
		alert("失敗！");
	  });



}
$('#labor_btn').on('click', async function(){
	var data;
	if($(this).val()=="陣痛きた！"){
		data = {"process":"createLabor"};
		let message = await create_labor(data);
			if(message){
				$('#labor_btn').val("陣痛収まった！");
			}


	}else if($(this).val()=="陣痛収まった！"){
		data = {"process":"stopLabor"};
		let message =await create_labor(data);
			if(message){
			$('#labor_btn').val("陣痛きた！");
			}
	}
	getTodayLaborCount()
});


function create_labor(data){
return new Promise((resolve,reject) =>{

	$.ajaxSetup({scriptCharset:'utf-8'});
	$.ajax({
		//どのサーブレットに送るか
		//ajaxSampleのところは自分のプロジェクト名に変更する必要あり。
		url: '/MaternityApp/LaborPainServlet',
		//どのメソッドを使用するか
		type:"GET",
		//受け取るデータのタイプ
		dataType:"json",
		//何をサーブレットに飛ばすか（変数を記述）
		data: data,
		//この下の２行はとりあえず書いてる（書かなくても大丈夫？）
		processDate:false,
		timeStamp: new Date().getTime()
	   //非同期通信が成功したときの処理
	}).done(function(data) {
		resolve(data);
	  })
	   //非同期通信が失敗したときの処理
	  .fail(function() {
		//失敗とアラートを出す
		alert("失敗！");
		reject();
	  });
	})
   }




