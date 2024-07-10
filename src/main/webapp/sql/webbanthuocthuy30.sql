-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 09, 2024 lúc 10:49 PM
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
(7, 'MaiDo95@gmail.com', 'Đỗ Thị Mai', 'Dịch vụ tuyệt vời, sẽ sử dụng lại.', '2024-01-21 21:05:55'),
(26, '21130556@st.hcmuaf.edu.vn', 'Đặng Nam Thuận', '                                     <span id=\"feedbackMessage\" class=\"feedback-message\" style=\"color: Green;\"></span>\n                                     <span id=\"errorMessage\" class=\"error-message\"  style=\"color: red;\"></span>', '2024-07-09 23:22:36');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `date_save` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `images`
--

INSERT INTO `images` (`id`, `product_id`, `url`, `date_save`) VALUES
(1, 1, '/data/sp_1/Dipomax-J.jpg', '2024-07-03 20:02:43'),
(2, 1, '/data/sp_1/Dipomax-J1.jpg', '2024-07-03 20:02:43'),
(3, 1, '/data/sp_1/Dipomax-J2.jpg', '2024-07-03 20:02:43'),
(4, 2, '/data/sp_2/ARBP-ME-2.jpg', '2024-07-03 20:02:43'),
(5, 2, '/data/sp_2/ARBP-ME-3.jpg', '2024-07-03 20:02:43'),
(6, 3, '/data/sp_3/APM-1.jpg', '2024-07-03 20:02:43'),
(7, 3, '/data/sp_3/APM-2.jpg', '2024-07-03 20:02:43'),
(8, 4, '/data/sp_4/AP125RX-2.jpg', '2024-07-03 20:02:43'),
(9, 4, '/data/sp_4/AP125RX-3.jpg', '2024-07-03 20:02:43'),
(10, 5, '/data/sp_5/pedtge.jpg', '2024-07-03 20:02:43'),
(11, 5, '/data/sp_5/pedtge1.jpg', '2024-07-03 20:02:43'),
(12, 6, '/data/sp_6/Dynazide-20-Injection-khang-sinh-dieu-tri-benh-duong-tieu-hoa (1).jpg', '2024-07-03 20:02:43'),
(13, 6, '/data/sp_6/Dynazide-20-Injection-khang-sinh-dieu-tri-benh-duong-tieu-hoa.jpg', '2024-07-03 20:02:43'),
(14, 7, '/data/sp_7/Dynazide-10-khang-sinh-Tiamulin-10-dieu-tri-benh-hong-ly (1).jpg', '2024-07-03 20:02:43'),
(15, 7, '/data/sp_7/Dynazide-10-khang-sinh-Tiamulin-10-dieu-tri-benh-hong-ly.jpg', '2024-07-03 20:02:43'),
(16, 8, '/data/sp_8/Mectinvet-Plus-tri-noi-ngoai-ky-sinh-tren-trau-bo-heo-va-cuu (1).jpg', '2024-07-03 20:02:43'),
(17, 8, '/data/sp_8/Mectinvet-Plus-tri-noi-ngoai-ky-sinh-tren-trau-bo-heo-va-cuu.jpg', '2024-07-03 20:02:43'),
(18, 9, '/data/sp_9/Danoguard-khang-sinh-tiem-tri-cac-benh-ho-hap-va-duong-ruot (1).jpg', '2024-07-03 20:02:43'),
(19, 9, '/data/sp_9/Danoguard-khang-sinh-tiem-tri-cac-benh-ho-hap-va-duong-ruot.jpg', '2024-07-03 20:02:43'),
(20, 10, '/data/sp_10/Pharmatilin-25-khang-sinh-dieu-tri-hong-ly-heo (1).jpg', '2024-07-03 20:02:43'),
(21, 10, '/data/sp_10/Pharmatilin-25-khang-sinh-dieu-tri-hong-ly-heo.jpg', '2024-07-03 20:02:43'),
(22, 11, '/data/sp_11/Colicure-40-thuoc-thu-y-Tien-Thang-Vet-1.jpg', '2024-07-03 20:02:43'),
(23, 11, '/data/sp_11/Colicure-40-thuoc-thu-y-Tien-Thang-Vet.jpg', '2024-07-03 20:02:43'),
(24, 12, '/data/sp_12/Colicure-40-thuoc-thu-y-Tien-Thang-Vet (1) - Copy.jpg', '2024-07-03 20:02:43'),
(25, 12, '/data/sp_12/Colicure-40-thuoc-thu-y-Tien-Thang-Vet (1).jpg', '2024-07-03 20:02:43'),
(26, 13, '/data/sp_13/nutrimaxplus-bo-sung-vitamin-khoang-cho-thu-cung.jpg', '2024-07-03 20:02:43'),
(27, 13, '/data/sp_13/nutrimaxplus-gel-dinh-duong-cho-thu-cung.jpg', '2024-07-03 20:02:43'),
(28, 14, '/data/sp_14/Nokodemaseb-dieu-tri-cac-trieu-chung-do-nam-gay-ra.jpg', '2024-07-03 20:02:43'),
(29, 14, '/data/sp_14/Nokodemaseb-dieu-tri-nam-tai-cho-va-dien-rong.jpg', '2024-07-03 20:02:43'),
(30, 14, '/data/sp_14/Nokodemaseb-xit-khang-khuan-diet-nam.jpg', '2024-07-03 20:02:43'),
(31, 15, '/data/sp_15/itragol-dac-tri-nam-cho-meo-600x600.jpg', '2024-07-03 20:02:43'),
(32, 15, '/data/sp_15/Itragol-dung-dich-uong-itraconazole.jpg', '2024-07-03 20:02:43'),
(33, 15, '/data/sp_15/Itragol-vi-sua-thom-ngon.jpg', '2024-07-03 20:02:43'),
(34, 16, '/data/sp_16/Selight-120-0.25-600x600.jpg', '2024-07-03 20:02:43'),
(35, 16, '/data/sp_16/Selight-120-0.5.jpg', '2024-07-03 20:02:43'),
(36, 16, '/data/sp_16/Selight-120.jpg', '2024-07-03 20:02:43'),
(37, 17, '/data/sp_17/Selight-60-0.75ml.jpg', '2024-07-03 20:02:43'),
(38, 17, '/data/sp_17/Selight-60-present.jpg', '2024-07-03 20:02:43'),
(39, 17, '/data/sp_17/Selight-solution-60-0.25ml.jpg', '2024-07-03 20:02:43'),
(40, 18, '/data/sp_18/Early-3Cs-bu-nuoc-va-dien-giai-khi-van-chuyen-ga-con-ve-trai (1).jpg', '2024-07-03 20:02:43'),
(41, 18, '/data/sp_18/Early-3Cs-bu-nuoc-va-dien-giai-khi-van-chuyen-ga-con-ve-trai.jpg', '2024-07-03 20:02:43'),
(42, 19, '/data/sp_19/nutrimaxplus-bo-sung-vitamin-khoang-cho-thu-cung - Copy.jpg', '2024-07-03 20:02:43'),
(43, 19, '/data/sp_19/nutrimaxplus-bo-sung-vitamin-khoang-cho-thu-cung.jpg', '2024-07-03 20:02:43'),
(44, 20, '/data/sp_20/nutrimaxplus-bo-sung-vitamin-khoang-cho-thu-cung - Copy.jpg', '2024-07-03 20:02:43'),
(45, 20, '/data/sp_20/nutrimaxplus-bo-sung-vitamin-khoang-cho-thu-cung.jpg', '2024-07-03 20:02:43'),
(46, 21, '/data/sp_21/cat-ve-sinh-meo-Captain-Meow-1.jpg', '2024-07-03 20:02:43'),
(47, 21, '/data/sp_21/cat-ve-sinh-meo-Captain-Meow-mui-ca-phe.jpg', '2024-07-03 20:02:43'),
(48, 21, '/data/sp_21/cat-ve-sinh-meo-Captain-Meow-mui-chanh.jpg', '2024-07-03 20:02:43'),
(49, 21, '/data/sp_21/cat-ve-sinh-meo-Captain-Meow-mui-tao.jpg', '2024-07-03 20:02:43'),
(50, 22, '/data/sp_22/Regalos-ca-ngu-phu-ca-bao.jpg', '2024-07-03 20:02:43'),
(51, 22, '/data/sp_22/Regalos-ca-ngu-phu-ca-hoi (1).jpg', '2024-07-03 20:02:43'),
(52, 22, '/data/sp_22/Regalos-ca-ngu-phu-thanh-cua.jpg', '2024-07-03 20:02:43'),
(53, 22, '/data/sp_22/Regalos-ca-ngu-phu-uc-ga.jpg', '2024-07-03 20:02:43'),
(54, 22, '/data/sp_22/Regalos-ca-ngu.jpg', '2024-07-03 20:02:43'),
(55, 22, '/data/sp_22/thuc-an-uot-Regalos-cho-meo.jpg', '2024-07-03 20:02:43'),
(56, 23, '/data/sp_23/jinny-stick-snack-cho-meo-2.jpg', '2024-07-03 20:02:43'),
(57, 23, '/data/sp_23/Jinny-Stick-vi-ca-hoi.jpg', '2024-07-03 20:02:43'),
(58, 23, '/data/sp_23/Jinny-Stick-vi-ca-ngu.jpg', '2024-07-03 20:02:43'),
(59, 23, '/data/sp_23/Jinny-Stick-vi-gan.jpg', '2024-07-03 20:02:43'),
(60, 23, '/data/sp_23/Jinny-Stick-vi-hai-san.jpg', '2024-07-03 20:02:43'),
(61, 23, '/data/sp_23/Jinny-Stick-vi-thit-ga.jpg', '2024-07-03 20:02:43'),
(62, 24, '/data/sp_24/Cupid-perfume-huong-Bright-Sunshine-vang.jpg', '2024-07-03 20:02:43'),
(63, 24, '/data/sp_24/Cupid-perfume-huong-Florarium-hong.jpg', '2024-07-03 20:02:43'),
(64, 24, '/data/sp_24/Cupid-perfume-huong-Heavenly-Fruits-cam.jpg', '2024-07-03 20:02:43'),
(65, 24, '/data/sp_24/Cupid-perfume-huong-Herbarium-xanh-la.jpg', '2024-07-03 20:02:43'),
(66, 24, '/data/sp_24/Cupid-perfume-huong-Secret-love-tim.jpg', '2024-07-03 20:02:43'),
(67, 24, '/data/sp_24/Nuoc-hoa-cho-meo-Cupid-Perfume.jpg', '2024-07-03 20:02:43'),
(68, 25, '/data/sp_25/pet-ear-cleaner-dung-dich-sach-tai-cho-cho-va-meo-khu-mui-hoi-va-di-ung (1).jpg', '2024-07-03 20:02:43'),
(69, 25, '/data/sp_25/pet-ear-cleaner-dung-dich-sach-tai-cho-cho-va-meo-khu-mui-hoi-va-di-ung.jpg', '2024-07-03 20:02:43'),
(70, 26, '/data/sp_26/Nutri-Forte-Gel-Gel-cung-cap-nang-luong-va-vitamin-khoang-acid-amin-danh-cho-cho-meo (1).jpg', '2024-07-03 20:02:43'),
(71, 26, '/data/sp_26/Nutri-Forte-Gel-Gel-cung-cap-nang-luong-va-vitamin-khoang-acid-amin-danh-cho-cho-meo.jpg', '2024-07-03 20:02:43'),
(72, 27, '/data/sp_27/Metricyclin-Vien-dat-tu-cung-Chlortetracyclin-hydrochloride-su-dung-trong-thu-y (1).jpg', '2024-07-03 20:02:43'),
(73, 27, '/data/sp_27/Metricyclin-Vien-dat-tu-cung-Chlortetracyclin-hydrochloride-su-dung-trong-thu-y.jpg', '2024-07-03 20:02:43'),
(74, 28, '/data/sp_28/Advance-Sulfa-Thoxine-Dac-tri-cau-trung-ky-sinh-trung-duong-mau-dau-den (1).jpg', '2024-07-03 20:02:43'),
(75, 28, '/data/sp_28/Advance-Sulfa-Thoxine-Dac-tri-cau-trung-ky-sinh-trung-duong-mau-dau-den.jpg', '2024-07-03 20:02:43'),
(76, 29, '/data/sp_29/Advance-New-Max-moi-truong-pha-tinh-heo (1).jpg', '2024-07-03 20:02:43'),
(77, 29, '/data/sp_29/Advance-New-Max-moi-truong-pha-tinh-heo.jpg', '2024-07-03 20:02:43'),
(78, 30, '/data/sp_30/Advance-Pro-lim-da-liem-bo-sung-khoang-cho-gia-suc (1).jpg', '2024-07-03 20:02:43'),
(79, 30, '/data/sp_30/Advance-Pro-lim-da-liem-bo-sung-khoang-cho-gia-suc.jpg', '2024-07-03 20:02:43'),
(80, 31, '/data/sp_31/Mectinvet-Injection-Ivermectin-10mgml-tri-noi-ngoai-ky-sinh (1).jpg', '2024-07-03 20:02:43'),
(81, 31, '/data/sp_31/Mectinvet-Injection-Ivermectin-10mgml-tri-noi-ngoai-ky-sinh.jpg', '2024-07-03 20:02:43'),
(82, 32, '/data/sp_32/Vaccine-nhuoc-doc-phong-benh-Dich-ta-heo-San-xuat-tren-te-bao (1).jpg', '2024-07-03 20:02:43'),
(83, 32, '/data/sp_32/Vaccine-nhuoc-doc-phong-benh-Dich-ta-heo-San-xuat-tren-te-bao.jpg', '2024-07-03 20:02:43'),
(84, 33, '/data/sp_33/Vaccine-vo-hoat-phong-benh-tai-xanh-chung-NVDC-JXA1 (1).jpg', '2024-07-03 20:02:43'),
(85, 33, '/data/sp_33/Vaccine-vo-hoat-phong-benh-tai-xanh-chung-NVDC-JXA1.jpg', '2024-07-03 20:02:43'),
(86, 34, '/data/sp_34/Vac-xin-vo-hoat-phong-benh-Newcastle-chung-Lasota-va-Cum-gia-cam-phan-typ-H9-chung-SS (1).jpg', '2024-07-03 20:02:43'),
(87, 34, '/data/sp_34/Vac-xin-vo-hoat-phong-benh-Newcastle-chung-Lasota-va-Cum-gia-cam-phan-typ-H9-chung-SS.jpg', '2024-07-03 20:02:43'),
(88, 35, '/data/sp_35/Tukono (1).jpg', '2024-07-03 20:02:43'),
(89, 35, '/data/sp_35/Tukono.jpg', '2024-07-03 20:02:43'),
(90, 36, '/data/sp_36/provita-bo-sung-vitamin-khoang-acid-amin-cho-vat-nuoi-khoe-manh.jpg', '2024-07-03 20:02:43'),
(91, 36, '/data/sp_36/PROVITA-–-bo-sung-vitamin-khoang-acid-amin-cho-vat-nuoi-khoe-manh-1.jpg', '2024-07-03 20:02:43'),
(92, 37, '/data/sp_37/super-red-skin-450ml-giup-ga-da-san-da-giam-bam-phong-nam.jpg', '2024-07-03 20:02:43'),
(93, 37, '/data/sp_37/Super-red-skin-giup-ga-da-san-da-giam-bam-phong-nam...jpg', '2024-07-03 20:02:43'),
(94, 38, '/data/sp_38/Keto-gel-Ketoconazole-dung-ngoai-dieu-tri-nam-da-cho-cho-meo-2.jpg', '2024-07-03 20:02:43'),
(95, 38, '/data/sp_38/Keto-gel-Ketoconazole-dung-ngoai-dieu-tri-nam-da-cho-cho-meo-3.jpg', '2024-07-03 20:02:43'),
(96, 38, '/data/sp_38/Keto-gel-Ketoconazole-dung-ngoai-dieu-tri-nam-da-cho-cho-meo-4.jpg', '2024-07-03 20:02:43'),
(97, 38, '/data/sp_38/Keto-gel-Ketoconazole-dung-ngoai-dieu-tri-nam-da-cho-cho-meo.jpg', '2024-07-03 20:02:43'),
(98, 39, '/data/sp_39/CP-–-CIN-20-hormone-dang-dung-dich-tiem-vo-trung (1).jpg', '2024-07-03 20:02:43'),
(99, 39, '/data/sp_39/CP-–-CIN-20-hormone-dang-dung-dich-tiem-vo-trung.jpg', '2024-07-03 20:02:43'),
(100, 40, '/data/sp_40/Doggygel-cung-cap-Omega-3-vi-khoang-thiet-yeu-cho-cho.jpg', '2024-07-03 20:02:43'),
(101, 40, '/data/sp_40/I-Pett-Doggy-Gel-cung-cap-Omega-3-vi-khoang-thiet-yeu-cho-cho.jpg', '2024-07-03 20:02:43'),
(102, 41, '/data/sp_41/I-Pett-Kitty-Gel-cung-cap-Omega-3-vi-khoang-thiet-yeu-cho-meo-.jpg', '2024-07-03 20:02:43'),
(103, 41, '/data/sp_41/Kitty-Gel-cung-cap-Omega-3-vi-khoang-thiet-yeu-cho-meo.jpg', '2024-07-03 20:02:43'),
(104, 42, '/data/sp_42/I-PETT-LIPOTIN-cham-soc-chuyen-sau-cho-da-long-danh-cho-cho.jpg', '2024-07-03 20:02:43'),
(105, 42, '/data/sp_42/Lipotin-cham-soc-chuyen-sau-cho-da-long-danh-cho-cho.jpg', '2024-07-03 20:02:43'),
(106, 43, '/data/sp_43/Nutrical-vien-bo-sung-Canxi-va-khoang-cho-cho-tam-voc-lon-30-vien (1).jpg', '2024-07-03 20:02:43'),
(107, 43, '/data/sp_43/Nutrical-vien-bo-sung-Canxi-va-khoang-cho-cho-tam-voc-lon-30-vien.jpg', '2024-07-03 20:02:43'),
(108, 43, '/data/sp_43/Nutrical-vien-bo-sung-Canxi-va-khoang-cho-cho-tam-voc-lon-60-vien-.jpg', '2024-07-03 20:02:43'),
(109, 44, '/data/sp_44/Dotrol-dung-dich-dieu-tri-giun-cho-cho-duoi-1-tuoi (1).jpg', '2024-07-03 20:02:43'),
(110, 44, '/data/sp_44/Dotrol-dung-dich-dieu-tri-giun-cho-cho-duoi-1-tuoi.jpg', '2024-07-03 20:02:43'),
(111, 45, '/data/sp_45/Catrol-dung-dich-dieu-tri-giun-tron-tren-meo (1).jpg', '2024-07-03 20:02:43'),
(112, 45, '/data/sp_45/Catrol-dung-dich-dieu-tri-giun-tron-tren-meo.jpg', '2024-07-03 20:02:43'),
(113, 46, '/data/sp_46/Advance-Lac-premix-thuc-An-bo-sung-vitamin-khoang-va-methionine-cho-heo-va-gia-cam (1).jpg', '2024-07-03 20:02:43'),
(114, 46, '/data/sp_46/Advance-Lac-premix-thuc-An-bo-sung-vitamin-khoang-va-methionine-cho-heo-va-gia-cam.jpg', '2024-07-03 20:02:43'),
(115, 47, '/data/sp_47/Yemune-G7-vacxin-phong-Newcastle-chung-A-VII-1 (1).jpg', '2024-07-03 20:02:43'),
(116, 47, '/data/sp_47/Yemune-G7-vacxin-phong-Newcastle-chung-A-VII-1.jpg', '2024-07-03 20:02:43'),
(117, 48, '/data/sp_48/AVI-POX-vac-xin-phong-benh-dau-ga-dong-Cutter-1 (1).jpg', '2024-07-03 20:02:43'),
(118, 48, '/data/sp_48/AVI-POX-vac-xin-phong-benh-dau-ga-dong-Cutter-1.jpg', '2024-07-03 20:02:43'),
(119, 49, '/data/sp_49/supercid (1).jpg', '2024-07-03 20:02:43'),
(120, 49, '/data/sp_49/supercid.jpg', '2024-07-03 20:02:43'),
(121, 50, '/data/sp_50/viatox (1).jpg', '2024-07-03 20:02:43'),
(122, 50, '/data/sp_50/viatox.jpg', '2024-07-03 20:02:43'),
(123, 51, '/data/sp_51/z4522333612940_488d9fdc8f2eeacc3c3621e90fbc182d-scaled.jpg', '2024-07-03 20:02:43'),
(124, 51, '/data/sp_51/z4522333617723_258555c26b006f9761076baf7e3d25c7-scaled.jpg', '2024-07-03 20:02:43'),
(125, 51, '/data/sp_51/z4522333634830_7e648cf1b5ec30c25dea21ac04db26b5-scaled.jpg', '2024-07-03 20:02:43'),
(126, 51, '/data/sp_51/z4522333645399_13b284dba22403682087a4a73c28a31e-scaled.jpg', '2024-07-03 20:02:43'),
(127, 52, '/data/sp_52/z4484496051046_324b6888e3a24d696b20a14283a2cb41-scaled.jpg', '2024-07-03 20:02:43'),
(128, 52, '/data/sp_52/z4484496056488_a00cfb1b89afe3c9eebf2111c075407e-scaled.jpg', '2024-07-03 20:02:43'),
(129, 53, '/data/sp_53/z4389541762182_889f2dafe829ee8eaa98a633d2abbcac-scaled.jpg', '2024-07-03 20:02:43'),
(130, 53, '/data/sp_53/z4475328357944_10f704bc36356c8ca272ba7454002be7-scaled.jpg', '2024-07-03 20:02:43'),
(131, 53, '/data/sp_53/z4475328442423_df342305eb7f07e958cc7fa934702a34-scaled.jpg', '2024-07-03 20:02:43'),
(132, 54, '/data/sp_54/1-scaled.jpg', '2024-07-03 20:02:43'),
(133, 54, '/data/sp_54/2-scaled.jpg', '2024-07-03 20:02:43'),
(134, 54, '/data/sp_54/3-scaled.jpg', '2024-07-03 20:02:43'),
(135, 55, '/data/sp_55/16-scaled (1).jpg', '2024-07-03 20:02:43'),
(136, 55, '/data/sp_55/16-scaled.jpg', '2024-07-03 20:02:43'),
(137, 56, '/data/sp_56/z4473172182232_20ed6cb28db1a8b51c54c173745c8dd5.jpg', '2024-07-03 20:02:43'),
(138, 56, '/data/sp_56/z4473172448000_07877f1634a08fc9440ed5b826478dfd.jpg', '2024-07-03 20:02:43'),
(139, 56, '/data/sp_56/z4475328455467_78044dc9eb0fb797f640f0cf4df70eb0-scaled.jpg', '2024-07-03 20:02:43'),
(140, 57, '/data/sp_57/14-scaled (1).jpg', '2024-07-03 20:02:43'),
(141, 57, '/data/sp_57/14-scaled.jpg', '2024-07-03 20:02:43'),
(142, 58, '/data/sp_58/13-scaled (1).jpg', '2024-07-03 20:02:43'),
(143, 58, '/data/sp_58/13-scaled.jpg', '2024-07-03 20:02:43'),
(144, 59, '/data/sp_59/17-scaled.jpg', '2024-07-03 20:02:43'),
(145, 59, '/data/sp_59/18-scaled.jpg', '2024-07-03 20:02:43'),
(146, 59, '/data/sp_59/19-scaled.jpg', '2024-07-03 20:02:43'),
(147, 59, '/data/sp_59/20-scaled.jpg', '2024-07-03 20:02:43'),
(148, 60, '/data/sp_60/3-33-scaled.jpg', '2024-07-03 20:02:43'),
(149, 60, '/data/sp_60/4-31-scaled.jpg', '2024-07-03 20:02:43'),
(150, 61, '/data/sp_61/4-30-scaled.jpg', '2024-07-03 20:02:43'),
(151, 61, '/data/sp_61/6-19-scaled.jpg', '2024-07-03 20:02:43'),
(152, 61, '/data/sp_61/7-1-scaled.jpg', '2024-07-03 20:02:43'),
(153, 62, '/data/sp_62/3-31-scaled.jpg', '2024-07-03 20:02:43'),
(154, 62, '/data/sp_62/4-29-scaled.jpg', '2024-07-03 20:02:43'),
(155, 63, '/data/sp_63/3-30-scaled.jpg', '2024-07-03 20:02:43'),
(156, 63, '/data/sp_63/4-28-scaled.jpg', '2024-07-03 20:02:43'),
(157, 63, '/data/sp_63/5-18-scaled.jpg', '2024-07-03 20:02:43'),
(158, 64, '/data/sp_64/3-29-scaled.jpg', '2024-07-03 20:02:43'),
(159, 64, '/data/sp_64/3-29-scaled1.jpg', '2024-07-03 20:02:43'),
(160, 65, '/data/sp_65/3-27-scaled.jpg', '2024-07-03 20:02:43'),
(161, 65, '/data/sp_65/4-25-scaled.jpg', '2024-07-03 20:02:43'),
(162, 65, '/data/sp_65/5-16-scaled.jpg', '2024-07-03 20:02:43'),
(163, 66, '/data/sp_66/3-26-scaled (1).jpg', '2024-07-03 20:02:43'),
(164, 66, '/data/sp_66/3-26-scaled.jpg', '2024-07-03 20:02:43'),
(165, 67, '/data/sp_67/3-25-scaled.jpg', '2024-07-03 20:02:43'),
(166, 67, '/data/sp_67/7-4-scaled.jpg', '2024-07-03 20:02:43'),
(167, 67, '/data/sp_67/z4375593397324_81691fbcf021dcdb050456d22be5d71b.jpg', '2024-07-03 20:02:43'),
(168, 68, '/data/sp_68/3-24-scaled.jpg', '2024-07-03 20:02:43'),
(169, 68, '/data/sp_68/4-23-scaled.jpg', '2024-07-03 20:02:43'),
(170, 68, '/data/sp_68/5-15-scaled.jpg', '2024-07-03 20:02:43'),
(171, 69, '/data/sp_69/10-1-scaled.jpg', '2024-07-03 20:02:43'),
(172, 69, '/data/sp_69/3-23-scaled.jpg', '2024-07-03 20:02:43'),
(173, 69, '/data/sp_69/4-22-scaled.jpg', '2024-07-03 20:02:43'),
(174, 69, '/data/sp_69/z4374543881011_1109ac84168d6d9fdfb76d5428a1d8b5.jpg', '2024-07-03 20:02:43'),
(175, 70, '/data/sp_70/3-22-scaled.jpg', '2024-07-03 20:02:43'),
(176, 70, '/data/sp_70/4-21-scaled.jpg', '2024-07-03 20:02:43'),
(177, 70, '/data/sp_70/5-14-scaled.jpg', '2024-07-03 20:02:43'),
(178, 70, '/data/sp_70/6-14-scaled.jpg', '2024-07-03 20:02:43'),
(179, 71, '/data/sp_71/3-20-scaled.jpg', '2024-07-03 20:02:43'),
(180, 71, '/data/sp_71/4-20-scaled.jpg', '2024-07-03 20:02:43'),
(181, 72, '/data/sp_72/3-19-scaled.jpg', '2024-07-03 20:02:43'),
(182, 72, '/data/sp_72/4-19-scaled.jpg', '2024-07-03 20:02:43'),
(183, 72, '/data/sp_72/z4375593448656_602ff33534537b7f464f629852f79ab8.jpg', '2024-07-03 20:02:43'),
(184, 73, '/data/sp_73/AVI-POX-vac-xin-phong-benh-dau-ga-dong-Cutter-1.jpg', '2024-07-03 20:02:43'),
(185, 74, '/data/sp_74/ITA-New-Vac-xin-bat-hoat-phong-benh-Dich-ta-ga-dong-Lasota-1.jpg', '2024-07-03 20:02:43'),
(186, 75, '/data/sp_75/ITA-ND-IBD-vac-xin-phong-benh-Dich-ta-Gumboro-1.jpg', '2024-07-03 20:02:43'),
(187, 76, '/data/sp_76/ITA-ND-IB-EDS-vac-xin-phong-benh-Dich-ta-Viem-phe-quan-truyen-nhiem-va-hoi-chung-giam-de-1-600x600.jpg', '2024-07-03 20:02:43'),
(188, 77, '/data/sp_77/AVI-ND-HB1IB-Vac-xin-phong-benh-IB-chung-Massachusetts-B48-va-Newcastle-chung-Hitchner-B1.jpg', '2024-07-03 20:02:43'),
(189, 78, '/data/sp_78/AVI-ND-Lasota-IB-Vac-xin-phong-benh-IB-dong-Massachusetts-B48-va-ND-dong-Lasota-1.jpg', '2024-07-03 20:02:43'),
(190, 79, '/data/sp_79/AVI-ND-Lasota-Vac-xin-phong-benh-ND-dong-Lasota-1.jpg', '2024-07-03 20:02:43'),
(191, 80, '/data/sp_80/AVI-IBD-PLUS-vac-xin-phong-benh-Gumboro-dong-Winterfiled-2512-G-61-1.jpg', '2024-07-03 20:02:43'),
(192, 81, '/data/sp_81/AVI-IBD-Inter-Vac-xin-phong-Gumboro-dong-LIBDV-1.jpg', '2024-07-03 20:02:44'),
(193, 82, '/data/sp_82/AVI-H120-Vac-xin-phong-benh-IB-dong-Massachusetts-H120-1-600x600.jpg', '2024-07-03 20:02:44'),
(194, 83, '/data/sp_83/ITA-Coryza-ABC-Gel-–-vac-xin-phong-benh-So-mui-truyen-nhiem-Coryza-tren-ge.jpg', '2024-07-03 20:02:44'),
(195, 84, '/data/sp_84/vac-xin-cum-gia-cam-typ-H9-chung-SS-1-e1626340751354.jpg', '2024-07-03 20:02:44'),
(196, 85, '/data/sp_85/Pro-acid-ho-hop-dung-dich-axit-huu-co-1.jpg', '2024-07-03 20:02:44'),
(197, 86, '/data/sp_86/Nano-Klea-Rx-xit-truc-tiep-len-vet-thuong.jpg', '2024-07-03 20:02:44'),
(198, 86, '/data/sp_86/nanokleanew.jpg', '2024-07-03 20:02:44'),
(199, 87, '/data/sp_87/Alpha-Trypsin-wsp-1kg-01-768x1024-1.png', '2024-07-03 20:02:44'),
(200, 87, '/data/sp_87/Alpha-Trypsin-wsp-500g-768x1024-1.png', '2024-07-03 20:02:44'),
(201, 87, '/data/sp_87/Alpha-Trypsin-wsp-768x1024-1.png', '2024-07-03 20:02:44'),
(202, 88, '/data/sp_88/3-17-768x768.jpg', '2024-07-03 20:02:44'),
(203, 88, '/data/sp_88/4-16-768x768.jpg', '2024-07-03 20:02:44'),
(204, 89, '/data/sp_89/oxytocin-kich-thich-co-bop-tu-cung-khi-sinh-con.jpg', '2024-07-03 20:02:44'),
(205, 90, '/data/sp_90/sua-tam-Modern-Pet-Gel-Plus-tri-ve-ran-bo-chet.jpg', '2024-07-03 20:02:44'),
(206, 91, '/data/sp_91/Khang-the-viem-gan-vit-Hepatitis-Antibodies.jpg', '2024-07-03 20:02:44'),
(207, 91, '/data/sp_91/Khang-the-viem-gan-vit-Hepatitis-Antibodies1.jpg', '2024-07-03 20:02:44'),
(208, 92, '/data/sp_92/MYCO-AD-hap-thu-doc-to-nam-moc1 - Copy.jpg', '2024-07-03 20:02:44'),
(209, 92, '/data/sp_92/MYCO-AD-hap-thu-doc-to-nam-moc1.jpg', '2024-07-03 20:02:44'),
(210, 93, '/data/sp_93/Modern-Pet-Vita-Hemo-ho-tro-tao-mau-cho-cho-meo - Copy.jpg', '2024-07-03 20:02:44'),
(211, 93, '/data/sp_93/Modern-Pet-Vita-Hemo-ho-tro-tao-mau-cho-cho-meo.jpg', '2024-07-03 20:02:44'),
(212, 94, '/data/sp_94/AMOX-15-LA-768x830.png', '2024-07-03 20:02:44'),
(213, 95, '/data/sp_95/10-vien-Prarintel-xo-giun-cho-meo.jpg', '2024-07-03 20:02:44'),
(214, 95, '/data/sp_95/Vien-Prarintel-xo-giun-duong-ruot-cho-meo.jpg', '2024-07-03 20:02:44'),
(215, 95, '/data/sp_95/Vien-xo-giun-tron-giun-dep-cho-meo-Prarintel.jpg', '2024-07-03 20:02:44'),
(216, 96, '/data/sp_96/20-vien-xo-giun-cho-cho-Prarintel-plus.jpg', '2024-07-03 20:02:44'),
(217, 96, '/data/sp_96/vien-xo-giun-dep-giun-tron-cho-cho-Prarintel-plus.jpg', '2024-07-03 20:02:44'),
(218, 96, '/data/sp_96/vien-xo-giun-Thai-Lan-cho-cho-Prarintel-plus.jpg', '2024-07-03 20:02:44'),
(219, 97, '/data/sp_97/I-pett-Coxae-ho-tro-chuc-nang-khop-cho-cho-meo.jpg', '2024-07-03 20:02:44'),
(220, 97, '/data/sp_97/thanh-phan-cua-Coxae.jpg', '2024-07-03 20:02:44'),
(221, 98, '/data/sp_98/Os-cal-Vien-ho-tro-chuc-nang-xuong-cho-cho-meo - Copy.jpg', '2024-07-03 20:02:44'),
(222, 98, '/data/sp_98/Os-cal-Vien-ho-tro-chuc-nang-xuong-cho-cho-meo.jpg', '2024-07-03 20:02:44'),
(223, 99, '/data/sp_99/I-PETT-KIDY-Vien-ho-tro-chuc-nang-than-cho-cho-meo - Copy.jpg', '2024-07-03 20:02:44'),
(224, 99, '/data/sp_99/I-PETT-KIDY-Vien-ho-tro-chuc-nang-than-cho-cho-meo.jpg', '2024-07-03 20:02:44'),
(225, 100, '/data/sp_100/Amoxclamed-drop-Khang-sinh-amox-dang-uong-cho-cho-meo - Copy.jpg', '2024-07-03 20:02:44'),
(226, 100, '/data/sp_100/Amoxclamed-drop-Khang-sinh-amox-dang-uong-cho-cho-meo.jpg', '2024-07-03 20:02:44'),
(227, 101, '/data/sp_101/thuoc-tien-me-Xylinvet-su-dung-cho-cho-meo (1).jpg', '2024-07-03 20:02:44'),
(228, 101, '/data/sp_101/thuoc-tien-me-Xylinvet-su-dung-cho-cho-meo.jpg', '2024-07-03 20:02:44'),
(229, 102, '/data/sp_102/Heartsaver-Chewable-Small-xo-giun-cho-cho-nho.jpg', '2024-07-03 20:02:44'),
(230, 102, '/data/sp_102/Heartsaver-Plus-Chewable-Small.jpg', '2024-07-03 20:02:44'),
(231, 102, '/data/sp_102/Vien-xo-giun-cho-cho-duoi-11kg-Heartsaver-Chewable-Small.jpg', '2024-07-03 20:02:44'),
(232, 103, '/data/sp_103/Heartsaver-Plus-Chewable-Large-hop-6-vien.jpg', '2024-07-03 20:02:44'),
(233, 103, '/data/sp_103/Heartsaver-Plus-Chewable-Large.jpg', '2024-07-03 20:02:44'),
(234, 103, '/data/sp_103/Vien-xo-giun-cho-cho-23-45kg-Heartsaver-Plus-Chewable-Large.jpg', '2024-07-03 20:02:44'),
(235, 104, '/data/sp_104/Thuoc-sat-trung-Advance-APA-Clean-dung-trong-trai-chan-nuoi - Copy.jpg', '2024-07-03 20:02:44'),
(236, 104, '/data/sp_104/Thuoc-sat-trung-Advance-APA-Clean-dung-trong-trai-chan-nuoi.jpg', '2024-07-03 20:02:44'),
(237, 105, '/data/sp_105/Thuc-an-kanipro-10kg-danh-cho-cho-moi-lua-tuoi - Copy.jpg', '2024-07-03 20:02:44'),
(238, 105, '/data/sp_105/Thuc-an-kanipro-10kg-danh-cho-cho-moi-lua-tuoi.jpg', '2024-07-03 20:02:44'),
(239, 106, '/data/sp_106/Thuoc-mo-ancomast (1).jpg', '2024-07-03 20:02:44'),
(240, 106, '/data/sp_106/Thuoc-mo-ancomast.jpg', '2024-07-03 20:02:44'),
(241, 107, '/data/sp_107/Chat-thay-the-sua-Birthright-cho-cho-meo-non-trong-vong-12-gio-tuoi-den-14-ngay-tuoi - Copy.jpg', '2024-07-03 20:02:44'),
(242, 107, '/data/sp_107/Chat-thay-the-sua-Birthright-cho-cho-meo-non-trong-vong-12-gio-tuoi-den-14-ngay-tuoi.jpg', '2024-07-03 20:02:44'),
(243, 108, '/data/sp_108/Coxzuril-5-kiem-soat-benh-cau-trung-tren-heo-con - Copy.jpg', '2024-07-03 20:02:44'),
(244, 108, '/data/sp_108/Coxzuril-5-kiem-soat-benh-cau-trung-tren-heo-con.jpg', '2024-07-03 20:02:44'),
(245, 109, '/data/sp_109/Coxzuril-2-5-dieu-tri-benh-cau-trung-tren-ga-vit-ngong - Copy.jpg', '2024-07-03 20:02:44'),
(246, 109, '/data/sp_109/Coxzuril-2-5-dieu-tri-benh-cau-trung-tren-ga-vit-ngong.jpg', '2024-07-03 20:02:44'),
(247, 110, '/data/sp_110/Sua-tam-Diamond-Pet-giup-khu-mui-hoi-duong-long-duong-da - Copy.jpg', '2024-07-03 20:02:44'),
(248, 110, '/data/sp_110/Sua-tam-Diamond-Pet-giup-khu-mui-hoi-duong-long-duong-da.jpg', '2024-07-03 20:02:44'),
(249, 111, '/data/sp_111/Dau-tam-Douxe-S3-dang-Mouse-cho-thu-cung-da-nhon-da-bong-troc - Copy.jpg', '2024-07-03 20:02:44'),
(250, 111, '/data/sp_111/Dau-tam-Douxe-S3-dang-Mouse-cho-thu-cung-da-nhon-da-bong-troc.jpg', '2024-07-03 20:02:44'),
(251, 112, '/data/sp_112/Cefvet-chua-khang-sinh-Ceftiofur-4g - Copy.jpg', '2024-07-03 20:02:44'),
(252, 112, '/data/sp_112/Cefvet-chua-khang-sinh-Ceftiofur-4g.jpg', '2024-07-03 20:02:44'),
(253, 113, '/data/sp_113/thuoc-nho-gay-Cleartix-Spot-on-tri-ve-bo-chet-tren-cho - Copy.jpg', '2024-07-03 20:02:44'),
(254, 113, '/data/sp_113/thuoc-nho-gay-Cleartix-Spot-on-tri-ve-bo-chet-tren-cho.jpg', '2024-07-03 20:02:44'),
(255, 114, '/data/sp_114/thuoc-nho-gay-cleartix-spot-on-cat-tri-ve-bo-chet-tren-meo - Copy.jpg', '2024-07-03 20:02:44'),
(256, 114, '/data/sp_114/thuoc-nho-gay-cleartix-spot-on-cat-tri-ve-bo-chet-tren-meo.jpg', '2024-07-03 20:02:44'),
(257, 115, '/data/sp_115/Thuoc-nho-tai-Auriclean-lam-sach-tai-cho-cho-meo - Copy.jpg', '2024-07-03 20:02:44'),
(258, 115, '/data/sp_115/Thuoc-nho-tai-Auriclean-lam-sach-tai-cho-cho-meo.jpg', '2024-07-03 20:02:44'),
(259, 116, '/data/sp_116/Chromamix-Plus-bo-sung-Crom-huu-co-cho-heo - Copy.jpg', '2024-07-03 20:02:44'),
(260, 116, '/data/sp_116/Chromamix-Plus-bo-sung-Crom-huu-co-cho-heo.jpg', '2024-07-03 20:02:44'),
(261, 117, '/data/sp_117/Advance-Normal-Saline-bu-nuoc-va-chat-dien-giai-do-mat-nuoc - Copy.jpg', '2024-07-03 20:02:44'),
(262, 117, '/data/sp_117/Advance-Normal-Saline-bu-nuoc-va-chat-dien-giai-do-mat-nuoc.jpg', '2024-07-03 20:02:44'),
(263, 118, '/data/sp_118/Biosol-poultry-cung-cap-khoang-chat-cho-gia-cam - Copy.jpg', '2024-07-03 20:02:44'),
(264, 118, '/data/sp_118/Biosol-poultry-cung-cap-khoang-chat-cho-gia-cam.jpg', '2024-07-03 20:02:44'),
(265, 119, '/data/sp_119/Vaccine-H5N1-Re5 - Copy.jpg', '2024-07-03 20:02:44'),
(266, 119, '/data/sp_119/Vaccine-H5N1-Re5.jpg', '2024-07-03 20:02:44'),
(267, 120, '/data/sp_120/3-16-768x768.jpg', '2024-07-03 20:02:44'),
(268, 120, '/data/sp_120/4-16-768x768.jpg', '2024-07-03 20:02:44'),
(269, 120, '/data/sp_120/5-12-768x768.jpg', '2024-07-03 20:02:44'),
(270, 120, '/data/sp_120/6-12-768x768.jpg', '2024-07-03 20:02:44'),
(271, 121, '/data/sp_121/3-15-768x768.jpg', '2024-07-03 20:02:44'),
(272, 121, '/data/sp_121/4-15-768x768.jpg', '2024-07-03 20:02:44'),
(273, 121, '/data/sp_121/5-11-768x768.jpg', '2024-07-03 20:02:44'),
(274, 122, '/data/sp_122/3-14-768x768.jpg', '2024-07-03 20:02:44'),
(275, 122, '/data/sp_122/4-14-768x768.jpg', '2024-07-03 20:02:44'),
(276, 122, '/data/sp_122/5-10-768x768.jpg', '2024-07-03 20:02:44'),
(277, 123, '/data/sp_123/3-13-768x768.jpg', '2024-07-03 20:02:44'),
(278, 124, '/data/sp_124/3-12-768x768.jpg', '2024-07-03 20:02:44'),
(279, 124, '/data/sp_124/4-12-768x768.jpg', '2024-07-03 20:02:44'),
(280, 124, '/data/sp_124/5-9-768x768.jpg', '2024-07-03 20:02:44'),
(281, 125, '/data/sp_125/3-11-768x768.jpg', '2024-07-03 20:02:44'),
(282, 126, '/data/sp_126/3-10-768x768.jpg', '2024-07-03 20:02:44'),
(283, 126, '/data/sp_126/4-10-768x768.jpg', '2024-07-03 20:02:44'),
(284, 126, '/data/sp_126/5-8-768x768.jpg', '2024-07-03 20:02:44'),
(285, 127, '/data/sp_127/3-9-768x768.jpg', '2024-07-03 20:02:44'),
(286, 127, '/data/sp_127/4-9-768x768.jpg', '2024-07-03 20:02:44'),
(287, 127, '/data/sp_127/5-7-768x768.jpg', '2024-07-03 20:02:44'),
(288, 128, '/data/sp_128/3-8-768x768.jpg', '2024-07-03 20:02:44'),
(289, 128, '/data/sp_128/4-8-768x768.jpg', '2024-07-03 20:02:44'),
(290, 128, '/data/sp_128/5-6-768x768.jpg', '2024-07-03 20:02:44'),
(291, 129, '/data/sp_129/3-7-768x768.jpg', '2024-07-03 20:02:44'),
(292, 130, '/data/sp_130/3-6-768x768.jpg', '2024-07-03 20:02:44'),
(293, 130, '/data/sp_130/4-6-768x768.jpg', '2024-07-03 20:02:44'),
(294, 130, '/data/sp_130/5-5-scaled.jpg', '2024-07-03 20:02:44'),
(295, 131, '/data/sp_131/3-5-768x768.jpg', '2024-07-03 20:02:44'),
(296, 132, '/data/sp_132/3-4-768x768.jpg', '2024-07-03 20:02:44'),
(297, 132, '/data/sp_132/4-4-768x768.jpg', '2024-07-03 20:02:44'),
(298, 132, '/data/sp_132/5-4-768x768.jpg', '2024-07-03 20:02:44'),
(299, 133, '/data/sp_133/3-2-768x768.jpg', '2024-07-03 20:02:44'),
(300, 133, '/data/sp_133/4-2-768x768.jpg', '2024-07-03 20:02:44'),
(301, 133, '/data/sp_133/5-2-768x768.jpg', '2024-07-03 20:02:44'),
(302, 134, '/data/sp_134/3-1-768x768.jpg', '2024-07-03 20:02:44'),
(303, 134, '/data/sp_134/4-1-768x768.jpg', '2024-07-03 20:02:44'),
(304, 134, '/data/sp_134/5-1-768x768.jpg', '2024-07-03 20:02:44'),
(305, 135, '/data/sp_135/3-768x768.jpg', '2024-07-03 20:02:44'),
(306, 135, '/data/sp_135/4-768x768.jpg', '2024-07-03 20:02:44'),
(307, 135, '/data/sp_135/5-768x768.jpg', '2024-07-03 20:02:44'),
(308, 136, '/data/sp_136/4-15-768x768.jpg', '2024-07-03 20:02:44'),
(309, 137, '/data/sp_137/3-14-768x768.jpg', '2024-07-03 20:02:44'),
(310, 138, '/data/sp_138/3-9-768x768.jpg', '2024-07-03 20:02:44'),
(311, 139, '/data/sp_139/3-3-768x768.jpg', '2024-07-03 20:02:44'),
(312, 140, '/data/sp_140/1-16-768x768.jpg', '2024-07-03 20:02:44'),
(313, 140, '/data/sp_140/2-17-768x768.jpg', '2024-07-03 20:02:44'),
(314, 140, '/data/sp_140/khang-sinh-vit-ngan-01-768x543.jpg', '2024-07-03 20:02:44'),
(315, 140, '/data/sp_140/Untitled-1-768x768.jpg', '2024-07-03 20:02:44'),
(316, 141, '/data/sp_141/DSC00387-Edit-1-768x768.jpg', '2024-07-03 20:02:44'),
(317, 141, '/data/sp_141/DSC00390-Edit-1-768x768.jpg', '2024-07-03 20:02:44'),
(318, 141, '/data/sp_141/DSC00393-Edit-1-768x768.jpg', '2024-07-03 20:02:44'),
(319, 141, '/data/sp_141/DSC00396-Edit-1-768x768.jpg', '2024-07-03 20:02:44'),
(320, 141, '/data/sp_141/DSC00401-Edit-Edit-1-768x768.jpg', '2024-07-03 20:02:44'),
(321, 142, '/data/sp_142/379cc3ab-8eed-4a13-8c7a-de9bd5f8309d.png', '2024-07-03 20:02:44'),
(322, 143, '/data/sp_143/3-14-768x768.jpg', '2024-07-03 20:02:44'),
(323, 143, '/data/sp_143/4-13-768x768.jpg', '2024-07-03 20:02:44'),
(324, 143, '/data/sp_143/5-4-768x768.jpg', '2024-07-03 20:02:44'),
(325, 144, '/data/sp_144/DSC00927-Edit-768x768.jpg', '2024-07-03 20:02:44'),
(326, 145, '/data/sp_145/3-3-768x768.jpg', '2024-07-03 20:02:44'),
(327, 145, '/data/sp_145/z4374543881019_7ed4ae075ba3554e63952018158ccc96-768x768.jpg', '2024-07-03 20:02:44'),
(328, 146, '/data/sp_146/Dung-dich-truyen-Glucose-5-tri-mat-nuoc-o-gia-suc-heo-cho-meo - Copy.jpg', '2024-07-03 20:02:44'),
(329, 146, '/data/sp_146/Dung-dich-truyen-Glucose-5-tri-mat-nuoc-o-gia-suc-heo-cho-meo.jpg', '2024-07-03 20:02:44'),
(330, 147, '/data/sp_147/Drycloxaject-phong-tri-benh-viem-vu-cho-gia-suc-o-giai-doan-can-sua - Copy.jpg', '2024-07-03 20:02:44'),
(331, 147, '/data/sp_147/Drycloxaject-phong-tri-benh-viem-vu-cho-gia-suc-o-giai-doan-can-sua.jpg', '2024-07-03 20:02:44'),
(332, 148, '/data/sp_148/Khang-sinh-Gentaguard-10-Injection-dac-tri-benh-cho-gia-suc - Copy.jpg', '2024-07-03 20:02:44'),
(333, 148, '/data/sp_148/Khang-sinh-Gentaguard-10-Injection-dac-tri-benh-cho-gia-suc.jpg', '2024-07-03 20:02:44'),
(334, 149, '/data/sp_149/Khang-sinh-Enroguard - Copy.jpg', '2024-07-03 20:02:44'),
(335, 149, '/data/sp_149/Khang-sinh-Enroguard.jpg', '2024-07-03 20:02:44'),
(336, 150, '/data/sp_150/Khang-sinh-Enrophar-0-5-Oral-tri-nhiem-trung-ho-hap-tieu-hoa-o-heo - Copy.jpg', '2024-07-03 20:02:44'),
(337, 150, '/data/sp_150/Khang-sinh-Enrophar-0-5-Oral-tri-nhiem-trung-ho-hap-tieu-hoa-o-heo.jpg', '2024-07-03 20:02:44'),
(338, 151, '/data/sp_151/Fermin-Tab-hon-hop-vitamin-ho-tro-qua-trinh-tao-mau - Copy.jpg', '2024-07-03 20:02:44'),
(339, 151, '/data/sp_151/Fermin-Tab-hon-hop-vitamin-ho-tro-qua-trinh-tao-mau.jpg', '2024-07-03 20:02:44'),
(340, 152, '/data/sp_152/Khang-sinh-Amoxclamed-500-tri-cac-benh-nhiem-trung-tren-cho.jpg', '2024-07-03 20:02:44'),
(341, 152, '/data/sp_152/Khang-sinh-amoxclamed-500.jpg', '2024-07-03 20:02:44'),
(342, 153, '/data/sp_153/Dau-tam-Modern-Pet-Dermacare-100ml.jpg', '2024-07-03 20:02:44'),
(343, 153, '/data/sp_153/Dau-tam-Modern-Pet-Dermacare-250ml.jpg', '2024-07-03 20:02:44'),
(344, 153, '/data/sp_153/Dau-tam-Modern-Pet-Dermacare-tri-nam-da-tren-cho-meo.jpg', '2024-07-03 20:02:44'),
(345, 154, '/data/sp_154/vac-xin-tai-to-hop-phong-benh-cum-gia-cam-h5n1-chung-re-6 - Copy.jpg', '2024-07-03 20:02:44'),
(346, 154, '/data/sp_154/vac-xin-tai-to-hop-phong-benh-cum-gia-cam-h5n1-chung-re-6.jpg', '2024-07-03 20:02:44'),
(347, 155, '/data/sp_155/Vac-xin-dong-kho-phong-benh-tai-xanh-chung-jxa-r - Copy.jpg', '2024-07-03 20:02:44'),
(348, 155, '/data/sp_155/Vac-xin-dong-kho-phong-benh-tai-xanh-chung-jxa-r.jpg', '2024-07-03 20:02:44'),
(349, 155, '/data/sp_155/Vaccine-phong-benh-heo-tai-xanh-chung-jxa-r.jpg', '2024-07-03 20:02:44'),
(350, 155, '/data/sp_155/Vaccine-tai-xanh-chung-jxa-r.jpg', '2024-07-03 20:02:44'),
(351, 156, '/data/sp_156/Khang-sinh-pho-rong-Advance-Amoxclavu-S-cho-cho-meo - Copy.jpg', '2024-07-03 20:02:44'),
(352, 156, '/data/sp_156/Khang-sinh-pho-rong-Advance-Amoxclavu-S-cho-cho-meo.jpg', '2024-07-03 20:02:44'),
(353, 157, '/data/sp_157/Felipro-8kg-Thuc-an-cao-cap-danh-cho-meo-moi-lua-tuoi - Copy.jpg', '2024-07-03 20:02:44'),
(354, 157, '/data/sp_157/Felipro-8kg-Thuc-an-cao-cap-danh-cho-meo-moi-lua-tuoi.jpg', '2024-07-03 20:02:44'),
(355, 158, '/data/sp_158/Khang-sinh-Amoxivet-50-Powder-tri-benh-ho-hap-tieu-hoa-o-gia-cam-heo - Copy.jpg', '2024-07-03 20:02:44'),
(356, 158, '/data/sp_158/Khang-sinh-Amoxivet-50-Powder-tri-benh-ho-hap-tieu-hoa-o-gia-cam-heo.jpg', '2024-07-03 20:02:44'),
(357, 159, '/data/sp_159/Sua-tam-Modern-Pet-Sunny-Gel-danh-cho-cho-long-trang - Copy.jpg', '2024-07-03 20:02:44'),
(358, 159, '/data/sp_159/Sua-tam-Modern-Pet-Sunny-Gel-danh-cho-cho-long-trang.jpg', '2024-07-03 20:02:44'),
(359, 160, '/data/sp_160/Khang-sinh-Nalistin-10-tri-nhiem-trung-duong-tieu-hoa-do-khuan-E-Coli-tren-heo-va-gia-cam - Copy.jpg', '2024-07-03 20:02:44'),
(360, 160, '/data/sp_160/Khang-sinh-Nalistin-10-tri-nhiem-trung-duong-tieu-hoa-do-khuan-E-Coli-tren-heo-va-gia-cam.jpg', '2024-07-03 20:02:44'),
(361, 161, '/data/sp_161/Sua-tam-Modern-Pet-Lucky-Gel-cho-cho-meo-co-long-nau-long-nau-do - Copy.jpg', '2024-07-03 20:02:44'),
(362, 161, '/data/sp_161/Sua-tam-Modern-Pet-Lucky-Gel-cho-cho-meo-co-long-nau-long-nau-do.jpg', '2024-07-03 20:02:44'),
(363, 162, '/data/sp_162/Thuoc-minical-bo-sung-Canxi-Photpho-va-Vitamin-A-D3-C-danh-cho-thu-tam-nho - Copy.jpg', '2024-07-03 20:02:44'),
(364, 162, '/data/sp_162/Thuoc-minical-bo-sung-Canxi-Photpho-va-Vitamin-A-D3-C-danh-cho-thu-tam-nho.jpg', '2024-07-03 20:02:44'),
(365, 163, '/data/sp_163/Sua-tam-Modern-Pet-Sweetie-Gel-khu-mui-tao-kieu-cho-cho-meo - Copy.jpg', '2024-07-03 20:02:44'),
(366, 163, '/data/sp_163/Sua-tam-Modern-Pet-Sweetie-Gel-khu-mui-tao-kieu-cho-cho-meo.jpg', '2024-07-03 20:02:44'),
(367, 164, '/data/sp_164/Khang-sinh-Marbovet-80-tri-nhiem-trung-da-va-mo-mem-tren-cho - Copy.jpg', '2024-07-03 20:02:44'),
(368, 164, '/data/sp_164/Khang-sinh-Marbovet-80-tri-nhiem-trung-da-va-mo-mem-tren-cho.jpg', '2024-07-03 20:02:44'),
(369, 165, '/data/sp_165/KC-Pol-bo-sung-hon-hop-vitamin-khoang-va-axit-amin - Copy.jpg', '2024-07-03 20:02:44'),
(370, 165, '/data/sp_165/KC-Pol-bo-sung-hon-hop-vitamin-khoang-va-axit-amin.jpg', '2024-07-03 20:02:44'),
(371, 166, '/data/sp_166/Actifarm-bo-sung-Bacillus-subtilis-cai-thien-tieu-hoa-cho-vat-nuoi - Copy.jpg', '2024-07-03 20:02:44'),
(372, 166, '/data/sp_166/Actifarm-bo-sung-Bacillus-subtilis-cai-thien-tieu-hoa-cho-vat-nuoi.jpg', '2024-07-03 20:02:44'),
(373, 166, '/data/sp_166/Actifarm100g.jpg', '2024-07-03 20:02:44'),
(374, 167, '/data/sp_167/Thuoc-bo-Hairry-dang-vien-bo-sung-Vitamin-A-D3-E-cho-cho.jpg', '2024-07-03 20:02:44'),
(375, 167, '/data/sp_167/Vien-nhai-Hairry-bo-sung-sat-cho-cho.jpg', '2024-07-03 20:02:44'),
(376, 168, '/data/sp_168/Dau-tam-Roy-lam-mem-diu-da-long-cho-cho-meo - Copy.jpg', '2024-07-03 20:02:44'),
(377, 168, '/data/sp_168/Dau-tam-Roy-lam-mem-diu-da-long-cho-cho-meo.jpg', '2024-07-03 20:02:44'),
(378, 169, '/data/sp_169/pate-cho-cho-Hi-Diet-Dog-Food-Tuna-Chicken-Lamb-flavour - Copy.jpg', '2024-07-03 20:02:44'),
(379, 169, '/data/sp_169/pate-cho-cho-Hi-Diet-Dog-Food-Tuna-Chicken-Lamb-flavour.jpg', '2024-07-03 20:02:44'),
(380, 170, '/data/sp_170/Pate-cho-meo-Hi-Diet-Cat-Food-Tuna-Chicken-flavour - Copy.jpg', '2024-07-03 20:02:44'),
(381, 170, '/data/sp_170/Pate-cho-meo-Hi-Diet-Cat-Food-Tuna-Chicken-flavour.jpg', '2024-07-03 20:02:44'),
(382, 171, '/data/sp_171/Thanh-phan-Doxicure-50 - Copy.jpg', '2024-07-03 20:02:44'),
(383, 171, '/data/sp_171/Thanh-phan-Doxicure-50.jpg', '2024-07-03 20:02:44'),
(384, 172, '/data/sp_172/Khang-sinh-Lincospecvet - Copy.jpg', '2024-07-03 20:02:44'),
(385, 172, '/data/sp_172/Khang-sinh-Lincospecvet.jpg', '2024-07-03 20:02:44'),
(386, 173, '/data/sp_173/Khang-sinh-tilmiguard.jpg', '2024-07-03 20:02:44'),
(387, 173, '/data/sp_173/khang-viem-Keprofen-10-tren-gia-suc-heo-cho-meo.jpg', '2024-07-03 20:02:44'),
(388, 174, '/data/sp_174/khang-viem-Keprofen-10-tren-gia-suc-heo-cho-meo - Copy.jpg', '2024-07-03 20:02:44'),
(389, 174, '/data/sp_174/khang-viem-Keprofen-10-tren-gia-suc-heo-cho-meo.jpg', '2024-07-03 20:02:44'),
(390, 175, '/data/sp_175/Vien-Ketoconazole-giup-tri-nam-da-hoac-khang-nam-tren-cho - Copy.jpg', '2024-07-03 20:02:44'),
(391, 175, '/data/sp_175/Vien-Ketoconazole-giup-tri-nam-da-hoac-khang-nam-tren-cho.jpg', '2024-07-03 20:02:44'),
(392, 176, '/data/sp_176/Vaccine-Newcastle-Bronchitis-B1-type-B1-strain-Mass-and-Conn-Types-Live-Virus - Copy.jpg', '2024-07-03 20:02:44'),
(393, 176, '/data/sp_176/Vaccine-Newcastle-Bronchitis-B1-type-B1-strain-Mass-and-Conn-Types-Live-Virus.jpg', '2024-07-03 20:02:44'),
(394, 177, '/data/sp_177/Scocvac-4-phong-benh-cau-trung-o-ga.jpg', '2024-07-03 20:02:44'),
(395, 177, '/data/sp_177/Vac-xin-da-gia-Scocvac-4-phong-benh-cau-trung-cho-ga-150x150.jpg', '2024-07-03 20:02:44'),
(396, 177, '/data/sp_177/Vac-xin-Scocvac-4-phong-benh-cau-trung-o-ga-long-mau-45-ngay-tuoi.jpg', '2024-07-03 20:02:44'),
(397, 178, '/data/sp_178/Scocvac-3-phong-benh-cau-trung-ga-thit-duoi-45-ngay.jpg', '2024-07-03 20:02:44'),
(398, 178, '/data/sp_178/Vaccine-gia-cam-scocvac-3-phong-benh-cau-trung-o-ga.jpg', '2024-07-03 20:02:44'),
(399, 178, '/data/sp_178/Vaccine-nhuoc-doc-tam-gia-Scocvac-3-phong-benh-cau-trung-o-ga-150x150.jpg', '2024-07-03 20:02:44'),
(400, 179, '/data/sp_179/XO-SAVE-1l-giup-cai-thien-ho-hap-luu-thong-khi.jpg', '2024-07-03 20:02:44'),
(401, 179, '/data/sp_179/XO-SAVE-250ml-giup-cai-thien-ho-hap-luu-thong-khi.jpg', '2024-07-03 20:02:44'),
(402, 179, '/data/sp_179/XO-SAVE-giup-cai-thien-ho-hap-luu-thong-khi.jpg', '2024-07-03 20:02:44'),
(403, 180, '/data/sp_180/Khang-sinh-amoxiguard-15 - Copy.jpg', '2024-07-03 20:02:44'),
(404, 180, '/data/sp_180/Khang-sinh-amoxiguard-15.jpg', '2024-07-03 20:02:44'),
(405, 181, '/data/sp_181/Khang-sinh-amoxivet-15 - Copy.jpg', '2024-07-03 20:02:44'),
(406, 181, '/data/sp_181/Khang-sinh-amoxivet-15.jpg', '2024-07-03 20:02:44'),
(407, 182, '/data/sp_182/Khang-sinh-ampi-200 - Copy.jpg', '2024-07-03 20:02:44'),
(408, 182, '/data/sp_182/Khang-sinh-ampi-200.jpg', '2024-07-03 20:02:44'),
(409, 183, '/data/sp_183/Vaccine-cum-gia-cam-H5N1-chung-Re-1 - Copy.jpg', '2024-07-03 20:02:44'),
(410, 183, '/data/sp_183/Vaccine-cum-gia-cam-H5N1-chung-Re-1.jpg', '2024-07-03 20:02:44'),
(411, 184, '/data/sp_184/sua-tam-modern-pet-gel-giup-kiem-soat-bo-chay-ran-ve-tren-cho-150x150 - Copy.jpg', '2024-07-03 20:02:44'),
(412, 184, '/data/sp_184/sua-tam-modern-pet-gel-giup-kiem-soat-bo-chay-ran-ve-tren-cho-150x150.jpg', '2024-07-03 20:02:44'),
(413, 185, '/data/sp_185/petty-gel-22-b - Copy.jpg', '2024-07-03 20:02:44'),
(414, 185, '/data/sp_185/petty-gel-22-b.jpg', '2024-07-03 20:02:44'),
(415, 185, '/data/sp_185/Petty-gel-a-2022.jpg', '2024-07-03 20:02:44'),
(416, 186, '/data/sp_186/DSC00838-Edit-scaled.jpg', '2024-07-03 20:02:44'),
(417, 186, '/data/sp_186/DSC00839-Edit-600x600 - Copy.jpg', '2024-07-03 20:02:44'),
(418, 186, '/data/sp_186/DSC00839-Edit-600x600.jpg', '2024-07-03 20:02:44'),
(419, 187, '/data/sp_187/DSC00765-Edit-scaled.jpg', '2024-07-03 20:02:44'),
(420, 187, '/data/sp_187/DSC00771-Edit-scaled.jpg', '2024-07-03 20:02:44'),
(421, 187, '/data/sp_187/DSC00775-Edit-scaled.jpg', '2024-07-03 20:02:44'),
(422, 188, '/data/sp_188/3-24-scaled.jpg', '2024-07-03 20:02:44'),
(423, 188, '/data/sp_188/Damong-01-scaled.jpg', '2024-07-03 20:02:44'),
(424, 189, '/data/sp_189/3-21-scaled.jpg', '2024-07-03 20:02:44'),
(425, 189, '/data/sp_189/DAMONG-SPRAY-100ml-01-scaled.jpg', '2024-07-03 20:02:44'),
(426, 190, '/data/sp_190/3-32-scaled - Copy.jpg', '2024-07-03 20:02:44'),
(427, 190, '/data/sp_190/3-32-scaled.jpg', '2024-07-03 20:02:44'),
(428, 191, '/data/sp_191/DSC00572-Edit-1-scaled.jpg', '2024-07-03 20:02:44'),
(429, 191, '/data/sp_191/DSC00573-Edit-1-scaled.jpg', '2024-07-03 20:02:44'),
(430, 191, '/data/sp_191/DSC00575-Edit-1-scaled.jpg', '2024-07-03 20:02:44'),
(431, 192, '/data/sp_192/DSC00995-Edit-scaled - Copy.jpg', '2024-07-03 20:02:44'),
(432, 192, '/data/sp_192/DSC00995-Edit-scaled.jpg', '2024-07-03 20:02:44'),
(433, 193, '/data/sp_193/DSC00530-Edit-1-scaled.jpg', '2024-07-03 20:02:44'),
(434, 193, '/data/sp_193/DSC00531-Edit-1-scaled.jpg', '2024-07-03 20:02:44'),
(435, 193, '/data/sp_193/DSC00532-Edit-1-scaled.jpg', '2024-07-03 20:02:44'),
(436, 194, '/data/sp_194/DSC00302-Edit-1-scaled.jpg', '2024-07-03 20:02:44'),
(437, 194, '/data/sp_194/DSC00308-Edit-1-scaled.jpg', '2024-07-03 20:02:44'),
(438, 194, '/data/sp_194/DSC00312-Edit-1-scaled.jpg', '2024-07-03 20:02:44'),
(439, 195, '/data/sp_195/DSC00239-Edit-1-scaled.jpg', '2024-07-03 20:02:44'),
(440, 195, '/data/sp_195/DSC00240-Edit-1-scaled.jpg', '2024-07-03 20:02:44'),
(441, 195, '/data/sp_195/DSC00243-Edit-1-scaled.jpg', '2024-07-03 20:02:44'),
(442, 196, '/data/sp_196/DSC00980-Edit-scaled - Copy.jpg', '2024-07-03 20:02:44'),
(443, 196, '/data/sp_196/DSC00980-Edit-scaled.jpg', '2024-07-03 20:02:44'),
(444, 197, '/data/sp_197/DSC00592-Edit-1-scaled.jpg', '2024-07-03 20:02:44'),
(445, 197, '/data/sp_197/DSC00594-Edit-1-scaled.jpg', '2024-07-03 20:02:44'),
(446, 197, '/data/sp_197/DSC00596-Edit-1-scaled.jpg', '2024-07-03 20:02:44'),
(447, 198, '/data/sp_198/DSC00544-Edit-1-scaled.jpg', '2024-07-03 20:02:44'),
(448, 198, '/data/sp_198/DSC00545-Edit-1-scaled.jpg', '2024-07-03 20:02:44'),
(449, 198, '/data/sp_198/DSC00547-Edit-1-scaled.jpg', '2024-07-03 20:02:44'),
(450, 199, '/data/sp_199/DSC00366-Edit-1-scaled.jpg', '2024-07-03 20:02:44'),
(451, 199, '/data/sp_199/DSC00372-Edit-1-scaled.jpg', '2024-07-03 20:02:44'),
(452, 199, '/data/sp_199/DSC00375-Edit-1-scaled.jpg', '2024-07-03 20:02:44'),
(453, 199, '/data/sp_199/DSC00380-Edit-1-scaled.jpg', '2024-07-03 20:02:44'),
(454, 200, '/data/sp_200/DSC00102-Edit-1-scaled.jpg', '2024-07-03 20:02:44'),
(455, 200, '/data/sp_200/DSC00104-Edit-1-scaled.jpg', '2024-07-03 20:02:44'),
(456, 200, '/data/sp_200/Untitled-1-scaled.jpg', '2024-07-03 20:02:44');

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
  `pre_value` text DEFAULT NULL,
  `post_value` text DEFAULT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `log`
--

INSERT INTO `log` (`id`, `level_id`, `ip`, `address`, `pre_value`, `post_value`, `create_at`) VALUES
(831, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '72: Login by 3 success. Congratulation!', '2024-07-06 13:57:43'),
(832, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '69: Login by 2 success. Congratulation!', '2024-07-06 14:00:24'),
(833, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '73: Login by 4 success. Congratulation!', '2024-07-06 21:24:48'),
(834, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '70: Login by 1 success. Congratulation!', '2024-07-06 22:02:59'),
(835, 1, '0:0:0:0:0:0:0:1', '/user/verify', 'Old password of ID=66 is $2a$10$00FCoRTwPuoYIZSmf4IOQeuU/dul4BucVLGpX86SoPGfvD8dRuz3i', 'Update password successfully! New password of ID=66 is $2a$10$00FCoRTwPuoYIZSmf4IOQeuU/dul4BucVLGpX86SoPGfvD8dRuz3i', '2024-07-06 22:13:21'),
(836, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '74: Login by 5 success. Congratulation!', '2024-07-07 01:22:48'),
(837, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '67: Login by 1 success. Congratulation!', '2024-07-07 01:24:52'),
(838, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '69: Login by 2 success. Congratulation!', '2024-07-07 01:59:59'),
(839, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old avatar of ID=69 is https://scontent-hkg4-2.xx.fbcdn.net/v/t1.30497-1/84628273_176159830277856_972693363922829312_n.jpg?stp=c15.0.50.50a_cp0_dst-jpg_p50x50&_nc_cat=1&ccb=1-7&_nc_sid=7565cd&_nc_eui2=AeGNlck_Ci0n0VQuBLi066dWik--Qfnh2B6KT75B-eHYHqM37wnh4sYcNki_GK1hPY3gFDX86wilfJrZGNQTkIhU&_nc_ohc=difA8UY_M0wQ7kNvgG3Yttp&_nc_ht=scontent-hkg4-2.xx&edm=AP4hL3IEAAAA&oh=00_AYCUYyfDoxXSpnR3JXq31MGZr0xAp0DM0XPj4ceYjBKMpQ&oe=66A21819', 'New avatar of ID=69 is https://scontent-hkg4-2.xx.fbcdn.net/v/t1.30497-1/84628273_176159830277856_972693363922829312_n.jpg?stp=c15.0.50.50a_cp0_dst-jpg_p50x50&_nc_cat=1&ccb=1-7&_nc_sid=7565cd&_nc_eui2=AeGNlck_Ci0n0VQuBLi066dWik--Qfnh2B6KT75B-eHYHqM37wnh4sYcNki_GK1hPY3gFDX86wilfJrZGNQTkIhU&_nc_ohc=difA8UY_M0wQ7kNvgG3Yttp&_nc_ht=scontent-hkg4-2.xx&edm=AP4hL3IEAAAA&oh=00_AYCUYyfDoxXSpnR3JXq31MGZr0xAp0DM0XPj4ceYjBKMpQ&oe=66A21819', '2024-07-07 02:00:14'),
(840, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '73: Login by 4 success. Congratulation!', '2024-07-07 02:03:33'),
(841, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old avatar of ID=73 is c6ae0d72fd50ad23b2b138691677fa15', 'New avatar of ID=73 is c6ae0d72fd50ad23b2b138691677fa15', '2024-07-07 02:04:48'),
(842, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '70: Login by 1 success. Congratulation!', '2024-07-07 02:10:24'),
(843, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old avatar of ID=70 is https://lh3.googleusercontent.com/a/ACg8ocLRN9ohOUxOWR5xr0fch3t6YlgEXwZEmjDyvtSQUs3bTC-BIsQ=s96-c', 'New avatar of ID=70 is https://lh3.googleusercontent.com/a/ACg8ocLRN9ohOUxOWR5xr0fch3t6YlgEXwZEmjDyvtSQUs3bTC-BIsQ=s96-c', '2024-07-07 02:10:39'),
(844, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old avatar of ID=70 is https://lh3.googleusercontent.com/a/ACg8ocLRN9ohOUxOWR5xr0fch3t6YlgEXwZEmjDyvtSQUs3bTC-BIsQ=s96-c', 'New avatar of ID=70 is https://lh3.googleusercontent.com/a/ACg8ocLRN9ohOUxOWR5xr0fch3t6YlgEXwZEmjDyvtSQUs3bTC-BIsQ=s96-c', '2024-07-07 02:10:46'),
(845, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old avatar of ID=70 is https://lh3.googleusercontent.com/a/ACg8ocLRN9ohOUxOWR5xr0fch3t6YlgEXwZEmjDyvtSQUs3bTC-BIsQ=s96-c', 'New avatar of ID=70 is https://lh3.googleusercontent.com/a/ACg8ocLRN9ohOUxOWR5xr0fch3t6YlgEXwZEmjDyvtSQUs3bTC-BIsQ=s96-c', '2024-07-07 02:10:52'),
(846, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '73: Login by 4 success. Congratulation!', '2024-07-07 02:12:25'),
(847, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old avatar of ID=73 is c6ae0d72fd50ad23b2b138691677fa15', 'New avatar of ID=73 is c6ae0d72fd50ad23b2b138691677fa15', '2024-07-07 02:12:36'),
(848, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '68: Login by 1 success. Congratulation!', '2024-07-07 03:25:46'),
(849, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '69: Login by 2 success. Congratulation!', '2024-07-07 03:29:48'),
(850, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '69: Login by 2 success. Congratulation!', '2024-07-07 03:32:58'),
(851, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '69: Login by 2 success. Congratulation!', '2024-07-07 03:35:14'),
(852, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '69: Login by 2 success. Congratulation!', '2024-07-07 03:44:03'),
(853, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old avatar of ID=69 is CG.jpg', 'New avatar of ID=69 is CG.jpg', '2024-07-07 03:44:11'),
(854, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old avatar of ID=69 is NT.jpg', 'New avatar of ID=69 is NT.jpg', '2024-07-07 03:46:39'),
(855, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old avatar of ID=69 is CG.jpg', 'New avatar of ID=69 is CG.jpg', '2024-07-07 03:47:10'),
(856, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old avatar of ID=69 is NT.jpg', 'New avatar of ID=69 is NT.jpg', '2024-07-07 03:47:24'),
(857, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old avatar of ID=69 is Cart Management.jpg', 'New avatar of ID=69 is Cart Management.jpg', '2024-07-07 03:48:46'),
(858, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old avatar of ID=69 is Untitled1.png', 'New avatar of ID=69 is Untitled1.png', '2024-07-07 03:48:51'),
(859, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old avatar of ID=69 is CG.jpg', 'New avatar of ID=69 is CG.jpg', '2024-07-07 03:50:19'),
(860, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old avatar of ID=69 is react.png', 'New avatar of ID=69 is react.png', '2024-07-07 03:50:26'),
(861, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '72: Login by 3 success. Congratulation!', '2024-07-07 03:50:57'),
(862, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old avatar of ID=72 is react.png', 'New avatar of ID=72 is react.png', '2024-07-07 03:51:04'),
(863, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '69: Login by 2 success. Congratulation!', '2024-07-07 19:57:20'),
(864, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old avatar of ID=69 is CG.jpg', 'New avatar of ID=69 is CG.jpg', '2024-07-07 19:57:27'),
(865, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '72: Login by 3 success. Congratulation!', '2024-07-07 19:58:28'),
(866, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '69: Login by 2 success. Congratulation!', '2024-07-07 20:00:44'),
(867, 2, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, 'Login failed. The new user is not in database!', '2024-07-07 20:01:15'),
(868, 2, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, 'Login failed. The new user is not in database!', '2024-07-07 20:01:19'),
(869, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '75: Login by 5 success. Congratulation!', '2024-07-07 20:02:11'),
(870, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '76: Login by 3 success. Congratulation!', '2024-07-07 20:02:34'),
(871, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '75: Login by 5 success. Congratulation!', '2024-07-07 20:02:41'),
(872, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '76: Login by 3 success. Congratulation!', '2024-07-07 20:03:02'),
(873, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '75: Login by 5 success. Congratulation!', '2024-07-07 20:28:27'),
(874, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-07-07 20:28:54'),
(875, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-07-07 20:28:59'),
(876, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, '77: Register success. Congratulation!', '2024-07-07 20:29:11'),
(877, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '21130556@st.hcmuaf.edu.vn: Your account has verified successfully. Congratulation!', '2024-07-07 20:29:25'),
(878, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=77', '2024-07-07 20:29:34'),
(879, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-07 20:29:34'),
(880, 2, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, 'Login failed. The new user is not in database!', '2024-07-07 22:10:01'),
(881, 2, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, 'Login failed. The new user is not in database!', '2024-07-07 22:10:07'),
(882, 2, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, 'Login failed. The new user is not in database!', '2024-07-07 22:10:18'),
(883, 2, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, 'Login failed. The new user is not in database!', '2024-07-07 22:10:21'),
(884, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '78: Login by 1 success. Congratulation!', '2024-07-07 22:10:27'),
(885, 2, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, 'Login failed. The new user is not in database!', '2024-07-07 22:10:53'),
(886, 2, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, 'Login failed. The new user is not in database!', '2024-07-07 22:11:02'),
(887, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '78: Login by 1 success. Congratulation!', '2024-07-07 22:11:09'),
(888, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '79: Login by 4 success. Congratulation!', '2024-07-07 22:11:31'),
(889, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '76: Login by 3 success. Congratulation!', '2024-07-07 22:11:47'),
(890, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '75: Login by 5 success. Congratulation!', '2024-07-07 22:12:25'),
(891, 2, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, 'Login failed. The new user is not in database!', '2024-07-07 22:12:34'),
(892, 2, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, 'Login failed. The new user is not in database!', '2024-07-07 22:13:45'),
(893, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '80: Login by 2 success. Congratulation!', '2024-07-07 22:15:57'),
(894, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '78: Login by 1 success. Congratulation!', '2024-07-07 22:16:27'),
(895, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '79: Login by 4 success. Congratulation!', '2024-07-07 22:16:35'),
(896, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '76: Login by 3 success. Congratulation!', '2024-07-07 22:16:43'),
(897, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '75: Login by 5 success. Congratulation!', '2024-07-07 22:16:47'),
(898, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=77', '2024-07-07 22:16:59'),
(899, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-07 22:16:59'),
(900, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=77', '2024-07-07 22:28:17'),
(901, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-07 22:28:17'),
(902, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=77', '2024-07-07 22:28:52'),
(903, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-07 22:28:52'),
(904, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', NULL, 'Load successfully with ID=77', '2024-07-07 22:30:44'),
(905, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', NULL, 'Load successfully with ID=77', '2024-07-07 22:30:46'),
(906, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', NULL, 'Load successfully with ID=77', '2024-07-07 22:30:50'),
(907, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', NULL, 'Load successfully with ID=77', '2024-07-07 22:30:53'),
(908, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', NULL, 'Load successfully with ID=77', '2024-07-07 22:30:55'),
(909, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=77', '2024-07-07 22:47:39'),
(910, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-07 22:47:39'),
(911, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=77', '2024-07-07 22:54:46'),
(912, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-07 22:54:46'),
(913, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=77', '2024-07-07 22:57:04'),
(914, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-07 22:57:04'),
(915, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=77', '2024-07-07 22:57:26'),
(916, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-07 22:57:26'),
(917, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=77', '2024-07-07 22:57:28'),
(918, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-07 22:57:28'),
(919, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=77', '2024-07-07 22:59:15'),
(920, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-07 22:59:15'),
(921, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=77', '2024-07-07 22:59:55'),
(922, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-07 22:59:55'),
(923, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=77', '2024-07-07 23:02:27'),
(924, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-07 23:02:27'),
(925, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=77', '2024-07-07 23:04:31'),
(926, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-07 23:04:31'),
(927, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=77', '2024-07-07 23:18:21'),
(928, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-07 23:18:21'),
(929, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=77', '2024-07-07 23:20:21'),
(930, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-07 23:20:21'),
(931, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=77', '2024-07-07 23:22:46'),
(932, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-07 23:22:46'),
(933, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=77', '2024-07-07 23:26:03'),
(934, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-07 23:26:03'),
(935, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old avatar of ID=77 is CG.jpg', 'New avatar of ID=77 is CG.jpg', '2024-07-07 23:26:44'),
(936, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old avatar of ID=77 is NT.jpg', 'New avatar of ID=77 is NT.jpg', '2024-07-07 23:26:55'),
(937, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old avatar of ID=77 is CG.jpg', 'New avatar of ID=77 is CG.jpg', '2024-07-07 23:27:06'),
(938, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=77', '2024-07-07 23:28:37'),
(939, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-07 23:28:37'),
(940, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old avatar of ID=77 is CG.jpg', 'New avatar of ID=77 is CG.jpg', '2024-07-07 23:28:44'),
(941, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old avatar of ID=77 is NT.jpg', 'New avatar of ID=77 is NT.jpg', '2024-07-07 23:28:49'),
(942, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '80: Login by 2 success. Congratulation!', '2024-07-07 23:28:56'),
(943, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '80: Login by 2 success. Congratulation!', '2024-07-07 23:28:57'),
(944, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old avatar of ID=80 is CG.jpg', 'New avatar of ID=80 is CG.jpg', '2024-07-07 23:29:01'),
(945, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=77', '2024-07-07 23:37:17'),
(946, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-07 23:37:17'),
(947, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old avatar of ID=77 is CG.jpg', 'New avatar of ID=77 is CG.jpg', '2024-07-07 23:37:21'),
(948, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old avatar of ID=77 is NT.jpg', 'New avatar of ID=77 is NT.jpg', '2024-07-07 23:37:26'),
(949, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old avatar of ID=77 is Activity_ChangePassword.jpg', 'New avatar of ID=77 is Activity_ChangePassword.jpg', '2024-07-07 23:37:43'),
(950, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old avatar of ID=77 is Activity_ChangePassword.jpg', 'New avatar of ID=77 is Activity_ChangePassword.jpg', '2024-07-07 23:38:12'),
(951, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=77', '2024-07-07 23:39:57'),
(952, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-07 23:39:57'),
(953, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old avatar of ID=77 is CG.jpg', 'New avatar of ID=77 is CG.jpg', '2024-07-07 23:40:01'),
(954, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '81: Login by 1 success. Congratulation!', '2024-07-07 23:40:26'),
(955, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=77', '2024-07-07 23:42:00'),
(956, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-07 23:42:00'),
(957, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '81: Login by 1 success. Congratulation!', '2024-07-07 23:42:19'),
(958, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '80: Login by 2 success. Congratulation!', '2024-07-08 00:01:12'),
(959, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old avatar of ID=80 is /uploads/CG.jpg', 'New avatar of ID=80 is /uploads/CG.jpg', '2024-07-08 00:01:18'),
(960, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old avatar of ID=80 is /uploads/NT.jpg', 'New avatar of ID=80 is /uploads/NT.jpg', '2024-07-08 00:01:43'),
(961, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '80: Login by 2 success. Congratulation!', '2024-07-08 00:01:50'),
(962, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=77', '2024-07-08 00:23:37'),
(963, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-08 00:23:37'),
(964, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old avatar of ID=77 is /uploads/CG.jpg', 'New avatar of ID=77 is /uploads/CG.jpg', '2024-07-08 00:23:42'),
(965, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=77', '2024-07-08 00:27:30'),
(966, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-08 00:27:30'),
(967, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=77', '2024-07-08 00:48:17'),
(968, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-08 00:48:17'),
(969, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old avatar of ID=77 is /uploads/react.png', 'New avatar of ID=77 is /uploads/react.png', '2024-07-08 01:39:58'),
(970, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '80: Login by 2 success. Congratulation!', '2024-07-08 02:08:01'),
(971, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old avatar of ID=80 is /uploads/react.png', 'New avatar of ID=80 is /uploads/react.png', '2024-07-08 02:08:06'),
(972, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '80: Login by 2 success. Congratulation!', '2024-07-08 02:10:43'),
(973, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=77', '2024-07-08 02:14:59'),
(974, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-08 02:14:59'),
(975, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=77', '2024-07-08 02:16:47'),
(976, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-08 02:16:47'),
(977, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=77', '2024-07-08 02:19:59'),
(978, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-08 02:19:59'),
(979, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=77', '2024-07-08 02:21:08'),
(980, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-08 02:21:08'),
(981, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=77', '2024-07-08 02:22:50'),
(982, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-08 02:22:50'),
(983, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=77', '2024-07-08 02:24:27'),
(984, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-08 02:24:27'),
(985, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=77 is User(id=77, username=hoangnv, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$4PzgFAEfjc1siGc3AGalNeGBHsKb/85Lo1aThBjY6zcNKCF/qnDmK, fullName=null, dateOfBirth=null, city=null, district=null, ward=null, detail_address=null, phone=null, avatar=/uploads/react.png, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 20:29:11.0)', 'Update successfully! New user info of ID=77 is updated!', '2024-07-08 02:28:29'),
(986, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=77', '2024-07-08 02:30:12'),
(987, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-08 02:30:12'),
(988, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=77', '2024-07-08 02:32:03'),
(989, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-08 02:32:03'),
(990, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=77 is User(id=77, username=hoangnv, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$4PzgFAEfjc1siGc3AGalNeGBHsKb/85Lo1aThBjY6zcNKCF/qnDmK, fullName=null, dateOfBirth=null, city=null, district=null, ward=null, detail_address=null, phone=null, avatar=/uploads/react.png, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 20:29:11.0)', 'Update successfully! New user info of ID=77 is updated!', '2024-07-08 02:32:20'),
(991, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=77 is User(id=77, username=hoangnv, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$4PzgFAEfjc1siGc3AGalNeGBHsKb/85Lo1aThBjY6zcNKCF/qnDmK, fullName=null, dateOfBirth=null, city=null, district=null, ward=null, detail_address=null, phone=null, avatar=/uploads/react.png, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 20:29:11.0)', 'Update successfully! New user info of ID=77 is updated!', '2024-07-08 02:34:53'),
(992, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=77 is User(id=77, username=hoangnv, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$4PzgFAEfjc1siGc3AGalNeGBHsKb/85Lo1aThBjY6zcNKCF/qnDmK, fullName=null, dateOfBirth=null, city=null, district=null, ward=null, detail_address=null, phone=null, avatar=/uploads/react.png, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 20:29:11.0)', 'Load successfully with ID=77', '2024-07-08 02:34:53'),
(993, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=77', '2024-07-08 02:36:46'),
(994, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-08 02:36:46'),
(995, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=77 is User(id=77, username=hoangnv, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$4PzgFAEfjc1siGc3AGalNeGBHsKb/85Lo1aThBjY6zcNKCF/qnDmK, fullName=Dang NamThuan, dateOfBirth=2024-07-11, city=89, district=886, ward=0, detail_address=dsdsds, phone=0384774118, avatar=/uploads/react.png, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 20:29:11.0)', 'Update successfully! New user info of ID=77 is updated!', '2024-07-08 02:36:49'),
(996, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=77 is User(id=77, username=hoangnv, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$4PzgFAEfjc1siGc3AGalNeGBHsKb/85Lo1aThBjY6zcNKCF/qnDmK, fullName=Dang NamThuan, dateOfBirth=2024-07-11, city=89, district=886, ward=0, detail_address=dsdsds, phone=0384774118, avatar=/uploads/react.png, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 20:29:11.0)', 'Load successfully with ID=77', '2024-07-08 02:36:49'),
(997, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=77 is User(id=77, username=hoangnv, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$4PzgFAEfjc1siGc3AGalNeGBHsKb/85Lo1aThBjY6zcNKCF/qnDmK, fullName=Dang NamThuan, dateOfBirth=2024-07-11, city=0, district=0, ward=0, detail_address=dsdsds, phone=0384774118, avatar=/uploads/react.png, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 20:29:11.0)', 'Update successfully! New user info of ID=77 is updated!', '2024-07-08 02:36:57'),
(998, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=77 is User(id=77, username=hoangnv, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$4PzgFAEfjc1siGc3AGalNeGBHsKb/85Lo1aThBjY6zcNKCF/qnDmK, fullName=Dang NamThuan, dateOfBirth=2024-07-11, city=0, district=0, ward=0, detail_address=dsdsds, phone=0384774118, avatar=/uploads/react.png, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 20:29:11.0)', 'Load successfully with ID=77', '2024-07-08 02:36:57'),
(999, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=77', '2024-07-08 02:41:38'),
(1000, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-08 02:41:38'),
(1001, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=77 is User(id=77, username=hoangnv, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$4PzgFAEfjc1siGc3AGalNeGBHsKb/85Lo1aThBjY6zcNKCF/qnDmK, fullName=Dang NamThuan, dateOfBirth=2024-07-11, city=0, district=0, ward=0, detail_address=dsdsds, phone=0384774118, avatar=/uploads/react.png, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 20:29:11.0)', 'Update successfully! New user info of ID=77 is updated!', '2024-07-08 02:41:41'),
(1002, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=77 is User(id=77, username=hoangnv, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$4PzgFAEfjc1siGc3AGalNeGBHsKb/85Lo1aThBjY6zcNKCF/qnDmK, fullName=Dang NamThuan, dateOfBirth=2024-07-11, city=0, district=0, ward=0, detail_address=dsdsds, phone=0384774118, avatar=/uploads/react.png, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 20:29:11.0)', 'Load successfully with ID=77', '2024-07-08 02:41:41'),
(1003, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=77 is User(id=77, username=hoangnv, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$4PzgFAEfjc1siGc3AGalNeGBHsKb/85Lo1aThBjY6zcNKCF/qnDmK, fullName=Dang NamThuan, dateOfBirth=2024-07-11, city=0, district=0, ward=0, detail_address=dsdsds, phone=0384774118, avatar=/uploads/react.png, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 20:29:11.0)', 'Update successfully! New user info of ID=77 is updated!', '2024-07-08 02:42:23'),
(1004, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=77 is User(id=77, username=hoangnv, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$4PzgFAEfjc1siGc3AGalNeGBHsKb/85Lo1aThBjY6zcNKCF/qnDmK, fullName=Dang NamThuan, dateOfBirth=2024-07-11, city=0, district=0, ward=0, detail_address=dsdsds, phone=0384774118, avatar=/uploads/react.png, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 20:29:11.0)', 'Load successfully with ID=77', '2024-07-08 02:42:23'),
(1005, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=77 is User(id=77, username=hoangnv, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$4PzgFAEfjc1siGc3AGalNeGBHsKb/85Lo1aThBjY6zcNKCF/qnDmK, fullName=Dang NamThuan, dateOfBirth=2024-07-11, city=0, district=0, ward=0, detail_address=dsdsds, phone=0384774118, avatar=/uploads/react.png, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 20:29:11.0)', 'Update successfully! New user info of ID=77 is updated!', '2024-07-08 02:42:28'),
(1006, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=77 is User(id=77, username=hoangnv, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$4PzgFAEfjc1siGc3AGalNeGBHsKb/85Lo1aThBjY6zcNKCF/qnDmK, fullName=Dang NamThuan, dateOfBirth=2024-07-11, city=0, district=0, ward=0, detail_address=dsdsds, phone=0384774118, avatar=/uploads/react.png, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 20:29:11.0)', 'Load successfully with ID=77', '2024-07-08 02:42:28'),
(1007, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=77 is User(id=77, username=hoangnv, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$4PzgFAEfjc1siGc3AGalNeGBHsKb/85Lo1aThBjY6zcNKCF/qnDmK, fullName=Dang NamThuan, dateOfBirth=2024-07-11, city=0, district=0, ward=0, detail_address=dsdsds, phone=0384774118, avatar=/uploads/react.png, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 20:29:11.0)', 'Update successfully! New user info of ID=77 is updated!', '2024-07-08 02:42:30'),
(1008, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=77 is User(id=77, username=hoangnv, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$4PzgFAEfjc1siGc3AGalNeGBHsKb/85Lo1aThBjY6zcNKCF/qnDmK, fullName=Dang NamThuan, dateOfBirth=2024-07-11, city=0, district=0, ward=0, detail_address=dsdsds, phone=0384774118, avatar=/uploads/react.png, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 20:29:11.0)', 'Load successfully with ID=77', '2024-07-08 02:42:30'),
(1009, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=77 is User(id=77, username=hoangnv, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$4PzgFAEfjc1siGc3AGalNeGBHsKb/85Lo1aThBjY6zcNKCF/qnDmK, fullName=Dang NamThuan, dateOfBirth=2024-07-11, city=0, district=0, ward=0, detail_address=dsdsds, phone=0384774118, avatar=/uploads/react.png, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 20:29:11.0)', 'Update successfully! New user info of ID=77 is updated!', '2024-07-08 02:42:31'),
(1010, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=77 is User(id=77, username=hoangnv, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$4PzgFAEfjc1siGc3AGalNeGBHsKb/85Lo1aThBjY6zcNKCF/qnDmK, fullName=Dang NamThuan, dateOfBirth=2024-07-11, city=0, district=0, ward=0, detail_address=dsdsds, phone=0384774118, avatar=/uploads/react.png, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 20:29:11.0)', 'Load successfully with ID=77', '2024-07-08 02:42:31'),
(1011, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=77 is User(id=77, username=hoangnv, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$4PzgFAEfjc1siGc3AGalNeGBHsKb/85Lo1aThBjY6zcNKCF/qnDmK, fullName=Dang NamThuan, dateOfBirth=2024-07-11, city=0, district=0, ward=0, detail_address=dsdsds, phone=0384774118, avatar=/uploads/react.png, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 20:29:11.0)', 'Update successfully! New user info of ID=77 is updated!', '2024-07-08 02:42:34'),
(1012, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=77 is User(id=77, username=hoangnv, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$4PzgFAEfjc1siGc3AGalNeGBHsKb/85Lo1aThBjY6zcNKCF/qnDmK, fullName=Dang NamThuan, dateOfBirth=2024-07-11, city=0, district=0, ward=0, detail_address=dsdsds, phone=0384774118, avatar=/uploads/react.png, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 20:29:11.0)', 'Load successfully with ID=77', '2024-07-08 02:42:34'),
(1013, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=77 is User(id=77, username=hoangnv, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$4PzgFAEfjc1siGc3AGalNeGBHsKb/85Lo1aThBjY6zcNKCF/qnDmK, fullName=Dang NamThuandsfdfdfs, dateOfBirth=2024-07-11, city=0, district=0, ward=0, detail_address=dsdsds, phone=0384774118, avatar=/uploads/react.png, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 20:29:11.0)', 'Update successfully! New user info of ID=77 is updated!', '2024-07-08 02:42:36'),
(1014, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=77 is User(id=77, username=hoangnv, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$4PzgFAEfjc1siGc3AGalNeGBHsKb/85Lo1aThBjY6zcNKCF/qnDmK, fullName=Dang NamThuandsfdfdfs, dateOfBirth=2024-07-11, city=0, district=0, ward=0, detail_address=dsdsds, phone=0384774118, avatar=/uploads/react.png, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 20:29:11.0)', 'Load successfully with ID=77', '2024-07-08 02:42:36'),
(1015, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=77', '2024-07-08 02:44:28'),
(1016, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-08 02:44:28'),
(1017, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=77', '2024-07-08 02:44:29'),
(1018, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-08 02:44:29'),
(1019, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=77', '2024-07-08 02:44:43'),
(1020, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-08 02:44:43'),
(1021, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=77 is User(id=77, username=hoangnv, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$4PzgFAEfjc1siGc3AGalNeGBHsKb/85Lo1aThBjY6zcNKCF/qnDmK, fullName=Dang NamThuandsfdfdfs, dateOfBirth=2024-07-11, city=0, district=0, ward=0, detail_address=dsdsds, phone=0384774118, avatar=/uploads/react.png, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 20:29:11.0)', 'Update successfully! New user info of ID=77 is updated!', '2024-07-08 02:44:46'),
(1022, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=77 is User(id=77, username=hoangnv, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$4PzgFAEfjc1siGc3AGalNeGBHsKb/85Lo1aThBjY6zcNKCF/qnDmK, fullName=Dang NamThuandsfdfdfs, dateOfBirth=2024-07-11, city=0, district=0, ward=0, detail_address=dsdsds, phone=0384774118, avatar=/uploads/react.png, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 20:29:11.0)', 'Load successfully with ID=77', '2024-07-08 02:44:46'),
(1023, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=77 is User(id=77, username=hoangnv, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$4PzgFAEfjc1siGc3AGalNeGBHsKb/85Lo1aThBjY6zcNKCF/qnDmK, fullName=Dang NamThuandsfdfdfs, dateOfBirth=2024-07-11, city=0, district=0, ward=0, detail_address=dsdsds, phone=0384774118, avatar=/uploads/react.png, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 20:29:11.0)', 'Update successfully! New user info of ID=77 is updated!', '2024-07-08 02:44:48'),
(1024, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=77 is User(id=77, username=hoangnv, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$4PzgFAEfjc1siGc3AGalNeGBHsKb/85Lo1aThBjY6zcNKCF/qnDmK, fullName=Dang NamThuandsfdfdfs, dateOfBirth=2024-07-11, city=0, district=0, ward=0, detail_address=dsdsds, phone=0384774118, avatar=/uploads/react.png, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 20:29:11.0)', 'Load successfully with ID=77', '2024-07-08 02:44:48'),
(1025, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=77 is User(id=77, username=hoangnv, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$4PzgFAEfjc1siGc3AGalNeGBHsKb/85Lo1aThBjY6zcNKCF/qnDmK, fullName=Dang NamThuandsfdfdfs, dateOfBirth=2024-07-11, city=0, district=0, ward=0, detail_address=dsdsds, phone=0384774118, avatar=/uploads/react.png, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 20:29:11.0)', 'Update successfully! New user info of ID=77 is updated!', '2024-07-08 02:44:49'),
(1026, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=77 is User(id=77, username=hoangnv, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$4PzgFAEfjc1siGc3AGalNeGBHsKb/85Lo1aThBjY6zcNKCF/qnDmK, fullName=Dang NamThuandsfdfdfs, dateOfBirth=2024-07-11, city=0, district=0, ward=0, detail_address=dsdsds, phone=0384774118, avatar=/uploads/react.png, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 20:29:11.0)', 'Load successfully with ID=77', '2024-07-08 02:44:49'),
(1027, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=77 is User(id=77, username=hoangnv, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$4PzgFAEfjc1siGc3AGalNeGBHsKb/85Lo1aThBjY6zcNKCF/qnDmK, fullName=Dang NamThuandsfdfdfs, dateOfBirth=2024-07-11, city=0, district=0, ward=0, detail_address=dsdsds, phone=0384774118, avatar=/uploads/react.png, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 20:29:11.0)', 'Update successfully! New user info of ID=77 is updated!', '2024-07-08 02:44:51'),
(1028, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=77 is User(id=77, username=hoangnv, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$4PzgFAEfjc1siGc3AGalNeGBHsKb/85Lo1aThBjY6zcNKCF/qnDmK, fullName=Dang NamThuandsfdfdfs, dateOfBirth=2024-07-11, city=0, district=0, ward=0, detail_address=dsdsds, phone=0384774118, avatar=/uploads/react.png, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 20:29:11.0)', 'Load successfully with ID=77', '2024-07-08 02:44:51'),
(1029, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=77 is User(id=77, username=hoangnv, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$4PzgFAEfjc1siGc3AGalNeGBHsKb/85Lo1aThBjY6zcNKCF/qnDmK, fullName=Dang NamThuandsfdfdfs, dateOfBirth=2024-07-11, city=0, district=0, ward=0, detail_address=dsdsds, phone=0384774118, avatar=/uploads/react.png, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 20:29:11.0)', 'Update successfully! New user info of ID=77 is updated!', '2024-07-08 02:44:57'),
(1030, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=77 is User(id=77, username=hoangnv, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$4PzgFAEfjc1siGc3AGalNeGBHsKb/85Lo1aThBjY6zcNKCF/qnDmK, fullName=Dang NamThuandsfdfdfs, dateOfBirth=2024-07-11, city=0, district=0, ward=0, detail_address=dsdsds, phone=0384774118, avatar=/uploads/react.png, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 20:29:11.0)', 'Load successfully with ID=77', '2024-07-08 02:44:57'),
(1031, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=77 is User(id=77, username=hoangnv, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$4PzgFAEfjc1siGc3AGalNeGBHsKb/85Lo1aThBjY6zcNKCF/qnDmK, fullName=Dang NamThuandsfdfdfs, dateOfBirth=2024-07-11, city=0, district=0, ward=0, detail_address=dsdsds, phone=0384774118, avatar=/uploads/react.png, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 20:29:11.0)', 'Update successfully! New user info of ID=77 is updated!', '2024-07-08 02:44:59'),
(1032, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=77 is User(id=77, username=hoangnv, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$4PzgFAEfjc1siGc3AGalNeGBHsKb/85Lo1aThBjY6zcNKCF/qnDmK, fullName=Dang NamThuandsfdfdfs, dateOfBirth=2024-07-11, city=0, district=0, ward=0, detail_address=dsdsds, phone=0384774118, avatar=/uploads/react.png, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 20:29:11.0)', 'Load successfully with ID=77', '2024-07-08 02:44:59'),
(1033, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=77 is User(id=77, username=hoangnv, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$4PzgFAEfjc1siGc3AGalNeGBHsKb/85Lo1aThBjY6zcNKCF/qnDmK, fullName=Dang NamThuandsfdfdfs, dateOfBirth=2024-07-11, city=0, district=0, ward=0, detail_address=dsdsds, phone=0384774118, avatar=/uploads/react.png, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 20:29:11.0)', 'Update successfully! New user info of ID=77 is updated!', '2024-07-08 02:45:04'),
(1034, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=77 is User(id=77, username=hoangnv, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$4PzgFAEfjc1siGc3AGalNeGBHsKb/85Lo1aThBjY6zcNKCF/qnDmK, fullName=Dang NamThuandsfdfdfs, dateOfBirth=2024-07-11, city=0, district=0, ward=0, detail_address=dsdsds, phone=0384774118, avatar=/uploads/react.png, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 20:29:11.0)', 'Load successfully with ID=77', '2024-07-08 02:45:04'),
(1035, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=77', '2024-07-08 02:46:31'),
(1036, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-08 02:46:31'),
(1037, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=77 is User(id=77, username=hoangnv, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$4PzgFAEfjc1siGc3AGalNeGBHsKb/85Lo1aThBjY6zcNKCF/qnDmK, fullName=Dang NamThuandsfdfdfsgygiyg, dateOfBirth=2024-07-11, city=0, district=0, ward=0, detail_address=dsdsds, phone=0384774118, avatar=/uploads/react.png, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 20:29:11.0)', 'Update successfully! New user info of ID=77 is updated!', '2024-07-08 02:46:36'),
(1038, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=77 is User(id=77, username=hoangnv, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$4PzgFAEfjc1siGc3AGalNeGBHsKb/85Lo1aThBjY6zcNKCF/qnDmK, fullName=Dang NamThuandsfdfdfsgygiyg, dateOfBirth=2024-07-11, city=0, district=0, ward=0, detail_address=dsdsds, phone=0384774118, avatar=/uploads/react.png, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 20:29:11.0)', 'Load successfully with ID=77', '2024-07-08 02:46:36'),
(1039, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '80: Login by 2 success. Congratulation!', '2024-07-08 02:47:33'),
(1040, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=77', '2024-07-08 02:50:05'),
(1041, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-08 02:50:05'),
(1042, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=77 is User(id=77, username=hoangnv, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$4PzgFAEfjc1siGc3AGalNeGBHsKb/85Lo1aThBjY6zcNKCF/qnDmK, fullName=Dang NamThuandsfdfdfsgygiyg, dateOfBirth=2024-07-11, city=0, district=0, ward=0, detail_address=dsdsds, phone=0384774118, avatar=/uploads/react.png, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 20:29:11.0)', 'Update successfully! New user info of ID=77 is updated!', '2024-07-08 02:50:10'),
(1043, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=77 is User(id=77, username=hoangnv, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$4PzgFAEfjc1siGc3AGalNeGBHsKb/85Lo1aThBjY6zcNKCF/qnDmK, fullName=Dang NamThuandsfdfdfsgygiyg, dateOfBirth=2024-07-11, city=0, district=0, ward=0, detail_address=dsdsds, phone=0384774118, avatar=/uploads/react.png, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 20:29:11.0)', 'Load successfully with ID=77', '2024-07-08 02:50:10'),
(1044, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=77 is User(id=77, username=hoangnv, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$4PzgFAEfjc1siGc3AGalNeGBHsKb/85Lo1aThBjY6zcNKCF/qnDmK, fullName=Dang NamThuandsfdfdfsgygiyg, dateOfBirth=2024-07-11, city=0, district=0, ward=0, detail_address=dsdsds, phone=0384774118, avatar=/uploads/react.png, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 20:29:11.0)', 'Update successfully! New user info of ID=77 is updated!', '2024-07-08 02:50:12'),
(1045, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=77 is User(id=77, username=hoangnv, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$4PzgFAEfjc1siGc3AGalNeGBHsKb/85Lo1aThBjY6zcNKCF/qnDmK, fullName=Dang NamThuandsfdfdfsgygiyg, dateOfBirth=2024-07-11, city=0, district=0, ward=0, detail_address=dsdsds, phone=0384774118, avatar=/uploads/react.png, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 20:29:11.0)', 'Load successfully with ID=77', '2024-07-08 02:50:12'),
(1046, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=77 is User(id=77, username=hoangnv, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$4PzgFAEfjc1siGc3AGalNeGBHsKb/85Lo1aThBjY6zcNKCF/qnDmK, fullName=Dang NamThuandsfdfdfsgygiyg, dateOfBirth=2024-07-11, city=0, district=0, ward=0, detail_address=dsdsds, phone=0384774118, avatar=/uploads/react.png, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 20:29:11.0)', 'Update successfully! New user info of ID=77 is updated!', '2024-07-08 02:50:14'),
(1047, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=77 is User(id=77, username=hoangnv, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$4PzgFAEfjc1siGc3AGalNeGBHsKb/85Lo1aThBjY6zcNKCF/qnDmK, fullName=Dang NamThuandsfdfdfsgygiyg, dateOfBirth=2024-07-11, city=0, district=0, ward=0, detail_address=dsdsds, phone=0384774118, avatar=/uploads/react.png, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 20:29:11.0)', 'Load successfully with ID=77', '2024-07-08 02:50:14'),
(1048, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=77 is User(id=77, username=hoangnv, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$4PzgFAEfjc1siGc3AGalNeGBHsKb/85Lo1aThBjY6zcNKCF/qnDmK, fullName=Dang NamThuandsfdfdfsgygiyg, dateOfBirth=2024-07-11, city=0, district=0, ward=0, detail_address=dsdsds, phone=0384774118, avatar=/uploads/react.png, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 20:29:11.0)', 'Update successfully! New user info of ID=77 is updated!', '2024-07-08 02:50:16'),
(1049, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=77 is User(id=77, username=hoangnv, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$4PzgFAEfjc1siGc3AGalNeGBHsKb/85Lo1aThBjY6zcNKCF/qnDmK, fullName=Dang NamThuandsfdfdfsgygiyg, dateOfBirth=2024-07-11, city=0, district=0, ward=0, detail_address=dsdsds, phone=0384774118, avatar=/uploads/react.png, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 20:29:11.0)', 'Load successfully with ID=77', '2024-07-08 02:50:16'),
(1050, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=77 is User(id=77, username=hoangnv, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$4PzgFAEfjc1siGc3AGalNeGBHsKb/85Lo1aThBjY6zcNKCF/qnDmK, fullName=Dang NamThuandsfdfdfsgygiyg, dateOfBirth=2024-07-11, city=0, district=0, ward=0, detail_address=dsdsds, phone=0384774118, avatar=/uploads/react.png, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 20:29:11.0)', 'Update successfully! New user info of ID=77 is updated!', '2024-07-08 02:50:18');
INSERT INTO `log` (`id`, `level_id`, `ip`, `address`, `pre_value`, `post_value`, `create_at`) VALUES
(1051, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=77 is User(id=77, username=hoangnv, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$4PzgFAEfjc1siGc3AGalNeGBHsKb/85Lo1aThBjY6zcNKCF/qnDmK, fullName=Dang NamThuandsfdfdfsgygiyg, dateOfBirth=2024-07-11, city=0, district=0, ward=0, detail_address=dsdsds, phone=0384774118, avatar=/uploads/react.png, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 20:29:11.0)', 'Load successfully with ID=77', '2024-07-08 02:50:18'),
(1052, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-07-08 02:52:22'),
(1053, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, '82: Register success. Congratulation!', '2024-07-08 02:52:38'),
(1054, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '21130556@st.hcmuaf.edu.vn: Your account has verified successfully. Congratulation!', '2024-07-08 02:52:58'),
(1055, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=82', '2024-07-08 02:53:19'),
(1056, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-08 02:53:19'),
(1057, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old avatar of ID=82 is /uploads/NT.jpg', 'New avatar of ID=82 is /uploads/NT.jpg', '2024-07-08 02:53:36'),
(1058, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS, fullName=null, dateOfBirth=null, city=null, district=null, ward=null, detail_address=null, phone=null, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Update successfully! New user info of ID=82 is updated!', '2024-07-08 02:54:04'),
(1059, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS, fullName=null, dateOfBirth=null, city=null, district=null, ward=null, detail_address=null, phone=null, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Update successfully! New user info of ID=82 is updated!', '2024-07-08 02:54:25'),
(1060, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS, fullName=null, dateOfBirth=null, city=null, district=null, ward=null, detail_address=null, phone=null, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Update successfully! New user info of ID=82 is updated!', '2024-07-08 02:54:32'),
(1061, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS, fullName=null, dateOfBirth=null, city=null, district=null, ward=null, detail_address=null, phone=null, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Load successfully with ID=82', '2024-07-08 02:54:32'),
(1062, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=82', '2024-07-08 03:03:52'),
(1063, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-08 03:03:52'),
(1064, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS, fullName=, dateOfBirth=2024-07-09, city=67, district=662, ward=24658, detail_address=bggbgb, phone=dsfddds, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Update successfully! New user info of ID=82 is updated!', '2024-07-08 03:04:13'),
(1065, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS, fullName=, dateOfBirth=2024-07-09, city=67, district=662, ward=24658, detail_address=bggbgb, phone=dsfddds, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Load successfully with ID=82', '2024-07-08 03:04:13'),
(1066, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS, fullName=, dateOfBirth=2024-07-04, city=67, district=662, ward=24658, detail_address=bggbgb, phone=dsfddds, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Update successfully! New user info of ID=82 is updated!', '2024-07-08 03:04:35'),
(1067, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=82', '2024-07-08 03:05:35'),
(1068, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-08 03:05:35'),
(1069, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS, fullName=, dateOfBirth=2024-07-04, city=67, district=662, ward=24658, detail_address=bggbgb, phone=dsfddds, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Update successfully! New user info of ID=82 is updated!', '2024-07-08 03:05:45'),
(1070, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS, fullName=, dateOfBirth=2024-07-04, city=67, district=662, ward=24658, detail_address=bggbgb, phone=dsfddds, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Update successfully! New user info of ID=82 is updated!', '2024-07-08 03:05:54'),
(1071, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS, fullName=, dateOfBirth=2024-07-04, city=67, district=662, ward=24658, detail_address=bggbgb, phone=dsfddds, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Load successfully with ID=82', '2024-07-08 03:05:54'),
(1072, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=82', '2024-07-08 03:07:47'),
(1073, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-08 03:07:47'),
(1074, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS, fullName=, dateOfBirth=2024-07-01, city=11, district=100, ward=03322, detail_address=bggbgb, phone=dsfddds, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Update successfully! New user info of ID=82 is updated!', '2024-07-08 03:07:54'),
(1075, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS, fullName=, dateOfBirth=2024-07-01, city=11, district=100, ward=03322, detail_address=bggbgb, phone=dsfddds, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Load successfully with ID=82', '2024-07-08 03:07:54'),
(1076, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS, fullName=, dateOfBirth=2024-07-01, city=89, district=886, ward=30373, detail_address=bggbgb, phone=dsfddds, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Update successfully! New user info of ID=82 is updated!', '2024-07-08 03:08:05'),
(1077, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=82', '2024-07-08 03:10:20'),
(1078, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-08 03:10:20'),
(1079, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS, fullName=, dateOfBirth=2024-07-01, city=89, district=886, ward=30373, detail_address=bggbgb, phone=dsfddds, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Update successfully! New user info of ID=82 is updated!', '2024-07-08 03:10:28'),
(1080, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS, fullName=, dateOfBirth=2024-07-01, city=89, district=886, ward=30373, detail_address=bggbgb, phone=dsfddds, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Load successfully with ID=82', '2024-07-08 03:10:28'),
(1081, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS, fullName=, dateOfBirth=2024-07-01, city=11, district=100, ward=03337, detail_address=bggbgb, phone=dsfddds, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Update successfully! New user info of ID=82 is updated!', '2024-07-08 03:11:59'),
(1082, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS, fullName=, dateOfBirth=2024-07-01, city=11, district=100, ward=03337, detail_address=bggbgb, phone=dsfddds, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Load successfully with ID=82', '2024-07-08 03:11:59'),
(1083, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS, fullName=, dateOfBirth=2024-07-01, city=11, district=100, ward=03337, detail_address=bggbgb, phone=dsfddds, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Update successfully! New user info of ID=82 is updated!', '2024-07-08 03:12:01'),
(1084, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS, fullName=, dateOfBirth=2024-07-01, city=11, district=100, ward=03337, detail_address=bggbgb, phone=dsfddds, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Load successfully with ID=82', '2024-07-08 03:12:01'),
(1085, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS, fullName=, dateOfBirth=2024-07-01, city=11, district=100, ward=03337, detail_address=bggbgb, phone=dsfddds, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Update successfully! New user info of ID=82 is updated!', '2024-07-08 03:12:03'),
(1086, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS, fullName=, dateOfBirth=2024-07-01, city=11, district=100, ward=03337, detail_address=bggbgb, phone=dsfddds, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Load successfully with ID=82', '2024-07-08 03:12:04'),
(1087, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS, fullName=, dateOfBirth=2024-07-01, city=11, district=100, ward=03337, detail_address=bggbgb, phone=dsfddds, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Update successfully! New user info of ID=82 is updated!', '2024-07-08 03:12:05'),
(1088, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS, fullName=, dateOfBirth=2024-07-01, city=11, district=100, ward=03337, detail_address=bggbgb, phone=dsfddds, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Load successfully with ID=82', '2024-07-08 03:12:05'),
(1089, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS, fullName=, dateOfBirth=2024-07-01, city=11, district=100, ward=03337, detail_address=bggbgb, phone=dsfddds, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Update successfully! New user info of ID=82 is updated!', '2024-07-08 03:12:07'),
(1090, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS, fullName=, dateOfBirth=2024-07-01, city=11, district=100, ward=03337, detail_address=bggbgb, phone=dsfddds, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Load successfully with ID=82', '2024-07-08 03:12:07'),
(1091, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=82', '2024-07-08 03:17:23'),
(1092, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-08 03:17:23'),
(1093, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS, fullName=, dateOfBirth=2024-07-01, city=11, district=100, ward=03337, detail_address=bggbgb, phone=dsfddds, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Update successfully! New user info of ID=82 is updated!', '2024-07-08 03:17:38'),
(1094, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS, fullName=, dateOfBirth=2024-07-01, city=11, district=100, ward=03337, detail_address=bggbgb, phone=dsfddds, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Load successfully with ID=82', '2024-07-08 03:17:38'),
(1095, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS, fullName=, dateOfBirth=null, city=87, district=873, ward=30094, detail_address=bggbgb, phone=dsfddds, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Update successfully! New user info of ID=82 is updated!', '2024-07-08 03:17:57'),
(1096, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS, fullName=, dateOfBirth=null, city=87, district=873, ward=30094, detail_address=bggbgb, phone=dsfddds, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Load successfully with ID=82', '2024-07-08 03:17:57'),
(1097, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS, fullName=, dateOfBirth=null, city=87, district=873, ward=30094, detail_address=bggbgb, phone=dsfddds, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Update successfully! New user info of ID=82 is updated!', '2024-07-08 03:17:58'),
(1098, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS, fullName=, dateOfBirth=null, city=87, district=873, ward=30094, detail_address=bggbgb, phone=dsfddds, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Load successfully with ID=82', '2024-07-08 03:17:58'),
(1099, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS, fullName=, dateOfBirth=null, city=87, district=873, ward=30094, detail_address=bggbgb, phone=dsfddds, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Update successfully! New user info of ID=82 is updated!', '2024-07-08 03:18:00'),
(1100, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS, fullName=, dateOfBirth=null, city=87, district=873, ward=30094, detail_address=bggbgb, phone=dsfddds, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Load successfully with ID=82', '2024-07-08 03:18:00'),
(1101, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS, fullName=, dateOfBirth=null, city=87, district=873, ward=30094, detail_address=bggbgb, phone=dsfddds, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Update successfully! New user info of ID=82 is updated!', '2024-07-08 03:18:08'),
(1102, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS, fullName=, dateOfBirth=null, city=87, district=873, ward=30094, detail_address=bggbgb, phone=dsfddds, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Load successfully with ID=82', '2024-07-08 03:18:08'),
(1103, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS, fullName=, dateOfBirth=null, city=87, district=873, ward=30094, detail_address=bggbgb, phone=dsfddds, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Update successfully! New user info of ID=82 is updated!', '2024-07-08 03:18:09'),
(1104, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS, fullName=, dateOfBirth=null, city=87, district=873, ward=30094, detail_address=bggbgb, phone=dsfddds, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Load successfully with ID=82', '2024-07-08 03:18:09'),
(1105, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '80: Login by 2 success. Congratulation!', '2024-07-08 03:20:33'),
(1106, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=80 is User(id=80, username=, email=21130556@st.hcmuaf.edu.vn, password=null, fullName=Đặng Nam Thuận, dateOfBirth=null, city=null, district=null, ward=null, detail_address=null, phone=null, avatar=/uploads/react.png, verified=true, loginBy=2, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 22:15:57.0)', 'Update successfully! New user info of ID=80 is updated!', '2024-07-08 03:21:08'),
(1107, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=80 is User(id=80, username=, email=21130556@st.hcmuaf.edu.vn, password=null, fullName=Đặng Nam Thuận, dateOfBirth=null, city=null, district=null, ward=null, detail_address=null, phone=null, avatar=/uploads/react.png, verified=true, loginBy=2, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 22:15:57.0)', 'Load successfully with ID=80', '2024-07-08 03:21:08'),
(1108, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=80 is User(id=80, username=, email=21130556@st.hcmuaf.edu.vn, password=null, fullName=, dateOfBirth=null, city=67, district=661, ward=24625, detail_address=gfdgff, phone=0987365222, avatar=/uploads/react.png, verified=true, loginBy=2, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 22:15:57.0)', 'Update successfully! New user info of ID=80 is updated!', '2024-07-08 03:21:29'),
(1109, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=80 is User(id=80, username=, email=21130556@st.hcmuaf.edu.vn, password=null, fullName=, dateOfBirth=null, city=67, district=661, ward=24625, detail_address=gfdgff, phone=0987365222, avatar=/uploads/react.png, verified=true, loginBy=2, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 22:15:57.0)', 'Load successfully with ID=80', '2024-07-08 03:21:29'),
(1110, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=80 is User(id=80, username=, email=21130556@st.hcmuaf.edu.vn, password=null, fullName=, dateOfBirth=2024-07-25, city=67, district=661, ward=24625, detail_address=gfdgff, phone=0987365222, avatar=/uploads/react.png, verified=true, loginBy=2, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 22:15:57.0)', 'Update successfully! New user info of ID=80 is updated!', '2024-07-08 03:21:43'),
(1111, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=80 is User(id=80, username=, email=21130556@st.hcmuaf.edu.vn, password=null, fullName=, dateOfBirth=2024-07-25, city=67, district=661, ward=24625, detail_address=gfdgff, phone=0987365222, avatar=/uploads/react.png, verified=true, loginBy=2, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 22:15:57.0)', 'Load successfully with ID=80', '2024-07-08 03:21:43'),
(1112, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=80 is User(id=80, username=, email=21130556@st.hcmuaf.edu.vn, password=null, fullName=, dateOfBirth=null, city=67, district=661, ward=24625, detail_address=gfdgff, phone=0987365222, avatar=/uploads/react.png, verified=true, loginBy=2, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 22:15:57.0)', 'Update successfully! New user info of ID=80 is updated!', '2024-07-08 03:22:22'),
(1113, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=80 is User(id=80, username=, email=21130556@st.hcmuaf.edu.vn, password=null, fullName=, dateOfBirth=null, city=67, district=661, ward=24625, detail_address=gfdgff, phone=0987365222, avatar=/uploads/react.png, verified=true, loginBy=2, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 22:15:57.0)', 'Load successfully with ID=80', '2024-07-08 03:22:22'),
(1114, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=82', '2024-07-08 03:29:45'),
(1115, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-08 03:29:45'),
(1116, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '75: Login by 5 success. Congratulation!', '2024-07-08 03:30:22'),
(1117, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=75 is User(id=75, username=namthuan2304, email=, password=null, fullName=Đặng Nam Thuận, dateOfBirth=null, city=null, district=null, ward=null, detail_address=null, phone=null, avatar=https://avatars.githubusercontent.com/u/146423539?v=4, verified=true, loginBy=5, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 20:02:11.0)', 'Update successfully! New user info of ID=75 is updated!', '2024-07-08 03:31:07'),
(1118, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=75 is User(id=75, username=namthuan2304, email=, password=null, fullName=Đặng Nam Thuận, dateOfBirth=null, city=null, district=null, ward=null, detail_address=null, phone=null, avatar=https://avatars.githubusercontent.com/u/146423539?v=4, verified=true, loginBy=5, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 20:02:11.0)', 'Load successfully with ID=75', '2024-07-08 03:31:07'),
(1119, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '75: Login by 5 success. Congratulation!', '2024-07-08 03:31:18'),
(1120, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '75: Login by 5 success. Congratulation!', '2024-07-08 03:33:56'),
(1121, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '75: Login by 5 success. Congratulation!', '2024-07-08 03:35:17'),
(1122, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=82', '2024-07-08 03:39:14'),
(1123, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-08 03:39:14'),
(1124, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS, fullName=, dateOfBirth=null, city=87, district=873, ward=30094, detail_address=bggbgb, phone=dsfddds, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Update successfully! New user info of ID=82 is updated!', '2024-07-08 03:39:54'),
(1125, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS, fullName=, dateOfBirth=null, city=87, district=873, ward=30094, detail_address=bggbgb, phone=dsfddds, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Load successfully with ID=82', '2024-07-08 03:39:54'),
(1126, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '80: Login by 2 success. Congratulation!', '2024-07-08 03:54:26'),
(1127, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '80: Login by 2 success. Congratulation!', '2024-07-08 04:00:53'),
(1128, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '80: Login by 2 success. Congratulation!', '2024-07-08 04:10:06'),
(1129, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '80: Login by 2 success. Congratulation!', '2024-07-08 04:24:49'),
(1130, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=82', '2024-07-08 04:29:14'),
(1131, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-08 04:29:14'),
(1132, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS, fullName=, dateOfBirth=null, city=60, district=601, ward=23236, detail_address=bggbgb, phone=dsfdddshuoh, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Update successfully! New user info of ID=82 is updated!', '2024-07-08 04:32:59'),
(1133, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS, fullName=, dateOfBirth=null, city=60, district=601, ward=23236, detail_address=bggbgb, phone=dsfdddshuoh, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Load successfully with ID=82', '2024-07-08 04:32:59'),
(1134, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS, fullName=, dateOfBirth=null, city=67, district=661, ward=24634, detail_address=bggbgb, phone=dsfdddshuoh, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Update successfully! New user info of ID=82 is updated!', '2024-07-08 04:33:11'),
(1135, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS, fullName=, dateOfBirth=null, city=67, district=661, ward=24634, detail_address=bggbgb, phone=dsfdddshuoh, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Load successfully with ID=82', '2024-07-08 04:33:11'),
(1136, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '80: Login by 2 success. Congratulation!', '2024-07-08 04:36:39'),
(1137, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=80 is User(id=80, username=, email=21130556@st.hcmuaf.edu.vn, password=null, fullName=, dateOfBirth=null, city=67, district=661, ward=24625, detail_address=gfdgff, phone=0987365222, avatar=/uploads/react.png, verified=true, loginBy=2, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 22:15:57.0)', 'Update successfully! New user info of ID=80 is updated!', '2024-07-08 04:40:04'),
(1138, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=80 is User(id=80, username=, email=21130556@st.hcmuaf.edu.vn, password=null, fullName=, dateOfBirth=null, city=67, district=661, ward=24625, detail_address=gfdgff, phone=0987365222, avatar=/uploads/react.png, verified=true, loginBy=2, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 22:15:57.0)', 'Load successfully with ID=80', '2024-07-08 04:40:04'),
(1139, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=80 is User(id=80, username=, email=21130556@st.hcmuaf.edu.vn, password=null, fullName=, dateOfBirth=null, city=74, district=719, ward=25819, detail_address=gfdgff, phone=0987365222, avatar=/uploads/react.png, verified=true, loginBy=2, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 22:15:57.0)', 'Update successfully! New user info of ID=80 is updated!', '2024-07-08 04:40:21'),
(1140, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=80 is User(id=80, username=, email=21130556@st.hcmuaf.edu.vn, password=null, fullName=, dateOfBirth=null, city=74, district=719, ward=25819, detail_address=gfdgff, phone=0987365222, avatar=/uploads/react.png, verified=true, loginBy=2, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 22:15:57.0)', 'Load successfully with ID=80', '2024-07-08 04:40:21'),
(1141, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '80: Login by 2 success. Congratulation!', '2024-07-08 04:57:29'),
(1142, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '78: Login by 1 success. Congratulation!', '2024-07-08 05:08:42'),
(1143, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=78 is User(id=78, username=Đặng Nam, email=21130556@st.hcmuaf.edu.vn, password=null, fullName=Đặng Nam Thuận, dateOfBirth=null, city=null, district=null, ward=null, detail_address=null, phone=null, avatar=https://lh3.googleusercontent.com/a/ACg8ocLRN9ohOUxOWR5xr0fch3t6YlgEXwZEmjDyvtSQUs3bTC-BIsQ=s96-c, verified=true, loginBy=1, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 22:10:27.0)', 'Update successfully! New user info of ID=78 is updated!', '2024-07-08 05:24:48'),
(1144, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=78 is User(id=78, username=Đặng Nam, email=21130556@st.hcmuaf.edu.vn, password=null, fullName=Đặng Nam Thuận, dateOfBirth=null, city=null, district=null, ward=null, detail_address=null, phone=null, avatar=https://lh3.googleusercontent.com/a/ACg8ocLRN9ohOUxOWR5xr0fch3t6YlgEXwZEmjDyvtSQUs3bTC-BIsQ=s96-c, verified=true, loginBy=1, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 22:10:27.0)', 'Load successfully with ID=78', '2024-07-08 05:24:48'),
(1145, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=82', '2024-07-08 05:26:31'),
(1146, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-08 05:26:31'),
(1147, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS, fullName=, dateOfBirth=null, city=95, district=960, ward=31987, detail_address=bggbgb, phone=dsfdddshuoh, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Update successfully! New user info of ID=82 is updated!', '2024-07-08 05:26:54'),
(1148, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS, fullName=, dateOfBirth=null, city=95, district=960, ward=31987, detail_address=bggbgb, phone=dsfdddshuoh, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Load successfully with ID=82', '2024-07-08 05:26:54'),
(1149, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS, fullName=, dateOfBirth=null, city=77, district=748, ward=26563, detail_address=bggbgb, phone=dsfdddshuoh, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Update successfully! New user info of ID=82 is updated!', '2024-07-08 05:27:26'),
(1150, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS, fullName=, dateOfBirth=null, city=77, district=748, ward=26563, detail_address=bggbgb, phone=dsfdddshuoh, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Load successfully with ID=82', '2024-07-08 05:27:26'),
(1151, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS, fullName=, dateOfBirth=null, city=60, district=601, ward=23236, detail_address=bggbgb, phone=dsfdddshuoh, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Update successfully! New user info of ID=82 is updated!', '2024-07-08 05:27:47'),
(1152, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS, fullName=, dateOfBirth=null, city=60, district=601, ward=23236, detail_address=bggbgb, phone=dsfdddshuoh, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Load successfully with ID=82', '2024-07-08 05:27:47'),
(1153, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS, fullName=, dateOfBirth=null, city=75, district=741, ward=26425, detail_address=bggbgb, phone=dsfdddshuoh, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Update successfully! New user info of ID=82 is updated!', '2024-07-08 05:28:02'),
(1154, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS, fullName=, dateOfBirth=null, city=75, district=741, ward=26425, detail_address=bggbgb, phone=dsfdddshuoh, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Load successfully with ID=82', '2024-07-08 05:28:02'),
(1155, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS, fullName=, dateOfBirth=null, city=60, district=601, ward=23236, detail_address=bggbgb, phone=dsfdddshuoh, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Update successfully! New user info of ID=82 is updated!', '2024-07-08 05:28:16'),
(1156, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS, fullName=, dateOfBirth=null, city=60, district=601, ward=23236, detail_address=bggbgb, phone=dsfdddshuoh, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Load successfully with ID=82', '2024-07-08 05:28:16'),
(1157, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS, fullName=, dateOfBirth=null, city=52, district=549, ward=21922, detail_address=bggbgb, phone=dsfdddshuoh, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Update successfully! New user info of ID=82 is updated!', '2024-07-08 05:28:52'),
(1158, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS, fullName=, dateOfBirth=null, city=52, district=549, ward=21922, detail_address=bggbgb, phone=dsfdddshuoh, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Load successfully with ID=82', '2024-07-08 05:28:52'),
(1159, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '80: Login by 2 success. Congratulation!', '2024-07-09 00:04:16'),
(1160, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=80 is User(id=80, username=, email=21130556@st.hcmuaf.edu.vn, password=null, fullName=, dateOfBirth=null, city=87, district=866, ward=29899, detail_address=gfdgff, phone=0987365222, avatar=/uploads/react.png, verified=true, loginBy=2, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 22:15:57.0)', 'Update successfully! New user info of ID=80 is updated!', '2024-07-09 00:13:49'),
(1161, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=80 is User(id=80, username=, email=21130556@st.hcmuaf.edu.vn, password=null, fullName=, dateOfBirth=null, city=87, district=866, ward=29899, detail_address=gfdgff, phone=0987365222, avatar=/uploads/react.png, verified=true, loginBy=2, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 22:15:57.0)', 'Load successfully with ID=80', '2024-07-09 00:13:49'),
(1162, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=80 is User(id=80, username=, email=21130556@st.hcmuaf.edu.vn, password=null, fullName=, dateOfBirth=null, city=60, district=601, ward=23236, detail_address=gfdgff, phone=0987365222, avatar=/uploads/react.png, verified=true, loginBy=2, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 22:15:57.0)', 'Update successfully! New user info of ID=80 is updated!', '2024-07-09 00:15:20'),
(1163, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=80 is User(id=80, username=, email=21130556@st.hcmuaf.edu.vn, password=null, fullName=, dateOfBirth=null, city=60, district=601, ward=23236, detail_address=gfdgff, phone=0987365222, avatar=/uploads/react.png, verified=true, loginBy=2, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-07 22:15:57.0)', 'Load successfully with ID=80', '2024-07-09 00:15:20'),
(1164, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=82', '2024-07-09 00:58:48'),
(1165, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-09 00:58:48'),
(1166, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=82', '2024-07-09 00:59:07'),
(1167, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-09 00:59:07'),
(1168, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS, fullName=, dateOfBirth=null, city=24, district=223, ward=07831, detail_address=bggbgb, phone=dsfdddshuoh, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Update successfully! New user info of ID=82 is updated!', '2024-07-09 01:23:17'),
(1169, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS, fullName=, dateOfBirth=null, city=24, district=223, ward=07831, detail_address=bggbgb, phone=dsfdddshuoh, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Load successfully with ID=82', '2024-07-09 01:23:17'),
(1170, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=82', '2024-07-09 02:50:07'),
(1171, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-09 02:50:07'),
(1172, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=82', '2024-07-09 02:53:42'),
(1173, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-09 02:53:42'),
(1174, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=82', '2024-07-09 02:55:46'),
(1175, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-09 02:55:46'),
(1176, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=82', '2024-07-09 02:59:39'),
(1177, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-09 02:59:39'),
(1178, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=82', '2024-07-09 03:02:20'),
(1179, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-09 03:02:20'),
(1180, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old password of ID=82 is $2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS', 'Update password successfully! New password of ID=82 is $2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS', '2024-07-09 03:02:58'),
(1181, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old password of ID=82 is $2a$10$7PaWF4HvvFC.rh0tou0u0euU2G/SSSnBUByUp4NlHAyxYjewcGGVS', 'Load successfully with ID=82', '2024-07-09 03:02:58'),
(1182, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=82', '2024-07-09 03:03:08'),
(1183, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 1', '2024-07-09 03:03:08'),
(1184, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=82', '2024-07-09 03:03:12'),
(1185, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-09 03:03:12'),
(1186, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=82', '2024-07-09 12:42:45'),
(1187, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-09 12:42:45'),
(1188, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=82', '2024-07-09 16:17:34'),
(1189, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-09 16:17:34'),
(1190, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$6tfZeQ65AEzPXL38uiqO4OwL8N1Nm3XD/W6AcZwFjmN4GnZ9RXFpK, fullName=, dateOfBirth=null, city=Tỉnh Bà Rịa - Vũng Tàu, district=Thành phố Bà Rịa, ward=Xã Hoà Long, detail_address=bggbgb, phone=dsfdddshuoh, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Update successfully! New user info of ID=82 is updated!', '2024-07-09 16:17:43'),
(1191, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$6tfZeQ65AEzPXL38uiqO4OwL8N1Nm3XD/W6AcZwFjmN4GnZ9RXFpK, fullName=, dateOfBirth=null, city=Tỉnh Bà Rịa - Vũng Tàu, district=Thành phố Bà Rịa, ward=Xã Hoà Long, detail_address=bggbgb, phone=dsfdddshuoh, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Load successfully with ID=82', '2024-07-09 16:17:43'),
(1192, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$6tfZeQ65AEzPXL38uiqO4OwL8N1Nm3XD/W6AcZwFjmN4GnZ9RXFpK, fullName=, dateOfBirth=null, city=Tỉnh An Giang, district=Huyện An Phú, ward=Thị trấn Đa Phước, detail_address=bggbgb, phone=dsfdddshuoh, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Update successfully! New user info of ID=82 is updated!', '2024-07-09 16:20:44');
INSERT INTO `log` (`id`, `level_id`, `ip`, `address`, `pre_value`, `post_value`, `create_at`) VALUES
(1193, 1, '0:0:0:0:0:0:0:1', '/user/updateinfouser', 'Old user info of ID=82 is User(id=82, username=chuotcon, email=21130556@st.hcmuaf.edu.vn, password=$2a$10$6tfZeQ65AEzPXL38uiqO4OwL8N1Nm3XD/W6AcZwFjmN4GnZ9RXFpK, fullName=, dateOfBirth=null, city=Tỉnh An Giang, district=Huyện An Phú, ward=Thị trấn Đa Phước, detail_address=bggbgb, phone=dsfdddshuoh, avatar=/uploads/NT.jpg, verified=true, loginBy=0, loginTimes=0, role=Role(id=1, roleName=null), dateCreated=2024-07-08 02:52:38.0)', 'Load successfully with ID=82', '2024-07-09 16:20:44'),
(1194, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '80: Login by 2 success. Congratulation!', '2024-07-09 23:01:07'),
(1195, 1, '0:0:0:0:0:0:0:1', '/user/feedback', NULL, 'Add feedback success ID=8', '2024-07-09 23:06:02'),
(1196, 1, '0:0:0:0:0:0:0:1', '/user/feedback', NULL, 'Add feedback success ID=9', '2024-07-09 23:11:04'),
(1197, 1, '0:0:0:0:0:0:0:1', '/user/feedback', NULL, 'Add feedback success ID=10', '2024-07-09 23:11:06'),
(1198, 1, '0:0:0:0:0:0:0:1', '/user/feedback', NULL, 'Add feedback success ID=11', '2024-07-09 23:11:06'),
(1199, 1, '0:0:0:0:0:0:0:1', '/user/feedback', NULL, 'Add feedback success ID=12', '2024-07-09 23:11:06'),
(1200, 1, '0:0:0:0:0:0:0:1', '/user/feedback', NULL, 'Add feedback success ID=13', '2024-07-09 23:11:06'),
(1201, 1, '0:0:0:0:0:0:0:1', '/user/feedback', NULL, 'Add feedback success ID=14', '2024-07-09 23:11:21'),
(1202, 1, '0:0:0:0:0:0:0:1', '/user/feedback', NULL, 'Add feedback success ID=15', '2024-07-09 23:13:50'),
(1203, 1, '0:0:0:0:0:0:0:1', '/user/feedback', NULL, 'Add feedback success ID=16', '2024-07-09 23:17:05'),
(1204, 1, '0:0:0:0:0:0:0:1', '/user/feedback', NULL, 'Add feedback success ID=17', '2024-07-09 23:17:08'),
(1205, 1, '0:0:0:0:0:0:0:1', '/user/feedback', NULL, 'Add feedback success ID=18', '2024-07-09 23:17:09'),
(1206, 1, '0:0:0:0:0:0:0:1', '/user/feedback', NULL, 'Add feedback success ID=19', '2024-07-09 23:17:10'),
(1207, 1, '0:0:0:0:0:0:0:1', '/user/feedback', NULL, 'Add feedback success ID=20', '2024-07-09 23:17:10'),
(1208, 1, '0:0:0:0:0:0:0:1', '/user/feedback', NULL, 'Add feedback success ID=21', '2024-07-09 23:17:11'),
(1209, 1, '0:0:0:0:0:0:0:1', '/user/feedback', NULL, 'Add feedback success ID=22', '2024-07-09 23:17:11'),
(1210, 1, '0:0:0:0:0:0:0:1', '/user/feedback', NULL, 'Add feedback success ID=23', '2024-07-09 23:17:33'),
(1211, 1, '0:0:0:0:0:0:0:1', '/user/feedback', NULL, 'Add feedback success ID=24', '2024-07-09 23:17:33'),
(1212, 1, '0:0:0:0:0:0:0:1', '/user/feedback', NULL, 'Add feedback success ID=25', '2024-07-09 23:17:33'),
(1213, 1, '0:0:0:0:0:0:0:1', '/user/feedback', NULL, 'Add feedback success ID=26', '2024-07-09 23:22:36'),
(1214, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=3 successfully', '2024-07-10 01:05:53'),
(1215, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=2 successfully', '2024-07-10 01:16:49'),
(1216, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=4 successfully', '2024-07-10 01:17:00'),
(1217, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=4 successfully', '2024-07-10 01:18:12'),
(1218, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=4 successfully', '2024-07-10 01:18:12'),
(1219, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=4 successfully', '2024-07-10 01:18:20'),
(1220, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=4 successfully', '2024-07-10 01:18:30'),
(1221, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=4 successfully', '2024-07-10 01:18:31'),
(1222, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=3 successfully', '2024-07-10 01:21:16'),
(1223, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=11 successfully', '2024-07-10 01:23:17'),
(1224, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=1 successfully', '2024-07-10 01:28:48'),
(1225, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=2 successfully', '2024-07-10 01:32:52'),
(1226, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=9 successfully', '2024-07-10 01:34:35'),
(1227, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=9 successfully', '2024-07-10 01:38:13'),
(1228, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=1 successfully', '2024-07-10 01:38:23'),
(1229, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=1 successfully', '2024-07-10 01:38:25'),
(1230, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=1 successfully', '2024-07-10 01:38:26'),
(1231, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=1 successfully', '2024-07-10 01:38:27'),
(1232, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=1 successfully', '2024-07-10 01:40:25'),
(1233, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=1 successfully', '2024-07-10 01:41:06'),
(1234, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=1 successfully', '2024-07-10 01:46:17'),
(1235, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=106 successfully', '2024-07-10 01:48:23'),
(1236, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=106 successfully', '2024-07-10 01:48:27'),
(1237, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=2 successfully', '2024-07-10 01:48:32'),
(1238, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=2 successfully', '2024-07-10 01:48:34'),
(1239, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=11 successfully', '2024-07-10 01:48:50'),
(1240, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=33 successfully', '2024-07-10 01:48:53'),
(1241, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=56 successfully', '2024-07-10 01:48:57'),
(1242, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=55 successfully', '2024-07-10 01:49:00'),
(1243, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=9 successfully', '2024-07-10 01:49:04'),
(1244, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=1 successfully', '2024-07-10 01:49:07'),
(1245, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=1 successfully', '2024-07-10 01:50:52'),
(1246, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=55 successfully', '2024-07-10 01:50:57'),
(1247, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=1 successfully', '2024-07-10 01:52:56'),
(1248, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=1 successfully', '2024-07-10 01:54:35'),
(1249, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=1 successfully', '2024-07-10 01:54:37'),
(1250, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=1 successfully', '2024-07-10 01:54:42'),
(1251, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=1 successfully', '2024-07-10 01:54:48'),
(1252, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=1 successfully', '2024-07-10 01:55:23'),
(1253, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=1 successfully', '2024-07-10 01:57:37'),
(1254, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=4 successfully', '2024-07-10 03:18:27'),
(1255, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=4 successfully', '2024-07-10 03:38:10');

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
  `cate_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `productName`, `sale_percent`, `price`, `quantity`, `purpose`, `contraindications`, `ingredients`, `dosage`, `instructions`, `warrantyPeriod`, `storageCondition`, `cate_id`, `type_id`, `supplier_id`, `active`) VALUES
(1, ' Dipomax-J trị viêm da', NULL, 50000, 100, 'DIPROMAX-J là sản phẩm điều trị viêm da Tiết Bã Do Vi Khuẩn (Staphylococcus Pseudintermedius),  Nấm Men (Malassezia Pachydermatis) Và Nấm Ngoài Da (Dermatophytosis). các triệu chứng viêm da cấp trên chó mèo.', '– Không để thuốc dính vào mắt hoặc bôi lên vết thương hở.– Không dùng cho vật nuôi quá mẫn cảm với bất kỳ thành phần nào của thuốc.', 'Betamethasone Dipropionate, Gentamicin Sulfate.', 'Thoa 2 lầngày (sáng & tối) cho đến khi hết các', 'Liều lượng sử dụng tùy thuộc vào mức độ vùng da bị bệnh', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 10, 1, 1, 1),
(2, 'Vắc-xin vô hoạt Nisseiken ARBP ', NULL, 35000, 50, 'Vắc xin ARBP ME giúp phòng ngừa bệnh teo mũi truyền nhiễm ở heo (AR) do nhiễm trùng kết hợp giữa Bordetella bronchiseptica (Bb) và độc tố được Pasteurella multocida (Pm) sinh ra hoặc do Bb hoặc Pm.', 'Dùng cho chó, mèo qua đường miệng, có thể cho ăn trực tiếp hoặc trộn với thức ăn', 'Bordetella bronchiseptica, Pasteurella  multocida,', 'Tiêm 2 mũi', 'Tiêm bắp liều 2ml cho mỗi heo nái mang thai, mỗi lần cách nhau từ 1-2 tháng.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 8, 1, 2, 1),
(3, 'Vắc-xin vô hoạt Nisseiken Swine ', NULL, 25000, 80, 'Vắc-xin vô hoạt kết hợp phòng Actinobacillus pleuropneumoniae (serotypes 1, 2 và 5, cùng các giả độc đố tái tổ hợp) và Mycoplasma hyopneumoniae (cùng chất bổ trợ)', 'Khi con vật biểu hiện một trong những vấn đề sức khỏe hoặc tình trạng thể chất sau đây, hãy xem xét cẩn thận liệu có nên tiêm phòng hay không', 'Actinobacillus pleuropneumoniae, Escherichia coli ', 'Tiêm 2 mũi', 'Tiêm bắp liều 2ml/con từ 3 tuần tuổi hoặc lớn hơn, 2 lần mỗi lần cách nhau 3 – 5 tuần', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 8, 2, 1, 1),
(4, 'Vắc -xin vô hoạt Nisseiken Swine AP ', NULL, 45000, 60, ' Vắc -xin vô hoạt kiểm soát Actinobacillus pleuropneumoniae ở heo  (Serotype 1, 2 và 5, và các độc tố tái tổ hợp)', 'Khi con vật biểu hiện một trong những vấn đề sức khỏe hoặc tình trạng thể chất sau đây, hãy xem xét cẩn thận liệu có nên tiêm phòng hay không.', 'Actinobacillus pleuropneumoniae, Escherichia coli', '1 mlgày', 'Tiêm bắp cổ với liều 1ml/ heo liều đầu từ 35 ngày hoặc lớn hơn, liều thứ 2 được thực hiện sau 3- 5 tuần', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 8, 2, 1, 1),
(5, 'Vắc xin vô hoạt PED+TGE ', NULL, 20000, 30, 'Vắc xin vô hoạt phòng bệnh Viêm dạ dày ruột truyền nhiễm (TGE) và Dịch tiêu chảy cấp (PED) ở lợn', 'Khi con vật biểu hiện một trong những vấn đề sức khỏe hoặc tình trạng thể chất', 'Transmissible Gastroenteritis, Porcine Epidemic Di', '1 mũigày', 'Tiêm vào điểm trũng ở giữa gốc đuôi và hậu môn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 8, 2, 1, 1),
(6, 'Dynazide 20% Injection ', NULL, 15000, 120, 'Dynazide 20% Injection – kháng sinh điều trị nhiễm khuẩn đường tiêu hóa trên gia súc, gia cầm', 'Không nên dùng các loại thuốc khác như monensin, narasin hoặc salinomycin trong khi điều trị bằng thuốc này.', 'Tiamulin hydro fumarate, Tiamulin ', '1mlgày', 'Tiêm bắp.• Bệnh đường ruột (viêm hồi tràng,hồng lỵ, viêm khớp truyền nhiễm): 1 ml / 20 kg thể trọng, bằng 1 hoặc 2 lần tiêm mỗi ngày.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 9, 3, 1, 1),
(7, 'Dynazide 10%', NULL, 30000, 70, 'Dynazide 10% – kháng sinh Tiamulin 10% điều trị bệnh hồng lỵ', 'Không có chống chỉ định cụ thể', 'Tiamulin fumarate 100 g', '1 viêngày', 'Trộn thức ăn. Liều dùng như sau• Điều trị bệnh lỵ trên heo: trộn 1.2 kg DYNAZIDE 10% / 1 tấn thức ăn, dùng trong 5-10 ngày• Điều trị bệnh viêm phổi trên động vật: trộn 2 kg DYNAZIDE 10%/ 1 tấn thức ăn, dùng trong 10 ngày', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 9, 3, 3, 1),
(8, 'Mectinvet Plus', NULL, 40000, 40, 'Mectinvet Plus – trị nội, ngoại ký sinh trên trâu, bò, heo và cừu', 'Không tiêm bắp và tiêm tĩnh mạchKhông sử dụng cho bò sữa giai đoạn không tiết sữa, trong vòng 60 ngày sau khi sinh.Không sử dụng cho bò đang sản xuất sữa thương phẩmKhông sử dụng cho những con vật không được chỉ định, trong trường hợp chó có thể bị chế', 'Ivermectin 10 mgClorsulon 100 mg', '2 viêngày', 'Đường dùng: tiêm dưới da', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 14, 3, 4, 1),
(9, 'Danoguard', NULL, 18000, 50, 'Danoguard – kháng sinh tiêm trị các bệnh hô hấp và đường ruột', 'Không sử dụng cho ngựa chuyên dùng để nuôi lấy thịt', 'Danofloxacin mesylate, Danofloxacin', '100ggày', 'Tiêm bắp hoặc tiêm tĩnh mạch.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 14, 4, 5, 1),
(10, 'Pharmatilin 25%', NULL, 28000, 60, 'Pharmatilin 25%- kháng sinh điều trị bệnh hồng lỵ trên heo', 'Không sử dụng cho động vật có tiền sử nhạy cảm với Tiamulin.• Heo đang điều trị bằng Tiamulin không nên cho ăn thức ăn có chứa polyether ionophores.• Không nên dùng Tiamulin trong vòng 7 ngày trước và sau khi sử dụng polyether ionophores.', 'Tiamulin hydrogen fumarate', '1 viêngày', 'Trộn thức ăn 150-200g Tiamulin hydrogen fumarate/ tấn thức ăn (150-200ppm)', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 9, 4, 2, 1),
(11, 'Colicure 40%', NULL, 52000, 60, 'Colicure 40% – kháng sinh điều trị bệnh đường ruột', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Colistin sulfate, Colistin', '10 mlgày', 'Trộn vào thức ăn với liều 160ppm (hay 400g COLICURE 40% cho 1 tấn thức ăn) dùng liên tục trong 5-10 ngày ( 100.000 IU / kg thể trọng) .', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 9, 4, 1, 1),
(12, 'Colicure 40%', NULL, 62000, 60, 'Colicure 40% – kháng sinh điều trị bệnh đường ruột', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Colistin sulfate, Colistin', '10 mlgày', 'Trộn vào thức ăn với liều 160ppm (hay 400g COLICURE 40% cho 1 tấn thức ăn) dùng liên tục trong 5-10 ngày ( 100.000 IU / kg thể trọng) .', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 9, 4, 2, 1),
(13, 'Nutrimax-plus', NULL, 47000, 60, 'Nutrimax-plus là gel dinh dưỡng bổ sung vitamin, khoáng dành cho chó mèo dễ tiêu hóa giúp hỗ trợ sự phát triển, vận động, hồi phục sức khỏe, ngăn ngừa búi lông cho mèo', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Vitamin A, D3, E, B1, B2, B6, B12, B3, Calcium pan', '10 mlgày', 'Dùng cho chó, mèo qua đường miệng, có thể cho ăn trực tiếp hoặc trộn với thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 13, 5, 3, 1),
(14, 'Nokodermaseb', NULL, 59000, 60, 'Nokodermaseb là dung dịch kháng khuẩn và điều trị nấm dạng xịt chứa Chlorhexidine, Miconazole, giúp thú cưng khỏi các triệu chứng khó chịu, đau đớn do nấm da', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Miconazole Nitrate, Chlorhexidine gluconate', ' 2 – 3 lần/ ngày', 'Sau khi vệ sinh, làm sạch da, xịt thuốc trực tiếp lên vùng da bị nhiễm nấm', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 12, 5, 4, 1),
(15, 'Itragol dung dich uống itraconazole', NULL, 66000, 60, 'Giúp điều trị hiệu quả bệnh nấm da ở mèo do Microsporum canis tác nhân gây bệnh phổ biến và chủ yếu nhất ở mèo, có thể lây lan cho cả chó và người cùng các bệnh nhiễm trùng liên quan đến nấm men Malassezia gây viêm da và nhiễm trùng.', 'Không sử dụng itraconazole cho mèo bị suy giảm chức năng gan thận, mèo mẹ đang mang thai và đang cho con bú.', 'Itraconazole ', '5 mg itraconazole/kg thể trọng', ' Dùng một lần mỗi ngày vào các tuần xen kẽ cho 3 đợt điều trị.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 15, 5, 5, 1),
(16, 'Selight 120 (Selamectin 12%) ', NULL, 85000, 60, 'Selight 120 là thuốc nhỏ gáy trị nội ngoại ký sinh, với thành phần chính là Selamectin, ngoài phòng trị ve, bọ chét, rận tai, thuốc nhỏ gáy trị ve rận Selight còn phòng và trị được giun tim cho chó mèo', 'không dùng cho chó mèo dưới 6 tuần tuổi', 'selamectin', '0.25ml', 'Dùng tay vạch lớp lông dưới cổ thú, giữa 2 bả vai để bộc lộ vùng da. Nhỏ trực tiếp lên da.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 15, 5, 6, 1),
(17, 'Selight 60 (Selamectin 6%)', NULL, 90000, 60, 'Selight 60 là thuốc nhỏ gáy trị nội ngoại ký sinh, với thành phần chính là Selamectin, ngoài phòng trị ve, bọ chét, rận tai, thuốc nhỏ gáy trị ve rận Selight còn phòng và trị được giun tim cho chó mèo', 'không dùng cho chó mèo dưới 6 tuần tuổi', 'selamectin', '0.25ml', 'Dùng tay vạch lớp lông dưới cổ thú, giữa 2 bả vai để bộc lộ vùng da. Nhỏ trực tiếp lên da. ', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 15, 1, 7, 1),
(18, 'Early 3Cs', NULL, 42000, 60, 'Early 3Cs là một giải pháp bù nước hiệu quả cho gà con.', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Vitamin E: 0.2mgProbiotic, acid amin, tá dược vừa', '100g ', 'Trộn đều trong 5-6 phút. Khi hạt Early3Cs được hoàn nguyên, sản phẩm lúc này đã sẵn dùng cho gà con trong khay gà/ hộp vận chuyển gà hoặc ở bên ngoài', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 5, 1, 5, 1),
(19, 'Nutrimax-plus', NULL, 45000, 60, 'Nutrimax-plus là gel dinh dưỡng bổ sung vitamin, khoáng dành cho chó mèo dễ tiêu hóa giúp hỗ trợ sự phát triển, vận động, hồi phục sức khỏe, ngăn ngừa búi lông cho mèo', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Vitamin A, D3, E, B1, B2, B6, B12, B3, Calcium pan', '10 mlgày', 'Dùng cho chó, mèo qua đường miệng, có thể cho ăn trực tiếp hoặc trộn với thức ăn.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 13, 1, 8, 1),
(20, 'Nokodermaseb', NULL, 32000, 60, 'Nokodermaseb là dung dịch kháng khuẩn và điều trị nấm dạng xịt chứa Chlorhexidine, Miconazole, giúp thú cưng khỏi các triệu chứng khó chịu, đau đớn do nấm da', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Miconazole Nitrate, Chlorhexidine gluconate', ' 2 – 3 lần/ ngày', 'Dùng cho chó, mèo qua đường miệng, có thể cho ăn trực tiếp hoặc trộn với thức ăn.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 12, 1, 9, 1),
(21, 'Cát vệ sinh Captain Meow 5 lít', NULL, 72000, 60, 'dùng để cho mèo đi vệ sinh', 'Không có', 'Bentonite ', 'Đồ lượng vừa đủ vào khay vệ sinh với độ dày tầm 2', 'Khi tiếp xúc với chất tải rắn và lòng của vật nuôi, cát sẽ đóng thành từng cục nhỏ. Sử dụng xẻng xúc cát ra khỏi khay. Không cần đổ bỏ phần cát còn lại mà làm đầy bằng cách đó thêm cát với độ dày như đã khuyến cáo.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 2, 5, 10, 1),
(22, 'Thức ăn ướt Regalos cho mèo', NULL, 37000, 60, 'pate cao cấp được tuyển chọn nguyên liệu 100% cá ngừ trắng thơm ngon nhất theo tiêu chuẩn dùng cho người giúp cung cấp dưỡng chất thiết yếu, hỗ trợ cho quá trình phát triển của mèo cưng', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cá ngừ, cá hồi, ức gà, cá bào Katsuobushi, thanh c', '2-3g', 'Cho mèo ăn trực tiếp, liều lượng tùy thuộc vào giống mèo, tuổi, cân nặng & mức độ hoạt động.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 6, 5, 5, 1),
(23, 'Jinny Stick – Snack cho mèo', NULL, 48000, 60, 'Thích hợp cho ăn như bánh ăn nhẹ hoặc phần thưởng cho thú cưng để thể hiện tình yêu của bạn với vật nuôi hay trong quá trình huấn luyện mèo. ', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cá ngừ, cá hồi, ức gà, cá bào Katsuobushi, thanh c', '1 góigày', ' Ăn ngay sau khi mở', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 6, 5, 1, 1),
(24, 'Nước hoa cho chó mèo Cupid Perfume', NULL, 90000, 60, 'Cupid Perfume là dòng nước hoa diệu kì dành cho chó mèo trong gia đình bạn giúp dưỡng lông, khử mùi, tạo hương thơm trên mình thú cưng nhanh với mùi hương được lưu giữ lâu nhẹ nhàng.', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Propylene glycol, Tea extract oil 0.2%', '0.25ml', 'Xịt trực tiếp', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 2, 5, 5, 1),
(25, 'Pet Ear Cleaner', NULL, 62000, 60, 'làm sạch tai cho chó mèo', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Propylene glycol, Tea extract oil 0.2%', '2-3 lần -tuần', 'Lắc kỹ chai thuốc trước khi sử dụng. Nhỏ vào tai, sau đó lấy tay xoa nhẹ phần gốc tai, lau phần trên vành tai và các phần khác bằng bông gòn thấm. Lấy bông ngoáy tai hoặc khăn mềm cho nhẹ nhàng vào tai thú cưng lấy các chất bẩn ra.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 2, 5, 2, 1),
(26, 'Nutri-Forte Gel', NULL, 82000, 60, 'Nutri-Forte gel là thức ăn rất hữu dụng cho thú cưng trong các trường hợp cần cung cấp năng lượng và các chất dinh dưỡng cần thiết trong trường hợp suy dinh dưỡng, biếng ăn hoặc cần chăm sóc đặc biệt', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Vitamin A, Vitamin D3, Vitamin E, Thiamine (B1), R', '1 thìa cà phê mỗi 4-6 giờ.', 'Cung cấp qua đường miệng.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 6, 5, 3, 1),
(27, 'Metricyclin – viên đặt tử cung chlortetracyclin', NULL, 49000, 60, 'Dùng để phòng bệnh viêm nội mạc tử cung sau khi sinh và điều trị các trường hợp nhiễm trùng tử cung.', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 5, 5, 5, 1),
(28, 'Advance Sulfa Thoxine –', NULL, 57000, 60, 'Đặc trị cầu trùng, ký sinh trùng đường máu, đầu đen', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 3, 5, 4, 1),
(29, 'Advance New Max', NULL, 55000, 60, 'môi trường pha tinh heo', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 5, 2, 5, 1),
(30, 'Advance Pro-lim', NULL, 62000, 60, 'Thức ăn bổ sung, hỗ trợ bổ sung khoáng chất cho gia súc.', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 7, 3, 6, 1),
(31, 'Mectinvet Injection', NULL, 52000, 60, 'trị nội ngoại ký sinh', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 13, 3, 7, 1),
(32, 'Vắc xin nhược độc phòng bệnh Dịch tả heo ', NULL, 82000, 60, 'phòng bệnh Dịch tả heo (Sản xuất trên tế bào)', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 8, 2, 8, 1),
(33, 'Vắc xin vô hoạt', NULL, 72000, 60, 'phòng bệnh tai xanh chủng NVDC-JXA1', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 8, 6, 9, 1),
(34, 'Vắc xin vô hoạt', NULL, 82000, 60, 'phòng bệnh Newcastle (chủng Lasota) và Cúm gia cầm (phân typ H9, chủng SS)', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 8, 4, 5, 1),
(35, 'TUKONO', NULL, 34000, 60, 'Tukono giúp điều trị viêm tai ngoài cấp tính hoặc mãn tính ở thủ cưng do vi khuẩn và nấm gây ra, đặc biệt là Maracetia pachydermatis', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 2, 5, 10, 1),
(36, 'PROVITA', NULL, 45000, 60, 'bổ sung vitamin khoáng, acid amin cho vật nuôi khỏe mạnh', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 13, 5, 1, 1),
(37, 'SUPER RED SKIN (NANO)', NULL, 52000, 60, 'giúp gà đá săn da, giảm bầm, phòng nấm', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 5, 4, 2, 1),
(38, 'Advance Keto – Ketoconazole', NULL, 60000, 60, 'giúp trị nấm da cho chó mèo', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 3, 4, 3, 1),
(39, 'CP – CIN 20 hormone', NULL, 70000, 60, 'Kích thích phát triển', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 11, 2, 4, 1),
(40, 'I-Pett Doggy Gel', NULL, 72000, 60, 'cung cấp Omega 3 vi khoáng thiết yếu cho chó', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 13, 5, 5, 1),
(41, 'I-Pett Kitty Gel', NULL, 98000, 60, 'cung cấp Omega 3 vi khoáng thiết yếu cho mèo', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 13, 5, 6, 1),
(42, 'I-PETT LIPOTIN', NULL, 67000, 60, 'viên chăm sóc chuyên sâu da lông dành cho chó', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 3, 1, 7, 1),
(43, 'Nutrical', NULL, 42000, 60, 'viên bổ sung Canxi và khoáng cho chó tầm vóc lớn', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 13, 1, 8, 1),
(44, 'Dotrol', NULL, 56000, 60, 'Dung dịch điều trị giun cho chó dưới 1 tuổi', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 14, 1, 9, 1),
(45, 'Catrol', NULL, 47000, 60, 'Dung dịch điều trị giun tròn trên mèo', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 14, 5, 10, 1),
(46, 'Lac-premix', NULL, 49000, 60, 'Thức Ăn Bổ Sung Vitamin, Khoáng Và Methionine Cho Heo Và Gia Cầm', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 13, 2, 5, 1),
(47, 'Yemune G7 ', NULL, 45000, 60, 'phòng bệnh Newcastle (chủng A VII)', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 8, 2, 1, 1),
(48, 'AVI Pox', NULL, 47000, 60, 'Vắc-xin phòng bệnh đậu gà, dòng Cutter', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 8, 4, 2, 1),
(49, 'THUỐC THÚ Y SUPERCID', NULL, 46000, 60, 'Dùng sát trùng chuồng trại, dụng cụ chăn nuôi, phương tiện vận chuyển, hố chôn, môitrường, khu vực chế biến thịt, sữa… để phòng và xử lý các dịch bệnh do vi khuẩn, virus,nấm mốc, bào tử gây ra trên gia súc, gia cầm.', 'Không dùng đồng thời với xà phòng.', 'Glutaraldehyde 250gFormaldehyd 185gAlkyl -dimeth', ' 1 lít SUPERCID với 250-300 lít nước sạch', ' Khử trùng không khí: pha 1 lít SUPERCID với 250-300 lít nước sạch, phun sương vớitỷ lệ 1 lít dung dịch đã pha cho 150 m3 không khí.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 12, 3, 3, 1),
(50, 'THUỐC THÚ Y VIATOX', NULL, 48000, 60, '– Diệt ruồi, muỗi, nhặng, kiến, gián, bọ chét, cái ghẻ trong trại chăn nuôi gia súc, gia cầm, gia đình, bãi rác, khu chôn xác động vật chết.– Phòng, trị: Ve bò, rận, ghẻ, bọ chét, bét, bọ chó, mòng trên trâu, bò, dê, cừu, lợn, mạt gà ở gia cầm.', 'Không ăn uống, hút thuốc khi sử dụng chế phẩm.* Không phun trên ao cá, bể cá, nơi đựng thức ăn, nước sinh hoạt, không đổ chế phẩm thừa xuống ao, hồ, sông, suối…', 'Deltamethrin, Dung môi vừa đủ', '1 lít ', ' Chuồng trống: phun đều lên tường, trần, sàn, cột, máng ăn, uống, không khí…', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 12, 4, 5, 1),
(51, 'THỨC ĂN BỔ SUNG BIOSUBTYL CHÓ MÈO', NULL, 49000, 60, '– BIOSUBTYL được bào chế theo công nghệ bao vi nang, siêu tan, cung cấp bổ sung các lợi khuẩn có ích, vitamin và điện giải giúp cân bằng hệ vi sinh đường ruột.– Tăng cường hệ miễn dịch, hỗ trợ và cải thiện rối loạn tiêu hoá, giúp phòng và trị tiêu chảy ', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Bacillus subtilis, Saccharomyces cerevisiae, Lipas', 'Chó con, mèo (nhỏ hơn 6 tháng tuổi):…………………….1 gói', 'Trộn thường xuyên vào khẩu phần thức ăn hoặc pha nước uống.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 7, 5, 6, 1),
(52, 'SACCHAROMYCES CEREVISIAE MEN SỐNG CHỊU KHÁNG SINH', NULL, 41000, 60, '– Nâng cao hiệu quả sử dụng thức ăn giúp vật nuôi hấp thu tối đa các chất dinh dưỡng, tăng trọng nhanh, giảm chi phí thức ăn.– Giúp cân bằng hệ vi sinh đường ruột cho gia súc, gia cầm.', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Saccharomyces cerevisiae', '– Heo con:1,5-2kg/tấn TĂ.– Heo', 'Để đảm bảo sản phẩm trộn đều trong thức ăn, nên trộn sản phẩm (Đã được tính theo liều quy định) với lượng thức ăn nhỏ rồi tăng dần lên.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 9, 2, 7, 1),
(53, 'THUỐC THÚ Y KHÁNG THỂ HEO CON PREVENTAL', NULL, 42000, 60, '– Bổ sung kháng thể IgG, L-Carnitine trong sữa đầu tăng cường hệ miễn dich, chống lại các loại virus và vi khuẩn xâm nhập cơ thể vật nuôi.', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Beta glucan, Mannan oligosaccharides, Dung môi vđ ', 'Mỗi lần xịt tương ứng 1ml.', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 10, 2, 8, 1),
(54, 'THUỐC THÚ Y ACEFA S LA', NULL, 40000, 60, 'Đặc trị các chứng viêm và nhiễm trùng trên trâu, bò, dê, cừu, heo', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cefalexin, Dung môi (Labrac PG,…)', '20ml ', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 3, 3, 9, 1),
(55, 'VIABIO MEN SỐNG GISOL ', NULL, 42000, 60, 'Bổ sung các lợi khuẩn dạng bào tử. Bào tử có thể sống sót ở nhiệt độ môi trường cao, khi di chuyển qua môi trường pH acid của dịch vị dạ dày – nơi phần lớn các vi khuẩn ở dạng thường sẽ bị tiêu diệt. Chống chịu tốt với các kháng sinh, có tác dụng vượt trộ', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Bacillus, Độ ẩm, Cát sạn, Tá dược ', '100gr/300kgTTgày ', 'Pha nước uống hoặc trộn thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 12, 6, 10, 1),
(56, 'THUỐC DIỆT RUỒI', NULL, 47000, 60, 'THU HÚT MẠNH – DIỆT RUỒI NHANHHIỆU LỰC TỨC THÌ – TÁC DỤNG KÉO DÀI', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Thiamethoxam, Tá dược vđ', '15g thuốc với 50g đường cát', 'Pha nước uống hoặc trộn thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 3, 6, 5, 1),
(57, 'VIABIO MEN SỐNG GISOL ', NULL, 40000, 60, 'Bổ sung các lợi khuẩn dạng bào tử. Bào tử có thể sống sót ở nhiệt độ môi trường cao, khi di chuyển qua môi trường pH acid của dịch vị dạ dày – nơi phần lớn các vi khuẩn ở dạng thường sẽ bị tiêu diệt. Chống chịu tốt với các kháng sinh, có tác dụng vượt trộ', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Bacillus, Độ ẩm, Cát sạn, Tá dược vđ', '100gr/300kgTTgày', 'Pha nước uống hoặc trộn thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 13, 6, 7, 1),
(58, 'VIABIO.KN01 MEN KHỬ MÙI NỀN CHUỒNG', NULL, 72000, 60, 'Hỗ trợ đệm lót nhằm: không phải dọn phân, rửa chuồng hàng ngày (nuôi lợn), không phải định kỳ thay đệm lót (nuôi gà) trong suốt quá trình nuôi, hút ẩm, khử mùi hôi trong tiểu khí hậu trang trại chăn nuôi nhưng vẫn đảm bảo chuồng nuôi hầu như không còn mùi', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Bacillus, Độ ẩm, Cát sạn, Tá dược vđ, Saccharomyce', '1kg chế phẩm trộn cùng 5-7 kg bột ngô hoặc cám gạo', 'Pha nước uống hoặc trộn thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 12, 6, 5, 1),
(59, 'THUỐC THÚ Y AZ.FASCIOLIS', NULL, 78000, 60, 'Tẩy sạch sán lá gan (sống trong ống mật), sán lá dạ cỏ, sán dây, các loại giun tròn, cả dạng ấu trùng và trưởng thành ký sinh ở trâu, bò, dê, cừu.', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Triclabendazole, Tá dược vđ', 'Trâu, bò: 1 viên/60kgTTDê, cừu:1/2 viên/25kgTT', 'Pha nước uống hoặc trộn thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 5, 3, 5, 1),
(60, 'THUỐC THÚ Y VIA', NULL, 42000, 60, 'Thuốc có tác dụng điều trị các bệnh nhiễm trùng nhạy cảm với Ampicillin và Erthromycin. Đặc hiệu với bệnh gà rù, gà toi, xù lông, sã cánh, mào thâm, chướng diều, khô chân, ăn không tiêu. Gia cầm tiêu chảy phân xanh, phân trắng, nghẹo đầu, nghẹo cổ, gục đầ', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Ampicillin trihydrate, Erythromycin thiocyanate', '10g/20kgTT hoặc 2g/lít nước uống', 'Pha nước uống hoặc trộn thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 12, 3, 8, 1),
(61, 'THUỐC THÚ Y CÚM GIA CẦM VIA', NULL, 49000, 60, 'Đặc trị nhiễm trùng đường tiêu hoá, hô hấp, sinh dục trên gia cầm như: tiêu chảy phân xanh, phân trắng bết hậu môn, hở rốn, viêm rốn, lòng đỏ chậm tiêu, CRD (khò khè) do E.coli, Salmonella gây ra.', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Ampicillin trihydrate, Erythromycin thiocyanate', '1g/kgTTgày hoặc pha 2 thìa cafe/lít nước', 'Pha nước uống hoặc trộn thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 5, 4, 3, 1),
(62, 'THUỐC THÚ Y SANFO.GENTADOX', NULL, 67000, 60, 'Điều trị các bệnh nhiễm trùng do các chủng vi khuẩn nhạy cảm với Gentamicin và Doxycycline:', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Doxycycline hyclate, Gentamicin sulphate, ', '1g/5kgTTgày', 'Pha nước uống hoặc trộn thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 12, 2, 6, 1),
(63, 'THUỐC THÚ Y AZ-MOXY 50S', NULL, 56000, 60, 'Đặc trị nhiễm khuẩn đường tiêu hoá, hô hấp, sinh dục gây ra bởi các vi khuẩn nhạy cảm với Amoxicillin:', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Amoxycillin, Tá dược ', '50g/200 lít nước', 'Pha nước uống hoặc trộn thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 12, 3, 6, 1),
(64, 'THUỐC THÚ Y AMPI-COLI (GOLD)', NULL, 56000, 60, 'Đặc trị các trường hợp nhiễm khuẩn do vi khuẩn nhạy cảm với Ampicillin và Colistin trên gia cầm như: Bệnh tiêu chảy do E.coli, Salmonella gây tiêu chảy phân xanh, phân trắng nhớt, bại huyết kéo màng trắng trên bao tim và gan; viêm túi lòng đỏ và hở rốn, b', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Ampicillin trihydrat, Colistin sulfate, Coloring a', '100g/400-600kgTTgày.', 'Pha nước uống hoặc trộn thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 12, 4, 5, 1),
(65, 'THUỐC THÚ Y VIA.DOXY-200', NULL, 42000, 60, 'Đặc trị nhiễm khuẩn đường hô hấp, tiêu hoá do vi khuẩn nhạy cảm với Doxycycline:', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Doxycycline HCl, Tá dược vđ', '1g/8-10kgTTgày', 'Pha nước uống hoặc trộn thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 12, 3, 5, 1),
(66, 'THUỐC THÚ Y VIATOX 300', NULL, 82000, 60, 'Diệt trừ các loại côn trùng gây hại như muỗi, ruồi, kiến, gián, ve, chấy, rận, bọ chét …', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '1 lít', 'Phun toàn bộ chuồng trại', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 3, 3, 5, 1),
(67, 'THUỐC THÚ Y SANFO.TIAMULIN', NULL, 52000, 60, 'Trị các bệnh hô hấp, tiêu hoá do vi khuẩn nhạy cảm với Tiamulin gây bệnh trên heo và gia cầm.', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Tiamulin hydrogen fumarate', '1kg/10-12 tấn TTgày ', 'Pha nước uống hoặc trộn thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 5, 2, 5, 1),
(68, 'THUỐC THÚ Y MOXYCOLI NANO', NULL, 22000, 60, 'Đặc trị nhiễm trùng đường tiêu hoá, hô hấp trên gia cầm và heo:', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Amoxicillin, Colistin sulfate', '100g/200 lít nước ', 'Pha nước uống hoặc trộn thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 5, 2, 5, 1),
(69, 'THỨC ĂN BỔ SUNG GLUCO-K.C', NULL, 62000, 60, 'Gluco -K.C giúp giải độc, giải nhiệt, làm mát cơ thể khi bị sốt cao, cầm máu, phòng báng nước cho gà hữu hiệu.', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Vitamin C, Vitamin K3, Glucose.', '200g pha với 20 lít nước uống.', 'Pha nước uống hoặc trộn thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 5, 3, 5, 1),
(70, 'THUỐC THÚ Y DOXYCOLI NANO', NULL, 92000, 60, 'Gia cầm: Đặc trị CRD – khò khè, CRD ghép ORT, CRD ghép E.coli tiêu chảy phân xanh, phân trắng Coryza, bạch lỵ, thương hàn, tụ huyết trùng.Heo: Đặc trị bệnh viêm phổi do Mycoplasma gây ho khan, ho kéo dài, viêm phổi dính sườn, tụ huyết trùng, lepto, hồng', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Doxycycline hyclate, Colistin sulfate', '1kg/30-35 tấnTTgày', 'Pha nước uống hoặc trộn thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 5, 4, 5, 1),
(71, 'THUỐC THÚ Y COLISTIN 10% PREMIX', NULL, 82000, 60, 'Đặc trị các bệnh nhiễm khuẩn tiêu hoá như E.coli, viêm ruột, tiêu chảy phân xanh, phân trắng, phân có bọt, thương hàn, bạch lỵ, viêm rốn gà con.', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Colistin sulphate, tá dược vđ', '1kg/8-10 tấnTT ', 'Pha nước uống hoặc trộn thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 5, 2, 5, 1),
(72, 'MEN SỐNG BIOSUBTYL', NULL, 72000, 60, 'BIOSUBTYL là hỗn hợp men sống chịu kháng sinh và kháng acid; bổ sung dạng thức ăn cho gia súc, gia cầm.', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Lactobacillus aicdophiius, Bacillus subtilis, Sacc', '1g/10kgTT', 'Pha nước uống hoặc trộn thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 9, 3, 5, 1),
(73, 'Vắc-xin phòng bệnh đậu gà', NULL, 50000, 100, 'AVI Pox giúp tạo miễn dịch chủ động của gà chống lại bệnh đậu gà.', 'Được dùng để chủng ngừa lần đầu hoặc tái chủng cho gà thịt, hậu bị và gà hướng trứng.', 'Trong 1 liều vắc-xin chứa: Virus dòng Cutter gây bệnh Đậu gà ở dạng nhược độc, đông khô.', '1 mũigày', 'Gà nên được chủng ngừa từ 4 – 16 tuần tuổi.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thấp', 8, 4, 1, 1),
(74, 'Vắc-xin bất hạt phòng bệnh dịch tả gà', NULL, 30000, 50, 'Được khuyến cáo sử dụng cho đàn gà giúp phòng bệnh Newcastle (dịch tả gà).', 'Không dùng cho gà con', 'Trong 1 liều vắc-xin chứa: Virus dòng Lasota gây bệnh Newcastle, chất bổ trợ là nhũ dầu.', '2 mũigày', 'Tiêm dưới da cổ, hoặc tiêm cơ (cơ ức hoặc đùi), liều 0,5ml/ gà.', '12 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ 2℃～8℃.', 8, 4, 2, 1),
(75, 'Vắc-xin bất phòng bệnh dịch tả gà', NULL, 25000, 70, 'Vắc-xin bất hoạt được khuyến cáo sử dụng cho đàn gà giống và gà đẻ trước đó đã có miễn dịch phòng bệnh Newcastle (ND) và Gumboro từ vắc-xin sống nhược độc.', 'Không nên sử dụng cho gà đang mang thai.', 'Trong 1 liều vắc-xin chứa: Tổ hợp virus dòng Lasota gây bệnh Newcastle,và virus dòng GP gây bệnh Viêm túi Bursal (Gumboro), chất bổ trợ là nhũ dầu.', '1 viêngày', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '18 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thoáng mát', 8, 4, 3, 1),
(76, 'Vắc-xin phòng bệnh viêm phế quản', NULL, 35000, 60, 'Trị bệnh viêm phế quản ở gà.', 'Không nên sử dụng cho gà đang mang thai.', 'Trong 1 liều vắc-xin chứa: Tổ hợp virus dòng Lasota gây bệnh Newcastle, virus dòng Massachussetts gây bệnh Viêm Phế quản truyền nhiễm', '2 mũigày', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '15 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ 2℃～8℃', 8, 4, 4, 1),
(77, 'Vắc-xin phòng IB', NULL, 58000, 90, 'AVI ND Lasota + IB giúp tạo miễn dịch chủ động của gà chống lại bệnh Viêm Phế quản Truyền nhiễm và Newcastle.', 'Không nên dùng cho gà đẻ trứng', 'Trong 1 liều vắc-xin chứa: Virus dòng Massachusetts B48 gây bệnh Viêm Phế quản truyền nhiễm và dòng LaSota gây bệnh Newcastle ở dạng nhược độc, đông khô.', '5mlgày', 'Sử dụng liên tục khi gà có bệnh.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thấp', 8, 4, 1, 1),
(78, 'Lasota+IB Vắc-xin phòng IB dòng Massachusetts', NULL, 18000, 90, 'AVI ND Lasota + IB giúp tạo miễn dịch chủ động của gà chống lại bệnh Viêm Phế quản Truyền nhiễm và Newcastle.', 'Không nên dùng cho gà đẻ trứng', 'Trong 1 liều vắc-xin chứa: Virus dòng Massachusetts B48 gây bệnh Viêm Phế quản truyền nhiễm và dòng LaSota gây bệnh Newcastle ở dạng nhược độc, đông khô.', '5mlgày', 'Sử dụng liên tục khi gà có bệnh.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thấp', 8, 4, 1, 1),
(79, 'Vắc-xin phòng bệnh Newcastle', NULL, 18000, 90, 'AVI ND Lasota giúp tạo miễn dịch chủ động của gà chống lại bệnh Newcastle.', 'Không nên dùng cho gà đẻ trứng', 'Trong 1 liều vắc-xin chứa: Virus dòng Lasota gây bệnh Newcastle, ở dạng nhược độc, đông khô nồng độ tối thiểu 5.5 log10 EID50/ liều.', '5mlgày', 'Sử dụng liên tục khi gà có bệnh.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ 2℃～8℃', 8, 4, 1, 1),
(80, 'AVI IBD Plus Vắc-xin phòng bệnh Gumboro', NULL, 32000, 70, ' AVI IBD Plus giúp tạo miễn dịch chủ động của gà chống lại bệnh Gumboro do virus độc lực gây ra', 'Nên cho đàn gà nhịn khát trong vòng 60-90 phút trước khi uống vắc xin', 'Trong 1 liều vắc-xin chứa: Virus dòng Winterfield 2512 G-61 gây viêm túi bursa, ở dạng nhược độc, đông khô nồng độ tối thiểu 2.0 log10 EID50/ liều', '2 mlgày', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '15 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ khô ráo', 8, 4, 3, 1),
(81, 'Vắc-xin phòng bệnh Gumboro dòng LIBDV', NULL, 28000, 80, 'AVI IBD Inter  giúp tạo miễn dịch chủ động của gà chống lại bệnh Gumboro.', 'Không dùng cho gà đẻ trứng', 'Trong 1 liều vắc-xin chứa: Virus dòng LIBDV gây viêm túi bursa, ở dạng nhược độc', '1 liềugày', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '20 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thấp', 8, 4, 4, 1),
(82, 'Vắc-xin phòng bệnh IB H120', NULL, 20000, 95, 'AVI IB H120 giúp tạo miễn dịch chủ động của gà chống lại bệnh Viêm Phế quản Truyền nhiễm.', 'Được dùng để chủng ngừa lần đầu hoặc tái chủng cho gà thịt, hậu bị và gà đẻ. ', 'Trong 1 liều vắc-xin chứa: Virus dòng Massachusetts H120 gây bệnh Viêm Phế quản Truyền nhiễm, ở dạng nhược độc', '1 viêngày', 'Sử dụng liên tục trong giai đoạn nuôi gà con.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 8, 4, 8, 1),
(83, 'Vắc-xin phòng sổ mũi truyền nhiễm trên gà', NULL, 26000, 65, 'Giảm triệu chứng sổ mũi ở gà.', 'Không nên sử dụng cho gà đang mang thai.', 'Trong 1 liều vắc-xin chứa: tổ hợp 3 chủng huyết thanh A, B, C của vi khuẩn  gây bệnh Sổ mũi truyền nhiễm (bệnh Coryza), đồng nhất với chất bổ trợ là nhôm hydroxit và được bảo quản bởi merthiolate.', '1 mlgày', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '18 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thấp', 8, 4, 2, 1),
(84, 'Vắc xin vô hoạt phòng bệnh Cúm gia cầm', NULL, 32000, 70, 'Ngăn chặn sự phát triển của virus cúm gia cầm', 'Chỉ sử dụng vắc xin trong ngày sau khi đã mở nắp chai.', 'Vắc xin chứa vi rút cúm gia cầm phân typ H9, chủng A/Chicken/Guangdong/SS/94 (H9N2) đã được vô hoạt. Hàm lượng vi rút trước khi vô hoạt ≥ 5×107.0 EID50/ml.', '2 mlgày', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '18 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ 2℃～8℃.', 8, 4, 3, 1),
(85, 'Hỗn hợp dung dịch các axit', NULL, 45000, 90, 'Pro-Acid là sản phẩm được tạo thành tự sự kết hợp của nhiều loại axit hữu cơ với công nghệ đệm được cấp bằng sáng chế.', 'Sau khi mở, phải sử dụng hết sản phẩm càng sớm càng tốt.', 'A-xít Citric, A-xít Lactic , A-xít formic , A-xít Acetic , A-xít Propionic chất mang: nước tinh khiết', 'Chai 500ml', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nơi khô thoáng, tránh ánh sáng mặt trời', 4, 6, 3, 1),
(86, 'Thuốc sát trùng Nano Klea Rx', NULL, 28000, 80, 'Nano Klea Rx có chức năng khử mùi, phân tử nano bạc giúp cải thiện vết thương bề mặt, không gây độc cho thú cưng, thành phần sản phẩm thân thiện với môi trường.', 'Không kích thích', ' Nano Bạc', 'Xịt trực tiếp', 'Xịt trực tiếp lên da, vết thương, khu vực cần điều trị 2-3 lầngày.', '20 tháng kể từ ngày sản xuất', 'Bảo quản nơi thoáng mát, dưới 30oC', 14, 1, 8, 1),
(87, 'Thuốc kháng viêm vịt', NULL, 20000, 95, 'Điều trị viêm, giảm xuất huyết, chống phù nề sau phẫu thuật, tan máu bầm do chấn thương, áp xe.', 'Thú quá mẫn với các thành phần của thuốc.', 'Alpha-chymotrypsin', '1 viêngày', 'Pha vào nước uống hoặc trộn vào thức ăn.', '24 tháng kể từ ngày sản xuất', 'Nơi khô ráo, thoáng mát, nhiệt độ dưới 30oC, tránh ánh nắng trực tiếp. Tránh xa tầm tay trẻ em.', 10, 4, 5, 1),
(88, 'Thức ăn bổ sung ADE.B-Complex', NULL, 26000, 70, ' ADE.B-complex là thức ăn bổ sung dạng bột hòa tan chứa các loại vitamin.', 'Không nên sử dụng cho heo con.', 'trong 1000g chứa: Vitamin A, D3, E, C, B1, B2, B5, B6, B9, B12, Lactose', '1 kggày', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '18 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thoáng mát', 7, 6, 1, 1),
(89, 'Thuốc dung dịch tiêm', NULL, 32000, 75, 'Kích thích co bóp tử cung (duy trì tử cung), thúc đẩy co hồi tử cung và tăng cường tiết sữa.', 'Khi được sử dụng một cách thích hợp theo liều khuyến cáo, oxytocin hiếm khi gây ra các phản ứng bất lợi.', 'Phenol, citric acid monohydrate, sodium chloride, nước pha tiêm.', ' Tiêm 2 mũigày', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '15 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ khô ráo', 9, 3, 2, 1),
(90, 'Dầu tắm đặc trị Modern Pet', NULL, 45000, 90, 'Điều trị ngoại ký sinh trùng cho chó, mèo.', 'Không có.', 'Trong 1l chứa Permethrin 5 g', 'Tắm 1 – 2 tuần/lần', 'Sử dụng tốt cho những chó giống lớn cả lông ngắn và lông dài.', '24 tháng kể từ ngày sản xuất', 'Ở nhiệt độ dưới 30°C , nơi khô ráo, thoáng mát', 1, 1, 3, 1),
(91, 'Kháng thể vi rút viêm gan vịt', NULL, 22000, 85, ' Kháng thể giúp phòng và điều trị khẩn cấp bệnh Viêm gan siêu trùng vịt, ngan, ngỗng, gà tây, gà sao, chim trĩ.', 'Không có', 'Kháng thể vi rút viêm gan vịt. Hiệu giá kháng thể trung hòa ≥ 1: 256', 'Chai 250ml', 'Tiêm dưới da hoặc tiêm bắp.', '24 tháng kể từ ngày sản xuất', 'Ở nhiệt độ 2-8°C', 8, 4, 6, 1),
(92, 'MYCO AD hấp thụ độc tố nấm mốc', NULL, 24000, 75, 'Bổ sung chất hấp thụ độc tố nấm mốc dùng trộn vào thức ăn cho gia súc, gia cầm.', 'Không mất tác dụng khi trộn với bất kì thành phần thức ăn nào.', 'SiO2,AI2O3', '1,5 – 2,5 kg/ tấn thức ăn.', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '18 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thoáng mát', 4, 6, 5, 1),
(93, 'Modern Pet Vita Hemo hỗ trợ tạo máu', NULL, 30000, 80, 'Hỗ trợ tạo máu, giúp thú cưng phục hồi nhanh chóng và kích thích sự thèm ăn sau bệnh.', 'Không có', 'Đồng, Folic acid, Inositol, Niacin, Pantothenic acid, Sắt, Vitamin B1, Vitamin B12, Vitamin B2, Vitamin B6', ' 2,2 ml/ 10 kg thể trọng', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '15 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ khô ráo', 3, 1, 6, 1),
(94, 'Thuốc trị viêm vú trên heo nái', NULL, 20000, 95, 'Được thiết kế đặc biệt để đối phó với tình trạng viêm vú và viêm tử cung ở heo nái.', 'Không có', 'Amoxicillin trihydrate: 15g', '1ml/15kg thể trọng/72 giờ.', 'Tiêm nhắc lại sau 48 giờ nếu cần thiết.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 10, 2, 2, 1),
(95, 'Viên xổ giun cho mèo Prarintel', NULL, 24000, 70, ' Điều trị bệnh nhiễm giun tròn và giun dẹp đường ruột ở mèo.', 'Không nên sử dụng cho mèo đang mang thai.', 'Mỗi viên có chứa:Praziquatel 20mg, Pyrantel pamoate 230 mg', '1 viêngày', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '18 tháng kể từ ngày sản xuất', 'Ở nhiệt độ dưới 25°C', 10, 5, 3, 1),
(96, 'Viên xổ giun cho chó Prarintel Plus', NULL, 32000, 75, 'Kiểm soát và điều trị chứng nhiễm giun dẹp và giun tròn có trong hệ tiêu hóa của chó lớn và chó con.', 'Không sử dụng ở động vật có độ nhạy đã biết với các thành phần hoạt động hoặc với bất kỳ tá dược nào.', 'Praziquatel', '1 viêngày', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '15 tháng kể từ ngày sản xuất', 'Ở nhiệt độ dưới 25°C', 14, 1, 9, 1),
(97, 'hỗ trợ chức năng khớp cho chó mèo', NULL, 18000, 90, 'Bổ sung vitamin và khoáng chất cho chó mèo trong giai đoạn phát triển.', 'Không có', 'L-Ascorbic acid monophosphate', '1 viêngày', 'Sử dụng theo hướng dẫn của bác sĩ.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 5, 1, 5, 1),
(98, 'Viên hỗ trợ chức năng xương cho chó mèo', NULL, 20000, 85, 'nguồn cung cấp canxi và các dưỡng chất thiết yếu cho chó con, chó mang thai và cho con bú.', 'Không có.', 'Dicalcium Phosphate', '1 viêngày', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '18 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thoáng mát', 5, 1, 1, 1),
(99, 'Viên hỗ trợ chức năng thận cho chó mèo', NULL, 22000, 80, 'I-PETT KIDY chứa chiết xuất Phytochemical, Vitamin, axit amin, khoáng và các vi sinh vật có lợi sử dụng cho chó, mèo giúp ngăn ngừa nhiễm trùng đường tiết niệu.', 'Không có', 'Lactobacillus acidophilus, Arginine HCL', '2 viêngày', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '15 tháng kể từ ngày sản xuất', 'Ở nhiệt độ dưới 30°C , nơi khô ráo, thoáng mát', 9, 6, 2, 1),
(100, 'Kháng sinh amox dạng uống cho chó mèo', NULL, 25000, 95, 'Điều trị các bệnh nhiễm trùng trên da và mô mềm, nhiễm trùng răng nướu, đường tiết niệu trên chó mèo.', 'Không sử dụng cho thỏ, chuột lang, hamsters, sóc sin-sin hoặc chuột túi.', 'Amoxicillin trihydrate', 'uống 1 ml, ngày 2 lần.', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '24 tháng kể từ ngày sản xuất', 'Ở nhiệt độ dưới 30°C', 2, 6, 3, 1),
(101, 'Thuốc tiền mê chó mèo Xylinvet', NULL, 20000, 90, 'Thuốc tiền mê cho chó và mèo.', 'Không sử dụng cho động vật đang trong giai đoạn cuối của thai kỳ.', 'Xylazine ', 'Tiêm bắp hoặc tiêm dưới da: 0,125 – 0,25 ml XYLINVET/ 5 kg thể trọng', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '18 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thoáng mát', 9, 6, 4, 1),
(102, 'Thuốc sổ giun cho chó con', NULL, 22000, 85, ' Phòng bệnh giun tim trên chó bằng cách loại bỏ giai đoạn mô của ấu trùng giun tim (Dirolaria immitis) khoảng 1 tháng (30 ngày) sau khi nhiễm.', 'Sử dụng với sự cẩn trọng trên thú bị suy nhược nghiêm trọng', 'Trong mỗi viên nhai chứa: Ivermectin,Pyrantel/ muối Pamoate', '1 viêngày', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '15 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ khô ráo', 14, 1, 5, 1),
(103, 'Thuốc xổ giun cho chó lớn', NULL, 35000, 80, 'Phòng bệnh giun tim trên chó bằng cách loại bỏ giai đoạn mô của ấu trùng giun tim (Dirolaria immitis) khoảng 1 tháng (30 ngày) sau khi nhiễm.', 'Sử dụng với sự cẩn trọng trên thú bị suy nhược nghiêm trọng.', 'Trong mỗi viên nhai chứa: Ivermectin,Pyrantel/ muối Pamoate', '1 mũigày', 'An toàn khi sử dụng trên thú mang thai và cho con bú.', '24 tháng kể từ ngày sản xuất', 'Ở nhiệt độ dưới 30°C, nơi khô ráo, thoáng mát', 14, 1, 1, 1),
(104, 'Thuốc sát trùng Advance APA', NULL, 28000, 80, 'Sát trùng, diệt khuẩn virus, vi trùng, bào tử nấm, Mycoplasma, nấm mốc.', 'Không có', 'Trong 1 lít chứa: Benzalkonium chloride 10%, Glutaraldehyde 15%', 'Phun 1 – 2 lầngày; liên tục 3 – 5 ngày hoặc cho đến khi hết dịch.', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '20 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 12, 6, 1, 1),
(105, 'Thức ăn cao cấp Kanipro dành cho chó trưởng thành', NULL, 22000, 90, 'Bổ sung vitamin và khoáng chất cho chó.', 'Không có', 'Thức ăn chứa bột cá, gia cầm thịt, ngô gluten, bắp, gạo nát, đậu nành, vitamin E (Tocopherol Acetate), và vitamin C (Axit ascorbic).', '1 kggày', 'Sử dụng liên tục trong giai đoạn nuôi chó.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 6, 1, 3, 1),
(106, 'Thuốc mỡ Ancomast phòng trị bệnh viêm', NULL, 24000, 85, 'Sử dụng điều trị cục bộ bệnh viêm vú cấp tính trong giai đọan bò tiết sữa', 'Không có.', 'Neomycin sulphate', 'dùng 1 ống (injector) cho 1 bầu vú bị viêm', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '18 tháng kể từ ngày sản xuất', 'Sản phẩm ở dạng nguyên vẹn và tránh ánh sáng (dưới 30°C)', 9, 3, 4, 1),
(107, 'Chất thay thế sữa Birthright cho thú non', NULL, 26000, 80, 'Là sản phẩm được nghiên cứu dành cho thú con sơ sinh không chứa kháng thể đặc hiệu.', 'Không có', 'Whey sấy khô, sữa tách béo sấy khô, casein, thức ăn đậm đặc protein từ whey sấy khô, huyết tương heo, chất béo động vật.', 'cho ăn lạnh từ 12 giờ sau sinh đến 14 ngày tuổi', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '15 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ khô ráo', 6, 6, 5, 1),
(108, ' Thuốc đặc trị kiểm soát bệnh cầu trùng trên heo con', NULL, 18000, 90, 'Sử dụng để điều trị và kiểm soát bệnh cầu trùng do Isospora suis gây ra trên heo. Tác dụng nhanh chóng và diệt tất cả các giai đoạn của cầu trùng (Isospora suis).', 'Không ảnh hưởng đến chức năng của hệ miễn dịch trong việc ức chế cầu trùng.', 'Toltrazuril', 'liều 20 mg', 'Sử dụng với 1 liều bơm duy nhất cho heo trong tuần đầu tiên sau khi sinh.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 14, 2, 1, 1),
(109, 'Thuốc trị bệnh cầu trùng trên gà vịt ngỗng', NULL, 20000, 85, 'Điều trị và kiểm soát bệnh cầu trùng gây ra bởi Eimeia anseris, Eimeria truncata.', 'Không nên sử dụng cho gia cầm đang mang thai.', 'Toltrazuril', '1 lít sản phẩm dùng được 3 500kg thể trọng.', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '18 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thoáng mát', 14, 4, 2, 1),
(110, 'Sữa tắm dưỡng da cho chó mèo', NULL, 22000, 80, 'Ngăn chặn sự phát triển của ký sinh trùng trong đàn mèo già.', 'Không có', ' Chiết xuất Hemicellulose, nguồn protein đậm đặc, whey sấy khô, dầu olive, nước, sodium saccharide, Xanthan Gum, tinh dầu cây kinh giới', 'Chai 300ml.', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '15 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ khô ráo', 1, 6, 1, 1),
(111, 'Dầu tắm khô dạng mouse', NULL, 20000, 95, 'Douxo S3 SEB phù hợp dùng cho chó mèo có da nhờn hoặc bong tróc: giảm gàu, bã nhờn dư thừa và mùi khó chịu nhờ hoạt động của Seboliance, đồng thời dưỡng ẩm và bảo vệ hệ sinh thái của da.', 'Không có', 'Seboliance, Ophytrium', 'Bơm 1 hoặc 2 lần lên bàn tay và mát-xa để lớp mouse thấm vào da.', 'Sử dụng ngoài da, dùng trên lớp lông khô và đã chải.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 1, 6, 4, 1),
(112, 'Kháng sinh phổ rộng Ceftiofur', NULL, 26000, 65, 'Điều trị bệnh trên đường hô hấp có liên quan đến các vi khuẩn Mannheimia haemolytica.', 'Không sử dụng cho ngựa chuyên dùng để nuôi lấy thịt.', 'Trong mỗi chai 4g chứa: Ceftiofur sodium hay Ceftiofur 4 g', '1 ml dung dịch CEFVET/ 50 kg thể trọng, cách 24 giờ, liên tục 3 – 5 ngày.', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '18 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thoáng mát', 9, 6, 5, 1),
(113, 'Thuốc điều trị bọ chét và ve gây bệnh trên chó', NULL, 32000, 70, 'Điều trị bọ chét và ve gây bệnh trên chó.', 'Không sử dụng cho chó con dưới 2 tháng tuổi', 'Chất Fipronil ', '2ml gày', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '15 tháng kể từ ngày sản xuất', 'Ở nhiệt độ dưới 30°C.', 14, 1, 2, 1),
(114, 'Thuốc điều trị bọ chét và ve gây bệnh trên mèo', NULL, 32000, 70, 'Điều trị bọ chét và ve gây bệnh trên mèo.', 'Không sử dụng cho mèo con dưới 2 tháng tuổi', 'Chất Fipronil ', '2ml gày', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '15 tháng kể từ ngày sản xuất', 'Ở nhiệt độ dưới 30°C.', 14, 5, 2, 1),
(115, 'Thuốc nhỏ tai Auriclean làm sạch tai cho chó', NULL, 28000, 80, 'Giải pháp làm sạch tai cho chó và mèo, khử mùi hôi và dị ứng.', 'Không có', 'Deionized water', 'nhỏ 1-3ml vào ống tai', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '20 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 3, 1, 3, 1),
(116, 'Thuốc bổ sung Crom hữu cơ cho heo', NULL, 45000, 90, 'Giúp heo Cải thiện màu sắc thịt,Tăng tỷ lệ thân thịt,Tăng tỷ lệ thịt thăn...', 'Không có.', 'Chromium (min – max)', 'Trộn thức ăn với liều 1kg/tấn thức ăn', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thấp', 13, 2, 4, 1),
(117, 'Dịch truyền Advance Normal', NULL, 28000, 80, 'Bù nước và chất điện giải do mất nước, dùng làm thuốc nhỏ mắt, rửa vết thương mắt, niêm mạ mũi, làm dung môi pha vaccine.', 'Không có', 'Trong 100ml chứa: Natri clorid ……………………..0.9 g', '1 viêngày', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '20 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 14, 4, 5, 1),
(118, 'Vi khoáng tăng năng suất cho gia cầm', NULL, 20000, 95, 'Bổ sung khoáng chất trong thức ăn chăn nuôi.', 'Không có', 'Canxi, Kẽm', '5mlgày', 'Hòa tan vào nước uống với liều cho gia cầm; 1-2ml / lít nước trong vòng 5 ngày.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 7, 4, 1, 1);
INSERT INTO `products` (`id`, `productName`, `sale_percent`, `price`, `quantity`, `purpose`, `contraindications`, `ingredients`, `dosage`, `instructions`, `warrantyPeriod`, `storageCondition`, `cate_id`, `type_id`, `supplier_id`, `active`) VALUES
(119, 'Vaccine vô hoạt phòng bệnh cúm', NULL, 26000, 70, ' Phòng bệnh cúm gia cầm gây bởi vi-rút cúm gia cầm tái tổ hợp subtype H5.', 'Không nên sử dụng cho gia cầm con.', 'Vaccine chứa vi-rút cúm gia cầm tái tổ hợp subtype H5N1, chủng Re-5 vô hoạt, trước khi vô hoạt, hiệu giá HA≥ 8log2', '0,5 ml/con', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '18 tháng kể từ ngày sản xuất', 'Ở nhiệt độ 2-8 °C. Không được để vaccine đóng đá.', 8, 4, 2, 1),
(120, 'Thuốc trị viêm phổi', NULL, 32000, 75, 'Đặc trị hen khẹc, viêm phổi, e.coli kéo màng, bại huyết, tiêu chảy nặng.', 'Không có', 'Apramycin sulfat, Tá dược vđ', '100g/1,5-2,0 tấnTTgày', 'Hoà nước cho uống hoặc trộn thức ăn, liệu trình 3-5 ngày liên tục.', '15 tháng kể từ ngày sản xuất', 'Nơi khô, nhiệt độ dưới 30 độ C, tránh ánh sáng', 10, 6, 3, 1),
(121, 'Thuốc đặc trị viêm phổi, tiêu chảy nặng', NULL, 18000, 90, 'Đặc trị bại huyết, E.coli kéo màng, tụ huyết trùng, hen khẹc, viêm phổi, viêm màng phổi.', 'Không có', 'Trong 1kg chứa: Cefalexin monohydrate 600g, Tá dược đặc biệt vđ 400g.', '1g/25 – 30kgTTgày', 'Pha nước uống hoặc trộn thức ăn, liệu trình 3-5 ngày liên tục.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 10, 6, 4, 1),
(122, 'Thuốc đặc trị hen gà, khẹc vịt', NULL, 20000, 85, 'Đặc trị viêm đường hô hấp, nhiễm khuẩn đường tiêu hoá.', 'Không nên sử dụng cho gia cầm già đang mang thai.', 'Erythromycin 10g, Colistin 25,000,000 IU, Tá dược đặc biệt vđ 100g.', 'Dùng bằng 1/2 liều trị.', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '18 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thoáng mát', 9, 4, 5, 1),
(123, 'Thuốc đặc trị viêm phổi, chướng diều', NULL, 24000, 85, 'Đặc trị nhiễm trùng đường hô hấp do vi khuẩn nhạy cảm với Sulfadimidine và Oxytetracycline.', 'Không có', 'Trong 1kg chứa: Sulfadimidine 112,5g, Oxytetracycline 60g, Tá dược (Glucose) vđ 827,5g.', 'Dùng bằng 1/2 liều trị.', 'Pha nước uống hoặc trộn thức ăn, liệu trình 3-5 ngày liên tục.', '15 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ khô ráo', 10, 6, 1, 1),
(124, 'Thuốc viêm khớp trên gà', NULL, 35000, 80, 'Trị bệnh viêm khớp do Mycoplasma synoviae (MS) trên gia cầm.', 'Không dùng với thuốc khác.', 'Trong 1kg chứa: Tylosin tartrate 800g, Tá dược vđ 200g.', '1g/4 lít nước uống hoặc 1kg/2 tấnTĂgày, liên tục 5-10 ngày', 'Pha nước cho uống hoặc trộn thức ăn.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thấp', 10, 4, 2, 1),
(125, 'Thuốc viêm phổi ghép thương hàn', NULL, 28000, 80, 'Đặc trị nhiễm khuẩn đường hô hấp gây ra bởi các vi khuẩn nhạy cảm với Florfenicol trên gia cầm và heo.', 'Không có', 'Trong 1kg chứa: Florfenicol 40g, Tá dược vđ 960g.', '100g/400kgTTgày hoặc 1g/lít nước.', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '20 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 10, 6, 3, 1),
(126, 'Thuốc đặc trị viêm hồi tràng', NULL, 28000, 80, 'Linspec Extra chỉ định điều trị các bệnh do vi khuẩn nhạy cảm với Lincomycin và Spectinomycin gây ra.', 'Không có', 'Trong 1kg chứa: Lincomycin HCl 222,2g, Spectinomycin HCl 444,4g, Tá dược vđ 333,4g', '100g/2 tấnTTgày hoặc 1kg/20 tấnTTgày hay 1g/4 lít nước.', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '20 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 10, 4, 10, 1),
(127, 'Thuốc trị suyễn heo', NULL, 20000, 85, 'Đặc trị bệnh viêm phổi do Mycoplasma gây ho khan, ho kéo dài; viêm phổi dính sườn, phó thương hàn, tụ huyết trùng, bệnh do E.coli: phân trắng, phân vàng.', 'Không có', 'Trong 1kg chứa: Florfenicol 500g, Tá dược vđ 500g.', '10g/1.000kgTTgày.', 'Pha nước uống hoặc trộn thức ăn, liệu trình 3-5 ngày liên tục.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 9, 2, 3, 1),
(128, 'Thuốc đặc trị viêm ruột gia cầm', NULL, 24000, 85, 'Đặc trị viêm ruột hoại tử do Clostridium SPP., hồng lị, tiêu chảy trên gia cầm.', 'Không nên sử dụng cho gia cầm đang mang thai.', 'Trong 1kg chứa: Bacitracin methylene disalicylate 150g, Tá dược vđ 850g.', '100g/1-1,2 tấnTTgày hoặc gói 100g/200-250 kgTĂ.', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '18 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thoáng mát', 10, 4, 5, 1),
(129, 'Thuốc đặc trị nấm phổi', NULL, 32000, 75, 'Đặc trị nhiễm trùng do nấm (nấm phổi, nấm phủ tạng, nấm diều, nấm ruột) .', 'Không có', 'Trong 1kg chứa: Neomycin sulfate 100g, Nystatin 75,000,000 IU, Tá dược vđ 899.999.900g.', '100g/200-250kgTTgày hay 1g/2 lít nước uống', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '15 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ khô ráo', 9, 4, 1, 1),
(130, 'Thuốc viêm ruột tiêu chảy', NULL, 35000, 80, 'Đặc trị nhiễm trùng do vi khuẩn nhạy cảm với Gentamicin và Doxycycline trên gia cầm.', 'Không dùng quá liều.', 'Trong 1kg chứa: Gentamicin sulfate 100g, Doxycycline hyclate 200g, Tá dược đặc biệt vđ 700g.', '10g/150-200kgTTgày', 'Pha nước uống hoặc trộn thức ăn, liệu trình liên tục 3-5 ngày.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thấp', 10, 4, 5, 1),
(131, 'Thuốc đặc trị E. coli', NULL, 45000, 90, 'Đặc trị các nhiễm khuẩn đường tiêu hoá, hô hấp.', 'Khi bị bệnh thương hàn, tăng liều gấp đôi.', 'Trong 1kg chứa: Enrofloxacin 100g, Tá dược vđ 900g.', '10g/100kgTTgày', 'Pha nước uống, sữa hoặc trộn thức ăn liệu trình 3-5 ngày.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thấp', 10, 6, 5, 1),
(132, 'Thuốc trị hồng lị trên heo', NULL, 28000, 80, 'Đặc trị bệnh viêm phổi do Mycoplasma gây ho khan, ho kéo dài, viêm phổi dính sườn, lepto, hồng lỵ.', 'Không có', 'Trong 1kg chứa: Doxycycline hyclate 500g; Tá dược đặc biệt vđ 500g.', '1 kg/2tấnTĂgày', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '20 tháng kể từ ngày sản xuất', 'Nơi khô, nhiệt độ dưới 30 độ C, tránh ánh sáng trực tiếp!', 10, 2, 1, 1),
(133, 'Thuốc đặc trị CRD gia cầm', NULL, 20000, 95, 'Đặc trị nhiễm trùng do các vi khuẩn nhạy cảm với Doxycycline và Tylosin trên gia cầm.', 'Không có', 'Trong 1 kg chứa: Tylosin tartrate 100g, Doxycycline hyclate 200g, Tá dược đặc biệt vđ 700g.', '10g/100kgTTgày', 'Pha nước uống hoặc trộn thức ăn, liệu trình liên tục 3-5 ngày.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 10, 4, 2, 1),
(134, 'Thuốc đặc trị E.COL', NULL, 26000, 70, 'Đặc trị nhiễm khuẩn đường hô hấp, viêm ruột tiêu chảy do E.coli.', 'Không nên sử dụng cho heo già đang mang thai.', 'Acid Oxolinic 200g; Tá dược đặc biệt (Lactose, Sodium carbonate) vđ 800g.', '100g/1 tấnTTgày hoặc 100g/100-200 lít nước', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '18 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thoáng mát', 10, 4, 3, 1),
(135, 'Thuốc đặc trị đường hô hấp heo', NULL, 32000, 75, 'Đặc trị các bệnh viêm đường hô hấp, viêm màng phổi (APP).', 'Không có', 'Florfenicol 200g, Doxycycline hyclate 100g, Bromhexine HCl 10g, Vitamin C 20g, Tá dược vđ 670g.', '1g/3 lít nước hoặc 1g/1,5kgTĂ', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '15 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ khô ráo', 10, 2, 4, 1),
(136, 'Kháng sinh trị bệnh vịt ngan', NULL, 18000, 90, 'Trị viêm ruột, tiêu chảy do E.coli, Salmonella cho ngan vịt', 'Không có', 'Trong 1 kg chứa: Enrofloxacin 50g; Tá dược đặc biệt vđ 950g', '1g/10kgTTgày hay 1g/2 lít nước uống.', 'Pha nước uống hoặc trộn thức ăn, liệu trình 3-5 ngày liên tục.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 9, 4, 3, 1),
(137, 'Thuốc đặc trị tiêu chảy', NULL, 20000, 85, 'Trị các bệnh nhiễm trùng dạ dày-ruột do vi khuẩn nhạy cảm với Sulfaguanidine.', 'Không nên sử dụng cho vật nuôi đang mang thai.', 'Trong 100g chứa: Sulfaguanidine 18g, Sodium salicylate 15,5g, Tá dược vừa đủ 66,5g.', '1g/2lít nước uống hoặc 1g/10kgTTgày.', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '18 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thoáng mát', 10, 6, 3, 1),
(138, 'Thuốc đặc trị hen gà', NULL, 24000, 85, 'Đặc trị các trường hợp nhiễm trùng đường tiêu hoá, hô hấp trên gia cầm.', 'Không có', 'Doxycycline hyclate 100g, Tylosin tartrate 50g, Tá dược đặc biệt vđ 850g', '1g/5kgTTgày hoặc 1g/lít nước uống', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '15 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ khô ráo', 10, 4, 5, 1),
(139, 'Tụ huyết trùng gia cầm', NULL, 35000, 80, 'Bệnh tụ huyết trùng ở gà, vịt, ngan, chim cút, biểu hiện gia cầm chết nhanh, xác chết béo, mào, tích, thân thịt tím tái.', 'Không dùng chung với thuốc khác.', 'Colistin Sulfate 1.200.000.000 IU', 'Tá dược đặc biệt vđ 1kg.', 'Pha nước hoặc trộn thức ăn, liệu trình 3-5 ngày liên tục.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thấp', 10, 4, 5, 1),
(140, 'Bộ kháng sinh vịt ngan', NULL, 28000, 80, 'Đặc trị nhiễm trùng huyết, ghép tiêu chảy phân xanh, phân trắng.', 'Không có', 'Ceftiofur sodium', 'Tiêm bắp hoặc tiêm dưới da 1ml/3-5kg/TT', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '20 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 9, 4, 5, 1),
(141, 'Thuốc đặc trị bệnh trên heo', NULL, 22000, 85, 'Đặc trị bệnh trên heo, viêm hồi tràng, suyễn, hồng lỵ.', 'Không tiêm chung với sản phẩm khác', 'Tiamulin hydrogen fumarate', '1ml/5-8kgTT', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 10, 2, 3, 1),
(142, 'Thuốc chống sổ mũi cho chó con', NULL, 26000, 70, 'Giảm triệu chứng sổ mũi ở chó con.', 'Không nên sử dụng cho chó con đang mang thai.', 'Silver nano, Zinc oxide, Quaternary ammonium, Glycerol, Aqua.', 'nhỏ vào mỗi bên mũi từ 1-2 giọt', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '18 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thoáng mát', 9, 1, 5, 1),
(143, 'Thuốc phòng trị nhiễm khuẩn hô hấp', NULL, 32000, 75, 'Đặc trị các bệnh nhiễm khuẩn huyết, bại huyết ở vịt, viêm rốn, tụ huyết trùng, viêm ruột do E.coli, bạch lỵ, thương hàn.', 'Không có', 'Trong 1kg chứa: Chlortetracycline HCl 500g, Tá dược vđ 500g.', '1g/12,5kgTT, tương ứng 1g/2,5 lít nước uống hoặc 2g/2.5kgTĂ', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '15 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ khô ráo', 10, 4, 1, 1),
(144, 'Dung dịch uống', NULL, 45000, 90, 'Tăng cường hệ miễn dịch cho vật nuôi.', 'Dùng kết hợp với kháng sinh giúp mau phục hồi và giảm tỷ lệ chết.', 'Malic acid, Glucosamine, Arginine, Glycine, Vitamin C, B6, B12', '1ml/lít nước uống', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thấp', 11, 6, 1, 1),
(145, 'Hoocmon kích trứng gia cầm', NULL, 28000, 80, 'Tăng năng suất trứng, kéo dài thời gian cao sản.', 'Không có', 'Oxytetracycline HCl 60.000 mg, Vitamin A 4.000.000 IU, Vitamin D3 700.000 IU', 'Pha 1g/lít nước uống hay 1g/5kgTTgày', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '20 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 11, 4, 3, 1),
(146, 'Dịch truyền Glucose 5% cho gia súc, gia cầm, chó mèo', NULL, 45000, 90, 'Trị mất nước ở trâu, bò, dê, cừu, heo, ngựa, chó và mèo; điều chỉnh tăng Kali máu, cải thiện thình trạng hạ đường huyết nhẹ.', 'Không có.', 'Glucose Monohydrate', '100mlgày', 'Tiêm chậm vào tĩnh mạch hoặc xoang bụng.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 9, 6, 3, 1),
(147, 'Thuốc mỡ Drycloxaject phòng trị viêm vú cho gia súc giai đoạn cạn sữa', NULL, 55000, 45, ' Dùng để phòng và trị bệnh viêm vú gây ra bởi các vi trùng Gram + mẫn cảm với Cloxacillin trong giai đoạn cạn sữa.', 'Không có.', 'Glucose Monohydrate', '100mlgày', 'Sau khi vắt hết sữa, lau sạch và sát trùng núm vú tiến hành bơm 1 Injector 9 g thuốc Drycloxa-Ject cho một núm vú có bầu vú bị viêm.Thông thường thì bơm cả bốn phần của bầu vú.', '24 tháng kể từ ngày sản xuất', 'Sản phẩm ở dạng nguyên vẹn và tránh ánh sáng (dưới 30°C)', 9, 3, 1, 1),
(148, 'Kháng sinh Gentaguard 10% Injection đặc trị bệnh cho gia súc', NULL, 34000, 72, 'Điều trị các bệnh do vi khuẩn mẫn cảm với gentamicin, bao gồm Pseudomonas aeruginosa, Rhodococcus equi và Salmonella spp.', 'Không có.', 'Gentamicin ', '2 mũigày', 'Tiêm bắp và tiêm tĩnh mạch chậm, lặp lại sau 8-12 giờ, tùy vào tình trạng bệnh:', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 9, 3, 1, 1),
(149, 'Kháng sinh Enroguard 10% Injection gia súc', NULL, 55000, 90, 'Điều trị nhiễm trùng đường hô hấp, nhiễm trùng đường tiêu hóa do vi khuẩn hoặc Mycoplasma nhạy cảm với Enro­oxacin;', 'Không sử dụng cho bê cung cấp thịt', 'Enro­oxacin', '2 mũigày', 'Tiêm cơ ức hoặc dưới da cổ', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 9, 3, 3, 1),
(150, 'Kháng sinh Enrophar 0.5% Oral trị nhiễm trùng hô hấp, tiêu hóa ở heo', NULL, 45000, 90, 'Đặc trị bệnh tiêu chảy trên heo con và bệnh nhiễm trùng huyết do E. coli mẫn cảm enro­floxacin; Điều trị bệnh nhiễm trùng đường hô hấp do Pasteurella multocida và Mycoplasma spp mẫn cảm với enrofl­oxacin gây ra.', 'Không có.', 'Enrofl­oxacin', '1ml/lần bơm 1 lầngày', 'Bơm trực tiếp vào miệng', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 9, 2, 3, 1),
(151, 'Fermin Tab bổ sung dinh dưỡng hỗ trợ tạo máu cho chó mèo', NULL, 45000, 90, 'I-PETT FERMIN TAB chứa hỗ hợp vitamin và khoáng chất ở dạng chelate giúp thúc đẩy quá trình sản sinh tế bào máu dùng trong trường hợp: Thú mang thai và đang cho con bú; Thú sau khi phẫu thuật và nhiễm ký sinh trùng máu.', 'Không có.', 'Ferrous amino acid chelate, Copper amino acid chelate,Vitamin B6, Vitamin B12, Vitamin K3, Folic acid.', '1 viêngày', 'Cho uống trực tiếp hoặc nghiền, trộn với thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 13, 1, 1, 1),
(152, 'Kháng sinh Amoxclamed 500 trị các bệnh nhiễm trùng trên chó', NULL, 64000, 47, 'Dùng để điều trị bệnh nhiễm trùng trên chó, bao gồm: nhiễm trùng da (nhiễm trùng sâu trong da và bên ngoài), nhiễm trùng mô mềm (ví dụ: áp-xe và nhiễm trùng đường sinh dục) nhiễm trùng hệ tiết niệu, hô hấp bao gồm hệ hô hấp trên và hệ hô hấp bên dưới, nhiễm trùng đường tiêu hóa do các vi khuẩn mẫn cảm Amoxicillin kết hợp với axit Clavulanic.', 'Không dùng cho vật nuôi mẫn cảm với Penicillins; Không sử dụng cho vật nuôi bị suy giảm chức năng thận trầm trọng do chứng bí tiểu và tiểu ít gây ra; Không dùng cho thỏ, chuột lang, chuột hamsters, chinchillas hoặc các loài gặm nhắm nhỏ.', 'Glucose Monohydrate', '2 lần/ ngày', 'Chỉ cấp thuốc bằng đường miệng', '24 tháng kể từ ngày sản xuất', 'Ở nhiệt độ dưới 25°C.', 9, 1, 3, 1),
(153, 'Dầu tắm Modern Pet Dermacare trị viêm nấm da trên chó mèo 100ml – 250ml', NULL, 42000, 23, 'Điều trị và kiểm soát viêm da gây ra do Staphylococcus intermedius và Malassezia pachydermatis', 'Không dùng cho vật nuôi quá mẫn cảm với các thành phần của thuốc.', 'Chlorhexidine gluconate, Miconazole nitrate', '1 – 2 tuần/lần.', 'Làm ướt toàn bộ lông, cho lượng dầu tắm vừa đủ lên lông, xoa đều từ đầu đến chân để tạo bọt, để yên trong 5 – 7 phút cho thuốc thấm, tắm lại với nước sạch vài lần cho đến khi sạch hẳn dầu tắm, sau đó lau và sấy khô lông;', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 1, 6, 3, 1),
(154, 'Vắc xin tái tổ hợp vô hoạt phòng bệnh cúm gia cầm H5N1 – Chủng Re-6', NULL, 45000, 90, 'Phòng bệnh cúm gia cầm gây bởi vi rút cúm gia cầm tái tổ hợp subtype H5. Đáp ứng miễn dịch 14 ngày sau khi tiêm, thời gian bảo hộ đối với gà là 6 tháng và 04 tháng đối với vịt, ngan và ngỗng sau khi tiêm mũi nhắc lại sau 21 ngày.', 'Không có.', 'Glucose Monohydrate', '100mlgày', 'Tiêm cơ ức hoặc dưới da cổ cho gia cầm và thủy cầm theo khuyến cáo của chương trình vaccine', '24 tháng kể từ ngày sản xuất', 'Ở nhiệt độ 2-8 °C. Không được để vaccine đóng đá.', 8, 6, 2, 1),
(155, 'Vắc xin nhược độc đông khô phòng bệnh Tai xanh – Chủng JXA1-R', NULL, 45000, 90, 'Tạo miễn dịch chủ động phòng Hội chứng gây rối loạn hô hấp và sinh sản (PRRS) thể độc lực cao trên heo. Hàm lượng kháng thể đạt cao nhất vào khoảng 21 – 28 ngày sau khi tiêm vaccine, thời gian bảo hộ kéo dài 4 – 6 tháng.', 'Không có.', 'Glucose Monohydrate', '100mlgày', 'Hòa tan vaccine với nước pha đi kèm. Tiêm bắp sau hốc tai.', '24 tháng kể từ ngày sản xuất', 'Ở nhiệt độ 2-8°C. Không được để vaccine đóng đá.', 8, 2, 1, 1),
(156, 'Kháng sinh phổ rộng Advance Amoxclavu S cho chó mèo', NULL, 45000, 90, ' Phòng và trị các bệnh viêm phổi, tiết niệu, tiêu hóa; Trị nhiễm khuẩn da, mô mềm, áp xe, viêm mô tế bào; Hiệu quả đối với nhiễm trùng da lần đầu và viêm da mũ dai dẳng trên chó, mèo.', 'Không có.', 'Amoxicillin trihydrate', '1 ml / 18 -20 kg thể trọng', 'tiêm dưới da.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 9, 6, 3, 1),
(157, 'Thức ăn cao cấp Felipro vị hải sản dành cho mèo mọi lứa tuổi', NULL, 66000, 90, ' Công thức cân bằng khoáng chất làm giảm nguy cơ gây sỏi mật', 'Không có.', 'Bột cá, gia cầm thịt, ngô Gluten, bắp, Broken Rice, đậu nành Bean, Vitamin E (Tocopherol Acetate) và Vitamin C (Axit ascorbic),…', '2-4 bữa/ ngày', '', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 6, 5, 3, 1),
(158, 'Kháng sinh Amoxivet 50% Powder trị bệnh hô hấp, tiêu hóa gia cầm, heo', NULL, 45000, 90, ' Điều trị bệnh trên đường hô hấp do vi khuẩn Actinobacillus pleuropneumoniae mẫn cảm với amoxicillin gây ra trên heo;', 'Không sử dụng cho vật nuôi mẫn cảm với penicillin hoặc kháng sinh nhóm ß- lactam; vật nuôi có dấu hiệu suy gan, suy thận; Không sử dụng cho động vật gặm nhấm như thỏ, chuột lang, chuột hamster và chồn, thú ăn cỏ và ngựa..', 'Amoxicillin trihydrate', '1 ml / 18 -20 kg thể trọng', 'Liều pha nước uống.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 9, 4, 3, 1),
(159, 'Dầu tắm Modern Pet Sunny Gel dành cho chó lông trắng', NULL, 45000, 64, ' Modern Pet Sunny Gel dành cho chó lông trắng, giữ màu lông ko bị ngả vàng, chỉ cần tắm 1 lần là có thể giúp bộ lông cải thiện độ trắng sáng.', 'Không có.', 'Amoxicillin trihydrate', '1 ml / 18 -20 kg thể trọng', 'Làm ướt toàn bộ lông thú yêu, thoa đều sữa tắm Modern Pet Sunny Gel lên da cho đến khi lông thú đầy bọt.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 1, 1, 3, 1),
(160, 'Kháng sinh Nalistin 10 trị nhiễm trùng đường tiêu hóa do khuẩn E. Coli', NULL, 67000, 35, ' Điều trị các bệnh nhiễm trùng đường tiêu hóa do vi khuẩn Salmonella, E. coli và các vi khuẩn nhạy cảm với Colistin gây ra trên heo và gia cầm.', 'Không sử dụng cho động vật mẫn cảm với thành phần của thuốc.', 'Colistin base', '1g NALISTIN – 10/12,5 kg thể trọnggày', ' Pha nước uống', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 9, 4, 3, 1),
(161, 'Dầu tắm Modern Pet Lucky Gel cho thú cưng lông nâu và lông đỏ', NULL, 45000, 90, 'Giúp lông mềm mượt và phù hợp với da nhạy cảm của thú cưng.', 'Không có.', 'Amoxicillin trihydrate', '1 ml / 18 -20 kg thể trọng', 'Làm ướt toàn bộ lông thú yêu, thoa đều sữa tắm Modern Pet Lucky Gel lên da cho đến khi lông thú đầy bọt.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 1, 5, 3, 1),
(162, 'Minical – viên bổ sung Canxi cho thú có tầm nhỏ', NULL, 55000, 90, 'Duy trì khung xương ở thú trưởng thành.', 'Không có.', 'Canxi, Phosphorus, Vitamin A', '2 viên / ngày', '', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 7, 1, 2, 1),
(163, 'Dầu tắm Modern Pet Sweetie Gel khử mùi và tạo kiểu', NULL, 45000, 34, 'Giúp lông mịn, bông, dễ dàng tạo kiểu cho thú cưng của bạn.', 'Không có.', 'Vitamin B6, Glycerin, D- Pantothenol, Acid Citric', '', 'Làm ướt toàn bộ lông thú yêu, thoa đều sữa tắm Modern Pet Sweetie Gel lên da cho đến khi lông thú đầy bọt.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 1, 1, 1, 1),
(164, 'Kháng sinh Marbovet 80 trị nhiễm trùng da và mô mềm trên chó', NULL, 55000, 66, ' Điều trị chứng nhiễm trùng da và mô mềm (viêm da có mủ, chốc lở, viêm nang lông, viêm da, viêm mô tế bào), nhiễm trùng đường tiết niệu và hô hấp do các vi khuẩn mẫn cảm với Marbofloxacin gây ra trên chó.', 'Không có.', 'Marbofloxacin', '2 mg/kg', '2 mg/kg thể trọng bằng đường miệng', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 9, 1, 3, 1),
(165, 'KC-Pol bổ sung hỗn hợp vitamin, khoáng và axit amin', NULL, 45000, 90, ' Kích thích tăng trọng và tăng sản xuất trứng', 'Không có.', 'Amoxicillin trihydrate', '5-10kg/tấn', '', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 7, 6, 3, 1),
(166, 'Actifarm cải thiện khả năng tiêu hóa và hấp thụ dinh dưỡng ở gia cầm', NULL, 45000, 53, ' Cải thiện tiêu chuẩn và hấp thụ chất dinh dưỡng trong hệ thống tiêu hóa.', 'Không có.', 'Bacillus subtilis', '', '', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 7, 4, 3, 1),
(167, 'Hairry – viên bổ sung giúp chó tầm vóc lớn lông, da khỏe đẹp', NULL, 45000, 90, ' Duy trì chức năng của các hệ thống trong cơ thể. Duy trì sức khỏe làn da và bộ lông thú.', 'Không có.', 'Sắt, Vitamin A, Vitamin D3, Vitamin E', '1 viên / 10 kg thể trọng mỗi ngày', '', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 5, 1, 4, 1),
(168, 'Dầu tắm Roy làm mềm dịu lông, hạn chế rụng lông chó mèo', NULL, 45000, 90, 'Với chiết xuất từ Aloe Vera, chăm sóc dịu nhẹ cho làn da thú cưng, giữ ẩm, làm mượt da lông, giúp lông mềm mượt, dễ chải, hạn chế rụng lông', 'Không có.', 'Amoxicillin trihydrate', '1 ml / 18 -20 kg thể trọng', 'Làm ướt toàn bộ lông thú yêu, thoa đều sữa tắm Roy lên da cho đến khi lông thú đầy bọt.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 1, 6, 6, 1),
(169, 'Pate dành cho chó Hi-Diet Dog Food ', NULL, 45000, 90, 'Tăng khả năng hồi phục sức khỏe khi: có vấn đề về các bệnh mãn tính, các vấn đề da, hậu phẫu…', 'Không có.', 'Thịt gà, cá, thịt cừu, gan bò, nước, Bột năng, Glycine, Chất kết dính, dầu hoa hướng dương, chất tạo mùi, vách tế bào nấm men', '1 ml / 18 -20 kg thể trọng', 'tiêm dưới da.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 6, 1, 3, 1),
(170, 'Pate dành cho mèo Hi-Diet Cat Food ', NULL, 45000, 90, 'Tăng khả năng hồi phục sức khỏe khi : có vấn đề về các bệnh mãn tính, các vấn đề da, hậu phẫu…', 'Không có.', 'Thịt gà, cá mòi, mỡ gà, chất tạo mùi, cá, Vitamin & khoáng chất, chất kết dính, chất ly trích từ nấm men, bột mỳ, bột gạo, Fructo Oligosaccharide, Taurine, Folic acid, nước.', 'Trọng lượng 2.1 – 5 (kg), 3.5 hộpgày.', '', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 6, 5, 7, 1),
(171, 'Doxicure-50 – kháng sinh Doxycycline dạng bột pha nước', NULL, 45000, 90, 'Thuốc được chỉ định để điều trị bệnh nhiễm trùng đường hô hấp trên gia cầm , gây ra bởi vi khuẩn nhạy cảm với Doxycycline, bao gồm Chlamydias spp . và Mycoplasma spp .', ' Không sử dụng cho gà trong giai đoạn đẻ trứng', 'Doxycycline hyclate', '1 ml / 18 -20 kg thể trọng', 'tiêm dưới da.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 9, 4, 6, 1),
(172, 'Kháng sinh Lincospecvet trị nhiễm trùng hô hấp,…gia súc, chó mèo', NULL, 45000, 90, 'Điều trị các bệnh nhiễm trùng đường hô hấp, đường ruột, đường tiết niệu  nhiễm trùng da và viêm khớp do các vi khuẩn gây ra bao gồm: Actinobacillus spp., Pasteurella spp., E.coli, Salmonella, Clostridium spp., Staphylococcus spp., Mycoplasma spp,… trên chó, mèo, heo, gia súc.', 'Không có.', 'Spectinomycin ', '1ml/5 kg', 'Tiêm bắp với liều 1ml/5 kg, lặp lại sau 12-24 giờ trong 3-7 ngày..', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 9, 6, 3, 1),
(173, 'Kháng sinh Tilmiguard Solution trị nhiễm khuẩn đường hô hấp gia cầm', NULL, 45000, 90, 'Hiệu quả cao trong điều trị chứng nhiễm trùng đường hô hấp trên gia cầm do M.gallisepticum và M.synoviae.', 'Không sử dụng cho gà đẻ thương phẩm..', 'Amoxicillin trihydrate', '1 ml / 18 -20 kg thể trọng', 'Pha vào nước cho uống với liều 10-25 mg / kg thể trọng (tương đương 10 – 25 tấn thể trọng), từ 3-5 ngày liên tục. Thuốc sau khi pha xong chỉ nên sử dụng trong vòng 24 giờ.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 9, 4, 5, 1),
(174, 'Kháng viêm Keprofen 10 cho gia súc, heo, chó, mèo', NULL, 45000, 90, 'Điều trị các chứng bệnh có triệu chứng viêm, sưng hoặc sốt có liên quan đến hệ hô hấp, viêm vú, cơ và xương khớp (như viêm cơ, xương khớp) và các chấn thương', 'Không dùng chung với thuốc nhóm non-steroid trước và sau khi cấp thuốc 24 giờ..', 'Ketoprofen ', '3 mg ketoprofen/kg thể trọng/ ngày hay 1 ml KEPROFEN 10%/ 30 kg thể trọng, sử dụng 3 ngày liên tiếp.', 'Tiêm sâu trong cơ hoặc tiêm tĩnh mạch.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 10, 3, 3, 1),
(175, 'Thuốc trị nấm da Ketoconazole dạng viên trên chó', NULL, 45000, 90, 'Điều trị các bệnh truyền nhiễm trên da gây ra bởi Malassezia và dermatophytes trên chó.', 'Không dùng cho thú có khả năng dị ứng (shock)..', 'Ketoconazole', '10mg ketoconazole cho mỗi kg thể trọng', 'Cấp qua đường miệng', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 15, 1, 5, 1),
(176, 'Vaccine Newcastle Bronchitis', NULL, 45000, 90, ' Vaccine giúp phòng bệnh Newcastle và viêm phế quản truyền nhiễm trên gà.', 'Chỉ chủng cho gà khoẻ mạnh..', 'Amoxicillin trihydrate', '1 ml / 18 -20 kg thể trọng', 'tiêm dưới da.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 8, 4, 5, 1),
(177, 'Vaccine nhược độc đa giá Scocvac 4 phòng bệnh cầu trùng ở gà', NULL, 45000, 90, ' Vaccine dùng phòng bệnh cầu trùng cho gà lông màu trên 45 ngày tuổi, gà ta thả vườn, gà hậu bị và gà giống. Sau khi chủng ngừa vaccine 21 ngày, gà sẽ có miễn dịch bảo hộ đầy đủ với bệnh cầu trùng. Miễn dịch bảo hộ kéo dài suốt đời.', 'Không có.', 'E. tenella (chủng PTMZ), E. maxima (chủng PMHY) và E. acervulina (chủng PAHY), E. necatrix (chủng PNHZ).', 'pha vaccine trong 6 lít nước / 1000 gà', 'Chủng ngừa bằng đường uống', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 8, 4, 3, 1),
(178, 'Vaccine nhược độc tam giá Scocvac 3 phòng bệnh cầu trùng ở gà', NULL, 75000, 90, 'Vaccine dùng phòng bệnh cầu trùng cho gà thịt dưới 45 ngày. Sau khi chủng ngừa vaccine 14 ngày, gà đã có miễn dịch bảo hộ với bệnh cầu trùng. Miễn dịch bảo hộ kéo dài đến khi xuất chuồng', 'Không có.', 'E. tenella (chủng PTMZ)', 'pha vaccine trong 6 lít nước / 1000 gà', 'Chủng ngừa bằng đường uống', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 8, 4, 4, 1),
(179, 'XO Save giúp cải thiện hô hấp và lưu thông khí cho gia cầm', NULL, 45000, 90, 'Sản phẩm này làm tăng năng suất vật nuôi và tăng miễn dịch cụ thể là phòng bệnh hô hấp trên gia cầm', 'Không có.', 'Amoxicillin trihydrate', 'Sử dụng cho vật nuôi bằng cách pha 1-2ml/1 lít nước uống.', 'Sử dụng cho vật nuôi bằng cách pha 1-2ml/1 lít nước uống.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 9, 4, 3, 1),
(180, 'Kháng sinh Amoxiguard 15% Injection LA gia súc, chó mèo', NULL, 45000, 90, 'Điều trị các bệnh trên đường tiêu hóa, hô hấp, các bệnh trên da, mô mềm, ngăn ngừa nhiễm trùng hậu phẫu (sử dụng trước khi phẫu thuật) do các vi khuẩn như E. coli, Proteus mirablis, Salmonella spp., Staphylococci (không tự tạo pencillin), Streptococci (không tự tạo pencillin), và Klebsiella pneumonia', 'Không cấp thuốc bằng đường tiêm tĩnh mạch, tiêm não tủy.', 'Amoxicillin trihydrate', ' 15 mg/kg thể trọng', 'tiêm dưới da.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 9, 6, 3, 1),
(181, 'Kháng sinh Amoxivet trị nhiễm trùng gia súc, chó mèo', NULL, 87000, 90, '  Điều trị các bệnh nhiễm trùng trên trâu, bò, heo, cừu, chó và mèo, nguyên nhân gây ra bởi các vi khuẩn gram âm và gram dương nhạy cảm với amoxicilin như: Actinobacillusequuli, Actinomyces bovis, Actinobacillus lignieresi, Bacillusanthracis, Bordetella bronchisep tica, Clostridium spp., Corynebacterium spp., Erysipelothrix rhusi opathiae, Escherichia coli, Fusiformisspp., Haemophilus spp. Morax ella spp., Pasteurella spp., Proteusmirabilis, Salmonella spp., Staphylococci.', 'Không có.', 'Amoxicillin ', '1ml/ 25kg thể trọng; 1 lần/ ngày; 5 ngày', 'tiêm dưới da.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 9, 6, 3, 1),
(182, 'Kháng sinh Ampi 200 điều trị bệnh viêm ruột', NULL, 50000, 90, ' Phòng và trị các bệnh viêm phổi, tiết niệu, tiêu hóa; Trị nhiễm khuẩn da, mô mềm, áp xe, viêm mô tế bào; Hiệu quả đối với nhiễm trùng da lần đầu và viêm da mũ dai dẳng trên chó, mèo.', 'Không sử dụng cho vật nuôi đang sản xuất sữa thương phẩm.', 'Ampicillin ', '1 ml / 18 -20 kg thể trọng', 'tiêm dưới da.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 9, 3, 1, 1),
(183, 'Vắc xin Cúm Gia Cầm H5N1 – chủng Re-1', NULL, 55000, 90, 'Vắc xin sử dụng để phòng bệnh Cúm gia cầm H5N1 chủng Re-1.', 'Không có.', 'Amoxicillin trihydrate', 'Vaccine chứa vi-rút cúm gia cầm tái tổ hợp H5N1 chủng Re-1 vô hoạt. Trước khi vô hoạt, hiệu giá HA của dịch niệu nang ≥ 8log2.', 'tiêm dưới da.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 8, 4, 3, 1),
(184, 'Sữa tắm đặt trị ve rận Modern Pet Gel dành cho chó', NULL, 45000, 90, 'Kiểm soát bọ chét, chấy, rận và ve trên chó và chó con trên 12 tuần tuổi.', 'Không có.', 'Permethrin ', '1 ml / 18 -20 kg thể trọng', 'Sử dụng tốt cho những chó giống lớn cả lông ngắn và lông dài.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 1, 1, 7, 1),
(185, 'Petty gel hỗ trợ chức năng gan cho chó mèo', NULL, 45000, 90, 'Hỗ trợ trong thời kỳ phẫu thuật hoặc theo khuyến cáo của bác sỹ thú y.', 'Không có.', 'Vitamin A, Vitamin D3, Vitamin E, Vitamin B1, Vitamin B2, Vitamin B5, Vitamin B6, Vitamin B12, Folic Acid, Ascorbic acid, Taurine, Methionine, Lecithin, Triglyceride, Glucose syrup, Glycerine.', '2 thìa cà phê, ngày 2 lần.', 'Cung cấp qua đường miệng.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 9, 6, 3, 1),
(186, 'THUỐC THÚ Y – VIAQUINO 25', NULL, 66000, 90, 'ĐẶC TRỊ PHÂN NHỚT VÀNG, PHÓ THƯƠNG HÀN GHÉP CẦU TRÙNG HEO.', 'Không có.', 'Enrofloxacin', '1,5ml/5kg TT/ lần, ngày 1-2 lần, dùng 3-5 ngày. Một lần bơm tương ứng 1,5ml.', 'Cho uống trực tiếp hay pha vào nước hoặc sữa cho uống.', '24 tháng kể từ ngày sản xuất', 'Nơi khô, nhiệt độ dưới 30 độ C, tránh ánh sáng!', 9, 2, 3, 1),
(187, 'THUỐC THÚ Y – VIAQUINO 100', NULL, 45000, 90, 'Đặc trị nhiễm trùng do vi khuẩn nhạy cảm với Enrofloxacin trên gia cầm như: bệnh viêm đường hô hấp mãn tính trên ra cầm gây hen nặng (CRD), hen ghép E.coli kết hợp (CCRD), với các biểu hiện: gia cầm khó thở, thở khò khè, khẹc, vảy mỏ, sưng đầu, sưng mặt, kèm theo tiêu chảy phân xanh, phân trắng, phân nhiều nước. Các bệnh thương hàn, bạch lỵ, Coryza trên gia cầm.', 'Không có.', 'Curcumin ', '10mg Enrofloxacin/kgTTgày hay 1ml/10kgTTgày hoặc 1ml/2lit nước.', 'Pha nước uống hoặc trộn thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 10, 4, 2, 1),
(188, 'THUỐC THÚ Y DAMONG SPRAY ', NULL, 45000, 90, 'ĐẶC TRỊ NHIỄM TRÙNG DA, CHÂN, MÓNG, VẾT THƯƠNG HỞ ĐẶC TRỊ NHIỄM TRÙNG DA', 'Không có.', 'Thiamphenicol', 'Phun dung dịch trên bề mặt vết thương 1 lần mỗi ngày/trong 3 ngày liên tiếp.', '', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 14, 6, 3, 1),
(189, 'THUỐC THÚ Y DAMONG SPRAY', NULL, 45000, 90, 'ĐẶC TRỊ NẤM DA, MÓNG TRÊN BÒ, DÊ, CỪU, THỎ', 'Không có.', 'Tiabendazole, Thiamphenicol, Curcumin ', 'Phun 1 lầngày', 'Phun đều lên vùng da bị nấm, theo hướng từ bên ngoài đến vùng bị bệnh cho thuốc thấm đều.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 15, 6, 3, 1),
(190, 'THUỐC THÚ Y VIA-CMT', NULL, 78000, 90, 'Dùng kiểm tra và phát hiện sớm hiện tượng viêm vú trên bò sữa. Kết quả có ngay sau 4-5 giây tiết kiệm thời gian lấy mẫu, sau khi thử và chính xác đến 100%.', 'Không có.', 'Fe-Dextran', '5ml sữa 2ml dụng dịch VA – CMT', 'Vệ sinh núm vú bò sạch sẽ, lấy mỗi núm vú bò 5ml sữa vào ngăn đĩa để thử. Nhỏ vào mỗi ngăn đĩa 2ml dụng dịch VA – CMT.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 10, 3, 3, 1),
(191, 'THUỐC THÚ Y VIA FER+B12', NULL, 76000, 90, 'SẮT CAO CẤP, TRỊ THIẾU MÁU, PHÒNG TIÊU CHẢY', 'Không có.', 'Vitamin ', '1-2ml/con', 'Tiêm bắp sâu, 1 liều duy nhất đủ bổ sung hàm lượng sắt cho cơ thể..', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 11, 4, 7, 1),
(192, 'THUỐC THÚ Y – ACHYMOSIN', NULL, 45000, 90, 'TAN ĐỜM, GIẢM DỊCH NHẦY, TIÊU VIÊM, CHỐNG PHÙ NỀ, TIÊU SỢI HUYẾT, PHÁ HUỶ CASEIN VÀ FIBRIN.', 'Không có.', 'Atropin Sulfat', '1ml/2-3 lít nước tương đương 10-15kgTT', 'Hòa nước cho uống theo liều.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 9, 3, 6, 1),
(193, 'THUỐC THÚ Y – ATROPIN MAX', NULL, 45000, 90, 'Hỗ trợ trong thời kỳ phẫu thuật hoặc theo khuyến cáo của bác sỹ thú y.', 'Không có.', 'Atropin Sulfat', '3 – 5 ml/con', 'Tiêm dưới da', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 9, 6, 6, 1),
(194, 'THUỐC THÚ Y – AMPHERAMIN', NULL, 46000, 90, 'ĐẶC TRỊ DỊ ỨNG, NỔI MẨN ĐỎ, PHÁT BAN, SỐT SỮA AN THẦN – CHỐNG SỐC, CO GIẬT, STRESS', 'Không có.', 'Chlorpheniramin maleat', '1ml/35-40kgTT', 'Tiêm bắp hoặc tiêm tĩnh mạch.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 9, 6, 8, 1),
(195, 'THUỐC THÚ Y AZ.KETOPRO', NULL, 45000, 90, 'KHÁNG VIÊM, GIẢM ĐAU, HẠ SỐT NHANH, MẠNH, KHÔNG LÀM MẤT SỮA.', 'Không có.', 'Ketoprofen', '1 ml/33kg TT, ngày 1 lần, trong 1 – 3 ngày.', 'Tiêm sâu bắp thịt hoặc tiêm tĩnh mạch..', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 10, 6, 8, 1),
(196, 'THUỐC THÚ Y – BROMREPSI', NULL, 87000, 90, 'THÔNG THỞ, TIÊU DỊCH NHẦY – HẠ SỐT, CHỐNG VIÊM, PHỤC HỒI CHỨC NĂNG PHỔI', 'Không có.', 'Bromhexine HCl', '2ml/1 lít nước', 'Hòa nước cho uống .', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 9, 4, 9, 1),
(197, 'THUỐC THÚ Y – CARNITOSAL', NULL, 45000, 90, 'TĂNG LỰC CẤP TỐC, TĂNG SỮA – TẠO NẠC, KÍCH THÍCH TĂNG TRỌNG', 'Không có.', 'Butafosfan, Vitamin PP', '1ml/10 – 15kgTT.', 'Tiêm dưới da, tiêm bắp', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 9, 6, 9, 1),
(198, 'THUỐC THÚ Y – CARNITOSAL BÒ SỮA', NULL, 45000, 90, 'KÍCH THÍCH TRAO ĐỔI CHẤT, TĂNG KHÔ – BÉO, SẢN LƯỢNG SỮA, NGỪA BIẾN CHỨNG SAU SINH', 'Không có.', 'Vitamin B9', '20ml/congày.', 'Tiêm dưới da, tiêm bắp hay tiêm tĩnh mạch.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 7, 3, 3, 1),
(199, 'THUỐC THÚ Y DEXASON', NULL, 45000, 90, 'KHÁNG VIÊM, GIẢM ĐAU, CHỐNG DỊ ỨNG', 'Không có.', 'Dexamethasone (phosphat dinatri)', '5 – 10ml/400kgTT.', 'Tiêm bắp, tĩnh mạch, dưới da, trong bao khớp.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 10, 6, 3, 1),
(200, 'THUỐC THÚ Y AZ GLUCO KC BAMIN', NULL, 45000, 90, 'Hỗ trợ trong thời kỳ phẫu thuật hoặc theo khuyến cáo của bác sỹ thú y.', 'Không có.', 'Calcium glucono glucoheptonate', '1ml/20kgTTgày.', 'Tiêm bắp thịt, liệu trình 3-5 ngày liên tục..', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 9, 6, 3, 1);

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
  `type_name` varchar(25) NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product_types`
--

INSERT INTO `product_types` (`id`, `type_name`, `active`) VALUES
(1, 'Chó', 0),
(2, 'Heo', 0),
(3, 'Gia súc', 0),
(4, 'Gia cầm', 0),
(5, 'Mèo', 0),
(6, 'Khác', 0);

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
(0, 'staff'),
(1, 'user'),
(2, 'admin'),
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
  `username` varchar(100) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `fullName` varchar(100) DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `district` varchar(100) DEFAULT NULL,
  `ward` varchar(100) DEFAULT NULL,
  `detail_address` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `avatar` text DEFAULT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT 0,
  `login_by` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: normal, 1: google, 2: facebook, 3: twitter, 4: discord, 5: github',
  `login_times` tinyint(1) NOT NULL DEFAULT 0,
  `role_id` int(11) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `fullName`, `dateOfBirth`, `city`, `district`, `ward`, `detail_address`, `phone`, `avatar`, `verified`, `login_by`, `login_times`, `role_id`, `date_created`) VALUES
(75, 'namthuan2304', '', NULL, 'Đặng Nam Thuận', NULL, '60', '601', '23236', 'gfdgff', '0384774118', 'https://avatars.githubusercontent.com/u/146423539?v=4', 1, 5, 0, 1, '2024-07-07 20:02:11'),
(76, 'thuanhahahihi', '', NULL, 'Nam Thuận Đặng', NULL, NULL, NULL, NULL, NULL, NULL, 'https://pbs.twimg.com/profile_images/1806013098832384000/BQ8FcjbK_normal.jpg', 1, 3, 0, 1, '2024-07-07 20:02:34'),
(78, 'Đặng Nam', '21130556@st.hcmuaf.edu.vn', NULL, 'Đặng Nam Thuận', NULL, '77', '750', '26578', 'dsdsds', '0987365222', 'https://lh3.googleusercontent.com/a/ACg8ocLRN9ohOUxOWR5xr0fch3t6YlgEXwZEmjDyvtSQUs3bTC-BIsQ=s96-c', 1, 1, 0, 1, '2024-07-07 22:10:27'),
(79, 'namthuan2k3', 'thuandangnam@gmail.com', NULL, 'Southwind', NULL, NULL, NULL, NULL, NULL, NULL, 'c6ae0d72fd50ad23b2b138691677fa15', 1, 4, 0, 1, '2024-07-07 22:11:31'),
(80, '', '21130556@st.hcmuaf.edu.vn', NULL, '', NULL, 'Tỉnh Bình Thuận', 'Huyện Hàm Tân', 'Thị trấn Tân Nghĩa', 'gfdgff', '0987365222', '/uploads/react.png', 1, 2, 0, 1, '2024-07-07 22:15:57'),
(81, 'Rựa', 'dnamthuan@gmail.com', NULL, 'Rựa Đực', NULL, NULL, NULL, NULL, NULL, NULL, 'https://lh3.googleusercontent.com/a/ACg8ocIjaL52zPg17MWOLhehbJfci6fABX4ZmdPYZeV1KqKBI5BQPHI=s96-c', 1, 1, 0, 1, '2024-07-07 23:40:26'),
(82, 'chuotcon', '21130556@st.hcmuaf.edu.vn', '$2a$10$6tfZeQ65AEzPXL38uiqO4OwL8N1Nm3XD/W6AcZwFjmN4GnZ9RXFpK', '', NULL, 'Tỉnh Bắc Ninh', 'Huyện Lương Tài', 'Xã Minh Tân', 'bggbgb', 'dsfdddshuoh', '/uploads/NT.jpg', 1, 0, 0, 1, '2024-07-08 02:52:38');

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
  ADD KEY `FK_images_products` (`product_id`);

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
  ADD KEY `FK_products_product_types` (`type_id`),
  ADD KEY `fk_products_categories` (`cate_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=457;

--
-- AUTO_INCREMENT cho bảng `level`
--
ALTER TABLE `level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1256;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

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
  ADD CONSTRAINT `FK_images_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

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
  ADD CONSTRAINT `fk_products_categories` FOREIGN KEY (`cate_id`) REFERENCES `product_categories` (`id`),
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
