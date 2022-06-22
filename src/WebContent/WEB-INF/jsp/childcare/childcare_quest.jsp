<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/sanitize.css" >
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/home/home.css" >
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script defer src="<%= request.getContextPath() %>/js/home/home.js"></script>
<title>famity 育児クエスト</title>
</head>
<body>
<div class="container">
	<%@ include file="../top/common.jsp"%>
	<main>
		        <h1>お願いリスト</h1>
        <div id="childcare_quest">
            <div class="sort_filter">
                <select name="sort">
                    <option value="time_limit" >締め切り早い順</option>
                    <option value="created_at">クエスト登録日順</option>
                    </select>
            </div>
            <input type="button" id="btn">←押したら出る
            <div class="childcare_quest_list">
				<table id="cq_table">
				<tr><td>タイトル</td><td>本文</td><td>期限</td><td>ラベル</td>
				</table>
            </div>
        </div>

    </main>
</div>

</body>
<script>
$("#btn").on('click',async function(){
	data={
			"process":"getQuestList"
	}
     ajax(data);


})

function ajax(process){
    $.ajaxSetup({scriptCharset:'utf-8'});
	$.ajax({
		//どのサーブレットに送るか
		//ajaxSampleのところは自分のプロジェクト名に変更する必要あり。
		url: '/MaternityApp/ChildcareQuestServlet',
		//どのメソッドを使用するか
		type:"GET",
		//受け取るデータのタイプ
		dataType:"json",
		//何をサーブレットに飛ばすか（変数を記述）
		data: process,
		//この下の２行はとりあえず書いてる（書かなくても大丈夫？）
		processDate:false,
		timeStamp: new Date().getTime()
	   //非同期通信が成功したときの処理
	}).done(function(data) {
		console.log(data.length);
		$.each(data, function(index, value){
			let $tr=$('<tr />',{id:index});
			var date = new Date(value.time_limit);
			$tr.append('<td name=title>'+value.title+"</td>")
			.append('<td name=body>'+value.body+"</td>")
			.append('<td name=time_limit>'+(date.getMonth()+1)+"-"+date.getDate()+"</td>")
			.append('<td name=title>'+value.label+"</td>")
			$("#cq_table").append($tr);

			})
        return(data);
	  })
	   //非同期通信が失敗したときの処理
	  .fail(function() {
		//失敗とアラートを出す
		alert("失敗！");
	  });
}

</script>
</html>