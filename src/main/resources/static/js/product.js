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
    //初始化頁面加載時顯示分頁
    initializePagination('appetizer');

    // 獲取按鈕對應的分類
    $('.list-group-item').click(function () {
        var category = $(this).data('category');
    });

    // 監聽視窗大小改變事件，並重新初始化分頁
    $(window).resize(function () {
        getPerPage();
        initializePagination();
    });

    // 初始化購物車資料
    let orderData = JSON.parse(localStorage.getItem('orderData')) || {
        totalPrice: 0,
        items: []
    };

    // 保存購物車資料
    function saveOrderData() {
        localStorage.setItem('orderData', JSON.stringify(orderData));
    }

    // 添加商品到購物車
    function addToCart(item) {
        let existingItem = orderData.items.find(cartItem => cartItem.orderName === item.orderName);
        if (existingItem) {
            existingItem.quantity++;
        } else {
            orderData.items.push({ ...item, quantity: 1 });
        }
        orderData.totalPrice += item.price;
        saveOrderData();

        // 成功提示
        Swal.fire({
            position: "center",
            icon: "success",
            iconColor: '#4CAF50',
            title: `${item.orderName}已加入購物車`,
            showConfirmButton: false,
            timer: 1000
        });
    }

    // 綁定按鈕點擊事件
    $(document).on('click', '.add-to-cart', function () {
        let orderName = $(this).data('name');
        let price = parseFloat($(this).data('price'));
        if (orderName && price) {
            addToCart({ orderName, price });
        } else {
            console.error('無效的商品資料', { orderName, price });
        }
    });

    // 根據視窗寬度設置每頁顯示的項目數量
    function getPerPage() {
        if (window.innerWidth < 767) {
            return 4;
        } else if (window.innerWidth < 992) {
            return 6;
        } else {
            return 9;
        }
    }

    function initializePagination(category) {
        var perPage = getPerPage();
        // 總共有多少個項目
        var numItems = $("." + category + " .list-item").length;
        // 初始化時先顯示前幾個項目
        $("." + category + " .list-item").addClass('d-none').slice(0, perPage).removeClass('d-none');

        // 初始化分頁
        $('#pagination-container').pagination('destroy').pagination({
            items: numItems,
            itemsOnPage: perPage,
            prevText: "&laquo",
            nextText: "&raquo",
            onPageClick: function (pageNumber) {
                var from = perPage * (pageNumber - 1);
                var to = from + perPage;
                $("." + category + " .list-item").addClass('d-none').slice(from, to).removeClass('d-none');
            }
        });
    }
});
