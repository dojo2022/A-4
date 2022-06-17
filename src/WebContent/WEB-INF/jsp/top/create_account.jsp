<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/sanitize.css" >
<link rel="stylesheet" href="/WebContent/css/top/create_account.css">
<title>アカウント作成｜famiTy</title>
</head>
<body>
    <div class = "all">
        <div class = "item">
            <h1>ロゴ</h1>
            <form method="POST" action="/MaternityApp/servlet/top/CreateAccountServlet.java">
            <p><input type="text" class = "form_item1" name="email" placeholder="メールアドレス" required></p><br>
            <p><input type="password"  class = "form_item2" name="password" placeholder="password" required></p><br>
            <p><input type="button" name="createAccount" value="アカウント作成"><br>
            </form>
            <p id="return_page"><input type= "button" onclick="location.href='/MaternityApp/servlet/top/LoginServlet.java'" value="ログインページへ"
                style="font-size:2px;width: 6rem; "></p>
        </div>
    </div>
</body>
</html>