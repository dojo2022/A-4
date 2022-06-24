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