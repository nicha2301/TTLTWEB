-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 16, 2024 lúc 04:22 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `webbanthuocthuy30`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `address`
--

CREATE TABLE `address` (
                           `id` int(11) NOT NULL,
                           `address` text NOT NULL,
                           `phone` varchar(25) NOT NULL,
                           `hotline` varchar(25) NOT NULL,
                           `email` varchar(50) NOT NULL,
                           `timeOpen` varchar(255) NOT NULL,
                           `map` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `address`
--

INSERT INTO `address` (`id`, `address`, `phone`, `hotline`, `email`, `timeOpen`, `map`) VALUES
    (1, 'Khu phố 6, Phường Linh Trung, TP. Thủ Đức, TP. Hồ Chí Minh.', '0384774118 - 0972087207', '1900 9054', 'doanwebnhom30@gmail.com', '8:00 AM - 7:00 PM every day, except Monday.', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.214525515988!2d106.78918677590663!3d10.871281657435139!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3175276398969f7b%3A0x9672b7efd0893fc4!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBOw7RuZyBMw6JtIFRQLiBI4buTIENow60gTWluaA!5e0!3m2!1svi!2s!4v1697118240058!5m2!1svi!2s');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
                        `id` int(11) NOT NULL COMMENT 'user_id',
                        `product_id` int(11) NOT NULL,
                        `quantity` int(11) NOT NULL,
                        `addDate` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `delivery_address`
--

CREATE TABLE `delivery_address` (
                                    `id` int(11) NOT NULL,
                                    `user_id` int(11) NOT NULL,
                                    `fullname` varchar(50) NOT NULL,
                                    `phone` varchar(15) NOT NULL,
                                    `province` text NOT NULL,
                                    `district` text NOT NULL,
                                    `ward` text NOT NULL,
                                    `detail_address` varchar(255) NOT NULL,
                                    `at_home` tinyint(1) DEFAULT 0,
                                    `primary` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `discounts`
--

CREATE TABLE `discounts` (
                             `id` int(11) NOT NULL,
                             `discountName` varchar(100) DEFAULT NULL,
                             `description` text DEFAULT NULL,
                             `sale_percent` double NOT NULL,
                             `quantity` int(11) DEFAULT NULL,
                             `startDate` datetime DEFAULT NULL,
                             `expirationDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `feedbacks`
--

CREATE TABLE `feedbacks` (
                             `id` int(11) NOT NULL,
                             `email` varchar(25) NOT NULL,
                             `name` varchar(25) NOT NULL,
                             `content` varchar(255) NOT NULL,
                             `submissionDate` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `feedbacks`
--

INSERT INTO `feedbacks` (`id`, `email`, `name`, `content`, `submissionDate`) VALUES
                                                                                 (1, 'example1@gmail.com', 'John Doe', 'Great service!', '2023-01-15 08:30:00'),
                                                                                 (2, 'cactungte2912200@gmail.co', 'Nguyễn Đình Tùng', 'Thuốc tốt quá', '2024-01-17 14:03:10'),
                                                                                 (3, 'cactungte291220@gmail.com', 'Nguyễn Đình Tùng', 'Thuốc xịn quá', '2024-01-18 04:04:55'),
                                                                                 (4, 'Nam22@gmail.com', 'Lê Văn Nam', 'Rất hài lòng với dịch vụ.', '2024-01-20 12:15:20'),
                                                                                 (5, 'Anh293@gmail.com', 'Trần Thị Minh Anh', 'Phản hồi nhanh chóng và nhân viên hữu ích.', '2024-01-21 15:30:45'),
                                                                                 (6, 'DuongP4@gmail.com', 'Phạm Văn Dương', 'Rất đáng giới thiệu!', '2024-01-21 18:20:10'),
                                                                                 (7, 'MaiDo95@gmail.com', 'Đỗ Thị Mai', 'Dịch vụ tuyệt vời, sẽ sử dụng lại.', '2024-01-21 21:05:55');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `images`
--

CREATE TABLE `images` (
                          `id` int(11) NOT NULL,
                          `product_id` int(11) NOT NULL,
                          `imageUrl` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `inventory`
--

CREATE TABLE `inventory` (
                             `user_id` int(11) NOT NULL,
                             `discount_id` int(11) NOT NULL,
                             `addDate` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
                             `isUsed` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `level`
--

CREATE TABLE `level` (
                         `id` int(11) NOT NULL,
                         `level` varchar(15) NOT NULL,
                         `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `level`
--

INSERT INTO `level` (`id`, `level`, `description`) VALUES
                                                       (1, 'INFO', NULL),
                                                       (2, 'WARNING', NULL),
                                                       (3, 'ALERT', NULL),
                                                       (4, 'DANGER', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `log`
--

CREATE TABLE `log` (
                       `id` int(11) NOT NULL,
                       `level_id` int(11) NOT NULL,
                       `ip` varchar(50) NOT NULL,
                       `address` varchar(255) NOT NULL,
                       `pre_value` longtext DEFAULT NULL,
                       `post_value` longtext DEFAULT NULL,
                       `create_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `log`
--

INSERT INTO `log` (`id`, `level_id`, `ip`, `address`, `pre_value`, `post_value`, `create_at`) VALUES
                                                                                                  (10, 1, 'localhost', 'UserDAO', 'Existing email: thuandangnam@gmail.com', 'Matching email: thuandangnam@gmail.com', '2024-05-09 02:01:54'),
                                                                                                  (11, 2, 'localhost', 'UserDAO', NULL, 'Email not found: thuandangnam123@gmail.com', '2024-05-09 02:01:54'),
                                                                                                  (12, 1, 'localhost', 'UserDAO', 'Existing email: thuandangnam@gmail.com', 'Matching email: thuandangnam@gmail.com', '2024-05-09 02:22:34'),
                                                                                                  (13, 2, 'localhost', 'UserDAO', NULL, 'Email not found: thuandangnam123@gmail.com', '2024-05-09 02:22:34'),
                                                                                                  (14, 1, 'localhost', 'UserDAO', 'Existing email: thuandangnam@gmail.com', 'Matching email: thuandangnam@gmail.com', '2024-05-09 02:28:39'),
                                                                                                  (15, 2, 'localhost', 'UserDAO', NULL, 'Email not found: thuandangnam123@gmail.com', '2024-05-09 02:28:39'),
                                                                                                  (16, 1, 'localhost', 'UserDAO', 'Existing email: thuandangnam@gmail.com', 'Matching email: thuandangnam@gmail.com', '2024-05-09 02:32:27'),
                                                                                                  (17, 2, 'localhost', 'UserDAO', NULL, 'Email not found: thuandangnam123@gmail.com', '2024-05-09 02:32:27'),
                                                                                                  (18, 1, 'localhost', 'UserDAO', 'Existing email: thuandangnam@gmail.com', 'Matching email: thuandangnam@gmail.com', '2024-05-09 03:22:10'),
                                                                                                  (19, 2, 'localhost', 'UserDAO', NULL, 'Email not found: thuandangnam123@gmail.com', '2024-05-09 03:22:10'),
                                                                                                  (20, 1, 'localhost', 'UserDAO', 'Existing email: thuandangnam@gmail.com', 'Matching email: thuandangnam@gmail.com', '2024-05-09 03:24:35'),
                                                                                                  (21, 2, 'localhost', 'UserDAO', NULL, 'Email not found: thuandangnam123@gmail.com', '2024-05-09 03:24:35'),
                                                                                                  (22, 1, 'localhost', 'UserDAO', 'Existing email: thuandangnam@gmail.com', 'Matching email: thuandangnam@gmail.com', '2024-05-09 22:19:00'),
                                                                                                  (23, 2, 'localhost', 'UserDAO', NULL, 'Email not found: thuandangnam123@gmail.com', '2024-05-09 22:19:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
                          `id` int(11) NOT NULL,
                          `user_id` int(11) NOT NULL,
                          `address_id` int(11) NOT NULL,
                          `ship_type` int(11) NOT NULL DEFAULT 1,
                          `discount_id` int(11) DEFAULT NULL,
                          `payment_id` int(11) NOT NULL DEFAULT 0,
                          `date_created` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
                          `date_payment` datetime DEFAULT NULL,
                          `note` longtext DEFAULT NULL,
                          `status_id` int(11) NOT NULL DEFAULT 1,
                          `admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_items`
--

CREATE TABLE `order_items` (
                               `order_id` int(11) NOT NULL,
                               `product_id` int(11) NOT NULL,
                               `quantity` int(11) NOT NULL,
                               `order_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_status`
--

CREATE TABLE `order_status` (
                                `id` int(11) NOT NULL,
                                `status_name` varchar(50) NOT NULL,
                                `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order_status`
--

INSERT INTO `order_status` (`id`, `status_name`, `description`) VALUES
                                                                    (1, 'Chờ Thanh Toán', NULL),
                                                                    (2, 'Chờ vận chuyển', NULL),
                                                                    (3, 'Chờ giao hàng', NULL),
                                                                    (4, 'Chờ đánh giá', NULL),
                                                                    (5, 'Đã huỷ', NULL),
                                                                    (6, 'Trả hàng/ Hoàn tiền', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payment`
--

CREATE TABLE `payment` (
                           `id` int(11) NOT NULL,
                           `name` varchar(255) NOT NULL,
                           `description` text DEFAULT NULL,
                           `remaining_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
                            `id` int(11) NOT NULL,
                            `productName` varchar(255) NOT NULL,
                            `category_id` int(11) NOT NULL,
                            `sale_percent` double DEFAULT NULL,
                            `price` int(11) NOT NULL,
                            `quantity` int(11) NOT NULL,
                            `purpose` text DEFAULT NULL,
                            `contraindications` text DEFAULT NULL,
                            `ingredients` text DEFAULT NULL,
                            `dosage` text DEFAULT NULL,
                            `instructions` text DEFAULT NULL,
                            `warrantyPeriod` text DEFAULT NULL,
                            `storageCondition` text DEFAULT NULL,
                            `type_id` int(11) NOT NULL,
                            `supplier_id` int(11) DEFAULT NULL,
                            `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `productName`, `category_id`, `sale_percent`, `price`, `quantity`, `purpose`, `contraindications`, `ingredients`, `dosage`, `instructions`, `warrantyPeriod`, `storageCondition`, `type_id`, `supplier_id`, `active`) VALUES
                                                                                                                                                                                                                                                        (1, ' Dipomax-J trị viêm da', 10, NULL, 50000, 100, 'DIPROMAX-J là sản phẩm điều trị viêm da Tiết Bã Do Vi Khuẩn (Staphylococcus Pseudintermedius),  Nấm Men (Malassezia Pachydermatis) Và Nấm Ngoài Da (Dermatophytosis). các triệu chứng viêm da cấp trên chó mèo.', '– Không để thuốc dính vào mắt hoặc bôi lên vết thương hở.– Không dùng cho vật nuôi quá mẫn cảm với bất kỳ thành phần nào của thuốc.', 'Betamethasone Dipropionate, Gentamicin Sulfate.', 'Thoa 2 lầngày (sáng & tối) cho đến khi hết các', 'Liều lượng sử dụng tùy thuộc vào mức độ vùng da bị bệnh', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 1, 1, 1),
                                                                                                                                                                                                                                                        (2, 'Vắc-xin vô hoạt Nisseiken ARBP ', 8, NULL, 35000, 50, 'Vắc xin ARBP ME giúp phòng ngừa bệnh teo mũi truyền nhiễm ở heo (AR) do nhiễm trùng kết hợp giữa Bordetella bronchiseptica (Bb) và độc tố được Pasteurella multocida (Pm) sinh ra hoặc do Bb hoặc Pm.', 'Dùng cho chó, mèo qua đường miệng, có thể cho ăn trực tiếp hoặc trộn với thức ăn', 'Bordetella bronchiseptica, Pasteurella  multocida,', 'Tiêm 2 mũi', 'Tiêm bắp liều 2ml cho mỗi heo nái mang thai, mỗi lần cách nhau từ 1-2 tháng.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 1, 2, 1),
                                                                                                                                                                                                                                                        (3, 'Vắc-xin vô hoạt Nisseiken Swine ', 8, NULL, 25000, 80, 'Vắc-xin vô hoạt kết hợp phòng Actinobacillus pleuropneumoniae (serotypes 1, 2 và 5, cùng các giả độc đố tái tổ hợp) và Mycoplasma hyopneumoniae (cùng chất bổ trợ)', 'Khi con vật biểu hiện một trong những vấn đề sức khỏe hoặc tình trạng thể chất sau đây, hãy xem xét cẩn thận liệu có nên tiêm phòng hay không', 'Actinobacillus pleuropneumoniae, Escherichia coli ', 'Tiêm 2 mũi', 'Tiêm bắp liều 2ml/con từ 3 tuần tuổi hoặc lớn hơn, 2 lần mỗi lần cách nhau 3 – 5 tuần', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 2, 1, 1),
                                                                                                                                                                                                                                                        (4, 'Vắc -xin vô hoạt Nisseiken Swine AP ', 8, NULL, 45000, 60, ' Vắc -xin vô hoạt kiểm soát Actinobacillus pleuropneumoniae ở heo  (Serotype 1, 2 và 5, và các độc tố tái tổ hợp)', 'Khi con vật biểu hiện một trong những vấn đề sức khỏe hoặc tình trạng thể chất sau đây, hãy xem xét cẩn thận liệu có nên tiêm phòng hay không.', 'Actinobacillus pleuropneumoniae, Escherichia coli', '1 mlgày', 'Tiêm bắp cổ với liều 1ml/ heo liều đầu từ 35 ngày hoặc lớn hơn, liều thứ 2 được thực hiện sau 3- 5 tuần', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 2, 1, 1),
                                                                                                                                                                                                                                                        (5, 'Vắc xin vô hoạt PED+TGE ', 8, NULL, 20000, 30, 'Vắc xin vô hoạt phòng bệnh Viêm dạ dày ruột truyền nhiễm (TGE) và Dịch tiêu chảy cấp (PED) ở lợn', 'Khi con vật biểu hiện một trong những vấn đề sức khỏe hoặc tình trạng thể chất', 'Transmissible Gastroenteritis, Porcine Epidemic Di', '1 mũigày', 'Tiêm vào điểm trũng ở giữa gốc đuôi và hậu môn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 2, 1, 1),
                                                                                                                                                                                                                                                        (6, 'Dynazide 20% Injection ', 9, NULL, 15000, 120, 'Dynazide 20% Injection – kháng sinh điều trị nhiễm khuẩn đường tiêu hóa trên gia súc, gia cầm', 'Không nên dùng các loại thuốc khác như monensin, narasin hoặc salinomycin trong khi điều trị bằng thuốc này.', 'Tiamulin hydro fumarate, Tiamulin ', '1mlgày', 'Tiêm bắp.• Bệnh đường ruột (viêm hồi tràng,hồng lỵ, viêm khớp truyền nhiễm): 1 ml / 20 kg thể trọng, bằng 1 hoặc 2 lần tiêm mỗi ngày.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 3, 1, 1),
                                                                                                                                                                                                                                                        (7, 'Dynazide 10%', 9, NULL, 30000, 70, 'Dynazide 10% – kháng sinh Tiamulin 10% điều trị bệnh hồng lỵ', 'Không có chống chỉ định cụ thể', 'Tiamulin fumarate 100 g', '1 viêngày', 'Trộn thức ăn. Liều dùng như sau• Điều trị bệnh lỵ trên heo: trộn 1.2 kg DYNAZIDE 10% / 1 tấn thức ăn, dùng trong 5-10 ngày• Điều trị bệnh viêm phổi trên động vật: trộn 2 kg DYNAZIDE 10%/ 1 tấn thức ăn, dùng trong 10 ngày', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 3, 3, 1),
                                                                                                                                                                                                                                                        (8, 'Mectinvet Plus', 14, NULL, 40000, 40, 'Mectinvet Plus – trị nội, ngoại ký sinh trên trâu, bò, heo và cừu', 'Không tiêm bắp và tiêm tĩnh mạchKhông sử dụng cho bò sữa giai đoạn không tiết sữa, trong vòng 60 ngày sau khi sinh.Không sử dụng cho bò đang sản xuất sữa thương phẩmKhông sử dụng cho những con vật không được chỉ định, trong trường hợp chó có thể bị chế', 'Ivermectin 10 mgClorsulon 100 mg', '2 viêngày', 'Đường dùng: tiêm dưới da', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 3, 4, 1),
                                                                                                                                                                                                                                                        (9, 'Danoguard', 14, NULL, 18000, 50, 'Danoguard – kháng sinh tiêm trị các bệnh hô hấp và đường ruột', 'Không sử dụng cho ngựa chuyên dùng để nuôi lấy thịt', 'Danofloxacin mesylate, Danofloxacin', '100ggày', 'Tiêm bắp hoặc tiêm tĩnh mạch.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 4, 5, 1),
                                                                                                                                                                                                                                                        (10, 'Pharmatilin 25%', 9, NULL, 28000, 60, 'Pharmatilin 25%- kháng sinh điều trị bệnh hồng lỵ trên heo', 'Không sử dụng cho động vật có tiền sử nhạy cảm với Tiamulin.• Heo đang điều trị bằng Tiamulin không nên cho ăn thức ăn có chứa polyether ionophores.• Không nên dùng Tiamulin trong vòng 7 ngày trước và sau khi sử dụng polyether ionophores.', 'Tiamulin hydrogen fumarate', '1 viêngày', 'Trộn thức ăn 150-200g Tiamulin hydrogen fumarate/ tấn thức ăn (150-200ppm)', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 4, 2, 1),
                                                                                                                                                                                                                                                        (11, 'Colicure 40%', 9, NULL, 52000, 60, 'Colicure 40% – kháng sinh điều trị bệnh đường ruột', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Colistin sulfate, Colistin', '10 mlgày', 'Trộn vào thức ăn với liều 160ppm (hay 400g COLICURE 40% cho 1 tấn thức ăn) dùng liên tục trong 5-10 ngày ( 100.000 IU / kg thể trọng) .', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 4, 1, 1),
                                                                                                                                                                                                                                                        (12, 'Colicure 40%', 9, NULL, 62000, 60, 'Colicure 40% – kháng sinh điều trị bệnh đường ruột', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Colistin sulfate, Colistin', '10 mlgày', 'Trộn vào thức ăn với liều 160ppm (hay 400g COLICURE 40% cho 1 tấn thức ăn) dùng liên tục trong 5-10 ngày ( 100.000 IU / kg thể trọng) .', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 4, 2, 1),
                                                                                                                                                                                                                                                        (13, 'Nutrimax-plus', 13, NULL, 47000, 60, 'Nutrimax-plus là gel dinh dưỡng bổ sung vitamin, khoáng dành cho chó mèo dễ tiêu hóa giúp hỗ trợ sự phát triển, vận động, hồi phục sức khỏe, ngăn ngừa búi lông cho mèo', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Vitamin A, D3, E, B1, B2, B6, B12, B3, Calcium pan', '10 mlgày', 'Dùng cho chó, mèo qua đường miệng, có thể cho ăn trực tiếp hoặc trộn với thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 5, 3, 1),
                                                                                                                                                                                                                                                        (14, 'Nokodermaseb', 12, NULL, 59000, 60, 'Nokodermaseb là dung dịch kháng khuẩn và điều trị nấm dạng xịt chứa Chlorhexidine, Miconazole, giúp thú cưng khỏi các triệu chứng khó chịu, đau đớn do nấm da', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Miconazole Nitrate, Chlorhexidine gluconate', ' 2 – 3 lần/ ngày', 'Sau khi vệ sinh, làm sạch da, xịt thuốc trực tiếp lên vùng da bị nhiễm nấm', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 5, 4, 1),
                                                                                                                                                                                                                                                        (15, 'Itragol dung dich uống itraconazole', 15, NULL, 66000, 60, 'Giúp điều trị hiệu quả bệnh nấm da ở mèo do Microsporum canis tác nhân gây bệnh phổ biến và chủ yếu nhất ở mèo, có thể lây lan cho cả chó và người cùng các bệnh nhiễm trùng liên quan đến nấm men Malassezia gây viêm da và nhiễm trùng.', 'Không sử dụng itraconazole cho mèo bị suy giảm chức năng gan thận, mèo mẹ đang mang thai và đang cho con bú.', 'Itraconazole ', '5 mg itraconazole/kg thể trọng', ' Dùng một lần mỗi ngày vào các tuần xen kẽ cho 3 đợt điều trị.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 5, 5, 1),
                                                                                                                                                                                                                                                        (16, 'Selight 120 (Selamectin 12%) ', 15, NULL, 85000, 60, 'Selight 120 là thuốc nhỏ gáy trị nội ngoại ký sinh, với thành phần chính là Selamectin, ngoài phòng trị ve, bọ chét, rận tai, thuốc nhỏ gáy trị ve rận Selight còn phòng và trị được giun tim cho chó mèo', 'không dùng cho chó mèo dưới 6 tuần tuổi', 'selamectin', '0.25ml', 'Dùng tay vạch lớp lông dưới cổ thú, giữa 2 bả vai để bộc lộ vùng da. Nhỏ trực tiếp lên da.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 5, 6, 1),
                                                                                                                                                                                                                                                        (17, 'Selight 60 (Selamectin 6%)', 15, NULL, 90000, 60, 'Selight 60 là thuốc nhỏ gáy trị nội ngoại ký sinh, với thành phần chính là Selamectin, ngoài phòng trị ve, bọ chét, rận tai, thuốc nhỏ gáy trị ve rận Selight còn phòng và trị được giun tim cho chó mèo', 'không dùng cho chó mèo dưới 6 tuần tuổi', 'selamectin', '0.25ml', 'Dùng tay vạch lớp lông dưới cổ thú, giữa 2 bả vai để bộc lộ vùng da. Nhỏ trực tiếp lên da. ', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 1, 7, 1),
                                                                                                                                                                                                                                                        (18, 'Early 3Cs', 5, NULL, 42000, 60, 'Early 3Cs là một giải pháp bù nước hiệu quả cho gà con.', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Vitamin E: 0.2mgProbiotic, acid amin, tá dược vừa', '100g ', 'Trộn đều trong 5-6 phút. Khi hạt Early3Cs được hoàn nguyên, sản phẩm lúc này đã sẵn dùng cho gà con trong khay gà/ hộp vận chuyển gà hoặc ở bên ngoài', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 1, 5, 1),
                                                                                                                                                                                                                                                        (19, 'Nutrimax-plus', 13, NULL, 45000, 60, 'Nutrimax-plus là gel dinh dưỡng bổ sung vitamin, khoáng dành cho chó mèo dễ tiêu hóa giúp hỗ trợ sự phát triển, vận động, hồi phục sức khỏe, ngăn ngừa búi lông cho mèo', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Vitamin A, D3, E, B1, B2, B6, B12, B3, Calcium pan', '10 mlgày', 'Dùng cho chó, mèo qua đường miệng, có thể cho ăn trực tiếp hoặc trộn với thức ăn.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 1, 8, 1),
                                                                                                                                                                                                                                                        (20, 'Nokodermaseb', 12, NULL, 32000, 60, 'Nokodermaseb là dung dịch kháng khuẩn và điều trị nấm dạng xịt chứa Chlorhexidine, Miconazole, giúp thú cưng khỏi các triệu chứng khó chịu, đau đớn do nấm da', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Miconazole Nitrate, Chlorhexidine gluconate', ' 2 – 3 lần/ ngày', 'Dùng cho chó, mèo qua đường miệng, có thể cho ăn trực tiếp hoặc trộn với thức ăn.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 1, 9, 1),
                                                                                                                                                                                                                                                        (21, 'Cát vệ sinh Captain Meow 5 lít', 2, NULL, 72000, 60, 'dùng để cho mèo đi vệ sinh', 'Không có', 'Bentonite ', 'Đồ lượng vừa đủ vào khay vệ sinh với độ dày tầm 2', 'Khi tiếp xúc với chất tải rắn và lòng của vật nuôi, cát sẽ đóng thành từng cục nhỏ. Sử dụng xẻng xúc cát ra khỏi khay. Không cần đổ bỏ phần cát còn lại mà làm đầy bằng cách đó thêm cát với độ dày như đã khuyến cáo.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 5, 10, 1),
                                                                                                                                                                                                                                                        (22, 'Thức ăn ướt Regalos cho mèo', 6, NULL, 37000, 60, 'pate cao cấp được tuyển chọn nguyên liệu 100% cá ngừ trắng thơm ngon nhất theo tiêu chuẩn dùng cho người giúp cung cấp dưỡng chất thiết yếu, hỗ trợ cho quá trình phát triển của mèo cưng', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cá ngừ, cá hồi, ức gà, cá bào Katsuobushi, thanh c', '2-3g', 'Cho mèo ăn trực tiếp, liều lượng tùy thuộc vào giống mèo, tuổi, cân nặng & mức độ hoạt động.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 5, 5, 1),
                                                                                                                                                                                                                                                        (23, 'Jinny Stick – Snack cho mèo', 6, NULL, 48000, 60, 'Thích hợp cho ăn như bánh ăn nhẹ hoặc phần thưởng cho thú cưng để thể hiện tình yêu của bạn với vật nuôi hay trong quá trình huấn luyện mèo. ', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cá ngừ, cá hồi, ức gà, cá bào Katsuobushi, thanh c', '1 góigày', ' Ăn ngay sau khi mở', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 5, 1, 1),
                                                                                                                                                                                                                                                        (24, 'Nước hoa cho chó mèo Cupid Perfume', 2, NULL, 90000, 60, 'Cupid Perfume là dòng nước hoa diệu kì dành cho chó mèo trong gia đình bạn giúp dưỡng lông, khử mùi, tạo hương thơm trên mình thú cưng nhanh với mùi hương được lưu giữ lâu nhẹ nhàng.', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Propylene glycol, Tea extract oil 0.2%', '0.25ml', 'Xịt trực tiếp', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 5, 5, 1),
                                                                                                                                                                                                                                                        (25, 'Pet Ear Cleaner', 2, NULL, 62000, 60, 'làm sạch tai cho chó mèo', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Propylene glycol, Tea extract oil 0.2%', '2-3 lần -tuần', 'Lắc kỹ chai thuốc trước khi sử dụng. Nhỏ vào tai, sau đó lấy tay xoa nhẹ phần gốc tai, lau phần trên vành tai và các phần khác bằng bông gòn thấm. Lấy bông ngoáy tai hoặc khăn mềm cho nhẹ nhàng vào tai thú cưng lấy các chất bẩn ra.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 5, 2, 1),
                                                                                                                                                                                                                                                        (26, 'Nutri-Forte Gel', 6, NULL, 82000, 60, 'Nutri-Forte gel là thức ăn rất hữu dụng cho thú cưng trong các trường hợp cần cung cấp năng lượng và các chất dinh dưỡng cần thiết trong trường hợp suy dinh dưỡng, biếng ăn hoặc cần chăm sóc đặc biệt', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Vitamin A, Vitamin D3, Vitamin E, Thiamine (B1), R', '1 thìa cà phê mỗi 4-6 giờ.', 'Cung cấp qua đường miệng.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 5, 3, 1),
                                                                                                                                                                                                                                                        (27, 'Metricyclin – viên đặt tử cung chlortetracyclin', 5, NULL, 49000, 60, 'Dùng để phòng bệnh viêm nội mạc tử cung sau khi sinh và điều trị các trường hợp nhiễm trùng tử cung.', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 5, 5, 1),
                                                                                                                                                                                                                                                        (28, 'Advance Sulfa Thoxine –', 3, NULL, 57000, 60, 'Đặc trị cầu trùng, ký sinh trùng đường máu, đầu đen', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 5, 4, 1),
                                                                                                                                                                                                                                                        (29, 'Advance New Max', 5, NULL, 55000, 60, 'môi trường pha tinh heo', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 2, 5, 1),
                                                                                                                                                                                                                                                        (30, 'Advance Pro-lim', 7, NULL, 62000, 60, 'Thức ăn bổ sung, hỗ trợ bổ sung khoáng chất cho gia súc.', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 3, 6, 1),
                                                                                                                                                                                                                                                        (31, 'Mectinvet Injection', 13, NULL, 52000, 60, 'trị nội ngoại ký sinh', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 3, 7, 1),
                                                                                                                                                                                                                                                        (32, 'Vắc xin nhược độc phòng bệnh Dịch tả heo ', 8, NULL, 82000, 60, 'phòng bệnh Dịch tả heo (Sản xuất trên tế bào)', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 2, 8, 1),
                                                                                                                                                                                                                                                        (33, 'Vắc xin vô hoạt', 8, NULL, 72000, 60, 'phòng bệnh tai xanh chủng NVDC-JXA1', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 6, 9, 1),
                                                                                                                                                                                                                                                        (34, 'Vắc xin vô hoạt', 8, NULL, 82000, 60, 'phòng bệnh Newcastle (chủng Lasota) và Cúm gia cầm (phân typ H9, chủng SS)', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 4, 5, 1),
                                                                                                                                                                                                                                                        (35, 'TUKONO', 2, NULL, 34000, 60, 'Tukono giúp điều trị viêm tai ngoài cấp tính hoặc mãn tính ở thủ cưng do vi khuẩn và nấm gây ra, đặc biệt là Maracetia pachydermatis', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 5, 10, 1),
                                                                                                                                                                                                                                                        (36, 'PROVITA', 13, NULL, 45000, 60, 'bổ sung vitamin khoáng, acid amin cho vật nuôi khỏe mạnh', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 5, 1, 1),
                                                                                                                                                                                                                                                        (37, 'SUPER RED SKIN (NANO)', 5, NULL, 52000, 60, 'giúp gà đá săn da, giảm bầm, phòng nấm', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 4, 2, 1),
                                                                                                                                                                                                                                                        (38, 'Advance Keto – Ketoconazole', 3, NULL, 60000, 60, 'giúp trị nấm da cho chó mèo', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 4, 3, 1),
                                                                                                                                                                                                                                                        (39, 'CP – CIN 20 hormone', 11, NULL, 70000, 60, 'Kích thích phát triển', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 2, 4, 1),
                                                                                                                                                                                                                                                        (40, 'I-Pett Doggy Gel', 13, NULL, 72000, 60, 'cung cấp Omega 3 vi khoáng thiết yếu cho chó', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 5, 5, 1),
                                                                                                                                                                                                                                                        (41, 'I-Pett Kitty Gel', 13, NULL, 98000, 60, 'cung cấp Omega 3 vi khoáng thiết yếu cho mèo', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 5, 6, 1),
                                                                                                                                                                                                                                                        (42, 'I-PETT LIPOTIN', 3, NULL, 67000, 60, 'viên chăm sóc chuyên sâu da lông dành cho chó', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 1, 7, 1),
                                                                                                                                                                                                                                                        (43, 'Nutrical', 13, NULL, 42000, 60, 'viên bổ sung Canxi và khoáng cho chó tầm vóc lớn', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 1, 8, 1),
                                                                                                                                                                                                                                                        (44, 'Dotrol', 14, NULL, 56000, 60, 'Dung dịch điều trị giun cho chó dưới 1 tuổi', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 1, 9, 1),
                                                                                                                                                                                                                                                        (45, 'Catrol', 14, NULL, 47000, 60, 'Dung dịch điều trị giun tròn trên mèo', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 5, 10, 1),
                                                                                                                                                                                                                                                        (46, 'Lac-premix', 13, NULL, 49000, 60, 'Thức Ăn Bổ Sung Vitamin, Khoáng Và Methionine Cho Heo Và Gia Cầm', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 2, 5, 1),
                                                                                                                                                                                                                                                        (47, 'Yemune G7 ', 8, NULL, 45000, 60, 'phòng bệnh Newcastle (chủng A VII)', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 2, 1, 1),
                                                                                                                                                                                                                                                        (48, 'AVI Pox', 8, NULL, 47000, 60, 'Vắc-xin phòng bệnh đậu gà, dòng Cutter', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 4, 2, 1),
                                                                                                                                                                                                                                                        (49, 'THUỐC THÚ Y SUPERCID', 12, NULL, 46000, 60, 'Dùng sát trùng chuồng trại, dụng cụ chăn nuôi, phương tiện vận chuyển, hố chôn, môitrường, khu vực chế biến thịt, sữa… để phòng và xử lý các dịch bệnh do vi khuẩn, virus,nấm mốc, bào tử gây ra trên gia súc, gia cầm.', 'Không dùng đồng thời với xà phòng.', 'Glutaraldehyde 250gFormaldehyd 185gAlkyl -dimeth', ' 1 lít SUPERCID với 250-300 lít nước sạch', ' Khử trùng không khí: pha 1 lít SUPERCID với 250-300 lít nước sạch, phun sương vớitỷ lệ 1 lít dung dịch đã pha cho 150 m3 không khí.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 3, 3, 1),
                                                                                                                                                                                                                                                        (50, 'THUỐC THÚ Y VIATOX', 12, NULL, 48000, 60, '– Diệt ruồi, muỗi, nhặng, kiến, gián, bọ chét, cái ghẻ trong trại chăn nuôi gia súc, gia cầm, gia đình, bãi rác, khu chôn xác động vật chết.– Phòng, trị: Ve bò, rận, ghẻ, bọ chét, bét, bọ chó, mòng trên trâu, bò, dê, cừu, lợn, mạt gà ở gia cầm.', 'Không ăn uống, hút thuốc khi sử dụng chế phẩm.* Không phun trên ao cá, bể cá, nơi đựng thức ăn, nước sinh hoạt, không đổ chế phẩm thừa xuống ao, hồ, sông, suối…', 'Deltamethrin, Dung môi vừa đủ', '1 lít ', ' Chuồng trống: phun đều lên tường, trần, sàn, cột, máng ăn, uống, không khí…', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 4, 5, 1),
                                                                                                                                                                                                                                                        (51, 'THỨC ĂN BỔ SUNG BIOSUBTYL CHÓ MÈO', 7, NULL, 49000, 60, '– BIOSUBTYL được bào chế theo công nghệ bao vi nang, siêu tan, cung cấp bổ sung các lợi khuẩn có ích, vitamin và điện giải giúp cân bằng hệ vi sinh đường ruột.– Tăng cường hệ miễn dịch, hỗ trợ và cải thiện rối loạn tiêu hoá, giúp phòng và trị tiêu chảy ', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Bacillus subtilis, Saccharomyces cerevisiae, Lipas', 'Chó con, mèo (nhỏ hơn 6 tháng tuổi):…………………….1 gói', 'Trộn thường xuyên vào khẩu phần thức ăn hoặc pha nước uống.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 5, 6, 1),
                                                                                                                                                                                                                                                        (52, 'SACCHAROMYCES CEREVISIAE MEN SỐNG CHỊU KHÁNG SINH', 9, NULL, 41000, 60, '– Nâng cao hiệu quả sử dụng thức ăn giúp vật nuôi hấp thu tối đa các chất dinh dưỡng, tăng trọng nhanh, giảm chi phí thức ăn.– Giúp cân bằng hệ vi sinh đường ruột cho gia súc, gia cầm.', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Saccharomyces cerevisiae', '– Heo con:1,5-2kg/tấn TĂ.– Heo', 'Để đảm bảo sản phẩm trộn đều trong thức ăn, nên trộn sản phẩm (Đã được tính theo liều quy định) với lượng thức ăn nhỏ rồi tăng dần lên.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 2, 7, 1),
                                                                                                                                                                                                                                                        (53, 'THUỐC THÚ Y KHÁNG THỂ HEO CON PREVENTAL', 10, NULL, 42000, 60, '– Bổ sung kháng thể IgG, L-Carnitine trong sữa đầu tăng cường hệ miễn dich, chống lại các loại virus và vi khuẩn xâm nhập cơ thể vật nuôi.', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Beta glucan, Mannan oligosaccharides, Dung môi vđ ', 'Mỗi lần xịt tương ứng 1ml.', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 2, 8, 1),
                                                                                                                                                                                                                                                        (54, 'THUỐC THÚ Y ACEFA S LA', 3, NULL, 40000, 60, 'Đặc trị các chứng viêm và nhiễm trùng trên trâu, bò, dê, cừu, heo', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cefalexin, Dung môi (Labrac PG,…)', '20ml ', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 3, 9, 1),
                                                                                                                                                                                                                                                        (55, 'VIABIO MEN SỐNG GISOL ', 12, NULL, 42000, 60, 'Bổ sung các lợi khuẩn dạng bào tử. Bào tử có thể sống sót ở nhiệt độ môi trường cao, khi di chuyển qua môi trường pH acid của dịch vị dạ dày – nơi phần lớn các vi khuẩn ở dạng thường sẽ bị tiêu diệt. Chống chịu tốt với các kháng sinh, có tác dụng vượt trộ', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Bacillus, Độ ẩm, Cát sạn, Tá dược ', '100gr/300kgTTgày ', 'Pha nước uống hoặc trộn thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 6, 10, 1),
                                                                                                                                                                                                                                                        (56, 'THUỐC DIỆT RUỒI', 3, NULL, 47000, 60, 'THU HÚT MẠNH – DIỆT RUỒI NHANHHIỆU LỰC TỨC THÌ – TÁC DỤNG KÉO DÀI', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Thiamethoxam, Tá dược vđ', '15g thuốc với 50g đường cát', 'Pha nước uống hoặc trộn thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 6, 5, 1),
                                                                                                                                                                                                                                                        (57, 'VIABIO MEN SỐNG GISOL ', 13, NULL, 40000, 60, 'Bổ sung các lợi khuẩn dạng bào tử. Bào tử có thể sống sót ở nhiệt độ môi trường cao, khi di chuyển qua môi trường pH acid của dịch vị dạ dày – nơi phần lớn các vi khuẩn ở dạng thường sẽ bị tiêu diệt. Chống chịu tốt với các kháng sinh, có tác dụng vượt trộ', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Bacillus, Độ ẩm, Cát sạn, Tá dược vđ', '100gr/300kgTTgày', 'Pha nước uống hoặc trộn thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 6, 7, 1),
                                                                                                                                                                                                                                                        (58, 'VIABIO.KN01 MEN KHỬ MÙI NỀN CHUỒNG', 12, NULL, 72000, 60, 'Hỗ trợ đệm lót nhằm: không phải dọn phân, rửa chuồng hàng ngày (nuôi lợn), không phải định kỳ thay đệm lót (nuôi gà) trong suốt quá trình nuôi, hút ẩm, khử mùi hôi trong tiểu khí hậu trang trại chăn nuôi nhưng vẫn đảm bảo chuồng nuôi hầu như không còn mùi', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Bacillus, Độ ẩm, Cát sạn, Tá dược vđ, Saccharomyce', '1kg chế phẩm trộn cùng 5-7 kg bột ngô hoặc cám gạo', 'Pha nước uống hoặc trộn thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 6, 5, 1),
                                                                                                                                                                                                                                                        (59, 'THUỐC THÚ Y AZ.FASCIOLIS', 5, NULL, 78000, 60, 'Tẩy sạch sán lá gan (sống trong ống mật), sán lá dạ cỏ, sán dây, các loại giun tròn, cả dạng ấu trùng và trưởng thành ký sinh ở trâu, bò, dê, cừu.', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Triclabendazole, Tá dược vđ', 'Trâu, bò: 1 viên/60kgTTDê, cừu:1/2 viên/25kgTT', 'Pha nước uống hoặc trộn thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 3, 5, 1),
                                                                                                                                                                                                                                                        (60, 'THUỐC THÚ Y VIA', 12, NULL, 42000, 60, 'Thuốc có tác dụng điều trị các bệnh nhiễm trùng nhạy cảm với Ampicillin và Erthromycin. Đặc hiệu với bệnh gà rù, gà toi, xù lông, sã cánh, mào thâm, chướng diều, khô chân, ăn không tiêu. Gia cầm tiêu chảy phân xanh, phân trắng, nghẹo đầu, nghẹo cổ, gục đầ', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Ampicillin trihydrate, Erythromycin thiocyanate', '10g/20kgTT hoặc 2g/lít nước uống', 'Pha nước uống hoặc trộn thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 3, 8, 1),
                                                                                                                                                                                                                                                        (61, 'THUỐC THÚ Y CÚM GIA CẦM VIA', 5, NULL, 49000, 60, 'Đặc trị nhiễm trùng đường tiêu hoá, hô hấp, sinh dục trên gia cầm như: tiêu chảy phân xanh, phân trắng bết hậu môn, hở rốn, viêm rốn, lòng đỏ chậm tiêu, CRD (khò khè) do E.coli, Salmonella gây ra.', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Ampicillin trihydrate, Erythromycin thiocyanate', '1g/kgTTgày hoặc pha 2 thìa cafe/lít nước', 'Pha nước uống hoặc trộn thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 4, 3, 1),
                                                                                                                                                                                                                                                        (62, 'THUỐC THÚ Y SANFO.GENTADOX', 12, NULL, 67000, 60, 'Điều trị các bệnh nhiễm trùng do các chủng vi khuẩn nhạy cảm với Gentamicin và Doxycycline:', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Doxycycline hyclate, Gentamicin sulphate, ', '1g/5kgTTgày', 'Pha nước uống hoặc trộn thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 2, 6, 1),
                                                                                                                                                                                                                                                        (63, 'THUỐC THÚ Y AZ-MOXY 50S', 12, NULL, 56000, 60, 'Đặc trị nhiễm khuẩn đường tiêu hoá, hô hấp, sinh dục gây ra bởi các vi khuẩn nhạy cảm với Amoxicillin:', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Amoxycillin, Tá dược ', '50g/200 lít nước', 'Pha nước uống hoặc trộn thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 3, 6, 1),
                                                                                                                                                                                                                                                        (64, 'THUỐC THÚ Y AMPI-COLI (GOLD)', 12, NULL, 56000, 60, 'Đặc trị các trường hợp nhiễm khuẩn do vi khuẩn nhạy cảm với Ampicillin và Colistin trên gia cầm như: Bệnh tiêu chảy do E.coli, Salmonella gây tiêu chảy phân xanh, phân trắng nhớt, bại huyết kéo màng trắng trên bao tim và gan; viêm túi lòng đỏ và hở rốn, b', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Ampicillin trihydrat, Colistin sulfate, Coloring a', '100g/400-600kgTTgày.', 'Pha nước uống hoặc trộn thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 4, 5, 1),
                                                                                                                                                                                                                                                        (65, 'THUỐC THÚ Y VIA.DOXY-200', 12, NULL, 42000, 60, 'Đặc trị nhiễm khuẩn đường hô hấp, tiêu hoá do vi khuẩn nhạy cảm với Doxycycline:', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Doxycycline HCl, Tá dược vđ', '1g/8-10kgTTgày', 'Pha nước uống hoặc trộn thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 3, 5, 1),
                                                                                                                                                                                                                                                        (66, 'THUỐC THÚ Y VIATOX 300', 3, NULL, 82000, 60, 'Diệt trừ các loại côn trùng gây hại như muỗi, ruồi, kiến, gián, ve, chấy, rận, bọ chét …', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '1 lít', 'Phun toàn bộ chuồng trại', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 3, 5, 1),
                                                                                                                                                                                                                                                        (67, 'THUỐC THÚ Y SANFO.TIAMULIN', 5, NULL, 52000, 60, 'Trị các bệnh hô hấp, tiêu hoá do vi khuẩn nhạy cảm với Tiamulin gây bệnh trên heo và gia cầm.', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Tiamulin hydrogen fumarate', '1kg/10-12 tấn TTgày ', 'Pha nước uống hoặc trộn thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 2, 5, 1),
                                                                                                                                                                                                                                                        (68, 'THUỐC THÚ Y MOXYCOLI NANO', 5, NULL, 22000, 60, 'Đặc trị nhiễm trùng đường tiêu hoá, hô hấp trên gia cầm và heo:', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Amoxicillin, Colistin sulfate', '100g/200 lít nước ', 'Pha nước uống hoặc trộn thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 2, 5, 1),
                                                                                                                                                                                                                                                        (69, 'THỨC ĂN BỔ SUNG GLUCO-K.C', 5, NULL, 62000, 60, 'Gluco -K.C giúp giải độc, giải nhiệt, làm mát cơ thể khi bị sốt cao, cầm máu, phòng báng nước cho gà hữu hiệu.', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Vitamin C, Vitamin K3, Glucose.', '200g pha với 20 lít nước uống.', 'Pha nước uống hoặc trộn thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 3, 5, 1),
                                                                                                                                                                                                                                                        (70, 'THUỐC THÚ Y DOXYCOLI NANO', 5, NULL, 92000, 60, 'Gia cầm: Đặc trị CRD – khò khè, CRD ghép ORT, CRD ghép E.coli tiêu chảy phân xanh, phân trắng Coryza, bạch lỵ, thương hàn, tụ huyết trùng.Heo: Đặc trị bệnh viêm phổi do Mycoplasma gây ho khan, ho kéo dài, viêm phổi dính sườn, tụ huyết trùng, lepto, hồng', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Doxycycline hyclate, Colistin sulfate', '1kg/30-35 tấnTTgày', 'Pha nước uống hoặc trộn thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 4, 5, 1),
                                                                                                                                                                                                                                                        (71, 'THUỐC THÚ Y COLISTIN 10% PREMIX', 5, NULL, 82000, 60, 'Đặc trị các bệnh nhiễm khuẩn tiêu hoá như E.coli, viêm ruột, tiêu chảy phân xanh, phân trắng, phân có bọt, thương hàn, bạch lỵ, viêm rốn gà con.', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Colistin sulphate, tá dược vđ', '1kg/8-10 tấnTT ', 'Pha nước uống hoặc trộn thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 2, 5, 1),
                                                                                                                                                                                                                                                        (72, 'MEN SỐNG BIOSUBTYL', 9, NULL, 72000, 60, 'BIOSUBTYL là hỗn hợp men sống chịu kháng sinh và kháng acid; bổ sung dạng thức ăn cho gia súc, gia cầm.', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Lactobacillus aicdophiius, Bacillus subtilis, Sacc', '1g/10kgTT', 'Pha nước uống hoặc trộn thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 3, 5, 1),
                                                                                                                                                                                                                                                        (73, 'Vắc-xin phòng bệnh đậu gà', 8, NULL, 50000, 100, 'AVI Pox giúp tạo miễn dịch chủ động của gà chống lại bệnh đậu gà.', 'Được dùng để chủng ngừa lần đầu hoặc tái chủng cho gà thịt, hậu bị và gà hướng trứng.', 'Trong 1 liều vắc-xin chứa: Virus dòng Cutter gây bệnh Đậu gà ở dạng nhược độc, đông khô.', '1 mũigày', 'Gà nên được chủng ngừa từ 4 – 16 tuần tuổi.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thấp', 4, 1, 1),
                                                                                                                                                                                                                                                        (74, 'Vắc-xin bất hạt phòng bệnh dịch tả gà', 8, NULL, 30000, 50, 'Được khuyến cáo sử dụng cho đàn gà giúp phòng bệnh Newcastle (dịch tả gà).', 'Không dùng cho gà con', 'Trong 1 liều vắc-xin chứa: Virus dòng Lasota gây bệnh Newcastle, chất bổ trợ là nhũ dầu.', '2 mũigày', 'Tiêm dưới da cổ, hoặc tiêm cơ (cơ ức hoặc đùi), liều 0,5ml/ gà.', '12 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ 2℃～8℃.', 4, 2, 1),
                                                                                                                                                                                                                                                        (75, 'Vắc-xin bất phòng bệnh dịch tả gà', 8, NULL, 25000, 70, 'Vắc-xin bất hoạt được khuyến cáo sử dụng cho đàn gà giống và gà đẻ trước đó đã có miễn dịch phòng bệnh Newcastle (ND) và Gumboro từ vắc-xin sống nhược độc.', 'Không nên sử dụng cho gà đang mang thai.', 'Trong 1 liều vắc-xin chứa: Tổ hợp virus dòng Lasota gây bệnh Newcastle,và virus dòng GP gây bệnh Viêm túi Bursal (Gumboro), chất bổ trợ là nhũ dầu.', '1 viêngày', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '18 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thoáng mát', 4, 3, 1),
                                                                                                                                                                                                                                                        (76, 'Vắc-xin phòng bệnh viêm phế quản', 8, NULL, 35000, 60, 'Trị bệnh viêm phế quản ở gà.', 'Không nên sử dụng cho gà đang mang thai.', 'Trong 1 liều vắc-xin chứa: Tổ hợp virus dòng Lasota gây bệnh Newcastle, virus dòng Massachussetts gây bệnh Viêm Phế quản truyền nhiễm', '2 mũigày', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '15 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ 2℃～8℃', 4, 4, 1),
                                                                                                                                                                                                                                                        (77, 'Vắc-xin phòng IB', 8, NULL, 58000, 90, 'AVI ND Lasota + IB giúp tạo miễn dịch chủ động của gà chống lại bệnh Viêm Phế quản Truyền nhiễm và Newcastle.', 'Không nên dùng cho gà đẻ trứng', 'Trong 1 liều vắc-xin chứa: Virus dòng Massachusetts B48 gây bệnh Viêm Phế quản truyền nhiễm và dòng LaSota gây bệnh Newcastle ở dạng nhược độc, đông khô.', '5mlgày', 'Sử dụng liên tục khi gà có bệnh.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thấp', 4, 1, 1),
                                                                                                                                                                                                                                                        (78, 'Lasota+IB Vắc-xin phòng IB dòng Massachusetts', 8, NULL, 18000, 90, 'AVI ND Lasota + IB giúp tạo miễn dịch chủ động của gà chống lại bệnh Viêm Phế quản Truyền nhiễm và Newcastle.', 'Không nên dùng cho gà đẻ trứng', 'Trong 1 liều vắc-xin chứa: Virus dòng Massachusetts B48 gây bệnh Viêm Phế quản truyền nhiễm và dòng LaSota gây bệnh Newcastle ở dạng nhược độc, đông khô.', '5mlgày', 'Sử dụng liên tục khi gà có bệnh.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thấp', 4, 1, 1),
                                                                                                                                                                                                                                                        (79, 'Vắc-xin phòng bệnh Newcastle', 8, NULL, 18000, 90, 'AVI ND Lasota giúp tạo miễn dịch chủ động của gà chống lại bệnh Newcastle.', 'Không nên dùng cho gà đẻ trứng', 'Trong 1 liều vắc-xin chứa: Virus dòng Lasota gây bệnh Newcastle, ở dạng nhược độc, đông khô nồng độ tối thiểu 5.5 log10 EID50/ liều.', '5mlgày', 'Sử dụng liên tục khi gà có bệnh.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ 2℃～8℃', 4, 1, 1),
                                                                                                                                                                                                                                                        (80, 'AVI IBD Plus Vắc-xin phòng bệnh Gumboro', 8, NULL, 32000, 70, ' AVI IBD Plus giúp tạo miễn dịch chủ động của gà chống lại bệnh Gumboro do virus độc lực gây ra', 'Nên cho đàn gà nhịn khát trong vòng 60-90 phút trước khi uống vắc xin', 'Trong 1 liều vắc-xin chứa: Virus dòng Winterfield 2512 G-61 gây viêm túi bursa, ở dạng nhược độc, đông khô nồng độ tối thiểu 2.0 log10 EID50/ liều', '2 mlgày', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '15 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ khô ráo', 4, 3, 1),
                                                                                                                                                                                                                                                        (81, 'Vắc-xin phòng bệnh Gumboro dòng LIBDV', 8, NULL, 28000, 80, 'AVI IBD Inter  giúp tạo miễn dịch chủ động của gà chống lại bệnh Gumboro.', 'Không dùng cho gà đẻ trứng', 'Trong 1 liều vắc-xin chứa: Virus dòng LIBDV gây viêm túi bursa, ở dạng nhược độc', '1 liềugày', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '20 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thấp', 4, 4, 1),
                                                                                                                                                                                                                                                        (82, 'Vắc-xin phòng bệnh IB H120', 8, NULL, 20000, 95, 'AVI IB H120 giúp tạo miễn dịch chủ động của gà chống lại bệnh Viêm Phế quản Truyền nhiễm.', 'Được dùng để chủng ngừa lần đầu hoặc tái chủng cho gà thịt, hậu bị và gà đẻ. ', 'Trong 1 liều vắc-xin chứa: Virus dòng Massachusetts H120 gây bệnh Viêm Phế quản Truyền nhiễm, ở dạng nhược độc', '1 viêngày', 'Sử dụng liên tục trong giai đoạn nuôi gà con.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 4, 8, 1),
                                                                                                                                                                                                                                                        (83, 'Vắc-xin phòng sổ mũi truyền nhiễm trên gà', 8, NULL, 26000, 65, 'Giảm triệu chứng sổ mũi ở gà.', 'Không nên sử dụng cho gà đang mang thai.', 'Trong 1 liều vắc-xin chứa: tổ hợp 3 chủng huyết thanh A, B, C của vi khuẩn  gây bệnh Sổ mũi truyền nhiễm (bệnh Coryza), đồng nhất với chất bổ trợ là nhôm hydroxit và được bảo quản bởi merthiolate.', '1 mlgày', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '18 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thấp', 4, 2, 1),
                                                                                                                                                                                                                                                        (84, 'Vắc xin vô hoạt phòng bệnh Cúm gia cầm', 8, NULL, 32000, 70, 'Ngăn chặn sự phát triển của virus cúm gia cầm', 'Chỉ sử dụng vắc xin trong ngày sau khi đã mở nắp chai.', 'Vắc xin chứa vi rút cúm gia cầm phân typ H9, chủng A/Chicken/Guangdong/SS/94 (H9N2) đã được vô hoạt. Hàm lượng vi rút trước khi vô hoạt ≥ 5×107.0 EID50/ml.', '2 mlgày', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '18 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ 2℃～8℃.', 4, 3, 1),
                                                                                                                                                                                                                                                        (85, 'Hỗn hợp dung dịch các axit', 4, NULL, 45000, 90, 'Pro-Acid là sản phẩm được tạo thành tự sự kết hợp của nhiều loại axit hữu cơ với công nghệ đệm được cấp bằng sáng chế.', 'Sau khi mở, phải sử dụng hết sản phẩm càng sớm càng tốt.', 'A-xít Citric, A-xít Lactic , A-xít formic , A-xít Acetic , A-xít Propionic chất mang: nước tinh khiết', 'Chai 500ml', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nơi khô thoáng, tránh ánh sáng mặt trời', 6, 3, 1),
                                                                                                                                                                                                                                                        (86, 'Thuốc sát trùng Nano Klea Rx', 14, NULL, 28000, 80, 'Nano Klea Rx có chức năng khử mùi, phân tử nano bạc giúp cải thiện vết thương bề mặt, không gây độc cho thú cưng, thành phần sản phẩm thân thiện với môi trường.', 'Không kích thích', ' Nano Bạc', 'Xịt trực tiếp', 'Xịt trực tiếp lên da, vết thương, khu vực cần điều trị 2-3 lầngày.', '20 tháng kể từ ngày sản xuất', 'Bảo quản nơi thoáng mát, dưới 30oC', 1, 8, 1),
                                                                                                                                                                                                                                                        (87, 'Thuốc kháng viêm vịt', 10, NULL, 20000, 95, 'Điều trị viêm, giảm xuất huyết, chống phù nề sau phẫu thuật, tan máu bầm do chấn thương, áp xe.', 'Thú quá mẫn với các thành phần của thuốc.', 'Alpha-chymotrypsin', '1 viêngày', 'Pha vào nước uống hoặc trộn vào thức ăn.', '24 tháng kể từ ngày sản xuất', 'Nơi khô ráo, thoáng mát, nhiệt độ dưới 30oC, tránh ánh nắng trực tiếp. Tránh xa tầm tay trẻ em.', 4, 5, 1),
                                                                                                                                                                                                                                                        (88, 'Thức ăn bổ sung ADE.B-Complex', 7, NULL, 26000, 70, ' ADE.B-complex là thức ăn bổ sung dạng bột hòa tan chứa các loại vitamin.', 'Không nên sử dụng cho heo con.', 'trong 1000g chứa: Vitamin A, D3, E, C, B1, B2, B5, B6, B9, B12, Lactose', '1 kggày', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '18 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thoáng mát', 6, 1, 1),
                                                                                                                                                                                                                                                        (89, 'Thuốc dung dịch tiêm', 9, NULL, 32000, 75, 'Kích thích co bóp tử cung (duy trì tử cung), thúc đẩy co hồi tử cung và tăng cường tiết sữa.', 'Khi được sử dụng một cách thích hợp theo liều khuyến cáo, oxytocin hiếm khi gây ra các phản ứng bất lợi.', 'Phenol, citric acid monohydrate, sodium chloride, nước pha tiêm.', ' Tiêm 2 mũigày', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '15 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ khô ráo', 3, 2, 1),
                                                                                                                                                                                                                                                        (90, 'Dầu tắm đặc trị Modern Pet', 1, NULL, 45000, 90, 'Điều trị ngoại ký sinh trùng cho chó, mèo.', 'Không có.', 'Trong 1l chứa Permethrin 5 g', 'Tắm 1 – 2 tuần/lần', 'Sử dụng tốt cho những chó giống lớn cả lông ngắn và lông dài.', '24 tháng kể từ ngày sản xuất', 'Ở nhiệt độ dưới 30°C , nơi khô ráo, thoáng mát', 1, 3, 1),
                                                                                                                                                                                                                                                        (91, 'Kháng thể vi rút viêm gan vịt', 8, NULL, 22000, 85, ' Kháng thể giúp phòng và điều trị khẩn cấp bệnh Viêm gan siêu trùng vịt, ngan, ngỗng, gà tây, gà sao, chim trĩ.', 'Không có', 'Kháng thể vi rút viêm gan vịt. Hiệu giá kháng thể trung hòa ≥ 1: 256', 'Chai 250ml', 'Tiêm dưới da hoặc tiêm bắp.', '24 tháng kể từ ngày sản xuất', 'Ở nhiệt độ 2-8°C', 4, 6, 1),
                                                                                                                                                                                                                                                        (92, 'MYCO AD hấp thụ độc tố nấm mốc', 4, NULL, 24000, 75, 'Bổ sung chất hấp thụ độc tố nấm mốc dùng trộn vào thức ăn cho gia súc, gia cầm.', 'Không mất tác dụng khi trộn với bất kì thành phần thức ăn nào.', 'SiO2,AI2O3', '1,5 – 2,5 kg/ tấn thức ăn.', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '18 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thoáng mát', 6, 5, 1),
                                                                                                                                                                                                                                                        (93, 'Modern Pet Vita Hemo hỗ trợ tạo máu', 3, NULL, 30000, 80, 'Hỗ trợ tạo máu, giúp thú cưng phục hồi nhanh chóng và kích thích sự thèm ăn sau bệnh.', 'Không có', 'Đồng, Folic acid, Inositol, Niacin, Pantothenic acid, Sắt, Vitamin B1, Vitamin B12, Vitamin B2, Vitamin B6', ' 2,2 ml/ 10 kg thể trọng', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '15 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ khô ráo', 1, 6, 1),
                                                                                                                                                                                                                                                        (94, 'Thuốc trị viêm vú trên heo nái', 10, NULL, 20000, 95, 'Được thiết kế đặc biệt để đối phó với tình trạng viêm vú và viêm tử cung ở heo nái.', 'Không có', 'Amoxicillin trihydrate: 15g', '1ml/15kg thể trọng/72 giờ.', 'Tiêm nhắc lại sau 48 giờ nếu cần thiết.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 2, 2, 1),
                                                                                                                                                                                                                                                        (95, 'Viên xổ giun cho mèo Prarintel', 10, NULL, 24000, 70, ' Điều trị bệnh nhiễm giun tròn và giun dẹp đường ruột ở mèo.', 'Không nên sử dụng cho mèo đang mang thai.', 'Mỗi viên có chứa:Praziquatel 20mg, Pyrantel pamoate 230 mg', '1 viêngày', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '18 tháng kể từ ngày sản xuất', 'Ở nhiệt độ dưới 25°C', 5, 3, 1),
                                                                                                                                                                                                                                                        (96, 'Viên xổ giun cho chó Prarintel Plus', 14, NULL, 32000, 75, 'Kiểm soát và điều trị chứng nhiễm giun dẹp và giun tròn có trong hệ tiêu hóa của chó lớn và chó con.', 'Không sử dụng ở động vật có độ nhạy đã biết với các thành phần hoạt động hoặc với bất kỳ tá dược nào.', 'Praziquatel', '1 viêngày', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '15 tháng kể từ ngày sản xuất', 'Ở nhiệt độ dưới 25°C', 1, 9, 1),
                                                                                                                                                                                                                                                        (97, 'hỗ trợ chức năng khớp cho chó mèo', 5, NULL, 18000, 90, 'Bổ sung vitamin và khoáng chất cho chó mèo trong giai đoạn phát triển.', 'Không có', 'L-Ascorbic acid monophosphate', '1 viêngày', 'Sử dụng theo hướng dẫn của bác sĩ.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 1, 5, 1),
                                                                                                                                                                                                                                                        (98, 'Viên hỗ trợ chức năng xương cho chó mèo', 5, NULL, 20000, 85, 'nguồn cung cấp canxi và các dưỡng chất thiết yếu cho chó con, chó mang thai và cho con bú.', 'Không có.', 'Dicalcium Phosphate', '1 viêngày', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '18 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thoáng mát', 1, 1, 1),
                                                                                                                                                                                                                                                        (99, 'Viên hỗ trợ chức năng thận cho chó mèo', 9, NULL, 22000, 80, 'I-PETT KIDY chứa chiết xuất Phytochemical, Vitamin, axit amin, khoáng và các vi sinh vật có lợi sử dụng cho chó, mèo giúp ngăn ngừa nhiễm trùng đường tiết niệu.', 'Không có', 'Lactobacillus acidophilus, Arginine HCL', '2 viêngày', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '15 tháng kể từ ngày sản xuất', 'Ở nhiệt độ dưới 30°C , nơi khô ráo, thoáng mát', 6, 2, 1),
                                                                                                                                                                                                                                                        (100, 'Kháng sinh amox dạng uống cho chó mèo', 2, NULL, 25000, 95, 'Điều trị các bệnh nhiễm trùng trên da và mô mềm, nhiễm trùng răng nướu, đường tiết niệu trên chó mèo.', 'Không sử dụng cho thỏ, chuột lang, hamsters, sóc sin-sin hoặc chuột túi.', 'Amoxicillin trihydrate', 'uống 1 ml, ngày 2 lần.', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '24 tháng kể từ ngày sản xuất', 'Ở nhiệt độ dưới 30°C', 6, 3, 1),
                                                                                                                                                                                                                                                        (101, 'Thuốc tiền mê chó mèo Xylinvet', 9, NULL, 20000, 90, 'Thuốc tiền mê cho chó và mèo.', 'Không sử dụng cho động vật đang trong giai đoạn cuối của thai kỳ.', 'Xylazine ', 'Tiêm bắp hoặc tiêm dưới da: 0,125 – 0,25 ml XYLINVET/ 5 kg thể trọng', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '18 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thoáng mát', 6, 4, 1),
                                                                                                                                                                                                                                                        (102, 'Thuốc sổ giun cho chó con', 14, NULL, 22000, 85, ' Phòng bệnh giun tim trên chó bằng cách loại bỏ giai đoạn mô của ấu trùng giun tim (Dirolaria immitis) khoảng 1 tháng (30 ngày) sau khi nhiễm.', 'Sử dụng với sự cẩn trọng trên thú bị suy nhược nghiêm trọng', 'Trong mỗi viên nhai chứa: Ivermectin,Pyrantel/ muối Pamoate', '1 viêngày', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '15 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ khô ráo', 1, 5, 1),
                                                                                                                                                                                                                                                        (103, 'Thuốc xổ giun cho chó lớn', 14, NULL, 35000, 80, 'Phòng bệnh giun tim trên chó bằng cách loại bỏ giai đoạn mô của ấu trùng giun tim (Dirolaria immitis) khoảng 1 tháng (30 ngày) sau khi nhiễm.', 'Sử dụng với sự cẩn trọng trên thú bị suy nhược nghiêm trọng.', 'Trong mỗi viên nhai chứa: Ivermectin,Pyrantel/ muối Pamoate', '1 mũigày', 'An toàn khi sử dụng trên thú mang thai và cho con bú.', '24 tháng kể từ ngày sản xuất', 'Ở nhiệt độ dưới 30°C, nơi khô ráo, thoáng mát', 1, 1, 1),
                                                                                                                                                                                                                                                        (104, 'Thuốc sát trùng Advance APA', 12, NULL, 28000, 80, 'Sát trùng, diệt khuẩn virus, vi trùng, bào tử nấm, Mycoplasma, nấm mốc.', 'Không có', 'Trong 1 lít chứa: Benzalkonium chloride 10%, Glutaraldehyde 15%', 'Phun 1 – 2 lầngày; liên tục 3 – 5 ngày hoặc cho đến khi hết dịch.', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '20 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 6, 1, 1),
                                                                                                                                                                                                                                                        (105, 'Thức ăn cao cấp Kanipro dành cho chó trưởng thành', 6, NULL, 22000, 90, 'Bổ sung vitamin và khoáng chất cho chó.', 'Không có', 'Thức ăn chứa bột cá, gia cầm thịt, ngô gluten, bắp, gạo nát, đậu nành, vitamin E (Tocopherol Acetate), và vitamin C (Axit ascorbic).', '1 kggày', 'Sử dụng liên tục trong giai đoạn nuôi chó.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 1, 3, 1),
                                                                                                                                                                                                                                                        (106, 'Thuốc mỡ Ancomast phòng trị bệnh viêm', 9, NULL, 24000, 85, 'Sử dụng điều trị cục bộ bệnh viêm vú cấp tính trong giai đọan bò tiết sữa', 'Không có.', 'Neomycin sulphate', 'dùng 1 ống (injector) cho 1 bầu vú bị viêm', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '18 tháng kể từ ngày sản xuất', 'Sản phẩm ở dạng nguyên vẹn và tránh ánh sáng (dưới 30°C)', 3, 4, 1),
                                                                                                                                                                                                                                                        (107, 'Chất thay thế sữa Birthright cho thú non', 6, NULL, 26000, 80, 'Là sản phẩm được nghiên cứu dành cho thú con sơ sinh không chứa kháng thể đặc hiệu.', 'Không có', 'Whey sấy khô, sữa tách béo sấy khô, casein, thức ăn đậm đặc protein từ whey sấy khô, huyết tương heo, chất béo động vật.', 'cho ăn lạnh từ 12 giờ sau sinh đến 14 ngày tuổi', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '15 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ khô ráo', 6, 5, 1),
                                                                                                                                                                                                                                                        (108, ' Thuốc đặc trị kiểm soát bệnh cầu trùng trên heo con', 14, NULL, 18000, 90, 'Sử dụng để điều trị và kiểm soát bệnh cầu trùng do Isospora suis gây ra trên heo. Tác dụng nhanh chóng và diệt tất cả các giai đoạn của cầu trùng (Isospora suis).', 'Không ảnh hưởng đến chức năng của hệ miễn dịch trong việc ức chế cầu trùng.', 'Toltrazuril', 'liều 20 mg', 'Sử dụng với 1 liều bơm duy nhất cho heo trong tuần đầu tiên sau khi sinh.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 2, 1, 1),
                                                                                                                                                                                                                                                        (109, 'Thuốc trị bệnh cầu trùng trên gà vịt ngỗng', 14, NULL, 20000, 85, 'Điều trị và kiểm soát bệnh cầu trùng gây ra bởi Eimeia anseris, Eimeria truncata.', 'Không nên sử dụng cho gia cầm đang mang thai.', 'Toltrazuril', '1 lít sản phẩm dùng được 3 500kg thể trọng.', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '18 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thoáng mát', 4, 2, 1),
                                                                                                                                                                                                                                                        (110, 'Sữa tắm dưỡng da cho chó mèo', 1, NULL, 22000, 80, 'Ngăn chặn sự phát triển của ký sinh trùng trong đàn mèo già.', 'Không có', ' Chiết xuất Hemicellulose, nguồn protein đậm đặc, whey sấy khô, dầu olive, nước, sodium saccharide, Xanthan Gum, tinh dầu cây kinh giới', 'Chai 300ml.', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '15 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ khô ráo', 6, 1, 1),
                                                                                                                                                                                                                                                        (111, 'Dầu tắm khô dạng mouse', 1, NULL, 20000, 95, 'Douxo S3 SEB phù hợp dùng cho chó mèo có da nhờn hoặc bong tróc: giảm gàu, bã nhờn dư thừa và mùi khó chịu nhờ hoạt động của Seboliance, đồng thời dưỡng ẩm và bảo vệ hệ sinh thái của da.', 'Không có', 'Seboliance, Ophytrium', 'Bơm 1 hoặc 2 lần lên bàn tay và mát-xa để lớp mouse thấm vào da.', 'Sử dụng ngoài da, dùng trên lớp lông khô và đã chải.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 6, 4, 1),
                                                                                                                                                                                                                                                        (112, 'Kháng sinh phổ rộng Ceftiofur', 9, NULL, 26000, 65, 'Điều trị bệnh trên đường hô hấp có liên quan đến các vi khuẩn Mannheimia haemolytica.', 'Không sử dụng cho ngựa chuyên dùng để nuôi lấy thịt.', 'Trong mỗi chai 4g chứa: Ceftiofur sodium hay Ceftiofur 4 g', '1 ml dung dịch CEFVET/ 50 kg thể trọng, cách 24 giờ, liên tục 3 – 5 ngày.', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '18 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thoáng mát', 6, 5, 1),
                                                                                                                                                                                                                                                        (113, 'Thuốc điều trị bọ chét và ve gây bệnh trên chó', 14, NULL, 32000, 70, 'Điều trị bọ chét và ve gây bệnh trên chó.', 'Không sử dụng cho chó con dưới 2 tháng tuổi', 'Chất Fipronil ', '2ml gày', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '15 tháng kể từ ngày sản xuất', 'Ở nhiệt độ dưới 30°C.', 1, 2, 1),
                                                                                                                                                                                                                                                        (114, 'Thuốc điều trị bọ chét và ve gây bệnh trên mèo', 14, NULL, 32000, 70, 'Điều trị bọ chét và ve gây bệnh trên mèo.', 'Không sử dụng cho mèo con dưới 2 tháng tuổi', 'Chất Fipronil ', '2ml gày', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '15 tháng kể từ ngày sản xuất', 'Ở nhiệt độ dưới 30°C.', 5, 2, 1),
                                                                                                                                                                                                                                                        (115, 'Thuốc nhỏ tai Auriclean làm sạch tai cho chó', 3, NULL, 28000, 80, 'Giải pháp làm sạch tai cho chó và mèo, khử mùi hôi và dị ứng.', 'Không có', 'Deionized water', 'nhỏ 1-3ml vào ống tai', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '20 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 1, 3, 1),
                                                                                                                                                                                                                                                        (116, 'Thuốc bổ sung Crom hữu cơ cho heo', 13, NULL, 45000, 90, 'Giúp heo Cải thiện màu sắc thịt,Tăng tỷ lệ thân thịt,Tăng tỷ lệ thịt thăn...', 'Không có.', 'Chromium (min – max)', 'Trộn thức ăn với liều 1kg/tấn thức ăn', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thấp', 2, 4, 1),
                                                                                                                                                                                                                                                        (117, 'Dịch truyền Advance Normal', 14, NULL, 28000, 80, 'Bù nước và chất điện giải do mất nước, dùng làm thuốc nhỏ mắt, rửa vết thương mắt, niêm mạ mũi, làm dung môi pha vaccine.', 'Không có', 'Trong 100ml chứa: Natri clorid ……………………..0.9 g', '1 viêngày', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '20 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 4, 5, 1),
                                                                                                                                                                                                                                                        (118, 'Vi khoáng tăng năng suất cho gia cầm', 7, NULL, 20000, 95, 'Bổ sung khoáng chất trong thức ăn chăn nuôi.', 'Không có', 'Canxi, Kẽm', '5mlgày', 'Hòa tan vào nước uống với liều cho gia cầm; 1-2ml / lít nước trong vòng 5 ngày.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 4, 1, 1);
INSERT INTO `products` (`id`, `productName`, `category_id`, `sale_percent`, `price`, `quantity`, `purpose`, `contraindications`, `ingredients`, `dosage`, `instructions`, `warrantyPeriod`, `storageCondition`, `type_id`, `supplier_id`, `active`) VALUES
                                                                                                                                                                                                                                                        (119, 'Vaccine vô hoạt phòng bệnh cúm', 8, NULL, 26000, 70, ' Phòng bệnh cúm gia cầm gây bởi vi-rút cúm gia cầm tái tổ hợp subtype H5.', 'Không nên sử dụng cho gia cầm con.', 'Vaccine chứa vi-rút cúm gia cầm tái tổ hợp subtype H5N1, chủng Re-5 vô hoạt, trước khi vô hoạt, hiệu giá HA≥ 8log2', '0,5 ml/con', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '18 tháng kể từ ngày sản xuất', 'Ở nhiệt độ 2-8 °C. Không được để vaccine đóng đá.', 4, 2, 1),
                                                                                                                                                                                                                                                        (120, 'Thuốc trị viêm phổi', 10, NULL, 32000, 75, 'Đặc trị hen khẹc, viêm phổi, e.coli kéo màng, bại huyết, tiêu chảy nặng.', 'Không có', 'Apramycin sulfat, Tá dược vđ', '100g/1,5-2,0 tấnTTgày', 'Hoà nước cho uống hoặc trộn thức ăn, liệu trình 3-5 ngày liên tục.', '15 tháng kể từ ngày sản xuất', 'Nơi khô, nhiệt độ dưới 30 độ C, tránh ánh sáng', 6, 3, 1),
                                                                                                                                                                                                                                                        (121, 'Thuốc đặc trị viêm phổi, tiêu chảy nặng', 10, NULL, 18000, 90, 'Đặc trị bại huyết, E.coli kéo màng, tụ huyết trùng, hen khẹc, viêm phổi, viêm màng phổi.', 'Không có', 'Trong 1kg chứa: Cefalexin monohydrate 600g, Tá dược đặc biệt vđ 400g.', '1g/25 – 30kgTTgày', 'Pha nước uống hoặc trộn thức ăn, liệu trình 3-5 ngày liên tục.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 6, 4, 1),
                                                                                                                                                                                                                                                        (122, 'Thuốc đặc trị hen gà, khẹc vịt', 9, NULL, 20000, 85, 'Đặc trị viêm đường hô hấp, nhiễm khuẩn đường tiêu hoá.', 'Không nên sử dụng cho gia cầm già đang mang thai.', 'Erythromycin 10g, Colistin 25,000,000 IU, Tá dược đặc biệt vđ 100g.', 'Dùng bằng 1/2 liều trị.', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '18 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thoáng mát', 4, 5, 1),
                                                                                                                                                                                                                                                        (123, 'Thuốc đặc trị viêm phổi, chướng diều', 10, NULL, 24000, 85, 'Đặc trị nhiễm trùng đường hô hấp do vi khuẩn nhạy cảm với Sulfadimidine và Oxytetracycline.', 'Không có', 'Trong 1kg chứa: Sulfadimidine 112,5g, Oxytetracycline 60g, Tá dược (Glucose) vđ 827,5g.', 'Dùng bằng 1/2 liều trị.', 'Pha nước uống hoặc trộn thức ăn, liệu trình 3-5 ngày liên tục.', '15 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ khô ráo', 6, 1, 1),
                                                                                                                                                                                                                                                        (124, 'Thuốc viêm khớp trên gà', 10, NULL, 35000, 80, 'Trị bệnh viêm khớp do Mycoplasma synoviae (MS) trên gia cầm.', 'Không dùng với thuốc khác.', 'Trong 1kg chứa: Tylosin tartrate 800g, Tá dược vđ 200g.', '1g/4 lít nước uống hoặc 1kg/2 tấnTĂgày, liên tục 5-10 ngày', 'Pha nước cho uống hoặc trộn thức ăn.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thấp', 4, 2, 1),
                                                                                                                                                                                                                                                        (125, 'Thuốc viêm phổi ghép thương hàn', 10, NULL, 28000, 80, 'Đặc trị nhiễm khuẩn đường hô hấp gây ra bởi các vi khuẩn nhạy cảm với Florfenicol trên gia cầm và heo.', 'Không có', 'Trong 1kg chứa: Florfenicol 40g, Tá dược vđ 960g.', '100g/400kgTTgày hoặc 1g/lít nước.', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '20 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 6, 3, 1),
                                                                                                                                                                                                                                                        (126, 'Thuốc đặc trị viêm hồi tràng', 10, NULL, 28000, 80, 'Linspec Extra chỉ định điều trị các bệnh do vi khuẩn nhạy cảm với Lincomycin và Spectinomycin gây ra.', 'Không có', 'Trong 1kg chứa: Lincomycin HCl 222,2g, Spectinomycin HCl 444,4g, Tá dược vđ 333,4g', '100g/2 tấnTTgày hoặc 1kg/20 tấnTTgày hay 1g/4 lít nước.', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '20 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 4, 10, 1),
                                                                                                                                                                                                                                                        (127, 'Thuốc trị suyễn heo', 9, NULL, 20000, 85, 'Đặc trị bệnh viêm phổi do Mycoplasma gây ho khan, ho kéo dài; viêm phổi dính sườn, phó thương hàn, tụ huyết trùng, bệnh do E.coli: phân trắng, phân vàng.', 'Không có', 'Trong 1kg chứa: Florfenicol 500g, Tá dược vđ 500g.', '10g/1.000kgTTgày.', 'Pha nước uống hoặc trộn thức ăn, liệu trình 3-5 ngày liên tục.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 2, 3, 1),
                                                                                                                                                                                                                                                        (128, 'Thuốc đặc trị viêm ruột gia cầm', 10, NULL, 24000, 85, 'Đặc trị viêm ruột hoại tử do Clostridium SPP., hồng lị, tiêu chảy trên gia cầm.', 'Không nên sử dụng cho gia cầm đang mang thai.', 'Trong 1kg chứa: Bacitracin methylene disalicylate 150g, Tá dược vđ 850g.', '100g/1-1,2 tấnTTgày hoặc gói 100g/200-250 kgTĂ.', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '18 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thoáng mát', 4, 5, 1),
                                                                                                                                                                                                                                                        (129, 'Thuốc đặc trị nấm phổi', 9, NULL, 32000, 75, 'Đặc trị nhiễm trùng do nấm (nấm phổi, nấm phủ tạng, nấm diều, nấm ruột) .', 'Không có', 'Trong 1kg chứa: Neomycin sulfate 100g, Nystatin 75,000,000 IU, Tá dược vđ 899.999.900g.', '100g/200-250kgTTgày hay 1g/2 lít nước uống', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '15 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ khô ráo', 4, 1, 1),
                                                                                                                                                                                                                                                        (130, 'Thuốc viêm ruột tiêu chảy', 10, NULL, 35000, 80, 'Đặc trị nhiễm trùng do vi khuẩn nhạy cảm với Gentamicin và Doxycycline trên gia cầm.', 'Không dùng quá liều.', 'Trong 1kg chứa: Gentamicin sulfate 100g, Doxycycline hyclate 200g, Tá dược đặc biệt vđ 700g.', '10g/150-200kgTTgày', 'Pha nước uống hoặc trộn thức ăn, liệu trình liên tục 3-5 ngày.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thấp', 4, 5, 1),
                                                                                                                                                                                                                                                        (131, 'Thuốc đặc trị E. coli', 10, NULL, 45000, 90, 'Đặc trị các nhiễm khuẩn đường tiêu hoá, hô hấp.', 'Khi bị bệnh thương hàn, tăng liều gấp đôi.', 'Trong 1kg chứa: Enrofloxacin 100g, Tá dược vđ 900g.', '10g/100kgTTgày', 'Pha nước uống, sữa hoặc trộn thức ăn liệu trình 3-5 ngày.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thấp', 6, 5, 1),
                                                                                                                                                                                                                                                        (132, 'Thuốc trị hồng lị trên heo', 10, NULL, 28000, 80, 'Đặc trị bệnh viêm phổi do Mycoplasma gây ho khan, ho kéo dài, viêm phổi dính sườn, lepto, hồng lỵ.', 'Không có', 'Trong 1kg chứa: Doxycycline hyclate 500g; Tá dược đặc biệt vđ 500g.', '1 kg/2tấnTĂgày', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '20 tháng kể từ ngày sản xuất', 'Nơi khô, nhiệt độ dưới 30 độ C, tránh ánh sáng trực tiếp!', 2, 1, 1),
                                                                                                                                                                                                                                                        (133, 'Thuốc đặc trị CRD gia cầm', 10, NULL, 20000, 95, 'Đặc trị nhiễm trùng do các vi khuẩn nhạy cảm với Doxycycline và Tylosin trên gia cầm.', 'Không có', 'Trong 1 kg chứa: Tylosin tartrate 100g, Doxycycline hyclate 200g, Tá dược đặc biệt vđ 700g.', '10g/100kgTTgày', 'Pha nước uống hoặc trộn thức ăn, liệu trình liên tục 3-5 ngày.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 4, 2, 1),
                                                                                                                                                                                                                                                        (134, 'Thuốc đặc trị E.COL', 10, NULL, 26000, 70, 'Đặc trị nhiễm khuẩn đường hô hấp, viêm ruột tiêu chảy do E.coli.', 'Không nên sử dụng cho heo già đang mang thai.', 'Acid Oxolinic 200g; Tá dược đặc biệt (Lactose, Sodium carbonate) vđ 800g.', '100g/1 tấnTTgày hoặc 100g/100-200 lít nước', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '18 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thoáng mát', 4, 3, 1),
                                                                                                                                                                                                                                                        (135, 'Thuốc đặc trị đường hô hấp heo', 10, NULL, 32000, 75, 'Đặc trị các bệnh viêm đường hô hấp, viêm màng phổi (APP).', 'Không có', 'Florfenicol 200g, Doxycycline hyclate 100g, Bromhexine HCl 10g, Vitamin C 20g, Tá dược vđ 670g.', '1g/3 lít nước hoặc 1g/1,5kgTĂ', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '15 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ khô ráo', 2, 4, 1),
                                                                                                                                                                                                                                                        (136, 'Kháng sinh trị bệnh vịt ngan', 9, NULL, 18000, 90, 'Trị viêm ruột, tiêu chảy do E.coli, Salmonella cho ngan vịt', 'Không có', 'Trong 1 kg chứa: Enrofloxacin 50g; Tá dược đặc biệt vđ 950g', '1g/10kgTTgày hay 1g/2 lít nước uống.', 'Pha nước uống hoặc trộn thức ăn, liệu trình 3-5 ngày liên tục.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 4, 3, 1),
                                                                                                                                                                                                                                                        (137, 'Thuốc đặc trị tiêu chảy', 10, NULL, 20000, 85, 'Trị các bệnh nhiễm trùng dạ dày-ruột do vi khuẩn nhạy cảm với Sulfaguanidine.', 'Không nên sử dụng cho vật nuôi đang mang thai.', 'Trong 100g chứa: Sulfaguanidine 18g, Sodium salicylate 15,5g, Tá dược vừa đủ 66,5g.', '1g/2lít nước uống hoặc 1g/10kgTTgày.', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '18 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thoáng mát', 6, 3, 1),
                                                                                                                                                                                                                                                        (138, 'Thuốc đặc trị hen gà', 10, NULL, 24000, 85, 'Đặc trị các trường hợp nhiễm trùng đường tiêu hoá, hô hấp trên gia cầm.', 'Không có', 'Doxycycline hyclate 100g, Tylosin tartrate 50g, Tá dược đặc biệt vđ 850g', '1g/5kgTTgày hoặc 1g/lít nước uống', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '15 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ khô ráo', 4, 5, 1),
                                                                                                                                                                                                                                                        (139, 'Tụ huyết trùng gia cầm', 10, NULL, 35000, 80, 'Bệnh tụ huyết trùng ở gà, vịt, ngan, chim cút, biểu hiện gia cầm chết nhanh, xác chết béo, mào, tích, thân thịt tím tái.', 'Không dùng chung với thuốc khác.', 'Colistin Sulfate 1.200.000.000 IU', 'Tá dược đặc biệt vđ 1kg.', 'Pha nước hoặc trộn thức ăn, liệu trình 3-5 ngày liên tục.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thấp', 4, 5, 1),
                                                                                                                                                                                                                                                        (140, 'Bộ kháng sinh vịt ngan', 9, NULL, 28000, 80, 'Đặc trị nhiễm trùng huyết, ghép tiêu chảy phân xanh, phân trắng.', 'Không có', 'Ceftiofur sodium', 'Tiêm bắp hoặc tiêm dưới da 1ml/3-5kg/TT', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '20 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 4, 5, 1),
                                                                                                                                                                                                                                                        (141, 'Thuốc đặc trị bệnh trên heo', 10, NULL, 22000, 85, 'Đặc trị bệnh trên heo, viêm hồi tràng, suyễn, hồng lỵ.', 'Không tiêm chung với sản phẩm khác', 'Tiamulin hydrogen fumarate', '1ml/5-8kgTT', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 2, 3, 1),
                                                                                                                                                                                                                                                        (142, 'Thuốc chống sổ mũi cho chó con', 9, NULL, 26000, 70, 'Giảm triệu chứng sổ mũi ở chó con.', 'Không nên sử dụng cho chó con đang mang thai.', 'Silver nano, Zinc oxide, Quaternary ammonium, Glycerol, Aqua.', 'nhỏ vào mỗi bên mũi từ 1-2 giọt', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '18 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thoáng mát', 1, 5, 1),
                                                                                                                                                                                                                                                        (143, 'Thuốc phòng trị nhiễm khuẩn hô hấp', 10, NULL, 32000, 75, 'Đặc trị các bệnh nhiễm khuẩn huyết, bại huyết ở vịt, viêm rốn, tụ huyết trùng, viêm ruột do E.coli, bạch lỵ, thương hàn.', 'Không có', 'Trong 1kg chứa: Chlortetracycline HCl 500g, Tá dược vđ 500g.', '1g/12,5kgTT, tương ứng 1g/2,5 lít nước uống hoặc 2g/2.5kgTĂ', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '15 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ khô ráo', 4, 1, 1),
                                                                                                                                                                                                                                                        (144, 'Dung dịch uống', 11, NULL, 45000, 90, 'Tăng cường hệ miễn dịch cho vật nuôi.', 'Dùng kết hợp với kháng sinh giúp mau phục hồi và giảm tỷ lệ chết.', 'Malic acid, Glucosamine, Arginine, Glycine, Vitamin C, B6, B12', '1ml/lít nước uống', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thấp', 6, 1, 1),
                                                                                                                                                                                                                                                        (145, 'Hoocmon kích trứng gia cầm', 11, NULL, 28000, 80, 'Tăng năng suất trứng, kéo dài thời gian cao sản.', 'Không có', 'Oxytetracycline HCl 60.000 mg, Vitamin A 4.000.000 IU, Vitamin D3 700.000 IU', 'Pha 1g/lít nước uống hay 1g/5kgTTgày', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '20 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 4, 3, 1),
                                                                                                                                                                                                                                                        (146, 'Dịch truyền Glucose 5% cho gia súc, gia cầm, chó mèo', 9, NULL, 45000, 90, 'Trị mất nước ở trâu, bò, dê, cừu, heo, ngựa, chó và mèo; điều chỉnh tăng Kali máu, cải thiện thình trạng hạ đường huyết nhẹ.', 'Không có.', 'Glucose Monohydrate', '100mlgày', 'Tiêm chậm vào tĩnh mạch hoặc xoang bụng.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 6, 3, 1),
                                                                                                                                                                                                                                                        (147, 'Thuốc mỡ Drycloxaject phòng trị viêm vú cho gia súc giai đoạn cạn sữa', 9, NULL, 55000, 45, ' Dùng để phòng và trị bệnh viêm vú gây ra bởi các vi trùng Gram + mẫn cảm với Cloxacillin trong giai đoạn cạn sữa.', 'Không có.', 'Glucose Monohydrate', '100mlgày', 'Sau khi vắt hết sữa, lau sạch và sát trùng núm vú tiến hành bơm 1 Injector 9 g thuốc Drycloxa-Ject cho một núm vú có bầu vú bị viêm.Thông thường thì bơm cả bốn phần của bầu vú.', '24 tháng kể từ ngày sản xuất', 'Sản phẩm ở dạng nguyên vẹn và tránh ánh sáng (dưới 30°C)', 3, 1, 1),
                                                                                                                                                                                                                                                        (148, 'Kháng sinh Gentaguard 10% Injection đặc trị bệnh cho gia súc', 9, NULL, 34000, 72, 'Điều trị các bệnh do vi khuẩn mẫn cảm với gentamicin, bao gồm Pseudomonas aeruginosa, Rhodococcus equi và Salmonella spp.', 'Không có.', 'Gentamicin ', '2 mũigày', 'Tiêm bắp và tiêm tĩnh mạch chậm, lặp lại sau 8-12 giờ, tùy vào tình trạng bệnh:', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 3, 1, 1),
                                                                                                                                                                                                                                                        (149, 'Kháng sinh Enroguard 10% Injection gia súc', 9, NULL, 55000, 90, 'Điều trị nhiễm trùng đường hô hấp, nhiễm trùng đường tiêu hóa do vi khuẩn hoặc Mycoplasma nhạy cảm với Enro­oxacin;', 'Không sử dụng cho bê cung cấp thịt', 'Enro­oxacin', '2 mũigày', 'Tiêm cơ ức hoặc dưới da cổ', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 3, 3, 1),
                                                                                                                                                                                                                                                        (150, 'Kháng sinh Enrophar 0.5% Oral trị nhiễm trùng hô hấp, tiêu hóa ở heo', 9, NULL, 45000, 90, 'Đặc trị bệnh tiêu chảy trên heo con và bệnh nhiễm trùng huyết do E. coli mẫn cảm enro­floxacin; Điều trị bệnh nhiễm trùng đường hô hấp do Pasteurella multocida và Mycoplasma spp mẫn cảm với enrofl­oxacin gây ra.', 'Không có.', 'Enrofl­oxacin', '1ml/lần bơm 1 lầngày', 'Bơm trực tiếp vào miệng', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 2, 3, 1),
                                                                                                                                                                                                                                                        (151, 'Fermin Tab bổ sung dinh dưỡng hỗ trợ tạo máu cho chó mèo', 13, NULL, 45000, 90, 'I-PETT FERMIN TAB chứa hỗ hợp vitamin và khoáng chất ở dạng chelate giúp thúc đẩy quá trình sản sinh tế bào máu dùng trong trường hợp: Thú mang thai và đang cho con bú; Thú sau khi phẫu thuật và nhiễm ký sinh trùng máu.', 'Không có.', 'Ferrous amino acid chelate, Copper amino acid chelate,Vitamin B6, Vitamin B12, Vitamin K3, Folic acid.', '1 viêngày', 'Cho uống trực tiếp hoặc nghiền, trộn với thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 1, 1, 1),
                                                                                                                                                                                                                                                        (152, 'Kháng sinh Amoxclamed 500 trị các bệnh nhiễm trùng trên chó', 9, NULL, 64000, 47, 'Dùng để điều trị bệnh nhiễm trùng trên chó, bao gồm: nhiễm trùng da (nhiễm trùng sâu trong da và bên ngoài), nhiễm trùng mô mềm (ví dụ: áp-xe và nhiễm trùng đường sinh dục) nhiễm trùng hệ tiết niệu, hô hấp bao gồm hệ hô hấp trên và hệ hô hấp bên dưới, nhiễm trùng đường tiêu hóa do các vi khuẩn mẫn cảm Amoxicillin kết hợp với axit Clavulanic.', 'Không dùng cho vật nuôi mẫn cảm với Penicillins; Không sử dụng cho vật nuôi bị suy giảm chức năng thận trầm trọng do chứng bí tiểu và tiểu ít gây ra; Không dùng cho thỏ, chuột lang, chuột hamsters, chinchillas hoặc các loài gặm nhắm nhỏ.', 'Glucose Monohydrate', '2 lần/ ngày', 'Chỉ cấp thuốc bằng đường miệng', '24 tháng kể từ ngày sản xuất', 'Ở nhiệt độ dưới 25°C.', 1, 3, 1),
                                                                                                                                                                                                                                                        (153, 'Dầu tắm Modern Pet Dermacare trị viêm nấm da trên chó mèo 100ml – 250ml', 1, NULL, 42000, 23, 'Điều trị và kiểm soát viêm da gây ra do Staphylococcus intermedius và Malassezia pachydermatis', 'Không dùng cho vật nuôi quá mẫn cảm với các thành phần của thuốc.', 'Chlorhexidine gluconate, Miconazole nitrate', '1 – 2 tuần/lần.', 'Làm ướt toàn bộ lông, cho lượng dầu tắm vừa đủ lên lông, xoa đều từ đầu đến chân để tạo bọt, để yên trong 5 – 7 phút cho thuốc thấm, tắm lại với nước sạch vài lần cho đến khi sạch hẳn dầu tắm, sau đó lau và sấy khô lông;', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 6, 3, 1),
                                                                                                                                                                                                                                                        (154, 'Vắc xin tái tổ hợp vô hoạt phòng bệnh cúm gia cầm H5N1 – Chủng Re-6', 8, NULL, 45000, 90, 'Phòng bệnh cúm gia cầm gây bởi vi rút cúm gia cầm tái tổ hợp subtype H5. Đáp ứng miễn dịch 14 ngày sau khi tiêm, thời gian bảo hộ đối với gà là 6 tháng và 04 tháng đối với vịt, ngan và ngỗng sau khi tiêm mũi nhắc lại sau 21 ngày.', 'Không có.', 'Glucose Monohydrate', '100mlgày', 'Tiêm cơ ức hoặc dưới da cổ cho gia cầm và thủy cầm theo khuyến cáo của chương trình vaccine', '24 tháng kể từ ngày sản xuất', 'Ở nhiệt độ 2-8 °C. Không được để vaccine đóng đá.', 6, 2, 1),
                                                                                                                                                                                                                                                        (155, 'Vắc xin nhược độc đông khô phòng bệnh Tai xanh – Chủng JXA1-R', 8, NULL, 45000, 90, 'Tạo miễn dịch chủ động phòng Hội chứng gây rối loạn hô hấp và sinh sản (PRRS) thể độc lực cao trên heo. Hàm lượng kháng thể đạt cao nhất vào khoảng 21 – 28 ngày sau khi tiêm vaccine, thời gian bảo hộ kéo dài 4 – 6 tháng.', 'Không có.', 'Glucose Monohydrate', '100mlgày', 'Hòa tan vaccine với nước pha đi kèm. Tiêm bắp sau hốc tai.', '24 tháng kể từ ngày sản xuất', 'Ở nhiệt độ 2-8°C. Không được để vaccine đóng đá.', 2, 1, 1),
                                                                                                                                                                                                                                                        (156, 'Kháng sinh phổ rộng Advance Amoxclavu S cho chó mèo', 9, NULL, 45000, 90, ' Phòng và trị các bệnh viêm phổi, tiết niệu, tiêu hóa; Trị nhiễm khuẩn da, mô mềm, áp xe, viêm mô tế bào; Hiệu quả đối với nhiễm trùng da lần đầu và viêm da mũ dai dẳng trên chó, mèo.', 'Không có.', 'Amoxicillin trihydrate', '1 ml / 18 -20 kg thể trọng', 'tiêm dưới da.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 6, 3, 1),
                                                                                                                                                                                                                                                        (157, 'Thức ăn cao cấp Felipro vị hải sản dành cho mèo mọi lứa tuổi', 6, NULL, 66000, 90, ' Công thức cân bằng khoáng chất làm giảm nguy cơ gây sỏi mật', 'Không có.', 'Bột cá, gia cầm thịt, ngô Gluten, bắp, Broken Rice, đậu nành Bean, Vitamin E (Tocopherol Acetate) và Vitamin C (Axit ascorbic),…', '2-4 bữa/ ngày', '', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 5, 3, 1),
                                                                                                                                                                                                                                                        (158, 'Kháng sinh Amoxivet 50% Powder trị bệnh hô hấp, tiêu hóa gia cầm, heo', 9, NULL, 45000, 90, ' Điều trị bệnh trên đường hô hấp do vi khuẩn Actinobacillus pleuropneumoniae mẫn cảm với amoxicillin gây ra trên heo;', 'Không sử dụng cho vật nuôi mẫn cảm với penicillin hoặc kháng sinh nhóm ß- lactam; vật nuôi có dấu hiệu suy gan, suy thận; Không sử dụng cho động vật gặm nhấm như thỏ, chuột lang, chuột hamster và chồn, thú ăn cỏ và ngựa..', 'Amoxicillin trihydrate', '1 ml / 18 -20 kg thể trọng', 'Liều pha nước uống.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 4, 3, 1),
                                                                                                                                                                                                                                                        (159, 'Dầu tắm Modern Pet Sunny Gel dành cho chó lông trắng', 1, NULL, 45000, 64, ' Modern Pet Sunny Gel dành cho chó lông trắng, giữ màu lông ko bị ngả vàng, chỉ cần tắm 1 lần là có thể giúp bộ lông cải thiện độ trắng sáng.', 'Không có.', 'Amoxicillin trihydrate', '1 ml / 18 -20 kg thể trọng', 'Làm ướt toàn bộ lông thú yêu, thoa đều sữa tắm Modern Pet Sunny Gel lên da cho đến khi lông thú đầy bọt.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 1, 3, 1),
                                                                                                                                                                                                                                                        (160, 'Kháng sinh Nalistin 10 trị nhiễm trùng đường tiêu hóa do khuẩn E. Coli', 9, NULL, 67000, 35, ' Điều trị các bệnh nhiễm trùng đường tiêu hóa do vi khuẩn Salmonella, E. coli và các vi khuẩn nhạy cảm với Colistin gây ra trên heo và gia cầm.', 'Không sử dụng cho động vật mẫn cảm với thành phần của thuốc.', 'Colistin base', '1g NALISTIN – 10/12,5 kg thể trọnggày', ' Pha nước uống', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 4, 3, 1),
                                                                                                                                                                                                                                                        (161, 'Dầu tắm Modern Pet Lucky Gel cho thú cưng lông nâu và lông đỏ', 1, NULL, 45000, 90, 'Giúp lông mềm mượt và phù hợp với da nhạy cảm của thú cưng.', 'Không có.', 'Amoxicillin trihydrate', '1 ml / 18 -20 kg thể trọng', 'Làm ướt toàn bộ lông thú yêu, thoa đều sữa tắm Modern Pet Lucky Gel lên da cho đến khi lông thú đầy bọt.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 5, 3, 1),
                                                                                                                                                                                                                                                        (162, 'Minical – viên bổ sung Canxi cho thú có tầm nhỏ', 7, NULL, 55000, 90, 'Duy trì khung xương ở thú trưởng thành.', 'Không có.', 'Canxi, Phosphorus, Vitamin A', '2 viên / ngày', '', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 1, 2, 1),
                                                                                                                                                                                                                                                        (163, 'Dầu tắm Modern Pet Sweetie Gel khử mùi và tạo kiểu', 1, NULL, 45000, 34, 'Giúp lông mịn, bông, dễ dàng tạo kiểu cho thú cưng của bạn.', 'Không có.', 'Vitamin B6, Glycerin, D- Pantothenol, Acid Citric', '', 'Làm ướt toàn bộ lông thú yêu, thoa đều sữa tắm Modern Pet Sweetie Gel lên da cho đến khi lông thú đầy bọt.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 1, 1, 1),
                                                                                                                                                                                                                                                        (164, 'Kháng sinh Marbovet 80 trị nhiễm trùng da và mô mềm trên chó', 9, NULL, 55000, 66, ' Điều trị chứng nhiễm trùng da và mô mềm (viêm da có mủ, chốc lở, viêm nang lông, viêm da, viêm mô tế bào), nhiễm trùng đường tiết niệu và hô hấp do các vi khuẩn mẫn cảm với Marbofloxacin gây ra trên chó.', 'Không có.', 'Marbofloxacin', '2 mg/kg', '2 mg/kg thể trọng bằng đường miệng', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 1, 3, 1),
                                                                                                                                                                                                                                                        (165, 'KC-Pol bổ sung hỗn hợp vitamin, khoáng và axit amin', 7, NULL, 45000, 90, ' Kích thích tăng trọng và tăng sản xuất trứng', 'Không có.', 'Amoxicillin trihydrate', '5-10kg/tấn', '', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 6, 3, 1),
                                                                                                                                                                                                                                                        (166, 'Actifarm cải thiện khả năng tiêu hóa và hấp thụ dinh dưỡng ở gia cầm', 7, NULL, 45000, 53, ' Cải thiện tiêu chuẩn và hấp thụ chất dinh dưỡng trong hệ thống tiêu hóa.', 'Không có.', 'Bacillus subtilis', '', '', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 4, 3, 1),
                                                                                                                                                                                                                                                        (167, 'Hairry – viên bổ sung giúp chó tầm vóc lớn lông, da khỏe đẹp', 5, NULL, 45000, 90, ' Duy trì chức năng của các hệ thống trong cơ thể. Duy trì sức khỏe làn da và bộ lông thú.', 'Không có.', 'Sắt, Vitamin A, Vitamin D3, Vitamin E', '1 viên / 10 kg thể trọng mỗi ngày', '', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 1, 4, 1),
                                                                                                                                                                                                                                                        (168, 'Dầu tắm Roy làm mềm dịu lông, hạn chế rụng lông chó mèo', 1, NULL, 45000, 90, 'Với chiết xuất từ Aloe Vera, chăm sóc dịu nhẹ cho làn da thú cưng, giữ ẩm, làm mượt da lông, giúp lông mềm mượt, dễ chải, hạn chế rụng lông', 'Không có.', 'Amoxicillin trihydrate', '1 ml / 18 -20 kg thể trọng', 'Làm ướt toàn bộ lông thú yêu, thoa đều sữa tắm Roy lên da cho đến khi lông thú đầy bọt.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 6, 6, 1),
                                                                                                                                                                                                                                                        (169, 'Pate dành cho chó Hi-Diet Dog Food ', 6, NULL, 45000, 90, 'Tăng khả năng hồi phục sức khỏe khi: có vấn đề về các bệnh mãn tính, các vấn đề da, hậu phẫu…', 'Không có.', 'Thịt gà, cá, thịt cừu, gan bò, nước, Bột năng, Glycine, Chất kết dính, dầu hoa hướng dương, chất tạo mùi, vách tế bào nấm men', '1 ml / 18 -20 kg thể trọng', 'tiêm dưới da.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 1, 3, 1),
                                                                                                                                                                                                                                                        (170, 'Pate dành cho mèo Hi-Diet Cat Food ', 6, NULL, 45000, 90, 'Tăng khả năng hồi phục sức khỏe khi : có vấn đề về các bệnh mãn tính, các vấn đề da, hậu phẫu…', 'Không có.', 'Thịt gà, cá mòi, mỡ gà, chất tạo mùi, cá, Vitamin & khoáng chất, chất kết dính, chất ly trích từ nấm men, bột mỳ, bột gạo, Fructo Oligosaccharide, Taurine, Folic acid, nước.', 'Trọng lượng 2.1 – 5 (kg), 3.5 hộpgày.', '', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 5, 7, 1),
                                                                                                                                                                                                                                                        (171, 'Doxicure-50 – kháng sinh Doxycycline dạng bột pha nước', 9, NULL, 45000, 90, 'Thuốc được chỉ định để điều trị bệnh nhiễm trùng đường hô hấp trên gia cầm , gây ra bởi vi khuẩn nhạy cảm với Doxycycline, bao gồm Chlamydias spp . và Mycoplasma spp .', ' Không sử dụng cho gà trong giai đoạn đẻ trứng', 'Doxycycline hyclate', '1 ml / 18 -20 kg thể trọng', 'tiêm dưới da.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 4, 6, 1),
                                                                                                                                                                                                                                                        (172, 'Kháng sinh Lincospecvet trị nhiễm trùng hô hấp,…gia súc, chó mèo', 9, NULL, 45000, 90, 'Điều trị các bệnh nhiễm trùng đường hô hấp, đường ruột, đường tiết niệu  nhiễm trùng da và viêm khớp do các vi khuẩn gây ra bao gồm: Actinobacillus spp., Pasteurella spp., E.coli, Salmonella, Clostridium spp., Staphylococcus spp., Mycoplasma spp,… trên chó, mèo, heo, gia súc.', 'Không có.', 'Spectinomycin ', '1ml/5 kg', 'Tiêm bắp với liều 1ml/5 kg, lặp lại sau 12-24 giờ trong 3-7 ngày..', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 6, 3, 1),
                                                                                                                                                                                                                                                        (173, 'Kháng sinh Tilmiguard Solution trị nhiễm khuẩn đường hô hấp gia cầm', 9, NULL, 45000, 90, 'Hiệu quả cao trong điều trị chứng nhiễm trùng đường hô hấp trên gia cầm do M.gallisepticum và M.synoviae.', 'Không sử dụng cho gà đẻ thương phẩm..', 'Amoxicillin trihydrate', '1 ml / 18 -20 kg thể trọng', 'Pha vào nước cho uống với liều 10-25 mg / kg thể trọng (tương đương 10 – 25 tấn thể trọng), từ 3-5 ngày liên tục. Thuốc sau khi pha xong chỉ nên sử dụng trong vòng 24 giờ.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 4, 5, 1),
                                                                                                                                                                                                                                                        (174, 'Kháng viêm Keprofen 10 cho gia súc, heo, chó, mèo', 10, NULL, 45000, 90, 'Điều trị các chứng bệnh có triệu chứng viêm, sưng hoặc sốt có liên quan đến hệ hô hấp, viêm vú, cơ và xương khớp (như viêm cơ, xương khớp) và các chấn thương', 'Không dùng chung với thuốc nhóm non-steroid trước và sau khi cấp thuốc 24 giờ..', 'Ketoprofen ', '3 mg ketoprofen/kg thể trọng/ ngày hay 1 ml KEPROFEN 10%/ 30 kg thể trọng, sử dụng 3 ngày liên tiếp.', 'Tiêm sâu trong cơ hoặc tiêm tĩnh mạch.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 3, 3, 1),
                                                                                                                                                                                                                                                        (175, 'Thuốc trị nấm da Ketoconazole dạng viên trên chó', 15, NULL, 45000, 90, 'Điều trị các bệnh truyền nhiễm trên da gây ra bởi Malassezia và dermatophytes trên chó.', 'Không dùng cho thú có khả năng dị ứng (shock)..', 'Ketoconazole', '10mg ketoconazole cho mỗi kg thể trọng', 'Cấp qua đường miệng', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 1, 5, 1),
                                                                                                                                                                                                                                                        (176, 'Vaccine Newcastle Bronchitis', 8, NULL, 45000, 90, ' Vaccine giúp phòng bệnh Newcastle và viêm phế quản truyền nhiễm trên gà.', 'Chỉ chủng cho gà khoẻ mạnh..', 'Amoxicillin trihydrate', '1 ml / 18 -20 kg thể trọng', 'tiêm dưới da.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 4, 5, 1),
                                                                                                                                                                                                                                                        (177, 'Vaccine nhược độc đa giá Scocvac 4 phòng bệnh cầu trùng ở gà', 8, NULL, 45000, 90, ' Vaccine dùng phòng bệnh cầu trùng cho gà lông màu trên 45 ngày tuổi, gà ta thả vườn, gà hậu bị và gà giống. Sau khi chủng ngừa vaccine 21 ngày, gà sẽ có miễn dịch bảo hộ đầy đủ với bệnh cầu trùng. Miễn dịch bảo hộ kéo dài suốt đời.', 'Không có.', 'E. tenella (chủng PTMZ), E. maxima (chủng PMHY) và E. acervulina (chủng PAHY), E. necatrix (chủng PNHZ).', 'pha vaccine trong 6 lít nước / 1000 gà', 'Chủng ngừa bằng đường uống', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 4, 3, 1),
                                                                                                                                                                                                                                                        (178, 'Vaccine nhược độc tam giá Scocvac 3 phòng bệnh cầu trùng ở gà', 8, NULL, 75000, 90, 'Vaccine dùng phòng bệnh cầu trùng cho gà thịt dưới 45 ngày. Sau khi chủng ngừa vaccine 14 ngày, gà đã có miễn dịch bảo hộ với bệnh cầu trùng. Miễn dịch bảo hộ kéo dài đến khi xuất chuồng', 'Không có.', 'E. tenella (chủng PTMZ)', 'pha vaccine trong 6 lít nước / 1000 gà', 'Chủng ngừa bằng đường uống', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 4, 4, 1),
                                                                                                                                                                                                                                                        (179, 'XO Save giúp cải thiện hô hấp và lưu thông khí cho gia cầm', 9, NULL, 45000, 90, 'Sản phẩm này làm tăng năng suất vật nuôi và tăng miễn dịch cụ thể là phòng bệnh hô hấp trên gia cầm', 'Không có.', 'Amoxicillin trihydrate', 'Sử dụng cho vật nuôi bằng cách pha 1-2ml/1 lít nước uống.', 'Sử dụng cho vật nuôi bằng cách pha 1-2ml/1 lít nước uống.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 4, 3, 1),
                                                                                                                                                                                                                                                        (180, 'Kháng sinh Amoxiguard 15% Injection LA gia súc, chó mèo', 9, NULL, 45000, 90, 'Điều trị các bệnh trên đường tiêu hóa, hô hấp, các bệnh trên da, mô mềm, ngăn ngừa nhiễm trùng hậu phẫu (sử dụng trước khi phẫu thuật) do các vi khuẩn như E. coli, Proteus mirablis, Salmonella spp., Staphylococci (không tự tạo pencillin), Streptococci (không tự tạo pencillin), và Klebsiella pneumonia', 'Không cấp thuốc bằng đường tiêm tĩnh mạch, tiêm não tủy.', 'Amoxicillin trihydrate', ' 15 mg/kg thể trọng', 'tiêm dưới da.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 6, 3, 1),
                                                                                                                                                                                                                                                        (181, 'Kháng sinh Amoxivet trị nhiễm trùng gia súc, chó mèo', 9, NULL, 87000, 90, '  Điều trị các bệnh nhiễm trùng trên trâu, bò, heo, cừu, chó và mèo, nguyên nhân gây ra bởi các vi khuẩn gram âm và gram dương nhạy cảm với amoxicilin như: Actinobacillusequuli, Actinomyces bovis, Actinobacillus lignieresi, Bacillusanthracis, Bordetella bronchisep tica, Clostridium spp., Corynebacterium spp., Erysipelothrix rhusi opathiae, Escherichia coli, Fusiformisspp., Haemophilus spp. Morax ella spp., Pasteurella spp., Proteusmirabilis, Salmonella spp., Staphylococci.', 'Không có.', 'Amoxicillin ', '1ml/ 25kg thể trọng; 1 lần/ ngày; 5 ngày', 'tiêm dưới da.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 6, 3, 1),
                                                                                                                                                                                                                                                        (182, 'Kháng sinh Ampi 200 điều trị bệnh viêm ruột', 9, NULL, 50000, 90, ' Phòng và trị các bệnh viêm phổi, tiết niệu, tiêu hóa; Trị nhiễm khuẩn da, mô mềm, áp xe, viêm mô tế bào; Hiệu quả đối với nhiễm trùng da lần đầu và viêm da mũ dai dẳng trên chó, mèo.', 'Không sử dụng cho vật nuôi đang sản xuất sữa thương phẩm.', 'Ampicillin ', '1 ml / 18 -20 kg thể trọng', 'tiêm dưới da.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 3, 1, 1),
                                                                                                                                                                                                                                                        (183, 'Vắc xin Cúm Gia Cầm H5N1 – chủng Re-1', 8, NULL, 55000, 90, 'Vắc xin sử dụng để phòng bệnh Cúm gia cầm H5N1 chủng Re-1.', 'Không có.', 'Amoxicillin trihydrate', 'Vaccine chứa vi-rút cúm gia cầm tái tổ hợp H5N1 chủng Re-1 vô hoạt. Trước khi vô hoạt, hiệu giá HA của dịch niệu nang ≥ 8log2.', 'tiêm dưới da.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 4, 3, 1),
                                                                                                                                                                                                                                                        (184, 'Sữa tắm đặt trị ve rận Modern Pet Gel dành cho chó', 1, NULL, 45000, 90, 'Kiểm soát bọ chét, chấy, rận và ve trên chó và chó con trên 12 tuần tuổi.', 'Không có.', 'Permethrin ', '1 ml / 18 -20 kg thể trọng', 'Sử dụng tốt cho những chó giống lớn cả lông ngắn và lông dài.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 1, 7, 1),
                                                                                                                                                                                                                                                        (185, 'Petty gel hỗ trợ chức năng gan cho chó mèo', 9, NULL, 45000, 90, 'Hỗ trợ trong thời kỳ phẫu thuật hoặc theo khuyến cáo của bác sỹ thú y.', 'Không có.', 'Vitamin A, Vitamin D3, Vitamin E, Vitamin B1, Vitamin B2, Vitamin B5, Vitamin B6, Vitamin B12, Folic Acid, Ascorbic acid, Taurine, Methionine, Lecithin, Triglyceride, Glucose syrup, Glycerine.', '2 thìa cà phê, ngày 2 lần.', 'Cung cấp qua đường miệng.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 6, 3, 1),
                                                                                                                                                                                                                                                        (186, 'THUỐC THÚ Y – VIAQUINO 25', 9, NULL, 66000, 90, 'ĐẶC TRỊ PHÂN NHỚT VÀNG, PHÓ THƯƠNG HÀN GHÉP CẦU TRÙNG HEO.', 'Không có.', 'Enrofloxacin', '1,5ml/5kg TT/ lần, ngày 1-2 lần, dùng 3-5 ngày. Một lần bơm tương ứng 1,5ml.', 'Cho uống trực tiếp hay pha vào nước hoặc sữa cho uống.', '24 tháng kể từ ngày sản xuất', 'Nơi khô, nhiệt độ dưới 30 độ C, tránh ánh sáng!', 2, 3, 1),
                                                                                                                                                                                                                                                        (187, 'THUỐC THÚ Y – VIAQUINO 100', 10, NULL, 45000, 90, 'Đặc trị nhiễm trùng do vi khuẩn nhạy cảm với Enrofloxacin trên gia cầm như: bệnh viêm đường hô hấp mãn tính trên ra cầm gây hen nặng (CRD), hen ghép E.coli kết hợp (CCRD), với các biểu hiện: gia cầm khó thở, thở khò khè, khẹc, vảy mỏ, sưng đầu, sưng mặt, kèm theo tiêu chảy phân xanh, phân trắng, phân nhiều nước. Các bệnh thương hàn, bạch lỵ, Coryza trên gia cầm.', 'Không có.', 'Curcumin ', '10mg Enrofloxacin/kgTTgày hay 1ml/10kgTTgày hoặc 1ml/2lit nước.', 'Pha nước uống hoặc trộn thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 4, 2, 1),
                                                                                                                                                                                                                                                        (188, 'THUỐC THÚ Y DAMONG SPRAY ', 14, NULL, 45000, 90, 'ĐẶC TRỊ NHIỄM TRÙNG DA, CHÂN, MÓNG, VẾT THƯƠNG HỞ ĐẶC TRỊ NHIỄM TRÙNG DA', 'Không có.', 'Thiamphenicol', 'Phun dung dịch trên bề mặt vết thương 1 lần mỗi ngày/trong 3 ngày liên tiếp.', '', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 6, 3, 1),
                                                                                                                                                                                                                                                        (189, 'THUỐC THÚ Y DAMONG SPRAY', 15, NULL, 45000, 90, 'ĐẶC TRỊ NẤM DA, MÓNG TRÊN BÒ, DÊ, CỪU, THỎ', 'Không có.', 'Tiabendazole, Thiamphenicol, Curcumin ', 'Phun 1 lầngày', 'Phun đều lên vùng da bị nấm, theo hướng từ bên ngoài đến vùng bị bệnh cho thuốc thấm đều.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 6, 3, 1),
                                                                                                                                                                                                                                                        (190, 'THUỐC THÚ Y VIA-CMT', 10, NULL, 78000, 90, 'Dùng kiểm tra và phát hiện sớm hiện tượng viêm vú trên bò sữa. Kết quả có ngay sau 4-5 giây tiết kiệm thời gian lấy mẫu, sau khi thử và chính xác đến 100%.', 'Không có.', 'Fe-Dextran', '5ml sữa 2ml dụng dịch VA – CMT', 'Vệ sinh núm vú bò sạch sẽ, lấy mỗi núm vú bò 5ml sữa vào ngăn đĩa để thử. Nhỏ vào mỗi ngăn đĩa 2ml dụng dịch VA – CMT.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 3, 3, 1),
                                                                                                                                                                                                                                                        (191, 'THUỐC THÚ Y VIA FER+B12', 11, NULL, 76000, 90, 'SẮT CAO CẤP, TRỊ THIẾU MÁU, PHÒNG TIÊU CHẢY', 'Không có.', 'Vitamin ', '1-2ml/con', 'Tiêm bắp sâu, 1 liều duy nhất đủ bổ sung hàm lượng sắt cho cơ thể..', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 4, 7, 1),
                                                                                                                                                                                                                                                        (192, 'THUỐC THÚ Y – ACHYMOSIN', 9, NULL, 45000, 90, 'TAN ĐỜM, GIẢM DỊCH NHẦY, TIÊU VIÊM, CHỐNG PHÙ NỀ, TIÊU SỢI HUYẾT, PHÁ HUỶ CASEIN VÀ FIBRIN.', 'Không có.', 'Atropin Sulfat', '1ml/2-3 lít nước tương đương 10-15kgTT', 'Hòa nước cho uống theo liều.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 3, 6, 1),
                                                                                                                                                                                                                                                        (193, 'THUỐC THÚ Y – ATROPIN MAX', 9, NULL, 45000, 90, 'Hỗ trợ trong thời kỳ phẫu thuật hoặc theo khuyến cáo của bác sỹ thú y.', 'Không có.', 'Atropin Sulfat', '3 – 5 ml/con', 'Tiêm dưới da', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 6, 6, 1),
                                                                                                                                                                                                                                                        (194, 'THUỐC THÚ Y – AMPHERAMIN', 9, NULL, 46000, 90, 'ĐẶC TRỊ DỊ ỨNG, NỔI MẨN ĐỎ, PHÁT BAN, SỐT SỮA AN THẦN – CHỐNG SỐC, CO GIẬT, STRESS', 'Không có.', 'Chlorpheniramin maleat', '1ml/35-40kgTT', 'Tiêm bắp hoặc tiêm tĩnh mạch.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 6, 8, 1),
                                                                                                                                                                                                                                                        (195, 'THUỐC THÚ Y AZ.KETOPRO', 10, NULL, 45000, 90, 'KHÁNG VIÊM, GIẢM ĐAU, HẠ SỐT NHANH, MẠNH, KHÔNG LÀM MẤT SỮA.', 'Không có.', 'Ketoprofen', '1 ml/33kg TT, ngày 1 lần, trong 1 – 3 ngày.', 'Tiêm sâu bắp thịt hoặc tiêm tĩnh mạch..', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 6, 8, 1),
                                                                                                                                                                                                                                                        (196, 'THUỐC THÚ Y – BROMREPSI', 9, NULL, 87000, 90, 'THÔNG THỞ, TIÊU DỊCH NHẦY – HẠ SỐT, CHỐNG VIÊM, PHỤC HỒI CHỨC NĂNG PHỔI', 'Không có.', 'Bromhexine HCl', '2ml/1 lít nước', 'Hòa nước cho uống .', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 4, 9, 1),
                                                                                                                                                                                                                                                        (197, 'THUỐC THÚ Y – CARNITOSAL', 9, NULL, 45000, 90, 'TĂNG LỰC CẤP TỐC, TĂNG SỮA – TẠO NẠC, KÍCH THÍCH TĂNG TRỌNG', 'Không có.', 'Butafosfan, Vitamin PP', '1ml/10 – 15kgTT.', 'Tiêm dưới da, tiêm bắp', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 6, 9, 1),
                                                                                                                                                                                                                                                        (198, 'THUỐC THÚ Y – CARNITOSAL BÒ SỮA', 7, NULL, 45000, 90, 'KÍCH THÍCH TRAO ĐỔI CHẤT, TĂNG KHÔ – BÉO, SẢN LƯỢNG SỮA, NGỪA BIẾN CHỨNG SAU SINH', 'Không có.', 'Vitamin B9', '20ml/congày.', 'Tiêm dưới da, tiêm bắp hay tiêm tĩnh mạch.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 3, 3, 1),
                                                                                                                                                                                                                                                        (199, 'THUỐC THÚ Y DEXASON', 10, NULL, 45000, 90, 'KHÁNG VIÊM, GIẢM ĐAU, CHỐNG DỊ ỨNG', 'Không có.', 'Dexamethasone (phosphat dinatri)', '5 – 10ml/400kgTT.', 'Tiêm bắp, tĩnh mạch, dưới da, trong bao khớp.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 6, 3, 1),
                                                                                                                                                                                                                                                        (200, 'THUỐC THÚ Y AZ GLUCO KC BAMIN', 9, NULL, 45000, 90, 'Hỗ trợ trong thời kỳ phẫu thuật hoặc theo khuyến cáo của bác sỹ thú y.', 'Không có.', 'Calcium glucono glucoheptonate', '1ml/20kgTTgày.', 'Tiêm bắp thịt, liệu trình 3-5 ngày liên tục..', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 6, 3, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_categories`
--

CREATE TABLE `product_categories` (
                                      `id` int(11) NOT NULL,
                                      `categoryName` varchar(255) NOT NULL,
                                      `group_id` int(11) NOT NULL,
                                      `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product_categories`
--

INSERT INTO `product_categories` (`id`, `categoryName`, `group_id`, `active`) VALUES
                                                                                  (1, 'Dầu tắm thú cưng', 1, 1),
                                                                                  (2, 'Phụ kiện làm đẹp', 1, 1),
                                                                                  (3, 'Vệ sinh sát trùng', 1, 1),
                                                                                  (4, 'Phụ gia thức ăn', 2, 1),
                                                                                  (5, 'Hỗ trợ chức năng', 2, 1),
                                                                                  (6, 'Thức ăn thú cưng', 2, 1),
                                                                                  (7, 'Thức ăn bổ sung', 2, 1),
                                                                                  (8, 'Vắc xin', 3, 1),
                                                                                  (9, 'Kháng sinh', 3, 1),
                                                                                  (10, 'Kháng viêm', 3, 1),
                                                                                  (11, 'Hoocmon', 3, 1),
                                                                                  (12, 'Sát trùng', 3, 1),
                                                                                  (13, 'Vitamins và khoáng', 1, 1),
                                                                                  (14, 'Thuốc trị nội ngoại ký sinh', 1, 1),
                                                                                  (15, 'Thuốc điều trị nấm', 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_groups`
--

CREATE TABLE `product_groups` (
                                  `id` int(11) NOT NULL,
                                  `groupName` varchar(255) NOT NULL,
                                  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product_groups`
--

INSERT INTO `product_groups` (`id`, `groupName`, `active`) VALUES
                                                               (1, 'Chăm sóc thú cưng', 1),
                                                               (2, 'Thức ăn chăn nuôi', 1),
                                                               (3, 'Thuốc thú y', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_types`
--

CREATE TABLE `product_types` (
                                 `id` int(11) NOT NULL,
                                 `type_name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product_types`
--

INSERT INTO `product_types` (`id`, `type_name`) VALUES
                                                    (1, 'Chó'),
                                                    (2, 'Heo'),
                                                    (3, 'Gia súc'),
                                                    (4, 'Gia cầm'),
                                                    (5, 'Mèo'),
                                                    (6, 'Khác');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role`
--

CREATE TABLE `role` (
                        `id` int(11) NOT NULL,
                        `role_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `role`
--

INSERT INTO `role` (`id`, `role_name`) VALUES
                                           (0, 'admin'),
                                           (1, 'user'),
                                           (2, 'staff'),
                                           (3, 'Mod'),
                                           (4, 'Thuan dep trai');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shipping_info`
--

CREATE TABLE `shipping_info` (
                                 `id` int(11) NOT NULL,
                                 `name` varchar(255) DEFAULT NULL,
                                 `phone` varchar(50) NOT NULL,
                                 `pricePerKg` int(11) NOT NULL,
                                 `pricePerSize` int(11) NOT NULL,
                                 `pricePerKm` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `shipping_info`
--

INSERT INTO `shipping_info` (`id`, `name`, `phone`, `pricePerKg`, `pricePerSize`, `pricePerKm`) VALUES
                                                                                                    (1, 'Giao hàng nhanh', '0972087207', 17, 3, 7),
                                                                                                    (2, 'Giao hàng tiết kiệm', '0384774118', 16, 3, 5),
                                                                                                    (3, 'Lalamove', '0369274066', 18, 3, 6);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shipping_type`
--

CREATE TABLE `shipping_type` (
                                 `id` int(11) NOT NULL,
                                 `type_name` varchar(25) NOT NULL,
                                 `description` varchar(255) DEFAULT NULL,
                                 `info_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `shipping_type`
--

INSERT INTO `shipping_type` (`id`, `type_name`, `description`, `info_id`) VALUES
                                                                              (1, 'Nhanh', 'Giao hàng từ 2-4 ngày', 1),
                                                                              (2, 'Tiết kiệm', 'Giao hàng từ 7-10 ngày', 2),
                                                                              (3, 'Hoả tốc', 'Giao hàng trong vòng 24h', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `social_media`
--

CREATE TABLE `social_media` (
                                `id` int(11) NOT NULL,
                                `facebook` text DEFAULT NULL,
                                `instagram` text DEFAULT NULL,
                                `twitter` text DEFAULT NULL,
                                `pinterest` text DEFAULT NULL,
                                `youtube` text DEFAULT NULL,
                                `linkedin` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `suppliers`
--

CREATE TABLE `suppliers` (
                             `id` int(11) NOT NULL,
                             `supplierName` varchar(255) NOT NULL,
                             `contactName` varchar(50) DEFAULT NULL,
                             `email` varchar(50) NOT NULL,
                             `phone` varchar(25) DEFAULT NULL,
                             `detail_address` varchar(255) DEFAULT NULL,
                             `imageUrl` varchar(255) DEFAULT NULL,
                             `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `suppliers`
--

INSERT INTO `suppliers` (`id`, `supplierName`, `contactName`, `email`, `phone`, `detail_address`, `imageUrl`, `active`) VALUES
                                                                                                                            (1, 'Công ty TNHH Công nghệ nano hợp nhất APA', 'apanano', 'support@apanano.com', '0286 292 1224', 'Sài Gòn', 'https://apanano.com/wp-content/uploads/APA-Cover@2x.png', 0),
                                                                                                                            (2, 'Công ty cổ phần thuốc thú y Trung Ương 5', 'Linh', 'info@fivevet.vn', '024 6653 9878', 'Hà Nội', 'https://fivevet.vn/system/cms/themes/default/images/logo.png', 0),
                                                                                                                            (3, 'Công ty TNHH Tigervet Việt Nam', 'marphavetcom', 'info@marphavet.com', '0979 899 172', 'Thái Nguyên', 'https://cdn.nhanlucnganhluat.vn/uploads/images/837E314E/logo/2019-10/Logo_Tigervet.jpg', 0),
                                                                                                                            (4, 'Công ty TNHH thuốc thú y Gấu Vàng', 'gauvang', 'info@gauvang.com.vn', '0901 868 678', 'Long An', 'https://bizweb.dktcdn.net/100/367/359/themes/738633/assets/footer_logo.png?1679275348083', 0),
                                                                                                                            (5, 'Công ty Liên doanh Bio', 'Việt Nam', 'bio@biopharmachemie.com', '028 3731 3489', 'TPHCM', 'https://cdn1.vieclam24h.vn/images/employer_avatar/2023/09/12/z4686265529605_c4f36c015f6ba57d17961c4a482817b0_169450203397.jpg', 0),
                                                                                                                            (6, 'Công ty sản xuất thuốc thú y Việt Anh', 'hitech', 'info@hitech.com.vn', '0368 987 654', 'Đà Nẵng', 'https://vietanhviavet.com/wp-content/uploads/2022/11/log_637717089243518829.png', 0),
                                                                                                                            (7, 'Công ty thuốc thú y Safa', 'safa', 'contact@pharmaplus.com', '0912 345 678', 'Hồ Chí Minh', 'https://phongsachquocphuong.com/thumbs/537x317x2/upload/news/lofo-safa-8359.jpg', 0),
                                                                                                                            (8, 'Công ty thuốc thú y Marphavet', 'greenlife', 'info@greenlife.com', '024 6688 1122', 'Hà Nội', 'https://i0.wp.com/hoanto.com/wp-content/uploads/2020/02/MPV.png?fit=224%2C225&ssl=1', 0),
                                                                                                                            (9, 'Công ty CP thuốc thú y Trung Ương Vinavietco', 'pharmacare', 'info@pharmacare.vn', '0905 123 456', 'Quảng Ninh', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-XJdo4UqCCI8FBkOdf6EFhBa0OgxKbWppgY8tO_i1ipFk5Dh2buGH8YQQpgGc5YLTJS8&usqp=CAU', 0),
                                                                                                                            (10, 'Công ty Greengroup', 'bellecosmetics', 'info@belle.com.vn', '028 3969 7890', 'Bình Dương', 'https://greengroup.com.vn/wp-content/uploads/2023/12/GG-04-e1701675746943.png', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
                         `id` int(11) NOT NULL,
                         `username` varchar(25) DEFAULT NULL,
                         `email` varchar(25) NOT NULL,
                         `password` varchar(25) DEFAULT NULL,
                         `fullName` varchar(25) DEFAULT NULL,
                         `dateOfBirth` date DEFAULT NULL,
                         `city` varchar(25) DEFAULT NULL,
                         `district` varchar(25) DEFAULT NULL,
                         `ward` varchar(25) DEFAULT NULL,
                         `detail_address` varchar(255) DEFAULT NULL,
                         `phone` varchar(10) DEFAULT NULL,
                         `avatar` varchar(255) DEFAULT NULL,
                         `verified` tinyint(4) NOT NULL DEFAULT 0,
                         `role_id` int(11) NOT NULL DEFAULT 1,
                         `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `fullName`, `dateOfBirth`, `city`, `district`, `ward`, `detail_address`, `phone`, `avatar`, `verified`, `role_id`, `date_created`) VALUES
    (19, 'abc', 'thuandangnam@gmail.com', '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, '2024-05-07 20:48:41');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wishlists`
--

CREATE TABLE `wishlists` (
                             `user_id` int(11) NOT NULL,
                             `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `address`
--
ALTER TABLE `address`
    ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
    ADD PRIMARY KEY (`id`,`product_id`),
  ADD KEY `FK_cart_products` (`product_id`),
  ADD KEY `FK_cart_users` (`id`);

--
-- Chỉ mục cho bảng `delivery_address`
--
ALTER TABLE `delivery_address`
    ADD PRIMARY KEY (`id`),
  ADD KEY `FK_delivery_address_users` (`user_id`);

--
-- Chỉ mục cho bảng `discounts`
--
ALTER TABLE `discounts`
    ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Chỉ mục cho bảng `feedbacks`
--
ALTER TABLE `feedbacks`
    ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `images`
--
ALTER TABLE `images`
    ADD PRIMARY KEY (`id`),
  ADD KEY `fk_images_product` (`product_id`);

--
-- Chỉ mục cho bảng `inventory`
--
ALTER TABLE `inventory`
    ADD PRIMARY KEY (`user_id`,`discount_id`),
  ADD KEY `fk_inventory_discount` (`discount_id`),
  ADD KEY `fk_inventory_user` (`user_id`) USING BTREE;

--
-- Chỉ mục cho bảng `level`
--
ALTER TABLE `level`
    ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `log`
--
ALTER TABLE `log`
    ADD PRIMARY KEY (`id`),
  ADD KEY `FK_log_level` (`level_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
    ADD PRIMARY KEY (`id`),
  ADD KEY `FK_orders_shipping_type` (`ship_type`),
  ADD KEY `FK_orders_order_status` (`status_id`),
  ADD KEY `FK_orders_delivery_address` (`address_id`),
  ADD KEY `FK_orders_discounts` (`discount_id`),
  ADD KEY `FK_orders_users` (`user_id`) USING BTREE,
  ADD KEY `FK_orders_order_payment` (`payment_id`),
  ADD KEY `FK_orders_admin` (`admin_id`);

--
-- Chỉ mục cho bảng `order_items`
--
ALTER TABLE `order_items`
    ADD PRIMARY KEY (`order_id`,`product_id`) USING BTREE,
  ADD KEY `FK_order_products_products` (`product_id`),
  ADD KEY `FK_order_products_order` (`order_id`) USING BTREE;

--
-- Chỉ mục cho bảng `order_status`
--
ALTER TABLE `order_status`
    ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `payment`
--
ALTER TABLE `payment`
    ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
    ADD PRIMARY KEY (`id`),
  ADD KEY `fk_products_supplier` (`supplier_id`),
  ADD KEY `fk_products_category` (`category_id`),
  ADD KEY `FK_products_product_types` (`type_id`);

--
-- Chỉ mục cho bảng `product_categories`
--
ALTER TABLE `product_categories`
    ADD PRIMARY KEY (`id`),
  ADD KEY `fk_categories_group` (`group_id`);

--
-- Chỉ mục cho bảng `product_groups`
--
ALTER TABLE `product_groups`
    ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_types`
--
ALTER TABLE `product_types`
    ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `role`
--
ALTER TABLE `role`
    ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `shipping_info`
--
ALTER TABLE `shipping_info`
    ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `shipping_type`
--
ALTER TABLE `shipping_type`
    ADD PRIMARY KEY (`id`),
  ADD KEY `FK_shipping_type_shipping_info` (`info_id`);

--
-- Chỉ mục cho bảng `social_media`
--
ALTER TABLE `social_media`
    ADD PRIMARY KEY (`id`),
  ADD KEY `FK__address` (`id`);

--
-- Chỉ mục cho bảng `suppliers`
--
ALTER TABLE `suppliers`
    ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
    ADD PRIMARY KEY (`id`),
  ADD KEY `FK_users_role` (`role_id`);

--
-- Chỉ mục cho bảng `wishlists`
--
ALTER TABLE `wishlists`
    ADD PRIMARY KEY (`user_id`,`product_id`),
  ADD KEY `FK__products` (`product_id`),
  ADD KEY `FK__users` (`user_id`) USING BTREE;

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `address`
--
ALTER TABLE `address`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `delivery_address`
--
ALTER TABLE `delivery_address`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `discounts`
--
ALTER TABLE `discounts`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `feedbacks`
--
ALTER TABLE `feedbacks`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `images`
--
ALTER TABLE `images`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `level`
--
ALTER TABLE `level`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `log`
--
ALTER TABLE `log`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `order_status`
--
ALTER TABLE `order_status`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `payment`
--
ALTER TABLE `payment`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT cho bảng `product_categories`
--
ALTER TABLE `product_categories`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `product_groups`
--
ALTER TABLE `product_groups`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `product_types`
--
ALTER TABLE `product_types`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `shipping_info`
--
ALTER TABLE `shipping_info`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `suppliers`
--
ALTER TABLE `suppliers`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
    ADD CONSTRAINT `FK_cart_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `FK_cart_users` FOREIGN KEY (`id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `delivery_address`
--
ALTER TABLE `delivery_address`
    ADD CONSTRAINT `FK_delivery_address_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `images`
--
ALTER TABLE `images`
    ADD CONSTRAINT `fk_images_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `inventory`
--
ALTER TABLE `inventory`
    ADD CONSTRAINT `fk_inventory_discount` FOREIGN KEY (`discount_id`) REFERENCES `discounts` (`id`),
  ADD CONSTRAINT `fk_inventory_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `log`
--
ALTER TABLE `log`
    ADD CONSTRAINT `FK_log_level` FOREIGN KEY (`level_id`) REFERENCES `level` (`id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
    ADD CONSTRAINT `FK_orders_admin` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FK_orders_delivery_address` FOREIGN KEY (`address_id`) REFERENCES `delivery_address` (`id`),
  ADD CONSTRAINT `FK_orders_discounts` FOREIGN KEY (`discount_id`) REFERENCES `discounts` (`id`),
  ADD CONSTRAINT `FK_orders_order_payment` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`id`),
  ADD CONSTRAINT `FK_orders_order_status` FOREIGN KEY (`status_id`) REFERENCES `order_status` (`id`),
  ADD CONSTRAINT `FK_orders_shipping_type` FOREIGN KEY (`ship_type`) REFERENCES `shipping_type` (`id`),
  ADD CONSTRAINT `FK_orders_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `order_items`
--
ALTER TABLE `order_items`
    ADD CONSTRAINT `FK_order_products_orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `FK_order_products_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
    ADD CONSTRAINT `FK_products_product_types` FOREIGN KEY (`type_id`) REFERENCES `product_types` (`id`),
  ADD CONSTRAINT `fk_products_category` FOREIGN KEY (`category_id`) REFERENCES `product_categories` (`id`),
  ADD CONSTRAINT `fk_products_supplier` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`);

--
-- Các ràng buộc cho bảng `product_categories`
--
ALTER TABLE `product_categories`
    ADD CONSTRAINT `fk_categories_group` FOREIGN KEY (`group_id`) REFERENCES `product_groups` (`id`);

--
-- Các ràng buộc cho bảng `shipping_type`
--
ALTER TABLE `shipping_type`
    ADD CONSTRAINT `FK_shipping_type_shipping_info` FOREIGN KEY (`info_id`) REFERENCES `shipping_info` (`id`);

--
-- Các ràng buộc cho bảng `social_media`
--
ALTER TABLE `social_media`
    ADD CONSTRAINT `FK__address` FOREIGN KEY (`id`) REFERENCES `address` (`id`);

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
    ADD CONSTRAINT `FK_users_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

--
-- Các ràng buộc cho bảng `wishlists`
--
ALTER TABLE `wishlists`
    ADD CONSTRAINT `FK__products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `FK__users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
