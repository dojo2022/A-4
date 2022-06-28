<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>famiTy パートナー登録</title>
<%@ include file="../top/common.jsp"%>

</head>
<body style="text-align:center">
    <main>
		<div id="overlay">
		  <div class="cv-spinner">
		    <span class="spinner"></span>
		  </div>
		</div>
        <div class="form">
            <h2>パートナー登録</h2>
            <form id="search_account_form" method="POST" action="ReregistPartnerServlet">
                <table align="center" >
                  <tr>
                    <td>
                      <label>連携するパートナーのメールアドレスを入力してください。<br>
                      <input type="text" name="email" placeholder="ex) mail@gmail.com" required>
                      </label>
                    </td>
                   </tr>
                   <tr>
                    <td colspan="2">
                      <input type="button" id="btn" value="パートナー登録">
                      <span id="error_message"></span>
                    <td>
                  </tr>
                </table>
                <br>
                <br>
                <p>パートナーがアカウント登録されていない場合、パートナー登録はできません。<br>
                	パートナーの新規アカウント登録を行ってから、再度実行してください。</p>
                <input type="hidden" name="family_id" value="${family_id}">
              </form>
        </div>
    </main>


<script src="https://code.jquery.com/jquery-3.0.0.min.js"></script>
<script >

$("#btn").on('click',function(e){
	data={
			email:$('#search_account_form [name=email]').val(),
			family_id:$('#search_account_form [name=family_id]').val()
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
		if(data=="success"){
			alert("パートナー登録しました。");
		}else{
			alert("アカウントが存在しません。パートナーの新規アカウント登録をしてください。");
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