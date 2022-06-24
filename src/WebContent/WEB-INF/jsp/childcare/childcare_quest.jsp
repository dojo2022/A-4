<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		        <h1>育児クエスト</h1>
        <div id="childcare_quest">
            <div class="sort_filter">
                <select  id="sort" name="sort">
                <option value="">並び替え</option>
                    <option value="time_limit" >締め切り早い順</option>
                    <option value="created_date">クエスト登録日順</option>
                 </select>

				<select id="comp_flag" name="comp_flag">
				  <option value="">フィルター</option>
				  <option value="0">未完</option>
				  <option value="1">完了</option>

				</select>
				<select id="label" name="label" >
				<option value="">ラベル</option>
				<c:forEach var="e" items="${labelList}" >
				<option value="${e.content_label }">${e.content_label }</option>
				</c:forEach>

				</select>
				<input type="button" id="btn" value="クエスト表示">
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
        		<div>
			<button id="open_modal" name="open_modal_btn">クエスト登録</button>
			<form id="quest_form" method="POST" action="<%= request.getContextPath() %>/ChildcareQuestServlet">
				<div id="resist_modal" class="modal">
					 <div class="modal_content">
						 <span class="close">X</span>
						 <div class="modal_body">
							タイトル：<input type = "text" name="declaration"><br>
							詳細：<textarea  name="tag"></textarea><br>
							期限<input type="date">
							<select id="label" name="label" >
								<option value="">ラベル</option>
								<c:forEach var="e" items="${labelList}" >
								<option value="${e.content_label }">${e.content_label }</option>
								</c:forEach>
							</select>
							<input type="hidden" name="count" value="1" id="count">
							<input type="button" id="regist_btn" value="新規登録" name="bt"><br>
						</div>
					</div>
				</div>
				</form>
		</div>

    </main>
</div>

</body>
<script>
$("#btn").on('click',async function(){
	const sort = $('#sort').val();
	const comp_flag = $('#comp_flag').val();
	const label = $('#label').val()
	console.log(sort+":"+comp_flag+":"+label);
	$("#cq_table").empty()
	data={
			"process":"getQuestList",
			"sort":sort,
			"completed_flag":comp_flag,
			"label":label
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

var modal = document.getElementById('resist_modal');
var btn = document.getElementById('open_modal');
var close = modal.getElementsByClassName('close')[0];
btn.onclick = function() {
	console.log("open modal");
	  modal.style.display = 'block';
};
//×を押したらモーダルを閉じる
close.onclick = function() {
		  modal.style.display = 'none';
};




//×を押したらモーダルが消える
function batten (indexNo){
	var modal2 = document.getElementById('edit_modal'+ indexNo);
	//var close_btn = modal2.getElementById('close' + indexNo)
	modal2.style.display = 'none';
	console.log(indexNo);
}



//モーダル以外を押したらモーダルが閉じる
window.onclick = function (event)  {
	if (event.target == modal) {

		modal.style.display = 'none';
	}
};

$("#regist_btn").on('click',function(e){
	e.preventDefault();
var form=$("#quest_form");

	$.ajaxSetup({scriptCharset:'utf-8'});
	$.ajax({
		//どのサーブレットに送るか
		//ajaxSampleのところは自分のプロジェクト名に変更する必要あり。
		url: '/MaternityApp/ChildcareQuestServlet',
		//どのメソッドを使用するか
		type:"POST",
		//受け取るデータのタイプ
		dataType:"text",
		//何をサーブレットに飛ばすか（変数を記述）
		data: process,
		//この下の２行はとりあえず書いてる（書かなくても大丈夫？）
		processDate:false,
		timeStamp: new Date().getTime()
	   //非同期通信が成功したときの処理
	}).done(function(data) {
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



})
</script>
</html>