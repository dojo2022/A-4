<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/sanitize.css" >
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/column/mypage.css" >

<title>famiTy マイページ</title>
<%@ include file="../top/common.jsp"%>
</head>
<body>
<table>
	<tr>
		<td><a href = "<%= request.getContextPath() %>/jsp/mypage/EditProfileServlet"><img src="<%= request.getContextPath() %>/image/edit_profile.png"></a></td>
		<td><a href = "<%= request.getContextPath() %>/jsp/mypage/PartnerSettingServlet"><img src="<%= request.getContextPath() %>/image/partner_setting.png"></a></td>
		<td><a href = "<%= request.getContextPath() %>/jsp/mypage/PartnerRegisterServlet"><img src="<%= request.getContextPath() %>/image/partner_register.png"></a></td>
	</tr>
	<tr>
		<td><a href = "<%= request.getContextPath() %>/jsp/mypage/EditProfileServlet"><img src="<%= request.getContextPath() %>/image/terms_of_service.png"></a></td>
		<td><a href = "<%= request.getContextPath() %>/jsp/mypage/PartnerSettingServlet"><img src="<%= request.getContextPath() %>/image/inquiry.png"></a></td>
		<td><a href = "<%= request.getContextPath() %>/jsp/mypage/LogoutServlet"><img src="<%= request.getContextPath() %>/image/logout.png"></a></td>
	</tr>
</table>





</body>
</html>