<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/sanitize.css" >
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/childcare/childcare_quest.css" >
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
                <input type="button" id="btn" value="クエスト表示"
               >
	            <select id="sleepy"name="number">ソート
				  <option value="1">1</option>
				  <option value="2">2</option>

				</select>
				<select name="number">完了
				  <option value="1">1</option>
				  <option value="2">2</option>

				</select>
				<select name="number">ラベル
				  <option value="1">1</option>
				  <option value="2">2</option>
				  <option value="3">3</option>
				  <option value="4">4</option>
				  <option value="5">5</option>
				</select>
            </div>

            <div class="childcare_quest_table">
				<table >
				<thead>
				<tr>
				<th style="width:15vw">タイトル</th>
				<th style="width:15vw">本文</th>
				<th style="width:15vw">期限</th>
				<th style="width:15vw">ラベル</th>
				<th style="width:15vw">ステータス</th>
				</tr>
				</thead>
				<tbody id="cq_table">
				</tbody>
				</table>
            </div>
        </div>

    </main>
</div>

</body>
<script>
$("#btn").on('click',async function(){
	var value = $("#sleepy").val();
	$("#cq_table").empty()
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
			var flag
			if(value.completed_flag == 0){
				flag="完了";
			}else if(value.completed_flag == 1){
				flag="削除";
			}
			$tr.append('<td name=title>'+value.title+"</td>")
			.append('<td name=body>'+value.body+"</td>")
			.append('<td name=time_limit>～'+(date.getMonth()+1)+"/"+date.getDate()+"</td>")
			.append('<td name=label>'+value.label+"</td>")
			.append("<td name=flag><input type='button' value='"+flag+"'></td>")
			let $body_tr=$('<tr />');
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