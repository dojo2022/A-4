'use strict';

// 年月日のoptionをminからmaxまで生成

(function goAjax() {
  let selectBox = document.getElementByID('edityear');
  for (let i = 1900; i <= 2050; i++) {
    let option = '<option value="' + i + '">' + i + '</option>';
    selectBox.insertAdjacentHTML('beforeend', option);
  }
})()
(function() {
  let selectBox = document.getElementByID('editmonth');
  for (let i = 1; i <= 12; i++) {
    let option = '<option value="' + i + '">' + i + '</option>';
    selectBox.insertAdjacentHTML('beforeend', option);
  }
})()
(function() {
  let selectBox = document.getElementByID('editday');
  for (let i = 1; i <= 31; i++) {
    let option = '<option value="' + i + '">' + i + '</option>';
    selectBox.insertAdjacentHTML('beforeend', option);
  }
})()

if (!(document.getElementById('myText',).value)) {
    alert('空文字またはnullです');
}