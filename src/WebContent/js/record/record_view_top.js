const week = ["日", "月", "火", "水", "木", "金", "土"];
const today = new Date();
// 月末だとずれる可能性があるため、1日固定で取得
var showDate = new Date(today.getFullYear(), today.getMonth(), 1);

// 初期表示
window.onload = function () {
	showDate.setMonth(showDate.getMonth());
    var month = showDate.getMonth();
    var year = showDate.getFullYear();
    getMonthDay(year,month+1)
    showProcess(showDate);
};
// 前の月表示
function prev(){
    showDate.setMonth(showDate.getMonth() - 1);
    var month = showDate.getMonth();
    var year = showDate.getFullYear();
    getMonthDay(year,month+1)
    showProcess(showDate);
}

// 次の月表示
function next(){
    showDate.setMonth(showDate.getMonth() + 1);
    var month = showDate.getMonth();
    var year = showDate.getFullYear();
    getMonthDay(year,month+1)
    showProcess(showDate);
}

// カレンダー表示
function showProcess(date) {
    var year = date.getFullYear();
    var month = date.getMonth();
    document.querySelector('#header').innerHTML = year + "年 " + (month + 1) + "月";

    var calendar = createProcess(year, month);
    document.querySelector('#calendar').innerHTML = calendar;
}

function getMonthDay(year,month){
     /*非同期処理開始*/
	var postData={"process":"getmonthday",
				  "year":year,
				  "month":month
				}
    /*非同期処理開始*/
    let postdata={month:6}

    $.ajaxSetup({scriptCharset:'utf-8'});
	$.ajax({


        /*どのサーブレットに送るか*/
        url: '/MaternityApp/RecordViewTopServlet',

        /*どのメソッドを使用するか*/
        type:"GET",

       /* 受け取るデータのタイプ*/
        dataType:"json",

       /* 何をサーブレットに飛ばすか（変数を記述）*/
        data:postData ,

        /*この下の２行はとりあえず書いてる（書かなくても大丈夫？）*/
        processDate:false,
        timeStamp: new Date().getTime()

    /*非同期通信が成功したときの処理*/
	}).done(function(data) {

		/*成功した時の処理を書く*/
		console.log('成功！！');
        console.log(data);
        /*hiddenのテキストボックスにdataを文字列として格納*/
		/*let element = document.getElementById('record_days');*/
		let element = JSON.stringify(data);
		/*文字列になったデータをカンマ区切りの配列にする*/
		/*let day = doucment.getElementById('record_days').value;*/
		element = element.replace('[','');
		element = element.replace(']','');
		let recordDays = element.split(",");
			for(let i of recordDays){
				console.log($('#'+i).text());
				$('#'+i).append('<img src="./image/pen.png" width="20" height="20" style="margin-left:15px; margin-right:-40px; margin-top:-40px;">');
			}

    })
    /* 非同期通信が失敗したときの処理*/
     .fail(function() {
        /*失敗した時の処理を書く*/
        alert('失敗');
      });



}


// カレンダー作成
function createProcess(year, month) {

    // 曜日
    var calendar = "<table><tr class='dayOfWeek'>";
    for (var i = 0; i < week.length; i++) {
        calendar += "<th>" + week[i] + "</th>";
    }
    calendar += "</tr>";

    var count = 0;
    var startDayOfWeek = new Date(year, month, 1).getDay();
    var endDate = new Date(year, month + 1, 0).getDate();
    var lastMonthEndDate = new Date(year, month, 0).getDate();
    var row = Math.ceil((startDayOfWeek + endDate) / week.length);

    // 1行ずつ設定
    for (var i = 0; i < row; i++) {
        calendar += "<tr>";
        // 1colum単位で設定
        for (var j = 0; j < week.length; j++) {
            if (i == 0 && j < startDayOfWeek) {
                // 1行目で1日まで先月の日付を設定
                calendar += "<td class='disabled'>" + (lastMonthEndDate - startDayOfWeek + j + 1) + "</td>";
            } else if (count >= endDate) {
                // 最終行で最終日以降、翌月の日付を設定
                count++;
                calendar += "<td class='disabled'>" + (count - endDate) + "</td>";
            } else {
                // 当月の日付を曜日に照らし合わせて設定
                count++;
                if(year == today.getFullYear()
                  && month == (today.getMonth())
                  && count == today.getDate()){
                    calendar += "<td class='today' id='"+count+"'>" + count + "</td>";
                } else {
                    calendar += "<td class='calendar_td' id='"+count+"'>" + count + "</td>";
                }
            }
        }
        calendar += "</tr>";
    }



    document.addEventListener("click", function(e) {
        if(e.target.classList.contains("calendar_td")) {
            console.log(showDate.getMonth() +1);
            console.log("クリックした日付は "+ e.target.textContent + "です");
            window.location = "/MaternityApp/RecordViewServlet?month="+(showDate.getMonth()+1)+"&"+"recordDay="+e.target.textContent+"";
        }else if(e.target.classList.contains("today")){
            console.log(showDate.getMonth() +1);
            console.log('クリックした日付は' + e.target.innerHTML + 'です');
            window.location = "/MaternityApp/RecordViewServlet?month="+(showDate.getMonth()+1)+"&"+"recordDay="+e.target.textContent+"";
        }
    })

    return calendar;
}