<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/sanitize.css" >
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/top/login.css" >
<title>famity ログイン</title>
</head>
<body>
<div class="container">
	<%@ include file="common.jsp"%>
	<main>
        <div class="form">
            <h1>log in</h1>
            <p class="error_msg" style="color:red">${msg}<p>
            <form id="login_form" method="POST" action="LoginServlet">
                <table>
                  <tr>
                    <td>
                      <label>ユーザーID<br>
                      <input type="text" name="user_id" placeholder="ユーザー名">
                      </label>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <label>パスワード<br>
                      <input type="password" name="password" placeholder="パスワード">
                      </label>
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
</html>