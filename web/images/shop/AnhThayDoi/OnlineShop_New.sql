create database OnlineShop_New

use OnlineShop_New

--Table Color
create table Color(
	colorID int identity(1,1),
	colorName nvarchar(max) not null,
	CONSTRAINT pk_Color_colorID PRIMARY KEY (colorID)
)

--Table Brand
create table Brand(
	brandID int identity(1,1),
	brandName varchar(max) not null,
	CONSTRAINT pk_Brand_brandID PRIMARY KEY (brandID)
)

--Table Category
create table Category(
	cateID int identity(1,1),
	brandID int not null ,
	cateName nvarchar(max) not null,
	CONSTRAINT pk_Category_cateID PRIMARY KEY (cateID),
	CONSTRAINT fk_Category_brandID FOREIGN KEY (brandID) REFERENCES Brand(brandID)
)


--Table Product
create table Product(
	productID int identity(1,1),
	productName nvarchar(max) not null,
	productPrice float not null,
	productImage varchar(max) not null,
	productDescribe nvarchar(max) not null,
	cateID int not null,
	totalQuantity int not null,
	discount float ,
	createAt Date not null,
	isSale bit not null,
	isActive bit not null,
	CONSTRAINT pk_Product_productID PRIMARY KEY (productID),
	CONSTRAINT fk_Product_cateID FOREIGN KEY (cateID) REFERENCES Category(cateID)
)

--Table Size
create table Size(
	sizeID int identity(1,1),
	numberSize int not null,
	CONSTRAINT pk_Size_sizeID PRIMARY KEY (sizeID)
)


--Table ProductDetail
create table ProductDetail(
	detailID int identity(1,1),
	productID int not null,
	sizeID int not null,
	quantity int not null,
	colorID int not null,
	CONSTRAINT pk_ProductDetail_deitailID PRIMARY KEY (detailID),
	CONSTRAINT fk_ProductDetail_productID FOREIGN KEY (productID) REFERENCES Product(productID),
	CONSTRAINT fk_ProductDetail_sizeID FOREIGN KEY (sizeID) REFERENCES Size(sizeID),
	CONSTRAINT fk_ProductDetail_colorID FOREIGN KEY (colorID) REFERENCES Color(colorID)
)

--Table ImgOfProduct
create table ImgOfProduct(
	imgID int identity(1,1),
	colorID int not null,
	productID int not null,
	imageProduct varchar(max) not null
	CONSTRAINT pk_img_ProductID PRIMARY KEY (imgID),
	CONSTRAINT fk_img_colorID FOREIGN KEY (colorID) REFERENCES Color(colorID),
	CONSTRAINT fk_img_productID FOREIGN KEY (productID) REFERENCES Product(productID)
)

--Table orderState
create table OrderState(
	stateID int identity(1,1),
	nameState nvarchar(max) not null,
	CONSTRAINT pk_OrderState_stateID PRIMARY KEY (stateID)
)

--Table Role
create table [Role](
	userRole int identity(1,1),
	roleName nvarchar(max) not null,
	CONSTRAINT pk_Role_userRole PRIMARY KEY (userRole)
)

--Table userStatus
create table userStatus(
	uStatusID int identity(1,1),
	statusName nvarchar(max) not null,
	CONSTRAINT pk_userStatus PRIMARY KEY(uStatusID),
)

--Table User
create table [User](
	userID int identity(1,1),
	userName varchar(max) not null,
	userPass varchar(max) not null,
	fullName nvarchar(max) not null,
	userAvatar varchar(max) not null,
	userAdress nvarchar(max) not null,
	userBirth date not null,
	userGender bit not null,
	userEmail varchar(max)not null,
	userPhone varchar(20)not null,
	userRole int not null,
	uStatusID int not null,
	CONSTRAINT pk_User_userID PRIMARY KEY (userID),
	CONSTRAINT fk_User_userRole FOREIGN KEY (userRole) REFERENCES [Role](userRole),
	CONSTRAINT fk_User_userStatus FOREIGN KEY (uStatusID) REFERENCES userStatus(uStatusID)
)

--Table Order
create table [Order](
	orderID int identity(1,1),
	userID int not null,
	orderDate date not null,
	amount int not null,
	stateID int not null,
	CONSTRAINT pk_Order_orderID PRIMARY KEY (orderID),
	CONSTRAINT fk_Order_userID FOREIGN KEY (userID) REFERENCES [User](userID),
	CONSTRAINT fk_Order_stateID FOREIGN KEY (stateID) REFERENCES OrderState(stateID),
)

--Table orderDetail
create table OrderDetail(
	orderDetailID int identity(1,1),
	detailID int not null,
	quantity int not null,
	price int not null,
	discount float,
	createAt date not null,
	updateAt date not null,
	orderID int not null,
	Amount int not null
	CONSTRAINT pk_OrderDetail_detailID PRIMARY KEY (orderDetailID),
	CONSTRAINT pk_DetailID FOREIGN KEY (detailID) REFERENCES  ProductDetail(detailID),
	CONSTRAINT pk_orderFrID FOREIGN KEY (orderID) REFERENCES  [Order](orderID)
)

--Table CateBlog
create table CategoryBlog(
	cateBlogID int identity(1,1),
	cateBlogName nvarchar(100) not null,
	CONSTRAINT pk_cateBlogID PRIMARY KEY (cateBlogID),
)

--Table Blog
create table Blog(
	blogID int identity(1,1),
	userID int not null,
	blogTitle nvarchar(max) not null,
	blogContent nvarchar(max) not null,
	blogImg varchar(max) not null,
	authorName nvarchar(max) not null,
	createDate date not null,
	statusBlogID bit not null,
	cateBlogID int not null,
	CONSTRAINT pk_Blog_postID PRIMARY KEY (blogID),
	CONSTRAINT fk_Blog_userID FOREIGN KEY (userID) REFERENCES [User](userID),
	CONSTRAINT fk_cateBlogID FOREIGN KEY (cateBlogID) REFERENCES [CategoryBlog](cateBlogID)
)

--Table FeedBack
create table Feedback(
	feedbackID int identity(1,1),
	userID int not null,
	detailID int not null,
	comment nvarchar(max) not null,
	commentDate date not null,
	CONSTRAINT pk_Feedback_feedbackID PRIMARY KEY (feedbackID),
	CONSTRAINT fk_Feedback_userlID FOREIGN KEY (userID) REFERENCES [User](userID),
	CONSTRAINT fk_Feedback_detailID FOREIGN KEY (detailID) REFERENCES [ProductDetail](detailID)
)

--Table Cart
create table Cart(
	cartID int identity(1,1),
	userID int not null,
	detailID int not null,
	quantity int not null,
	CONSTRAINT pk_Cart_cartID PRIMARY KEY (cartID),
	CONSTRAINT fk_Cart_detailID FOREIGN KEY (detailID) REFERENCES [ProductDetail](detailID),
	CONSTRAINT fk_Cart_userID FOREIGN KEY (userID) REFERENCES [User](userID)
)

--Table Slider
create table Slider(
	sliderID int identity(1,1),
	title nvarchar(max) not null,
	img varchar(max) not null,
	createDate date not null,
	[status] bit not null,
	link varchar(max) not null,
	CONSTRAINT pk_Slider_sliderID PRIMARY KEY (sliderID)
)


--=====Insert to Role=====
insert into [Role] values ('Admin'),('Sale Manager'),('Sale'),('Marketing'),('Customer')

--=====Insert to userStatus=====
insert into userStatus values('Active'),('Not Active')

--=====Insert into Color=====
insert into Color (colorName) values ('pink');
insert into Color (colorName) values ('black');
insert into Color (colorName) values ('yellow');
insert into Color (colorName) values ('red');
insert into Color (colorName) values ('white');
insert into Color (colorName) values ('blue');
insert into Color (colorName) values ('grey');
insert into Color (colorName) values ('orange');

--=====Insert into Size=====
insert into Size (numberSize) values (38);
insert into Size (numberSize) values (39);
insert into Size (numberSize) values (40);
insert into Size (numberSize) values (41);
insert into Size (numberSize) values (42);
insert into Size (numberSize) values (43);

--=====Insert into Brand=====
insert into Brand (brandName) values ('Kappa');
insert into Brand (brandName) values ('Ecko Unltd');
insert into Brand (brandName) values ('Superga');
insert into Brand (brandName) values ('Staple');

--=====Insert into CategoryBlog=====
insert into CategoryBlog values ('Clean Shoes'),('Custom Shoes'),('Recovery Shoes'),('Repair Shoes')

--=====Insert into Category=====
insert into Category (brandID, cateName) values (1, 'Sneakers');
insert into Category (brandID, cateName) values (1, 'Sport');
insert into Category (brandID, cateName) values (1, 'Casual');
insert into Category (brandID, cateName) values (2, 'Sneakers');
insert into Category (brandID, cateName) values (2, 'Sport');
insert into Category (brandID, cateName) values (2, 'Casual');
insert into Category (brandID, cateName) values (3, 'Sneakers');
insert into Category (brandID, cateName) values (3, 'Sport');
insert into Category (brandID, cateName) values (3, 'Casual');
insert into Category (brandID, cateName) values (4, 'Sneakers');
insert into Category (brandID, cateName) values (4, 'Sport');
insert into Category (brandID, cateName) values (4, 'Casual');

--=====Insert into Product=====
insert into Product (productName, productPrice, productImage, productDescribe, cateID, totalQuantity, discount, createAt, isSale, isActive) values (N'Kappa giày sneakers nam/nữ 36151QW SS22', 699.00, 'product_1', N'Giày thể thao nam/nữ Kappa. Giày nam/nữ thuộc bộ sưu tập xuân hè 2022. Thân giày: vải tổng hợp và PU; đế giày: cao su. Giày nhẹ và dễ dàng vệ sinh.', 1, 136, 0.37,'2021-03-22', 0, 0);
insert into Product (productName, productPrice, productImage, productDescribe, cateID, totalQuantity, discount, createAt, isSale, isActive) values (N'Kappa giày thể thao nam 311992W SS22', 799.00, 'product_2', N'Giày thể thao nam Kappa. Giày nam thuộc bộ sưu tập xuân hè 2022. Thân giày: vải dệt và TPU; đế giày: cao su.', 2, 81, 0.36,'2020-06-28', 1, 0);
insert into Product (productName, productPrice, productImage, productDescribe, cateID, totalQuantity, discount, createAt, isSale, isActive) values (N'Kappa giày thể thao nam/nữ 311992W SS22', 799.00, 'product_3', N'Giày thể thao nam/ nữ Kappa. Giày nam/ nữ thuộc bộ sưu tập xuân hè 2022. Thân giày: vải dệt và TPU; đế giày: cao su.', 2, 165, 0.06,'2020-06-03', 1, 0);
insert into Product (productName, productPrice, productImage, productDescribe, cateID, totalQuantity, discount, createAt, isSale, isActive) values (N'Kappa giày thể thao nữ 311992W SS22', 799.00, 'product_4', N'Giày thể thao nữ Kappa. Giày nữ thuộc bộ sưu tập xuân hè 2022. Thân giày: vải dệt và TPU; đế giày: cao su.', 2, 178, 0.18,'2020-10-31', 0, 0);
insert into Product (productName, productPrice, productImage, productDescribe, cateID, totalQuantity, discount, createAt, isSale, isActive) values (N'Kappa giày sneakers nữ 37163FW SS22', 599.00, 'product_5', N'Giày sneakers nam/nữ Kappa. Giày nam/ nữ thuộc bộ sưu tập xuân hè 2022. Thân giày được làm từ PU, polyester, đế giày làm cao su, bền bỉ, trọng lượng nhẹ và dễ vệ sinh.', 1, 108, 0.01,'2020-04-02', 0, 0);
insert into Product (productName, productPrice, productImage, productDescribe, cateID, totalQuantity, discount, createAt, isSale, isActive) values (N'ECKO UNLTD GIÀY SNEAKERS UNISEX OF21-28008', 499.00, 'product_6', N'GIÀY SNEAKERS', 4, 171, 0.2,'2020-10-21', 0, 1);
insert into Product (productName, productPrice, productImage, productDescribe, cateID, totalQuantity, discount, createAt, isSale, isActive) values (N'ECKO UNLTD GIÀY SNEAKERS UNISEX OF21-28006', 499.00, 'product_7', N'GIÀY SNEAKERS', 4, 188, 0.35,'2020-12-09', 0, 1);
insert into Product (productName, productPrice, productImage, productDescribe, cateID, totalQuantity, discount, createAt, isSale, isActive) values (N'Ecko Unltd giày thể thao nữ OF21-24022', 699.00, 'product_8', N'Thiết kế dáng thể thao, trendy, trẻ trung và năng động. Ôm vừa vặn vào cổ chân, dễ dàng di chuyển. Có thể kế hợp cùng các trang phục thể thao, hoặc trang phục thường ngày để tăng thêm nét xinh xắn và trẻ trung cho các nàng.', 5, 134, 0.1,'2020-07-25', 1, 1);
insert into Product (productName, productPrice, productImage, productDescribe, cateID, totalQuantity, discount, createAt, isSale, isActive) values (N'Ecko Unltd giày thể thao nữ OF21-24020', 699.00, 'product_9', N'Thuộc bộ sưu tập giày Thu Đông 2021 mới nhất của ECKO UNLTD. Nhiều sắc màu thời thượng, trendy và cá tính. Đi làm, đi chơi, đi du lịch, hay đi học đều trẻ trung, năng động. Chất liệu: Thân: PU/MESH, Đế: EVA/TPR.', 5, 173, 0.43,'2020-07-04', 0, 1);
insert into Product (productName, productPrice, productImage, productDescribe, cateID, totalQuantity, discount, createAt, isSale, isActive) values (N'Ecko Unltd giày thể thao nữ OF21-24021', 699.00, 'product_10', N'Thuộc bộ sưu tập giày Thu Đông 2021 mới nhất của ECKO UNLTD. Nhiều sắc màu thời thượng, trendy và cá tính. Đi làm, đi chơi, đi du lịch, hay đi học đều trẻ trung, năng động. Chất liệu: Thân: PU/MESH, Đế: EVA/TPR.', 5, 96, 0.16,'2021-04-30', 1, 0);
insert into Product (productName, productPrice, productImage, productDescribe, cateID, totalQuantity, discount, createAt, isSale, isActive) values (N'Superga giày sneakers nữ 121SSWS_S00C3N0', 499.00, 'product_11', N'Bộ sưu tập sneaker nữ: LE SUPERGA. Chất liệu: Đế ngoài: 100% Cao su; Bề mặt: 100% Cotton; Lớp lót: 100% Cotton. Thiết kế: Sự cải tiến của một biểu tượng.', 7, 5, 0.0,'2021-03-06', 1, 0);
insert into Product (productName, productPrice, productImage, productDescribe, cateID, totalQuantity, discount, createAt, isSale, isActive) values (N'Superga giày sneakers nữ 121SSWS_S001W00', 499.00, 'product_12', N'Bộ sưu tập giày sneaker nữ đẹp: LE SUPERGA. Chất liệu: Đế ngoài: 100% Cao su; Bề mặt: 100% Cotton; Lớp lót: 100% Cotton. Thiết kế: Một sự tôn vinh của màu sắc và sự sáng tạo - đôi giày thể thao Superga 2750 theo mùa này được in với họa tiết đồ họa vui tư', 7, 297, 0.27,'2021-11-19', 0, 0);
insert into Product (productName, productPrice, productImage, productDescribe, cateID, totalQuantity, discount, createAt, isSale, isActive) values (N'Superga giày sneakers nam/nữ S00BN20', 499.00, 'product_13', N'GIÀY SNEAKERS', 7, 56, 0.11,'2021-12-12', 0, 1);
insert into Product (productName, productPrice, productImage, productDescribe, cateID, totalQuantity, discount, createAt, isSale, isActive) values (N'Superga giày nữ 221SSWS_S000010', 499.00, 'product_14', N'GIÀY', 9, 147, 0.02,'2020-06-04', 1, 0);
insert into Product (productName, productPrice, productImage, productDescribe, cateID, totalQuantity, discount, createAt, isSale, isActive) values (N'Superga giày đế cao su nữ 221SSWS_S001W00', 699.00, N'product_15', N'Bạn đang tìm kiếm một mẫu giày đế cao su nữ đẹp để đi chơi và đi dạo? Mẫu giày nữ Superga 221SSWS_S001W00 A5P chính là sự lựa chọn bạn nên cân nhắc đấy.', 9, 163, 0.18,'2021-09-04', 1, 1);
insert into Product (productName, productPrice, productImage, productDescribe, cateID, totalQuantity, discount, createAt, isSale, isActive) values (N'Superga giày nam/nữ 221SSUS_S4116EW', 599.00, 'product_16', N'Thiết kế basic và trung tính. Nam nữ mang đều đẹp. Đế cao: 3cm. Chất liệu: Thân: 100% Cotton; Đế: 100% Cao su.', 9, 105, 0.21,'2021-10-11', 1, 1);
insert into Product (productName, productPrice, productImage, productDescribe, cateID, totalQuantity, discount, createAt, isSale, isActive) values (N'KAPPA GIÀY SNEAKERS 37152LW A0E 45', 799.00, 'product_17', N'GIÀY SNEAKERS', 1, 145, 0.04,'2020-04-22', 0, 1);
insert into Product (productName, productPrice, productImage, productDescribe, cateID, totalQuantity, discount, createAt, isSale, isActive) values (N'KAPPA GIÀY SNEAKERS 304UEA0 A01 38', 799.00, 'product_18', N'GIÀY SNEAKERS', 1, 160, 0.19,'2022-04-20', 1, 0);
insert into Product (productName, productPrice, productImage, productDescribe, cateID, totalQuantity, discount, createAt, isSale, isActive) values (N'Ecko Unltd giày sneakers nam IS22-26503', 699.00, 'product_19', N'Giày sneakers Ecko Unltd. chinh phục các tín đồ sneakers với cách phối màu trẻ trung, năng động cùng họa tiết điểm nhấn Ecko Unltd. đậm chất thương hiệu. Phần thiết kế bắt mắt, trendy và có thể cân được mọi outfit cũng là một điểm sáng của Giày nam sneakers Ecko Unltd. Với hai chất liệu da tổng hợp và cao su, giày không chỉ giúp các bước chân trở nên nhẹ nhàng mà còn bền bỉ. Đáp ứng đủ mọi tiêu chí thời trang nam, giày sneakers Ecko Unltd. hoàn toàn là lựa chọn tuyệt vời trong tủ giày của bạn.', 4, 143, 0.39,'2022-03-20', 1, 1);
insert into Product (productName, productPrice, productImage, productDescribe, cateID, totalQuantity, discount, createAt, isSale, isActive) values (N'Ecko Unltd giày sneakers nam OF21-26001', 699.00, 'product_20', N'Sau một thời gian vắng bóng, bộ sưu tập giày đậm chất Mỹ từ thương hiệu ECKO UNLTD. đã quay lại thị trường Việt Nam. Giày Sneakers Nam ECKO UNLTD. OF21-26001 Trắng chắc chắn sẽ là item thời trang không thể thiếu trong tủ giày của các tín đồ thời trang chuộng phong cách sôi động, phóng khoáng và đậm chất thời thượng cho những buổi tiệc hết mình hoặc những lần dạo phố năng động.', 4, 298, 0.3,'2021-03-20', 0, 0);
insert into Product (productName, productPrice, productImage, productDescribe, cateID, totalQuantity, discount, createAt, isSale, isActive) values (N'Superga giày sneakers nam S000010 SS22', 499.00, 'product_21', N'GIÀY THỜI TRANG CỔ THẤP', 7, 70, 0.19,'2021-01-25', 1, 1);
insert into Product (productName, productPrice, productImage, productDescribe, cateID, totalQuantity, discount, createAt, isSale, isActive) values (N'Superga giày nam/nữ 221SSUS_S4116EW', 599.00, 'product_22', N'Thiết kế basic và trung tính. Nam nữ mang đều đẹp. Đế cao: 3cm. Chất liệu: Thân: 100% Cotton; Đế: 100% Cao su. Đủ size từ 35-44 cho chàng và nàng lựa chọn.', 9, 160, 0.09,'2021-04-26', 0, 0);

--=====Insert into User=====
insert into [User] (userName, userPass, fullName, userAvatar, userAdress, userBirth, userGender, userEmail, userPhone, userRole, uStatusID) values ('long123', '123', N'Phạm Thành Long', 'long', N'Thanh Oai - Hà Nội', '2001-01-19', 1, 'longpthe150040@fpt.edu.vn', '0394292729', 1 , 1);
insert into [User] (userName, userPass, fullName, userAvatar, userAdress, userBirth, userGender, userEmail, userPhone, userRole, uStatusID) values ('dong123', '123', N'Hồ Phương Đồng', 'dong', N'Thuận Thành - Bắc Ninh', '2001-05-25', 1, 'donghphe150112@fpt.edu.vn', '0949948556', 2, 1);
insert into [User] (userName, userPass, fullName, userAvatar, userAdress, userBirth, userGender, userEmail, userPhone, userRole, uStatusID) values ('dung123', '123', N'Chu Tuấn Dũng', 'dung', N'Văn Giang - Hưng Yên', '2001-01-21', 1, 'dungcthe150178@fpt.edu.vn', '0928602001', 3, 1);
insert into [User] (userName, userPass, fullName, userAvatar, userAdress, userBirth, userGender, userEmail, userPhone, userRole, uStatusID) values ('phat123', '123', N'Nguyễn Đình Phát', 'phat', N'Tiên Du - Bắc Ninh', '2001-04-07', 1, 'phatndhe150033@fpt.edu.vn', '0974242242', 4, 1);
insert into [User] (userName, userPass, fullName, userAvatar, userAdress, userBirth, userGender, userEmail, userPhone, userRole, uStatusID) values ('hai123', '123', N'Phùng Đức Hải', 'hai', N'Thái Hòa - Nghệ An', '2001-05-04', 1, 'haipdhe153344@fpt.edu.vn', '0964203311', 5, 1);

--=====Insert into Blog=====
insert into Blog (userID, blogTitle, blogContent, blogImg, authorName, createDate, statusBlogID,cateBlogID) values (1, 'How to Clean Your Shoes in 6 Easy Steps', 'It’s tough to keep your shoes pristine without cleaning them regularly. The minute those new sneakers come out of the box, you’ll want to wear them outside — where they’ll pick up dirt, mud, scuffs, and stains.
To ensure peak performance of your sneakers over time, we recommend proper care and maintenance, including cleaning. Before you get started, place your shoes in a shoe tree or fill them with crumpled newspapers to help retain their shape during cleaning. Then, get to work.
These tips will help you keep any sneakers and running shoes fresh and clean in just a few easy steps.
How to Clean Your Shoes Step by Step
1.Use a Dry Brush
Remove loose dirt from the outsole, midsole, and uppers using a dry, soft-bristled shoe brush. No shoe brush? No problem, an old toothbrush works fine.
2.Make a Mild Cleaning Solution
Mix warm water with a small amount of mild laundry detergent or dish soap.
For white and lighter colored shoes, you can also make an effective cleaning paste by mixing equal parts baking soda and water.
3.Hand Wash the Laces
Remove the shoelaces and apply a small amount of the mild cleaning solution to them. Massage the laces with your hands, rinse, then dab dry with a soft cloth.
4.Wash the Soles
Apply the mild solution to a soft-bristled brush, toothbrush or a wash cloth. Clean the outsole and midsole thoroughly, taking your time to clean every part of the soles. Dry with a soft cloth.
Note: If you need to wash your insoles, remove them first and clean with your solution, making sure to give them time to dry before putting them back into your shoes.
5.Wash and Blot the Uppers
Use the mild solution and a soft-bristled brush, toothbrush, or a soft damp cloth to clean the uppers. Take your time ', 'blog_ 1', N'Hồ Phương Đồng', '2022-06-13', 1,1);
insert into Blog (userID, blogTitle, blogContent, blogImg, authorName, createDate, statusBlogID,cateBlogID) values (2, N'Làm thế nào để làm sạch giày của bạn trong 6 bước đơn giản', N'Thật khó để giữ cho đôi giày của bạn nguyên sơ mà không làm sạch chúng thường xuyên. Ngay khi những đôi giày thể thao mới đó ra khỏi hộp, bạn sẽ muốn mặc chúng bên ngoài - nơi chúng sẽ nhặt bụi bẩn, bùn, xô xát và vết bẩn.
Để đảm bảo hiệu suất cao nhất của giày thể thao của bạn theo thời gian, chúng tôi khuyên bạn nên chăm sóc và bảo trì đúng cách, bao gồm cả làm sạch. Trước khi bạn bắt đầu, hãy đặt giày của bạn vào một cây giày hoặc lấp đầy chúng bằng những tờ báo nhàu nát để giúp giữ lại hình dạng của chúng trong quá trình làm sạch. Sau đó, đi làm.
Những lời khuyên này sẽ giúp bạn giữ cho bất kỳ đôi giày thể thao và giày chạy bộ nào luôn tươi mới và sạch sẽ chỉ trong vài bước đơn giản.
Làm thế nào để làm sạch giày của bạn từng bước
1.Sử dụng bàn chải khô
Loại bỏ bụi bẩn lỏng lẻo từ đế ngoài, đế giữa và phần trên bằng cách sử dụng bàn chải giày khô, lông mềm. Không có bàn chải giày? Không có vấn đề gì, một bàn chải đánh răng cũ hoạt động tốt.
2.Làm một giải pháp làm sạch nhẹ
Trộn nước ấm với một lượng nhỏ bột giặt nhẹ hoặc xà phòng rửa chén.
Đối với giày màu trắng và sáng hơn, bạn cũng có thể tạo ra một hỗn hợp làm sạch hiệu quả bằng cách trộn các phần bằng nhau baking soda và nước.
3.Rửa tay dây buộc
Tháo dây giày và áp dụng một lượng nhỏ dung dịch làm sạch nhẹ cho chúng. Massage dây buộc bằng tay, rửa sạch, sau đó phơi khô bằng một miếng vải mềm.
4.Rửa đế giày
Áp dụng dung dịch nhẹ cho bàn chải lông mềm, bàn chải đánh răng hoặc vải giặt. Làm sạch đế ngoài và đế giữa kỹ lưỡng, dành thời gian của bạn để làm sạch mọi phần của đế giày. Lau khô bằng một miếng vải mềm.
Lưu ý: Nếu bạn cần rửa đế lót, hãy tháo chúng ra trước và làm sạch bằng dung dịch của bạn, đảm bảo cho chúng thời gian để khô trước khi đặt chúng trở lại vào giày của bạn.
5.Rửa và làm mờ phần trên
Sử dụng dung dịch nhẹ và bàn chải lông mềm, bàn chải đánh răng hoặc vải ẩm mềm để làm sạch phần trên. Hãy dành thời gian của bạn và đừng chà quá mạnh.', 'blog_2', N'Phạm Thành Long', '2022-06-13', 2,2);
insert into Blog (userID, blogTitle, blogContent, blogImg, authorName, createDate, statusBlogID,cateBlogID) values (3, N'Thể hiện sự khác biệt, giàu có', N'Bất cứ khi nào xu hướng này xuất hiện, nó đều làm nhiều người cảm thấy khó chịu. 
Tuy nhiên, những mẫu thiết kế bẩn được yêu thích một cách kỳ lạ. Nó biểu thị cho sự giàu có, thích khác biệt.
Một số thương hiệu xa xỉ như Gucci cũng lựa chọn đôi giày cũ, bẩn để phối với trang phục sang trọng. Họ xem đây là cách cân bằng giữa những bộ quần áo được thiết kế hoàn hảo kết hợp đôi giày phá cách tạo điểm nhấn.
Và dấu hiệu giàu có kỳ lạ đó chỉ trở nên thú vị hơn khi xung quanh bạn là những người có con mắt sành điệu, đam mê thời trang mới có thể nhận ra.
Trong thế giới thời trang, ý tưởng về đôi giày bẩn - đặc biệt là đôi giày của một thương hiệu lớn - có ý nghĩa khác với đôi giày bình thường. Thời trang là sự giao tiếp và nó không rõ ràng như nhiều người nghĩ.', 'blog_3', N'Phùng Đức Hải', '2021-04-24', 3, 3);
insert into Blog (userID, blogTitle, blogContent, blogImg, authorName, createDate, statusBlogID,cateBlogID) values (4, N'Thế giới giày bẩn', N'Tất nhiên, Balenciaga không phải là thương hiệu đầu tiên bước vào thế giới giày bẩn.
Vài năm trước, Vetements (dưới sự dẫn dắt của Demna Gvasalia) đã tung ra những đôi giày nguệch ngoạc với giá hơn 1.500 USD, Gucci với đôi giày có chữ lồng màu nhạt, bán với giá 890 USD. Saint Laurent tiếp tục chạy theo xu hướng, phát hành giày cao cổ với dòng chữ "Saint Laurent" được viết nguệch ngoạc trên đế có giá 695 USD.
Ngoài ra, bộ sưu tập giày mới của Balenciaga gợi nhớ tới mẫu phụ kiện nhếch nhác kinh điển của Golden Goose, với giá lên tới 795 USD.', 'blog_4', N'Chu Tấn Dũng', '2021-04-24', 4, 4);
insert into Blog (userID, blogTitle, blogContent, blogImg, authorName, createDate, statusBlogID,cateBlogID) values (5, N'ADIDAS TĂNG TRƯỞNG HAI CON SỐ TẠI CÁC THỊ TRƯỜNG PHƯƠNG TÂY TRONG Q1', N'Từ góc độ khu vực, sự phát triển hàng đầu trong quý đầu tiên của năm 2022 tiếp tục có sự khác biệt đáng kể giữa thị trường phương Tây và phương Đông. 
Bất chấp những hạn chế của chuỗi cung ứng làm hạn chế tăng trưởng khoảng 400 triệu euro, doanh thu trung lập về tiền tệ ở tất cả các thị trường phương Tây cộng lại đã tăng 13% trong quý với mức tăng hai con số ở Bắc Mỹ (+ 13%) và Mỹ Latinh (+ 38%). Doanh số bán hàng tại EMEA bị ảnh hưởng nhiều nhất bởi sự thiếu hụt nguồn cung với hơn một nửa 
tổng số tác động tiêu cực được ghi nhận tại thị trường cụ thể này. Tuy nhiên, doanh thu tăng ở mức một con số cao (+ 9%) trong khu vực. Ở khu vực phía Đông của thế giới, công ty tiếp tục đối mặt với môi trường thị trường đầy thách thức ở Trung Quốc Đại lục, được khuếch đại bởi các đợt khóa máy liên quan đến covid-19 trên cả hai khu vực. 
Kết quả là, doanh thu ở Trung Quốc Đại lục giảm 35%,', 'blog_5', N'Nguyễn Đình Phát', '2021-04-24', 5, 4);

--=====Insert into OrderState=====
insert into OrderState (nameState) values (N'Thành công');
insert into OrderState (nameState) values (N'Vận chuyển');
insert into OrderState (nameState) values (N'Đã được xử lý');
insert into OrderState (nameState) values (N'Đang xử lý');
insert into OrderState (nameState) values (N'Hết hạn');

--=====Insert into Slider=====
insert into Slider (title, img,createDate,status, link) values (N'Director of Sales', 'blog1.jpg','2021-06-21',1, 'blogDetail?id=1');
insert into Slider (title, img,createDate, status, link) values (N'Legal Assistant', 'blog2.jpg','2020-10-26', 0, 'blogDetail?id=2');
insert into Slider (title, img,createDate, status, link) values (N'Senior Sales Associate', 'blog3.jpg','2021-01-27', 1, 'blogDetail?id=3');
insert into Slider (title, img,createDate, status, link) values (N'Actuary', 'blog4.jpg','2021-12-21', 0, 'blogDetail?id=4');
insert into Slider (title, img,createDate, status, link) values (N'Quanlity Engineer', 'blog5.jpg','2022-05-15', 1, 'blogDetail?id=5');
insert into Slider (title, img,createDate, status, link) values (N'Nice model sports shoes', 'blog5.jpg','2022-05-15', 1, 'shop.jsp');
