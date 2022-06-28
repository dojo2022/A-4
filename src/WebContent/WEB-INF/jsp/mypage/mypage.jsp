<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="https://unpkg.com/sanitize.css" >
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/mypage/mypage.css" >

<title>famiTy マイページ</title>
<%@ include file="../top/common.jsp"%>
<link rel="icon" href="<%= request.getContextPath() %>/image/back_botton.png">

</head>
<body>
<main>
<table>
	<tr>
		<td><a href = "<%= request.getContextPath() %>/EditProfileServlet"><img src="<%= request.getContextPath() %>/image/edit_profile.png" height="200" width="auto"></a></td>
		<td><a href = "<%= request.getContextPath() %>/EditPartnerServlet"><img src="<%= request.getContextPath() %>/image/partner_setting.png" height="200" width="auto"></a></td>
		<td><a href = "<%= request.getContextPath() %>/RegisterPartnerServlet"><img src="<%= request.getContextPath() %>/image/partner_register.png" height="200" width="auto"></a></td>
	</tr>
	<tr>
		<td><a href = "<%= request.getContextPath() %>/EditProfileServlet"><img src="<%= request.getContextPath() %>/image/terms_of_service.png" height="200" width="auto"></a></td>
		<td><a href = "<%= request.getContextPath() %>/EditPartnerServlet"><img src="<%= request.getContextPath() %>/image/inquiry.png" height="200" width="auto"></a></td>
		<td><a href = "<%= request.getContextPath() %>/LogoutServlet" onclick="OnLinkClick();"><img src="<%= request.getContextPath() %>/image/logout.png" height="200" width="auto"></a></td>
	</tr>
</table>

</main>
</body>
<script defer src="<%= request.getContextPath() %>/js/mypage/mypage.js"></script>
</html>