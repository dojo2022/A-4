<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>共通画面</title>
<link rel="stylesheet" href="https://unpkg.com/sanitize.css" >
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/top/common.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body>
    <header class="header">
        <div class="header__inner">
            <h1 class="header__title header-title">
                <img src="<%= request.getContextPath() %>/image/text_logo.jpg" alt="ロゴ" class="text_logo">
            </h1>
            <nav class="header__nav nav" id="js-nav">
            <ul class="nav__items nav-items">
                <li class="nav-items__item"><img src="<%= request.getContextPath() %>/image/home.png" alt="ロゴ画像"><a href="HomeServlet">ホーム</a></li>
                <li class="nav-items__item"><img src="<%= request.getContextPath() %>/image/input_record.png" alt="ロゴ画像"><a href="InputRecordServlet">記録をつける</a></li>
                <li class="nav-items__item"><img src="<%= request.getContextPath() %>/image/view_record.png" alt="ロゴ画像"><a href="RecordViewTopServlet">記録閲覧</a></li>
                <li class="nav-items__item"><img src="<%= request.getContextPath() %>/image/childcare_quest.png" alt="ロゴ画像"><a href="ChildcareQuestServlet">育児クエスト</a></li>
                <li class="nav-items__item"><img src="<%= request.getContextPath() %>/image/hurima.png" alt="ロゴ画像"><a href="HurimaServlet">フリマ</a></li>
                <li class="nav-items__item"><img src="<%= request.getContextPath() %>/image/column.png" alt="ロゴ画像"><a href="ColumnServlet">コラム</a></li>
                <li class="nav-items__item"><img src="<%= request.getContextPath() %>/image/post.png" alt="ロゴ画像"><a href="BbsServlet">掲示板</a></li>
            </ul>
            </nav>

            <button class="header__hamburger hamburger" id="js-hamburger">
            <span></span>
            <span></span>
            <span></span>
            </button>
            <div class ="help">
                <a href="HelpServlet"><img src="<%= request.getContextPath() %>/image/help.png" alt="ヘルプ"></a>
            </div>
            <div class="user_icon">
                <a href="MypageServlet"><img src="<%= request.getContextPath() %>/image/user_icon.png" alt="マイページ"></a>
            </div>

        </div>
    </header>

</body>
 <script src="<%= request.getContextPath() %>/js/top/common.js"></script>

</html>