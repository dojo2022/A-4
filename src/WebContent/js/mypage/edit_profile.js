'use strict';

// 年月日のoptionをminからmaxまで生成

function year() {
  let selectBox = document.getElementById('edityear');
  for (let i = 1900; i <= 2050; i++) {
    let option = '<option value="' + i + '">' + i + '</option>';
    selectBox.insertAdjacentHTML('beforeend', option);
  }
}
function month() {
  let selectBox = document.getElementById('editmonth');
  for (let i = 1; i <= 12; i++) {
    let option = '<option value="' + i + '">' + i + '</option>';
    selectBox.insertAdjacentHTML('beforeend', option);
  }
}
function day() {
  let selectBox = document.getElementById('editday');
  for (let i = 1; i <= 31; i++) {
    let option = '<option value="' + i + '">' + i + '</option>';
    selectBox.insertAdjacentHTML('beforeend', option);
  }
}
function upd(){
		document.getElementById('user_profile_from').submit();
        alert("登録しました");
        return true;    //メッセージ出力
    }
function check(){
	function inputChange(){
            if (window.confirm('登録されていません。移動しますか？')) {
      }
    }
  }