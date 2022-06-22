<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>famiTy ユーザー情報登録</title>
<link rel="stylesheet" href="https://unpkg.com/sanitize.css" ></linkrel>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/mypage/edit_profile.css">
</head>
<body>
	<div class = "container">
		<main>
		<h2>ユーザー情報登録</h2>
			<div class = "form">
				<form id="user_profile_from" method="POST" name="uprform" action="EditProfileServlet">
					<tr>
						<td>
							氏名<input size="30" type="text" id="name" class = "form_user1" name="name" value="${user.name}" required placeholder="氏名">※必須<br>
						</td>
					</tr>
					<tr>
						<td>
							公開用ユーザー名<input size="30" type="text" id="nickname" class = "form_user2" name="nickname" value="${user.nickname}" required placeholder="公開用ユーザー名">※必須<br>
						</td>
					</tr>
					<tr>
						<td>
							郵便番号<input size="30" type="text" id="post_code" class = "form_user3" name="post_code" value="${user.post_code}" placeholder="郵便番号"><br>
						</td>
					</tr>
					<tr>
						<td>
							住所<input size="30" type="text" id="address" class = "form_user4" name="address" value="${user.address}" placeholder="住所"><br>
						</td>
					</tr>
					<tr>
						<td>
							電話番号<input size="30" type="text" id="tel" class = "form_user5" name="tel" value="${user.tel}" placeholder="電話番号"><br>
						</td>
					</tr>
					<tr>
						<td>
							生年月日
							<input type="date" name ="birthday" id="edityear">
							<!--
							<select id="edityear" class = "form_user6" name="year" onclick="return year(); value="${user.birthday}"></select>

							<select id="editmonth" class = "form_user7" name="month" onclick="return month(); value="${user.month}"></select>

							<select id="editday" class = "form_user8" name="day" onclick="return day(); value="${user.day}"></select><br>
 -->
						</td>
					</tr>
					<tr>
						<td>
							性別<select id="nickname" class = "form_user9" name="gender" value="${user.gender}">
							<option value="女性">女性</option>
							<option value="男性">男性</option>
							<option value="その他">その他</option>
							</select><br>
						</td>
					</tr>
					<tr>
						<td>
							出産予定日<input size="30" type="date" id="due_date" class = "form_user10" name="due_date" value="${user.due_date}" required placeholder="出産予定日">※必須<br>
						</td>
					</tr>
					<tr>
						<td>
							<input class="user_profile_button" type="button" name="selectprofile" value="登録" onclick="return upd();">
						</td>
					</tr>
			</form>
		</div>
	</main>
</div>
<a href="/MaternityApp/MypageServlet.java"><img src="赤ちゃんの画像リンクが入る" alt="マイページへ" onclick="return check();"></a>
<script src="<%= request.getContextPath() %>/js/mypage/edit_profile.js"></script>
</body>
</html>