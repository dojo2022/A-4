<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/sanitize.css" >
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/home/home.css" >
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script defer src="<%= request.getContextPath() %>/js/home/home.js"></script>
<title>famiTy ホーム</title>
<link rel="icon" href="<%= request.getContextPath() %>/image/back_botton.png">
</head>
<body>
<div class="container">
	<%@ include file="../top/common.jsp"%>
	<main>
        <h1>ホーム</h1>
        <div class="countdown_weeks">
            <table>
                <tr bgcolor="#DCD79F">
                    <td><h3>出産予定日まで${remain_day}日</h3></td>
                    <td><h3>現在${now_weeks}週目</h3></td>
                </tr>
            </table>
        </div>
        <div class="labor">
            <input class="btn btn-danger" type="button" id="labor_btn" name="labor_pain" bgcolor="#D2DFF3">
            <span id="today_labor_count"></span>
        </div>

        <div class="card mb-3 " >
		  <div class="row g-0">
		    <div class="col-md-4">
		      <img src="<%= request.getContextPath() %>${mother_report.image}" alt="" style="width:100%">
		    </div>
		    <div class="col-md-8">
		      <div class="card-body">
		        <h3 class="card-title">${mother_report.title }</h3>
		        <p class="card-text">${mother_report.body}</p>
		      </div>
		    </div>
		  </div>
		</div>
		<div class="card mb-3 " >
		  <div class="row g-0">
		    <div class="col-md-4">
		      <img src="<%= request.getContextPath() %>${baby_report.image}" alt="" style="width:100%">
		    </div>
		    <div class="col-md-8">
		      <div class="card-body">
		        <h3 class="card-title">${baby_report.title }</h3>
		        <p class="card-text">${mother_report.body}</p>
		      </div>
		    </div>
		  </div>
		</div>


    </main>
</div>

</body>
</html>