<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/sanitize.css" >
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/top/login.css" >
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>famity ログイン</title>
</head>
<body>
<div class="container">
	<main>
        <div class="form">
            <h1><img src="<%= request.getContextPath() %>/image/logo.png" alt="ロゴ"></h1>
            <p class="error_msg" style="color:red">${msg}<p>
            <form id="login_form" method="POST" action="LoginServlet">
                <table>
                  <tr>
                    <td>
                      <input type="text" name="email" placeholder="メールアドレス">
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <input type="password" name="password" placeholder="password">
                    </td>
                  <tr>
                  <tr>
                    <td colspan="2">
                      <input id="login_btn" type="button" value="ログイン">
                      <span id="error_message"></span>
                    <td>
                  </tr>
                  <tr>
                      <td class="auth_non">
                    <p><b>パスワードを忘れてしまった場合は<a href="AccountReregisterServlet">こちら</a>・
                    アカウントをお持ちでない方は<a href="AccountRegisterServlet">こちら</a></b></p>
                      </td>
                  </tr>
                </table>
              </form>
        </div>

    </main>
</div>
<script src="<%= request.getContextPath() %>/js/top/login.js"></script>
</body>
<script >
	$("#login_btn").on('click',async function(e){
	    //e.preventDefault();
	    let email = $('#login_form [name=email').val();
	    let password = $('#login_form [name=password]').val();
	    //alert(user_id+"\n"+password);
	    if(!(email && password)){
	        alert("メールアドレスとパスワードを入力してください");
	        return false;
	    }
	    const hashed_password = await digestMessage(password);
	    $('#login_form [name=password]').val(hashed_password);
	  $('form').submit();
	})


	async function digestMessage(message) {
	const msgUint8 = new TextEncoder().encode(message);                           // encode as (utf-8) Uint8Array
	const hashBuffer = await crypto.subtle.digest('SHA-256', msgUint8);
	const hashArray = Array.from(new Uint8Array(hashBuffer));                     // convert buffer to byte array
	const hashHex = hashArray.map(b => b.toString(16).padStart(2, '0')).join(''); // convert bytes to hex string
	return hashHex;
	}
</script>
</html>