// 設定奇偶數圖片及文字對調
$(document).ready(function () {
    // 檢查登入狀態
    var userName = localStorage.getItem('userName'); // 從 localStorage 獲取 userName
    if (!userName) {
        // 顯示提示訊息
        Swal.fire({
            icon: 'warning',
            title: '未登入',
            text: '您尚未登入，將自動跳轉到登入頁面。',
            confirmButtonText: '確定'
        }).then(() => {
            // 跳轉到登入頁面
            window.location.href = '/user'; // 替換成你的登入頁面路徑
        });

        return; // 阻止後續功能執行
    }

    $('#sec2 .item').each(function (index) {
        if ((index + 1) % 2 === 0) {  // 偶數卡片
            $(this).find('.col-md-6').eq(0).addClass('order-md-2');
            $(this).find('.col-md-6').eq(1).addClass('order-md-1');
        }
    });

    // 每個頁面要顯示幾個項目
    var perPage = 3;
    // 總共有多少個項目
    var numItems = $(".list-item").length;

    $(".list-item").slice(perPage).hide();

    $('#pagination-container').pagination({

        items: numItems,
        itemsOnPage: perPage,
        prevText: "&laquo",
        nextText: "&raquo",
        onPageClick: function (pageNumber) {
            // 計算起始及結束
            var from = perPage * (pageNumber - 1);
            var to = from + perPage;
            $(".list-item").hide().slice(from, to).show();
        }
    })

});