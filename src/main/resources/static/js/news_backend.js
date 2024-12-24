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
    // 檢查管理員身分
    var isUser = localStorage.getItem('isUser'); // 從 localStorage 中取得 isUser 資料
    if (isUser !== '1'){
        // 顯示提示訊息
        Swal.fire({
            icon: 'warning',
            title: '非管理員身分',
            text: '非管理員身分，將自動跳轉到首面。',
            confirmButtonText: '確定'
        }).then(() => {
            // 跳轉到首面
            window.location.href = '/index'; // 替換成你的首面路徑
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

    // 刷新表單內的圖片
    $('#newsimage').change(function (event) {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function (e) {
                // 找到已有的 img 標籤，並更新其 src 屬性
                $('#imagePreview img').attr('src', e.target.result);
            };
            reader.readAsDataURL(file);

        }
    });


    // 新增或修改活動按鈕
    $('#addNewsForm').on('submit', function (event) {
        // 阻止表單的默認提交行為
        event.preventDefault();

        // 獲取按鈕的 data-action 屬性的值
        var action = $('button[type="submit"]').data('action');

        // 根據 data-action 的值顯示相應的 SweetAlert2 警告框
        if (action === 'update') {
            Swal.fire({
                icon: "success",
                iconColor: '#4CAF50',
                title: "修改活動成功",
                showConfirmButton: false,
                timer: 1000
            });
        } else if (action === 'create') {
            Swal.fire({
                icon: "success",
                iconColor: '#4CAF50',
                title: "新增活動成功",
                showConfirmButton: false,
                timer: 1000
            });
        }
        // 表單提交
        this.submit();
    });


    // 刪除按鈕
    $('.deleteButton').on('click', function (event) {
        event.preventDefault(); // 阻止表單的默認提交行為

        var form = $(this).closest('form'); // 獲取當前按鈕所在的表單

        // closest 方法找最近具有 list-item 類的父元素，在該元素內部找具有 card-title 類的元素，然後取得文本內容並去除頭尾空白
        var newsName = $(this).closest('.list-item').find('.card-title').text().trim();

        // 使用 SweetAlert2 顯示確認提示框
        Swal.fire({
            title: '確定要刪除嗎?',
            text: '此操作無法恢復！',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '刪除',
            cancelButtonText: '取消'
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire({
                    title: `${newsName}刪除成功!`,
                    icon: "success",
                    iconColor: '#4CAF50',
                    timer: 1300,
                    showConfirmButton: false
                });
                form.submit();
            }
        });
    });
});
