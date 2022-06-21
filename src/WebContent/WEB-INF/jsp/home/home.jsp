<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/sanitize.css" >
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/home/home.css" >
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script defer src="<%= request.getContextPath() %>/js/home/home.js"></script>
<title>ページのタイトル</title>
</head>
<body>
<div class="container">
	<%@ include file="../top/common.jsp"%>
	<main>
        <h1>ホーム</h1>
        <div class="countdown_weeks">
            <table>
                <tr>
                    <td><h3>出産予定日まで${remain_day}日</h3></td>
                    <td><h3>現在${now_weeks}週目</h3></td>
                </tr>
            </table>
        </div>
        <div class="labor">
            <input type="button" id="labor_btn" name="labor_pain" >
            <span id="today_labor_count"></span>
        </div>
        <div class="report">
            <div class="report_info mother">
                <div class="mother_img">
                    <img src="<%= request.getContextPath() %>${mother_report.image}" alt="ママの画像">
                </div>
                <div class="report_text">
                    <h3 class="report_title">
                        ${mother_report.title }
                    </h3>
                    <p>
                        ${mother_report.body }
                    </p>
                </div>
            </div>
            <div class="report_info baby">
                <div class="baby_img">
                    <img src="<%= request.getContextPath() %>${baby_report.image}" alt="赤ちゃんの画像">
                </div>
                <div class="report_text">
                    <h3 class="report_title">
                        ${baby_report.title }
                    </h3>
                    <p>
                        ${baby_report.body }
                    </p>
                </div>
            </div>
        </div>

    </main>
</div>

</body>
</html>