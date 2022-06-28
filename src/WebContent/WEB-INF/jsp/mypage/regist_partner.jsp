<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>famiTy パートナー登録</title>
<%@ include file="../top/common.jsp"%>

</head>
<body>
    <main>
		<div id="overlay">
		  <div class="cv-spinner">
		    <span class="spinner"></span>
		  </div>
		</div>
        <div class="form">
            <h2>パートナー登録</h2>
            <form id="search_account_form" method="POST" action="ReregistPartnerServlet">
                <table>
                  <tr>
                    <td>
                      <label>招待するパートナーのメールアドレスを入力してください。<br>
                      <input type="text" name="email" placeholder="ex) mail@gmail.com" required>
                      </label>
                    </td>
                    <td colspan="2">
                      <input type="button" id="btn" value="送信">
                      <span id="error_message"></span>
                    <td>
                  </tr>
                </table>
                <p>パートナーが登録されていない場合、アカウント作成ページが送られます。</p>
              </form>
        </div>
    </main>


<script src="https://code.jquery.com/jquery-3.0.0.min.js"></script>
<script >

$("#btn").on('click',function(e){
	data={
			email:$('#search_account_form [name=email]').val()
	}
	sendMail(data);

})

function sendMail(data){
	$(document).ajaxSend(function() {
	        $("#overlay").fadeIn(300);
	    });
	$.ajax({
		type:'post',
		url: '/MaternityApp/RegisterPartnerServlet',
		dataType:"text",
		data:data
	},

	).done(function(data,status) {
		$("#overlay").fadeOut(300);
		// 正常
		if(data=="noEmail"){
			alert("招待メールが送信されました。");
		}else if(data=="success"){
			alert("アカウント作成メールが送信されました");
		}else{
			alert("送信できませんでした。");
		}
	}).fail(function(xhr, status, error) {
		$("#overlay").fadeOut(300);
		// 異常
		alert(xhr+"\n"+status+"\n"+error);
	});
}

</script>
</body>
</html>