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
             element.value = month+'/'+recordDay

 }

 /* アカウント切り替え */
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


	}

}