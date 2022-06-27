<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>famiTy 記録詳細画面</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/record/record_view.css">
<%@ include file="../top/common.jsp"%>
</head>
<body>

	<main>

<!-- 今日の日付 -->
<form class="input_record" method="GET" action="<%= request.getContextPath() %>/src/servlet.record/RecordViewServlet">
<h2><strong><span id="today"></span></strong></h2><br>
<input type="hidden" id="hoge" value="${hoge}">

<!-- アカウント切り替え -->

<c:forEach var="e" items="${ucList}" varStatus="status">

<%-- 	<div style="float:left">
   <!--  顔の表示 -->
	<img src="<%= request.getContextPath() %>/image/level1.png">
	<!-- ダーリン・ハニー -->
	${e.name}
	</div> --%>
 <table class="tab-panel" align="left">
	<input type="hidden" class="partner_id" id="partner_id${status.index}" value="${e.partner_id}">


	<tr class="tab-group">
		<td class="tab" id="${status.index}" onclick="tabClick()" >
	    	<img src="<%= request.getContextPath() %>/image/level1.png"><br>${e.name}
		</td>
	</tr>

</table>

<div class="panel" id="${status.index}">
<input type="hidden" id="today"  value="${count}" onclick="todayRecord()">


<!-- 状態文 -->
<div>
	<input type = "text" id="text" name = "detail"  class="text"  readonly style="background-color: lightgray" value="${e.text }">
</div>

<!-- 体温・体重 -->
<div>
	<label>体重(kg)</label><input type = "number" class="number" id="weight" name = "weight"  readonly style="background-color: lightgray" value = "${e.weight }">
	<label>体温(℃)</label><input type = "number" class="number" id="body_temparture" name = "body_temparture"  readonly style="background-color: lightgray" value = "${e.body_temparture }">
</div>
<!-- 家族メーター -->
<table id="family-meter">
	<tr id="appetite" class="view${e.appetite}">
		<td>食欲</td>
		<td class="hidden">
			<label><input type="radio" name="meter1"  value="0" class="radio" ></label>
		</td>
		<td>
			<label><input type="radio" name="meter1"  value="1"  class="radio" readonly="readonly" <c:if test="${e.appetite == 1}">checked</c:if> onclick="return false;"><img src="<%= request.getContextPath() %>/image/level1.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter1" value="2"  class="radio" readonly="readonly" <c:if test="${e.appetite == 2}">checked</c:if> onclick="return false;"><img src="<%= request.getContextPath() %>/image/level2.png" class="radio_image">
			</label>
			</td>
		<td>
			<label><input type="radio" name="meter1"  value="3" class="radio" readonly="readonly" <c:if test="${e.appetite == 3}">checked</c:if> onclick="return false;"><img src="<%= request.getContextPath() %>/image/level3.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter1"  value="4" class="radio" readonly="readonly" <c:if test="${e.appetite == 4}">checked</c:if> onclick="return false;"><img src="<%= request.getContextPath() %>/image/level4.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter1"  value="5" class="radio" readonly="readonly" <c:if test="${e.appetite == 5}">checked</c:if> onclick="return false;"><img src="<%= request.getContextPath() %>/image/level5.png" class="radio_image">
			</label>
		</td>
	</tr>
	<tr id="sleepiness" class="view${e.sleepiness}">
		<td>眠気</td>
		<td class="hidden">
			<label><input type="radio" name="meter2" value="0" class="radio" ></label>
		</td>
		<td>
			<label><input type="radio" name="meter2"  value="1" class="radio" readonly="readonly" <c:if test="${e.sleepiness == 1}">checked</c:if> onclick="return false;"><img src="<%= request.getContextPath() %>/image/level1.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter2" value="2" class="radio"  readonly="readonly" <c:if test="${e.sleepiness == 2}">checked</c:if> onclick="return false;"><img src="<%= request.getContextPath() %>/image/level2.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter2" value="3" class="radio" readonly="readonly" <c:if test="${e.sleepiness == 3}">checked</c:if> onclick="return false;"><img src="<%= request.getContextPath() %>/image/level3.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter2" value="4" class="radio" readonly="readonly" <c:if test="${e.sleepiness == 4}">checked</c:if> onclick="return false;"><img src="<%= request.getContextPath() %>/image/level4.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter2"  value="5" class="radio" readonly="readonly" <c:if test="${e.sleepiness == 5}">checked</c:if> onclick="return false;"><img src="<%= request.getContextPath() %>/image/level5.png" class="radio_image">
			</label>
		</td>
	</tr>
	<tr id="humor" class="view${e.humor}">

		<td>機嫌</td>
		<td class="hidden">
			<label><input type="radio" name="meter3" value="0" class="radio" ></label>
		</td>
		<td>

			<label><input type="radio" name="meter3" <c:if test="${e.humor == 1}">checked</c:if> readonly="readonly" value="1" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level1.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter3" <c:if test="${e.humor == 2}">checked</c:if> readonly="readonly" value="2" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level2.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter3" <c:if test="${e.humor == 3}">checked</c:if> readonly="readonly" value="3" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level3.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter3" <c:if test="${e.humor == 4}">checked</c:if> readonly="readonly" value="4" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level4.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter3" <c:if test="${e.humor == 5}">checked</c:if> readonly="readonly" value="5" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level5.png" class="radio_image">
			</label>
		</td>
	</tr>
	<tr id="nausea" class="view${e.nausea}">
		<td>吐き気</td>
		<td class="hidden">
			<label><input type="radio" name="meter4"  value="0" class="radio"></label>
		</td>
		<td>
			<label><input type="radio" name="meter4" <c:if test="${e.nausea == 1}">checked</c:if> readonly="readonly" value="1" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level1.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter4" <c:if test="${e.nausea == 2}">checked</c:if> readonly="readonly" value="2" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level2.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter4" <c:if test="${e.nausea == 3}">checked</c:if> readonly="readonly" value="3" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level3.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter4" <c:if test="${e.nausea == 4}">checked</c:if> readonly="readonly" value="4" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level4.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter4" <c:if test="${e.nausea == 5}">checked</c:if>readonly="readonly" value="5" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level5.png" class="radio_image">
			</label>
		</td>
	</tr>
	<tr id="stress" class="view${e.stress}">
		<td>ストレス</td>
		<td class="hidden">
			<label><input type="radio" name="meter5"  value="0" class="radio" ></label>
		</td>
		<td>
			<label><input type="radio" name="meter5" <c:if test="${e.stress == 1}">checked</c:if> readonly="readonly" value="1" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level1.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter5" <c:if test="${e.stress == 2}">checked</c:if> readonly="readonly" value="2" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level2.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter5" <c:if test="${e.stress == 3}">checked</c:if> readonly="readonly" value="3" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level3.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter5" <c:if test="${e.stress == 4}">checked</c:if> readonly="readonly" value="4" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level4.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter5" <c:if test="${e.stress == 5}">checked</c:if> readonly="readonly" value="5" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level5.png" class="radio_image">
			</label>
		</td>
	</tr>
	<tr id="dizziness" class="view${e.dizziness}">
		<td>めまい</td>
		<td class="hidden">
			<label><input type="radio" name="meter6" value="0" class="radio" ></label>
		</td>
		<td>
			<label><input type="radio" name="meter6" <c:if test="${e.dizziness == 1}">checked</c:if> readonly="readonly" value="1" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level1.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter6" <c:if test="${e.dizziness == 2}">checked</c:if> readonly="readonly" value="2" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level2.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter6" <c:if test="${e.dizziness == 3}">checked</c:if> readonly="readonly" value="3" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level3.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter6" <c:if test="${e.dizziness == 4}">checked</c:if> readonly="readonly" value="4" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level4.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter6" <c:if test="${e.dizziness == 5}">checked</c:if> readonly="readonly" value="5" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level5.png" class="radio_image">
			</label>
		</td>
	</tr>
	<tr id="fatigue" class="view${e.fatigue}">
		<td>疲労</td>
		<td class="hidden">
			<label><input type="radio" name="meter7" value="0" class="radio"></label>
		</td>
		<td>
			<label><input type="radio" name="meter7" <c:if test="${e.fatigue == 1}">checked</c:if> readonly="readonly" value="1" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level1.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter7" <c:if test="${e.fatigue == 2}">checked</c:if> readonly="readonly" value="2" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level2.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter7" <c:if test="${e.fatigue == 3}">checked</c:if> readonly="readonly" value="3" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level3.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter7" <c:if test="${e.fatigue == 4}">checked</c:if> readonly="readonly" value="4" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level4.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter7" <c:if test="${e.fatigue == 5}">checked</c:if> readonly="readonly" value="5" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level5.png" class="radio_image">
			</label>
		</td>
	</tr>
	<tr id="stiff_shoulder" class="view${e.stiff_shoulder}">
		<td>肩こり</td>
		<td class="hidden">
			<label><input type="radio" name="meter8" value="0" class="radio" ></label>
		</td>
		<td>
			<label><input type="radio" name="meter8" <c:if test="${e.stiff_shoulder == 1}">checked</c:if> readonly="readonly" value="1" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level1.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter8" <c:if test="${e.stiff_shoulder == 2}">checked</c:if> readonly="readonly" value="2" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level2.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter8" <c:if test="${e.stiff_shoulder == 3}">selected</c:if> readonly="readonly" value="3" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level3.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter8" <c:if test="${e.stiff_shoulder == 4}">selected</c:if> readonly="readonly" value="4"  class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level4.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter8" <c:if test="${e.stiff_shoulder == 5}">selected</c:if> readonly="readonly" value="5" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level5.png" class="radio_image">
			</label>
		</td>
	</tr>
	<tr id="headache" class="view${e.headache}">
		<td>頭痛</td>
		<td class="hidden">
			<label><input type="radio" name="meter9" value="0" class="radio"></label>
		</td>
		<td>
			<label><input type="radio" name="meter9" <c:if test="${e.headache == 1}">checked</c:if> readonly="readonly" value="1" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level1.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter9" <c:if test="${e.headache == 2}">checked</c:if> readonly="readonly" value="2" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level2.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter9" <c:if test="${e.headache == 3}">checked</c:if> readonly="readonly" value="3" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level3.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter9" <c:if test="${e.headache == 4}">checked</c:if> readonly="readonly" value="4" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level4.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter9" <c:if test="${e.headache == 5}">checked</c:if> readonly="readonly" value="5" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level5.png" class="radio_image">
			</label>
		</td>
	</tr>
	<tr id="backache" class="view${e.backache}">
		<td>腰痛</td>
		<td class="hidden">
			<label><input type="radio" name="meter10" value="0" class="radio" ></label>
		</td>
		<td>
			<label><input type="radio" name="meter10" <c:if test="${e.backache == 1}">checked</c:if> readonly="readonly" value="1" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level1.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter10" <c:if test="${e.backache == 2}">checked</c:if> readonly="readonly" value="2" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level2.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter10" <c:if test="${e.backache == 3}">checked</c:if> readonly="readonly" value="3" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level3.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter10" <c:if test="${e.backache == 4}">checked</c:if> readonly="readonly" value="4" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level4.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter10" <c:if test="${e.backache == 5}">checked</c:if> readonly="readonly" value="5" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level5.png" class="radio_image">
			</label>
		</td>
	</tr>
	<tr id="stomach_ache" class="view${e.stomach_ache}">
		<td>腹痛</td>
		<td class="hidden">
			<label><input type="radio" name="meter11" value="0" class="radio" ></label>
		</td>
		<td>
			<label><input type="radio" name="meter11" <c:if test="${e.stomach_ache == 1}">checked</c:if> readonly="readonly" value="1" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level1.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter11" <c:if test="${e.stomach_ache == 2}">checked</c:if> readonly="readonly" value="2" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level2.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter11" <c:if test="${e.stomach_ache == 3}">checked</c:if> readonly="readonly" value="3" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level3.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter11" <c:if test="${e.stomach_ache == 4}">checked</c:if> readonly="readonly" value="4" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level4.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter11" <c:if test="${e.stomach_ache == 5}">checked</c:if> readonly="readonly" value="5" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level5.png" class="radio_image">
			</label>
		</td>
	</tr>
	<tr id="feeling" class="view${e.feeling}">
		<td>気分</td>
		<td class="hidden">
			<label><input type="radio" name="meter12"  value="0" class="radio" ></label>
		</td>
		<td>
			<label><input type="radio" name="meter12" <c:if test="${e.feeling == 1}">checked</c:if> readonly="readonly" value="1" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level1.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter12" <c:if test="${e.feeling == 2}">checked</c:if> readonly="readonly" value="2" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level2.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter12" <c:if test="${e.feeling == 3}">checked</c:if> readonly="readonly" value="3" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level3.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter12" <c:if test="${e.feeling == 4}">checked</c:if> readonly="readonly" value="4" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level4.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter12" <c:if test="${e.feeling == 5}">checked</c:if> readonly="readonly" value="5" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level5.png" class="radio_image">
			</label>
		</td>
	</tr>
	<tr id="tidying" class="view${e.tidying}">
		<td>お片付け</td>
		<td class="hidden">
			<label><input type="radio" name="meter13"  value="0" class="radio" ></label>
		</td>
		<td>
			<label><input type="radio" name="meter13" <c:if test="${e.tidying == 1}">checked</c:if> readonly="readonly" value="1" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level1.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter13" <c:if test="${e.tidying == 2}">checked</c:if> readonly="readonly" value="2" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level2.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter13" <c:if test="${e.tidying == 3}">checked</c:if> readonly="readonly" value="3" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level3.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter13" <c:if test="${e.tidying == 4}">checked</c:if> readonly="readonly" value="4" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level4.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter13" <c:if test="${e.tidying == 5}">checked</c:if> readonly="readonly" value="5" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level5.png" class="radio_image">
			</label>
		</td>
	</tr>
	<tr id="self_assertion" class="view${e.self_assertion}">
		<td>イヤイヤ</td>
		<td class="hidden">
			<label><input type="radio" name="meter14" value="0" class="radio" ></label>
		</td>
		<td>
			<label><input type="radio" name="meter14" <c:if test="${e.self_assertion == 1}">checked</c:if> readonly="readonly" value="1" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level1.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter14" <c:if test="${e.self_assertion == 2}">checked</c:if> readonly="readonly" value="2" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level2.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter14" <c:if test="${e.self_assertion == 3}">checked</c:if> readonly="readonly" value="3" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level3.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter14" <c:if test="${e.self_assertion == 4}">checked</c:if> readonly="readonly" value="4" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level4.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter14" <c:if test="${e.self_assertion == 5}">checked</c:if> readonly="readonly" value="5" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level5.png" class="radio_image">
			</label>
		</td>
	</tr>
	<tr id="poop" class="view${e.poop}">
		<td>うんち</td>
		<td class="hidden">
			<label><input type="radio" name="meter15"  value="0" class="radio" ></label>
		</td>
		<td>
			<label><input type="radio" name="meter15" <c:if test="${e.poop == 1}">checked</c:if> readonly="readonly" value="1" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level1.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter15"  <c:if test="${e.poop == 2}">checked</c:if> readonly="readonly" value="2" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level2.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter15"  <c:if test="${e.poop == 3}">checked</c:if> readonly="readonly" value="3" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level3.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter15"  <c:if test="${e.poop == 4}">checked</c:if> readonly="readonly" value="4" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level4.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter15"  <c:if test="${e.poop == 5}">checked</c:if> readonly="readonly" value="5" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level5.png" class="radio_image">
			</label>
		</td>
	</tr>
	<tr id="tooth_brushing" class="view${e.tooth_brushing}">
		<td>歯磨き</td>
		<td class="hidden">
			<label><input type="radio" name="meter16" value="0" class="radio" ></label>
		</td>
		<td>
			<label><input type="radio" name="meter16"  <c:if test="${e.tooth_brushing == 1}">checked</c:if> readonly="readonly" value="1" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level1.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter16" <c:if test="${e.tooth_brushing == 2}">checked</c:if> readonly="readonly" value="2" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level2.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter16" <c:if test="${e.tooth_brushing == 3}">checked</c:if> readonly="readonly" value="3" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level3.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter16" <c:if test="${e.tooth_brushing == 4}">checked</c:if> readonly="readonly" value="4" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level4.png" class="radio_image">
			</label>
		</td>
		<td>
			<label><input type="radio" name="meter16" <c:if test="${e.tooth_brushing == 5}">checked</c:if> readonly="readonly" value="5" class="radio" onclick="return false;"><img src="<%= request.getContextPath() %>/image/level5.png" class="radio_image">
			</label>
		</td>
	</tr>
</table>

</div>
</c:forEach>
</form>

</main>
<a href="/MaternityApp/RecordViewTopServlet"><img src="./image/back_botton.png" width="50px" height="50px" style="margin-right:730px;"></a>


<script>




<!-- 日付 -->
 window.onload = function() {
    // URLを取得
    const url = new URL(window.location.href);

    // URLSearchParamsオブジェクトを取得
    const params = url.searchParams;

    // consoleに受け取ったパラメータを出力
    console.log(params);

    // パラメータから「month」と「recordDay」を取得
    let month = params.get("month");
    let recordDay = params.get("recordDay");

     console.log(month);
     console.log(recordDay);

     let element = document.getElementById('today');
     element.textContent = month+'月'+recordDay+'日の記録';

     let a = document.getElementById('hoge').value;
 	if(a == 'エラー'){
 		 alert('記録がまだありません。記録閲覧画面に戻ります。');
 		 location.href = "/MaternityApp/RecordViewTopServlet";
 	}


}


<!-- アカウント切り替え -->
// 選んだタブをアクティブにする
document.getElementById('0').classList.add('is-active');
let index=0;
function tabClick(){
	// タブに対してクリックイベントを適用
	const tabs = document.getElementsByClassName('tab');
	for(let i = 0; i < tabs.length; i++) {
		tabs[i].addEventListener('click', tabSwitch, false);
	}

	document.getElementById('0').classList.add('is-show')
	// タブをクリックすると実行する関数
	function tabSwitch(){
	// タブのclassの値を変更
	document.getElementsByClassName('is-active')[0].classList.remove('is-active');
		this.classList.add('is-active');
	// コンテンツのclassの値を変更
	document.getElementsByClassName('is-show')[0].classList.remove('is-show');
		const arrayTabs = Array.prototype.slice.call(tabs);
		index = arrayTabs.indexOf(this);
		document.getElementsByClassName('panel')[index].classList.add('is-show');
	};
}

</script>
</body>
</html>