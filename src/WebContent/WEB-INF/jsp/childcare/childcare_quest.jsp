<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/sanitize.css" >
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/childcare/childcare_quest.css" >
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script defer src="<%= request.getContextPath() %>/js/home/home.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<title>famity 育児クエスト</title>
<link rel="icon" href="<%= request.getContextPath() %>/image/back_botton.png">
</head>
<body >
<div class="container">
	<%@ include file="../top/common.jsp"%>
	<main>
		        <h2>育児クエスト</h2>
        <div id="childcare_quest">
            <div class="sort_filter">
                <select  id="sort" name="sort">
                <option value="">並び替え</option>
                    <option value="time_limit" >締め切り早い順</option>
                    <option value="created_date desc">クエスト登録日順</option>
                 </select>

				<select id="comp_flag" name="comp_flag">
				  <option value="">フィルター</option>
				  <option value="0">未完</option>
				  <option value="1">完了</option>
				  <option value="">すべて</option>

				</select>
				<select id="label" name="label" >
				<option value="">ラベル</option>
				<c:forEach var="e" items="${labelList}" >
				<option value="${e.content_label }">${e.content_label }</option>
				</c:forEach>
				<option value="">すべて</option>

				</select>
            </div>

            <div class="childcare_quest_table">
				<table >

				<tbody id="cq_table">
				</tbody>
				</table>
            </div>
        </div>
        		<div>
			<button class = "btn btn-primary" id="open_modal" name="open_modal_btn">クエスト登録</button>
			<form id="quest_form" name ="quest_form" method="POST" action="<%= request.getContextPath() %>/ChildcareQuestServlet">
				<div id="resist_modal" class="modal">
					 <div class="modal_content">
						 <span class="close">X</span>
						 <div class="modal_body">
						 <h3>クエスト登録</h3>
							タイトル：<textarea  name="title"></textarea><br>
							詳細：<textarea  name="body"></textarea><br>
							<p>いつまで？<p>
							<input type="date" name="time_limit">
							<select id="label" name="label" >
								<option value="9">ラベル</option>
								<c:forEach var="e" items="${labelList}" >
								<option value="${e.childcare_quest_label_id}">${e.content_label }</option>
								</c:forEach>

							</select>
							<input type="hidden" name="family_id" value="${loginUser.family_id }" id="family_id">
							<input class="btn btn-secondary" type="button" id="regist_btn" value="登録" name="bt"><br>
						</div>
					</div>
				</div>
				</form>
		</div>

    </main>
</div>

</body>
<script>

$("#sort").on("change",function(){
	getChildcareQuest();
})

$("#comp_flag").on("change",function(){
	getChildcareQuest();
})
$("#label").on("change",function(){
	getChildcareQuest();
})

$(window).on("load",function(){

	getChildcareQuest();

});



function getChildcareQuest(){

	const sort = $('#sort').val();
	const comp_flag = $('#comp_flag').val();
	const label = $('#label').val()
	$("#cq_table").empty()
	data={
			"process":"getQuestList",
			"sort":sort,
			"completed_flag":comp_flag,
			"label":label
	}

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
		data: data,
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
				flag="達成！";
			}else if(value.completed_flag == 1){
				flag="削除";
			}
			$tr.append("<td name=id id='quest_id' hidden>"+value.childcare_quest_id+"</td>")
			if(value.completed_flag==0){
				$tr.append('<td name=title>'+value.title+"</td>");
			}else{
				$tr.append('<td name=title><s>'+value.title+"</s></td>");
			}
			$tr.append('<td name=time_limit>～'+(date.getMonth()+1)+"/"+date.getDate()+"</td>")
			$tr.append("<td name='label' class='id"+value.label_id+"'>"+value.label+"</td>");
			if(value.completed_flag==0){
				$tr.append("<td name=flag><input class='btn btn-warning' type='button' id='flag_is_"+value.completed_flag+"' value='"+flag+"'></td>");
			}else{
				$tr.append("<td name=flag><input class='btn btn-secondary'type='button' id='flag_is_"+value.completed_flag+"' value='"+flag+"'></td>");
			}
			$tr.append("<td name='show_detail' id='show_detail'>詳細を表示する▼</td>")
			let $body_tr=$('<tr />',{class:"cqbody"});
			$body_tr.append("<td name=body colspan='5' style='padding: 0px;'><div style='height: 22px; padding: 1px;'>"+value.body+"</div></td>");
			$("#cq_table").append($tr).append($body_tr);

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
	$form=$("#quest_form");
	$form.append($("<input />",{
		type:'hidden',
		name:'process',
		value:'regist cq'
	}));

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
		data: $form.serialize(),
		//この下の２行はとりあえず書いてる（書かなくても大丈夫？）
		processDate:false,
		timeStamp: new Date().getTime()
	   //非同期通信が成功したときの処理
	}).done(function(data) {

	    alert("クエストを登録しました！");
	    modal.style.display = 'none';
	    document.quest_form.reset();
	    getChildcareQuest();

	  })
	   //非同期通信が失敗したときの処理
	  .fail(function() {
		//失敗とアラートを出す
		alert("失敗！");
	  });



})


$(document).on("click","#flag_is_0",function(){
	let cqid = $(this).parents("tr").find("#quest_id").text();
	var postData={
			"process":"accomplish cq",
			"quest_id":cqid
	}
	$form=$("#quest_form");

	$.ajaxSetup({scriptCharset:'utf-8'});
	$.ajax({
		url: $form.attr('action'),
		type:"POST",
		dataType:"text",
		data:postData,
		processDate:false,
		timeStamp: new Date().getTime()
	}).done(function(data) {

	    alert("クエストを達成しました！");

	    getChildcareQuest();

	  })
	   //非同期通信が失敗したときの処理
	  .fail(function() {
		//失敗とアラートを出す
		alert("失敗！");
	  });

});

$(document).on("click","#flag_is_1",function(){
	let cqid = $(this).parents("tr").find("#quest_id").text();
	var postData={
			"process":"delete cq",
			"quest_id":cqid
	}
	$form=$("#quest_form");

	$.ajaxSetup({scriptCharset:'utf-8'});
	$.ajax({
		url: $form.attr('action'),
		type:"POST",
		dataType:"text",
		data:postData,
		processDate:false,
		timeStamp: new Date().getTime()
	}).done(function(data) {

	    alert("クエストを削除しました！");

	    getChildcareQuest();

	  })
	   //非同期通信が失敗したときの処理
	  .fail(function() {
		//失敗とアラートを出す
		alert("失敗！");
	  });

});
$(document).on("click","#show_detail",function(){
	$(this).parent().next().children('div').toggle('slow');
	$(this).parent().next().toggle('slow');

});
</script>
</html>