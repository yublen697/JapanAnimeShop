$(document).ready(function () {
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

    // 定義全局變數，初始值為 localStorage 中的值或 null
    let orderData = JSON.parse(localStorage.getItem('orderData')) || {
        total: 0,
        orderTime: null,
        items: []
    };

    // 渲染購物車
    function renderCart() {
        let cartItems = $('#cart-items'); // 選擇購物車項目容器
        cartItems.empty(); // 清空購物車容器的內容
        let totalPrice = 0; // 初始化總金額

        orderData.items.forEach((item, index) => {
            totalPrice += item.price * item.quantity; // 計算總金額
            cartItems.append(`
                <tr class="">
                    <td class="text-center py-2">${item.orderName}</td>
                    <td class="text-center py-2">${item.price}</td>
                    <td class="text-center py-2">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <button class="btn btn-outline-secondary btn-sm change-quantity" data-index="${index}" data-action="decrease">-</button>
                            </div>
                            <input type="text" class="form-control text-center quantity-input" value="${item.quantity}" readonly>
                            <div class="input-group-append">
                                <button class="btn btn-outline-secondary btn-sm change-quantity" data-index="${index}" data-action="increase">+</button>
                            </div>
                        </div>
                    </td>
                    <td class="text-center py-2">NT$${item.price * item.quantity}</td>
                    <td class="text-center py-2"><button type="button" class="btn btn-outline-danger btn-sm remove-item" data-index="${index}">刪除</button></td>
                </tr>
            `);
        });
        $('#total-amount').text(`總金額: NT$${totalPrice}`); // 更新總金額顯示
        orderData.totalPrice = totalPrice; // 更新總金額
        saveOrderData(); // 保存訂單資料
    }

    // 將訂單資料儲存到 localStorage
    function saveOrderData() {
        localStorage.setItem('orderData', JSON.stringify(orderData));
    }

    // 點擊刪除按鈕時從購物車中移除對應項目
    $('#cart-items').on('click', '.remove-item', function () {
        let index = $(this).data('index'); // 獲取項目索引
        var itemName = $(this).closest('tr').find('td').eq(0).text().trim(); // 獲取當前按鈕所在的行，並直接取第一個單元格的內容

        Swal.fire({
            title: "確定要刪除嗎?",
            text: "此操作無法恢復！",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "刪除",
            cancelButtonText: "取消"
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire({
                    title: `${itemName}刪除成功!`,
                    icon: "success",
                    iconColor: '#4CAF50',
                    timer: 1000,
                    showConfirmButton: false
                });

                orderData.items.splice(index, 1); // 刪除對應項目
                renderCart(); // 渲染更新後的購物車
            }
        });
    });

    // 點擊增加或減少數量按鈕時更新對應項目的數量
    $('#cart-items').on('click', '.change-quantity', function () {
        let index = $(this).data('index'); // 獲取項目索引
        let action = $(this).data('action'); // 獲取操作類型（增加或減少）

        if (action === 'increase') {
            orderData.items[index].quantity++; // 增加數量
        } else if (action === 'decrease') {
            if (orderData.items[index].quantity > 1) {
                orderData.items[index].quantity--; // 減少數量
            }
        }

        renderCart(); // 渲染更新後的購物車
    });

    // 點擊送出訂單按鈕時，使用 AJAX 將購物車資料發送到後端
    $('#submit-order').on('click', function (event) {
        event.preventDefault(); // 阻止表單的默認提交行為

        const userName = $('#userName').val().trim();
        const userAddress = $('#userAddress').val().trim();
        const userPhone = $('#userPhone').val().trim();

        // 驗證輸入欄位
        if (!userName || !userAddress || !userPhone) {
            Swal.fire({
                icon: 'error',
                title: '請填寫完整的姓名、地址和電話！',
                timer: 1500,
                showConfirmButton: false
            });
            return;
        }

        if (orderData.items.length === 0) {
            Swal.fire({
                icon: "error",
                title: "購物車是空的，無法結帳！",
                timer: 1500,
                showConfirmButton: false
            });
            return;
        }

        // 更新訂單時間
        orderData.orderTime = new Date().toISOString().replace('T', ' ').substring(0, 19); // 新增訂單時間，格式為 "yyyy-MM-dd HH:mm:ss"
        // 增加姓名和地址到訂單資料
        orderData.userName = userName
        orderData.userAddress = userAddress
        orderData.userPhone = userPhone
        /*
        // 獲取當前時間
        var currentDate = new Date();

        // 格式化輸出
        orderData.orderTime = currentDate.getFullYear() + '-' +
            ('0' + (currentDate.getMonth() + 1)).slice(-2) + '-' +
            ('0' + currentDate.getDate()).slice(-2) + ' ' +
            ('0' + currentDate.getHours()).slice(-2) + ':' +
            ('0' + currentDate.getMinutes()).slice(-2) + ':' +
            ('0' + currentDate.getSeconds()).slice(-2);
         */

        // 使用 AJAX 發送資料到後端
        $.ajax({
            url: 'http://localhost:8080/order_backend/', // 替換為你的後端提交訂單的 URL
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(orderData),
            success: function (response) {
                Swal.fire({
                    icon: "success",
                    iconColor: '#4CAF50',
                    title: "訂單已送出！",
                    timer: 1500,
                    showConfirmButton: false
                });

                if (response.redirectUrl) {
                    window.location.href = response.redirectUrl;
                } else {
                    orderData = { // 重置訂單資料
                        userName: null,
                        userAddress: null,
                        userPhone: null,
                        total: 0,
                        orderTime: null,
                        items: []
                    };
                    $('.form-select').val(null).prop('selectedIndex', 0);
                    renderCart(); // 渲染空的購物車
                }
            },
            error: function (xhr, status, error) {
                Swal.fire({
                    icon: "error",
                    title: "送出訂單失敗，請稍後再試",
                    timer: 1500,
                    showConfirmButton: false
                });
            }
        });
    });

    renderCart(); // 在頁面載入時渲染購物車
});