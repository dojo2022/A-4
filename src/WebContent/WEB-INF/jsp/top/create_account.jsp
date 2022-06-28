<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/sanitize.css" ></linkrel>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/top/create_account.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>famiTy 新規アカウント作成</title>
<link rel="icon" href="<%= request.getContextPath() %>/image/back_botton.png">
</head>
<body>
<div class = "container">
    <main>
        <div class = "form">
            <h1><img src="<%= request.getContextPath() %>/image/login_logo.jpg" alt="ロゴ"></h1>
            <form id="create_account_from" method="POST" action="CreateAccountServlet">
                <table>
                    <tr>
                        <td>
                            <p><input type="text" id="email" class = "form_item1" name="email" value="${param.email}" placeholder="メールアドレス" required></p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p><input type="password" id="password" class = "form_item2" name="password" value="${param.password}" placeholder="password" required></p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p><input class="create_account_button" type="button" name="createAccount" value="アカウント作成" onclick="goAjax()"></p>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <input class="create_account_button" type= "button" onclick="location.href='LoginServlet'" value="ログインページへ"
                            style="font-size:2px;width: 6rem; ">
                 		</td>
                 	</tr>
				</table>
			</form>
        </div>
    </main>
</div>
<script src="<%= request.getContextPath() %>/js/top/create_account.js"></script>
</body>
</html>