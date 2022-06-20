
 'use strict';
function goAjax(){

    /*入力値を取得してくる*/

	let email = document.getElementById('email').value;
	let password = document.getElementById('password').value;

    let postDate = {email:email,password:password}

    /*非同期処理開始*/

    $.ajaxSetup({scriptCharset:'utf-8'});
	$.ajax({

        /*どのサーブレットに送るか*/
        url: '/MaternityApp/servlet/top/CreateAccountServlet.java',

        /*どのメソッドを使用するか*/
        type:"POST",

       /* 受け取るデータのタイプ*/
        dataType:"text",

       /* 何をサーブレットに飛ばすか（変数を記述）*/
        data: postData,

        /*この下の２行はとりあえず書いてる（書かなくても大丈夫？）*/
        processDate:false,
        timeStamp: new Date().getTime()

    /*非同期通信が成功したときの処理*/
	}).done(function(data) {

		/*成功した時の処理を書く*/
        if (data.equals('success')){
            alert('登録に成功しました。');

            /*アカウントを作成したので自動的に初回ログイン、プロフィール編集画面へ*/
            window.location.href = '/MaternityApp/servlet/mypage/EditProfileServlet';

        } else if(data.equals('exist')){
            alart('すでに登録されています。');
        }else {
            alert('登録できませんでした。');
        }
    })
    /* 非同期通信が失敗したときの処理*/
     .fail(function() {
        /*失敗した時の処理を書く*/
        alert('失敗');
      });


}