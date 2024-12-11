// 確保當整個網頁載入完畢後執行
$(document).ready(function () {
    // 從 localStorage 中取得 userName 資料
    var userName = localStorage.getItem('userName');
    // 從 localStorage 中取得 isUser 資料
    var isUser = localStorage.getItem('isUser');

    // 若權限不是1或2則隱藏歡迎詞
    if (isUser !== '1' && isUser !== '2') {
        $('.hello').hide(); // 隱藏歡迎語句元素
    }

    // 找到具有 hello 類別的 <a> 元素，並將歡迎回來 userName 設定為其內容
    // 且寬度小於768時不顯示後面名稱
    function updateText() {
        if ($(window).width() < 768) {
            $('.hello').text('歡迎回來 ' + userName);
        } else {
            $('.hello').text('歡迎回來 ' + userName + ' 桑');
        }
    }

    $(window).resize(updateText);
    updateText(); // 初始化呼叫

    // 登出按鈕
    $('.logout').on('click', function (event) {
        event.preventDefault(); // 防止默認的跳轉行為

        // 清空 localStorage 中的資料
        localStorage.removeItem('userName');
        localStorage.removeItem('isUser');

        Swal.fire({
            title: '登出成功!',
            icon: 'success',
            iconColor: '#4CAF50',
            showConfirmButton: false,
            timer: 900
        }).then(() => {
            window.location.href = '/logout';
        });
    });

});