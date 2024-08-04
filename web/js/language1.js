var dictionary = {
    'cart': {
        'en': 'Cart',
        'vi': 'Giỏ hàng',
    },
    'total': {
        'en': 'Total',
        'vi': 'Tổng',
    },
    'view_cart': {
        'en': 'View Cart',
        'vi': 'Xem giỏ hàng',
    },
    'checkout': {
        'en': 'Checkout',
        'vi': 'Thanh toán',
    },
    'search': {
        'en': 'Search',
        'vi': 'Tìm kiếm',
    },
    'home': {
        'en': 'Home',
        'vi': 'Trang chủ',
    },
    'shop': {
        'en': 'Shop',
        'vi': 'Cửa hàng',
    },
    'blog': {
        'en': 'Blog',
        'vi': 'Nhật ký',
    },
    'login': {
        'en': 'Login',
        'vi': 'Đăng nhập',
    },
    'profile': {
        'en': 'Profile',
        'vi': 'Hồ sơ',
    },
    'my_order': {
        'en': 'My Order',
        'vi': 'Đơn hàng của tôi',
    },
    'change_pass': {
        'en': 'Change Pass',
        'vi': 'Đổi mật khẩu',
    },
    'dashboard': {
        'en': 'MKT Dashboard',
        'vi': 'Thống kê',
    },
    'review': {
        'en': 'Feedback',
        'vi': 'Phản hồi',
    },
    'logout': {
        'en': 'Logout',
        'vi': 'Thoát',
    },
    'product_category': {
        'en': 'Product Category',
        'vi': 'Danh sách sản phẩm',
    },
    'sport_shoes': {
        'en': 'Sport Shoes',
        'vi': 'Giày Sport',
    },
    'sneakers_shoes': {
        'en': 'Sneakers Shoes',
        'vi': 'Giày Sneakers',
    },
    'casual_shoes': {
        'en': 'Casual Shoes',
        'vi': 'Giày Causual',
    },
    'trendy_products': {
        'en': 'Trendy Products',
        'vi': 'Sản phẩm bán chạy',
    },
    'view_product': {
        'en': 'View Product',
        'vi': 'Xem sản phẩm',
    },
    'new_products': {
        'en': 'New Products',
        'vi': 'Sản phẩm mới',
    },
    'subscribe_to': {
        'en': 'SUBSCRIBE TO NEWSLETTER',
        'vi': 'ĐĂNG KÝ TIN',
    },
    'the_shop_products': {
        'en': 'The shop products are very good, the color and quality of the products are excellent beyond criticism. Hope the shop will grow stronger.',
        'vi': 'Hàng của shop rất tốt, màu sắc và chất lượng sản phẩm tuyệt vời khỏi chê. Mong shop ngày càng lớn mạnh.',
    },
    'subscribe_now': {
        'en': 'Subscribe Now!',
        'vi': 'Theo dõi ngay!',
    },
    'view_us': {
        'en': 'View us on instagrama',
        'vi': 'Xem chúng tôi trên instagram',
    },
    'contact': {
        'en': 'CONTACT',
        'vi': 'Liên hệ',
    },
    'pricing': {
        'en': 'PRICING',
        'vi': 'Định giá',
    },
    'privacy_policy': {
        'en': 'PRIVACY POLICY',
        'vi': 'Chính sách bảo mật',
    }
};
/* var langs = ['it', 'en', 'fr']; */
var langs = ['en', 'vi'];
var current_lang_index = 0;
var current_lang = langs[current_lang_index];

window.change_lang = function () {
    current_lang_index = ++current_lang_index % 2;
    current_lang = langs[current_lang_index];
    translate();
}

function translate() {
    $("[data-translate]").each(function () {
        var key = $(this).data('translate');
        $(this).html(dictionary[key][current_lang]);
    });
}

translate();