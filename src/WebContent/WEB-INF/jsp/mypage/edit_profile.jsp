<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>famiTy ユーザー情報登録</title>

<style>
	{
		outline: 1px solid #ff0000;
	}
</style>
<link rel="stylesheet" href="https://unpkg.com/sanitize.css" ></linkrel>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/mypage/edit_profile.css">

<link rel="icon" href="<%= request.getContextPath() %>/image/back_botton.png">
 </head>
<body>
	<div class = "container">
		<main>
		<h2>ユーザー情報登録</h2>
		<%@ include file="../top/common.jsp"%>
			<div class = "form">
				<form id="user_profile_form" method="POST" name="uprform" action="EditProfileServlet">
					<tr>
						<td>
							氏名<input size="30" type="text" id="name" class = "form_user1" name="name" value="${loginUser.name}" required placeholder="氏名" >※必須<br>
						</td>
					</tr>
					<tr>
						<td>
							公開用ユーザー名<input size="30" type="text" id="nickname" class = "form_user2" name="nickname" value="${loginUser.nickname}" required placeholder="公開用ユーザー名" >※必須<br>
						</td>
					</tr>
					<tr>
						<td>
							郵便番号<input size="30" type="text" id="post_code" class = "form_user3" name="post_code" value="${loginUser.post_code}" placeholder="郵便番号" ><br>
						</td>
					</tr>
					<tr>
						<td>
							住所<input size="30" type="text" id="address" class = "form_user4" name="address" value="${loginUser.address}" placeholder="住所" ><br>
						</td>
					</tr>
					<tr>
						<td>
							電話番号<input size="30" type="text" id="tel" class = "form_user5" name="tel" value="${loginUser.tel}" placeholder="電話番号" ><br>
						</td>
					</tr>
					<tr>
						<td>
							生年月日
							<input type="date" name ="birthday" id="edityear" >
							<!--
							<select id="edityear" class = "form_user6" name="year" onclick="return year(); value="${user.birthday}"></select>

							<select id="editmonth" class = "form_user7" name="month" onclick="return month(); value="${user.month}"></select>

							<select id="editday" class = "form_user8" name="day" onclick="return day(); value="${user.day}"></select><br>
 -->
						</td>
					</tr>
					<tr>
						<td>
							性別<select id="nickname" class = "form_user9" name="gender" value="${user.gender}" >
							<option value="女性">女性</option>
							<option value="男性">男性</option>
							<option value="その他">その他</option>
							</select><br>
						</td>
					</tr>
					<tr>
						<td>
							出産予定日<input size="30" type="date" id="due_date" class = "form_user10" name="due_date" value="${user.due_date}" required placeholder="出産予定日" >※必須<br>
						</td>
					</tr>
					<tr>
						<td>
							<input class="user_profile_button" type="submit" name="selectprofile" value="登録" >
						</td>
					</tr>
			</form>
		</div>
	</main>
</div>
<a href="MypageServlet"><img src="<%= request.getContextPath() %>/image/back_botton.png" alt="マイページへ" width = 90px height = 90px ></a>

</body>
</html>