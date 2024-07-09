-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 03, 2024 lúc 10:43 PM
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
                                                                                                  (23, 2, 'localhost', 'UserDAO', NULL, 'Email not found: thuandangnam123@gmail.com', '2024-05-09 22:19:00'),
                                                                                                  (24, 1, '127.0.0.1', 'main/UserService', NULL, 'tom: Username is existed!', '2024-06-21 01:21:28'),
                                                                                                  (25, 1, '127.0.0.1', 'main/UserService', NULL, 'thuandeptrai: Username is existed!', '2024-06-21 01:22:19'),
                                                                                                  (26, 1, '127.0.0.1', 'main/UserService', NULL, 'thuandeptrai888: Username is existed!', '2024-06-21 01:22:28'),
                                                                                                  (27, 1, '127.0.0.1', 'main/UserService', NULL, 'thuandeptrai888: Email is existed!', '2024-06-21 01:23:08'),
                                                                                                  (28, 1, '127.0.0.1', 'main/UserService', NULL, 'thuandeptrai888: Register fail because my system can\'t insert your account into database!', '2024-06-21 01:31:39'),
(29, 1, '127.0.0.1', 'main/UserService', NULL, '21: Register success. Congratulation!', '2024-06-21 01:39:39'),
(30, 1, '127.0.0.1', 'main/UserService', NULL, '22: Register success. Congratulation!', '2024-06-21 01:41:29'),
(31, 1, '127.0.0.1', 'main/UserService', NULL, 'thuandeptrai8880: Username is existed!', '2024-06-21 01:49:56'),
(32, 1, '127.0.0.1', 'main/UserService', NULL, '23: Register success. Congratulation!', '2024-06-21 01:50:26'),
(33, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, '24: Register success. Congratulation!', '2024-06-21 01:56:50'),
(34, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '24: Set verified status failed for your account', '2024-06-21 02:18:19'),
(35, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '24: Set verified status failed for your account', '2024-06-21 02:18:29'),
(36, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, '25: Register success. Congratulation!', '2024-06-21 02:22:24'),
(37, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '25: Set verified status failed for your account', '2024-06-21 02:22:49'),
(38, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '25: Set verified status failed for your account', '2024-06-21 02:22:54'),
(39, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '25: Verified code do not match!', '2024-06-21 02:23:11'),
(40, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '25: Set verified status failed for your account', '2024-06-21 02:23:17'),
(41, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, '26: Register success. Congratulation!', '2024-06-21 02:26:18'),
(42, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '26: Set verified status failed for your account', '2024-06-21 02:26:40'),
(43, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, '27: Register success. Congratulation!', '2024-06-21 02:28:04'),
(44, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '27: Set verified status failed for your account', '2024-06-21 02:28:27'),
(45, 1, '127.0.0.1', 'main/UserService', NULL, 'null: Set verified status failed for your account', '2024-06-21 02:32:13'),
(46, 1, '127.0.0.1', 'main/UserService', NULL, 'null: Set verified status failed for your account', '2024-06-21 02:35:44'),
(47, 1, '127.0.0.1', 'main/UserService', NULL, '26: Set verified status failed for your account', '2024-06-21 02:37:44'),
(48, 1, '127.0.0.1', 'main/UserService', NULL, '26: Set verified status failed for your account', '2024-06-21 02:38:11'),
(49, 1, '127.0.0.1', 'main/UserService', NULL, '26: Your account has verified successfully. Congratulation!', '2024-06-21 02:57:01'),
(50, 1, '127.0.0.1', 'main/UserService', NULL, '26: Your account has verified successfully. Congratulation!', '2024-06-21 02:58:41'),
(51, 1, '127.0.0.1', 'main/UserService', NULL, '26: Set verified status failed for your account', '2024-06-21 03:02:41'),
(52, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, '28: Register success. Congratulation!', '2024-06-21 03:04:22'),
(53, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '28: Your account has verified successfully. Congratulation!', '2024-06-21 03:04:43'),
(54, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-06-21 03:05:11'),
(55, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-06-21 03:05:41'),
(56, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=28', '2024-06-21 03:08:06'),
(57, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=28', '2024-06-21 03:08:11'),
(58, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, 'hoangnv: Password must have at least 8 characters, including numbers, capital letters and special characters!', '2024-06-21 18:11:27'),
(59, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, '29: Register success. Congratulation!', '2024-06-21 18:11:48'),
(60, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '29: Your account has verified successfully. Congratulation!', '2024-06-21 18:12:19'),
(61, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=29', '2024-06-21 18:12:34'),
(62, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, '30: Register success. Congratulation!', '2024-06-21 18:20:31'),
(63, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, 'null: Verified code is timeout!', '2024-06-21 18:22:26'),
(64, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, 'null: Verified code is timeout!', '2024-06-21 18:22:45'),
(65, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, '31: Register success. Congratulation!', '2024-06-21 18:33:59'),
(66, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, 'null: Verified code is timeout!', '2024-06-21 18:34:46'),
(67, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, 'null: Verified code is timeout!', '2024-06-21 18:34:49'),
(68, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, 'null: Verified code is timeout!', '2024-06-21 18:34:51'),
(69, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, '32: Register success. Congratulation!', '2024-06-21 18:38:17'),
(70, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '32: Verified code is timeout!', '2024-06-21 18:39:00'),
(71, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '32: Verified code is timeout!', '2024-06-21 18:39:12'),
(72, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, '33: Register success. Congratulation!', '2024-06-21 18:39:56'),
(73, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '33: Your account has verified successfully. Congratulation!', '2024-06-21 18:40:15'),
(74, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, ': Email is invalid!', '2024-06-22 21:42:09'),
(75, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, ': Email is invalid!', '2024-06-22 21:42:09'),
(76, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, ': Email is invalid!', '2024-06-22 21:42:10'),
(77, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, ': Email is invalid!', '2024-06-22 21:42:10'),
(78, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, ': Email is invalid!', '2024-06-22 21:42:11'),
(79, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, ': Email is invalid!', '2024-06-22 21:42:12'),
(80, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, ': Email is invalid!', '2024-06-22 21:42:12'),
(81, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, ': Email is invalid!', '2024-06-22 21:42:13'),
(82, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, ': Email is invalid!', '2024-06-22 21:42:13'),
(83, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, ': Email is invalid!', '2024-06-22 21:42:14'),
(84, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, ': Email is invalid!', '2024-06-22 21:42:15'),
(85, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, ': Email is invalid!', '2024-06-22 21:42:16'),
(86, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, ': Email is invalid!', '2024-06-22 21:42:16'),
(87, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, ': Email is invalid!', '2024-06-22 21:42:16'),
(88, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, ': Email is invalid!', '2024-06-22 21:43:21'),
(89, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, 'hoangnv: Passwords do not match!', '2024-06-22 21:43:41'),
(90, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, '34: Register success. Congratulation!', '2024-06-22 21:43:48'),
(91, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, 'hoangnv: Username is existed!', '2024-06-22 21:43:50'),
(92, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, 'hoangnv: Username is existed!', '2024-06-22 21:43:52'),
(93, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, 'hoangnv: Passwords do not match!', '2024-06-22 22:08:49'),
(94, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, '35: Register success. Congratulation!', '2024-06-22 22:08:54'),
(95, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, '36: Register success. Congratulation!', '2024-06-22 22:10:50'),
(96, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, '37: Register success. Congratulation!', '2024-06-22 22:24:49'),
(97, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, '38: Register success. Congratulation!', '2024-06-22 22:26:33'),
(98, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, 'hoangnv: Username is existed!', '2024-06-22 22:26:46'),
(99, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, 'hoangnv: Username is existed!', '2024-06-22 22:26:49'),
(100, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, '39: Register success. Congratulation!', '2024-06-22 22:37:45'),
(101, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, '40: Register success. Congratulation!', '2024-06-22 22:40:11'),
(102, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, 'chuotcon: Password must have at least 8 characters, including numbers, capital letters and special characters!', '2024-06-22 22:41:52'),
(103, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, 'chuotcon: Password must have at least 8 characters, including numbers, capital letters and special characters!', '2024-06-22 22:41:52'),
(104, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, 'chuotcon: Password must have at least 8 characters, including numbers, capital letters and special characters!', '2024-06-22 22:42:00'),
(105, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, 'chuotcon: Password must have at least 8 characters, including numbers, capital letters and special characters!', '2024-06-22 22:42:01'),
(106, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, 'chuotcon: Password must have at least 8 characters, including numbers, capital letters and special characters!', '2024-06-22 22:42:03'),
(107, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, 'chuotcon: Password must have at least 8 characters, including numbers, capital letters and special characters!', '2024-06-22 22:42:03'),
(108, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, 'chuotcon: Password must have at least 8 characters, including numbers, capital letters and special characters!', '2024-06-22 22:42:03'),
(109, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, 'chuotcon: Password must have at least 8 characters, including numbers, capital letters and special characters!', '2024-06-22 22:42:04'),
(110, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, 'chuotcon: Password must have at least 8 characters, including numbers, capital letters and special characters!', '2024-06-22 22:42:12'),
(111, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, 'chuotcon: Password must have at least 8 characters, including numbers, capital letters and special characters!', '2024-06-22 22:42:13'),
(112, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, 'chuotcon: Password must have at least 8 characters, including numbers, capital letters and special characters!', '2024-06-22 22:42:13'),
(113, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, 'chuotcon: Password must have at least 8 characters, including numbers, capital letters and special characters!', '2024-06-22 22:42:14'),
(114, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, 'chuotcon: Password must have at least 8 characters, including numbers, capital letters and special characters!', '2024-06-22 22:42:14'),
(115, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, 'chuotcon: Password must have at least 8 characters, including numbers, capital letters and special characters!', '2024-06-22 22:42:14'),
(116, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, 'chuotcon: Password must have at least 8 characters, including numbers, capital letters and special characters!', '2024-06-22 22:42:41'),
(117, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, 'chuotcon: Password must have at least 8 characters, including numbers, capital letters and special characters!', '2024-06-22 22:42:42'),
(118, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, 'chuotcon: Password must have at least 8 characters, including numbers, capital letters and special characters!', '2024-06-22 22:42:42'),
(119, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, 'chuotcon: Password must have at least 8 characters, including numbers, capital letters and special characters!', '2024-06-22 22:42:43'),
(120, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, 'chuotcon: Password must have at least 8 characters, including numbers, capital letters and special characters!', '2024-06-22 22:42:43'),
(121, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, 'chuotcon: Passwords do not match!', '2024-06-22 22:43:20'),
(122, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, '41: Register success. Congratulation!', '2024-06-22 22:43:24'),
(123, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, 'chuotcon: Username is existed!', '2024-06-22 22:44:00'),
(124, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, '42: Register success. Congratulation!', '2024-06-22 22:46:28'),
(125, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, '43: Register success. Congratulation!', '2024-06-22 22:54:21'),
(126, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, 'hoangnv: Username is existed!', '2024-06-22 22:55:17'),
(127, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, 'hoangnv: Passwords do not match!', '2024-06-22 22:55:31'),
(128, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, 'hoangnv: Password must have at least 8 characters, including numbers, capital letters and special characters!', '2024-06-22 22:55:34'),
(129, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, 'hoangnv: Passwords do not match!', '2024-06-22 22:57:34'),
(130, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, '44: Register success. Congratulation!', '2024-06-22 22:57:41'),
(131, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, 'hoangnv: Username is existed!', '2024-06-22 22:58:24'),
(132, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, '45: Register success. Congratulation!', '2024-06-22 23:08:16'),
(133, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, '46: Register success. Congratulation!', '2024-06-23 00:09:33'),
(134, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, 'hoangnv: Username is existed!', '2024-06-23 00:09:34'),
(135, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, 'hoangnv: Username is existed!', '2024-06-23 00:09:34'),
(136, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, 'hoangnv: Username is existed!', '2024-06-23 00:09:34'),
(137, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, 'hoangnv: Username is existed!', '2024-06-23 00:09:35'),
(138, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, 'hoangnv: Username is existed!', '2024-06-23 00:09:35'),
(139, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, 'hoangnv: Username is existed!', '2024-06-23 00:09:35'),
(140, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, 'hoangnv: Username is existed!', '2024-06-23 00:09:36'),
(141, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, 'hoangnv: Username is existed!', '2024-06-23 00:09:36'),
(142, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, 'hoangnv: Username is existed!', '2024-06-23 00:09:36'),
(143, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, 'hoangnv: Username is existed!', '2024-06-23 00:09:36'),
(144, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, 'hoangnv: Username is existed!', '2024-06-23 00:09:37'),
(145, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, 'hoangnv: Username is existed!', '2024-06-23 00:09:37'),
(146, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, 'hoangnv: Username is existed!', '2024-06-23 00:09:37'),
(147, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, 'hoangnv: Passwords do not match!', '2024-06-23 00:09:57'),
(148, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, '47: Register success. Congratulation!', '2024-06-23 00:10:07'),
(149, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, 'hoangnv: Passwords do not match!', '2024-06-23 00:55:48'),
(150, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, '48: Register success. Congratulation!', '2024-06-23 00:55:54'),
(151, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, 'null: Verified code do not match!', '2024-06-23 00:56:39'),
(152, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, 'null: Verified code do not match!', '2024-06-23 00:56:42'),
(153, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, 'null: Verified code is timeout!', '2024-06-23 01:24:49'),
(154, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, '49: Register success. Congratulation!', '2024-06-23 01:36:44'),
(155, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '49: Verified code do not match!', '2024-06-23 01:37:00'),
(156, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '49: Your account has verified successfully. Congratulation!', '2024-06-23 01:37:09'),
(157, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, '50: Register success. Congratulation!', '2024-06-23 01:56:18'),
(158, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '50: Your account has verified successfully. Congratulation!', '2024-06-23 01:56:37'),
(159, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, '51: Register success. Congratulation!', '2024-06-23 04:36:31'),
(160, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '51: Verified code do not match!', '2024-06-23 04:37:01'),
(161, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '51: Verified code do not match!', '2024-06-23 04:37:07'),
(162, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '51: Your account has verified successfully. Congratulation!', '2024-06-23 04:37:10'),
(163, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=51', '2024-06-23 04:37:33'),
(164, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 0', '2024-06-23 04:37:33'),
(165, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 04:38:43'),
(166, 2, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update fail. Login times of email=21130556@st.hcmuaf.edu.vn are not changed', '2024-06-23 04:38:43'),
(167, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 04:38:45'),
(168, 2, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update fail. Login times of email=21130556@st.hcmuaf.edu.vn are not changed', '2024-06-23 04:38:45'),
(169, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-06-23 04:44:34'),
(170, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 04:44:40'),
(171, 2, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update fail. Login times of email=21130556@st.hcmuaf.edu.vn are not changed', '2024-06-23 04:44:40'),
(172, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-06-23 04:45:23'),
(173, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 04:45:32'),
(174, 2, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update fail. Login times of email=21130556@st.hcmuaf.edu.vn are not changed', '2024-06-23 04:45:32'),
(175, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 04:45:42'),
(176, 2, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update fail. Login times of email=21130556@st.hcmuaf.edu.vn are not changed', '2024-06-23 04:45:42'),
(177, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 04:45:45'),
(178, 2, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update fail. Login times of email=21130556@st.hcmuaf.edu.vn are not changed', '2024-06-23 04:45:45'),
(179, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 04:45:46'),
(180, 2, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update fail. Login times of email=21130556@st.hcmuaf.edu.vn are not changed', '2024-06-23 04:45:46'),
(181, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 04:45:47'),
(182, 2, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update fail. Login times of email=21130556@st.hcmuaf.edu.vn are not changed', '2024-06-23 04:45:47'),
(183, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 04:45:47'),
(184, 2, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update fail. Login times of email=21130556@st.hcmuaf.edu.vn are not changed', '2024-06-23 04:45:47'),
(185, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 04:45:48'),
(186, 2, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update fail. Login times of email=21130556@st.hcmuaf.edu.vn are not changed', '2024-06-23 04:45:48'),
(187, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-06-23 04:48:59'),
(188, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-06-23 04:49:37'),
(189, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-06-23 04:49:51'),
(190, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-06-23 04:50:01'),
(191, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-06-23 04:50:02'),
(192, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-06-23 04:50:02'),
(193, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-06-23 04:50:02'),
(194, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-06-23 04:50:03'),
(195, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-06-23 04:50:03'),
(196, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-06-23 04:50:03'),
(197, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-06-23 04:50:03'),
(198, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-06-23 04:50:04'),
(199, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-06-23 04:58:33'),
(200, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 04:58:39'),
(201, 2, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update fail. Login times of email=21130556@st.hcmuaf.edu.vn are not changed', '2024-06-23 04:58:39'),
(202, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 04:58:41'),
(203, 2, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update fail. Login times of email=21130556@st.hcmuaf.edu.vn are not changed', '2024-06-23 04:58:41'),
(204, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 04:58:44'),
(205, 2, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update fail. Login times of email=21130556@st.hcmuaf.edu.vn are not changed', '2024-06-23 04:58:44'),
(206, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 04:58:46'),
(207, 2, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update fail. Login times of email=21130556@st.hcmuaf.edu.vn are not changed', '2024-06-23 04:58:46'),
(208, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=51', '2024-06-23 04:58:53'),
(209, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 0', '2024-06-23 04:58:53'),
(210, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=51', '2024-06-23 04:58:54'),
(211, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 0', '2024-06-23 04:58:54'),
(212, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=51', '2024-06-23 04:58:54'),
(213, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 0', '2024-06-23 04:58:54'),
(214, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=51', '2024-06-23 04:58:55'),
(215, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 0', '2024-06-23 04:58:55'),
(216, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=51', '2024-06-23 04:58:55'),
(217, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 0', '2024-06-23 04:58:55'),
(218, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=51', '2024-06-23 04:58:56'),
(219, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 0', '2024-06-23 04:58:56'),
(220, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-06-23 05:04:22'),
(221, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:04:27'),
(222, 2, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update fail. Login times of email=21130556@st.hcmuaf.edu.vn are not changed', '2024-06-23 05:04:27'),
(223, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:04:31'),
(224, 2, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update fail. Login times of email=21130556@st.hcmuaf.edu.vn are not changed', '2024-06-23 05:04:31'),
(225, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:04:32'),
(226, 2, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update fail. Login times of email=21130556@st.hcmuaf.edu.vn are not changed', '2024-06-23 05:04:32'),
(227, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-06-23 05:07:14'),
(228, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:07:19'),
(229, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 1', '2024-06-23 05:07:19'),
(230, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:07:22'),
(231, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 1', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 2', '2024-06-23 05:07:22'),
(232, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:07:22'),
(233, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 2', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 3', '2024-06-23 05:07:22'),
(234, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:07:23'),
(235, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 3', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 4', '2024-06-23 05:07:23'),
(236, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:07:23'),
(237, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 4', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 5', '2024-06-23 05:07:23'),
(238, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:07:25'),
(239, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:07:44'),
(240, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:07:45'),
(241, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:07:47'),
(242, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:07:49'),
(243, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=51', '2024-06-23 05:07:56'),
(244, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 5', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 0', '2024-06-23 05:07:56'),
(245, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=51', '2024-06-23 05:07:57'),
(246, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 0', '2024-06-23 05:07:57'),
(247, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=51', '2024-06-23 05:07:57'),
(248, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 0', '2024-06-23 05:07:57'),
(249, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=51', '2024-06-23 05:07:57'),
(250, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 0', '2024-06-23 05:07:57'),
(251, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-06-23 05:08:05'),
(252, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=51', '2024-06-23 05:08:10'),
(253, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 0', '2024-06-23 05:08:10'),
(254, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=51', '2024-06-23 05:08:20'),
(255, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 0', '2024-06-23 05:08:20'),
(256, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=51', '2024-06-23 05:08:21'),
(257, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 0', '2024-06-23 05:08:21'),
(258, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=51', '2024-06-23 05:08:21'),
(259, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 0', '2024-06-23 05:08:21'),
(260, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:09:14'),
(261, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:09:14'),
(262, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 1', '2024-06-23 05:09:14'),
(263, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 1', '2024-06-23 05:09:14'),
(264, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:09:16'),
(265, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 1', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 2', '2024-06-23 05:09:16'),
(266, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:09:17'),
(267, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 2', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 3', '2024-06-23 05:09:17'),
(268, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:09:17'),
(269, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 3', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 4', '2024-06-23 05:09:17'),
(270, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:09:18'),
(271, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 4', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 5', '2024-06-23 05:09:18'),
(272, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:09:18'),
(273, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:09:19'),
(274, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=51', '2024-06-23 05:09:45'),
(275, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 5', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 0', '2024-06-23 05:09:45'),
(276, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:14:52'),
(277, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:15:04'),
(278, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:15:05'),
(279, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:15:11'),
(280, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:15:20'),
(281, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:15:26'),
(282, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:15:27'),
(283, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:15:38'),
(284, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:15:54'),
(285, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-06-23 05:16:25'),
(286, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:16:31'),
(287, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 1', '2024-06-23 05:16:31'),
(288, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:16:33'),
(289, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 1', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 2', '2024-06-23 05:16:33'),
(290, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:16:35'),
(291, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 2', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 3', '2024-06-23 05:16:35'),
(292, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:16:35'),
(293, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 3', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 4', '2024-06-23 05:16:35'),
(294, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:16:36'),
(295, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 4', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 5', '2024-06-23 05:16:36'),
(296, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:16:37'),
(297, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:16:37'),
(298, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:16:38'),
(299, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:16:39'),
(300, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:16:41'),
(301, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=51', '2024-06-23 05:16:50'),
(302, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=51', '2024-06-23 05:16:51'),
(303, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:18:58'),
(304, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=51', '2024-06-23 05:19:06'),
(305, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-06-23 05:23:10'),
(306, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-06-23 05:23:13'),
(307, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:23:19'),
(308, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:23:46'),
(309, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-06-23 05:23:49'),
(310, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-06-23 05:24:15'),
(311, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-06-23 05:24:16'),
(312, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:24:21'),
(313, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 1', '2024-06-23 05:24:21'),
(314, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:24:22'),
(315, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 1', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 2', '2024-06-23 05:24:22'),
(316, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:24:22'),
(317, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 2', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 3', '2024-06-23 05:24:22'),
(318, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:24:24'),
(319, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 3', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 4', '2024-06-23 05:24:24'),
(320, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:24:25'),
(321, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 4', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 5', '2024-06-23 05:24:25'),
(322, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:24:25'),
(323, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:24:26'),
(324, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:24:26'),
(325, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:24:26'),
(326, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:24:27'),
(327, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=51', '2024-06-23 05:24:34'),
(328, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:25:13'),
(329, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:25:25'),
(330, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:25:26'),
(331, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=51', '2024-06-23 05:25:44'),
(332, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 0', '2024-06-23 05:25:44'),
(333, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=51', '2024-06-23 05:28:16'),
(334, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 0', '2024-06-23 05:28:16'),
(335, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=51', '2024-06-23 05:31:45'),
(336, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 0', '2024-06-23 05:31:45'),
(337, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=51', '2024-06-23 05:34:13'),
(338, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 0', '2024-06-23 05:34:13'),
(339, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:34:19'),
(340, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 1', '2024-06-23 05:34:19'),
(341, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:34:20'),
(342, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 1', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 2', '2024-06-23 05:34:20'),
(343, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=51', '2024-06-23 05:34:20'),
(344, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 2', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 3', '2024-06-23 05:34:20'),
(345, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=51', '2024-06-23 05:34:24'),
(346, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 3', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 0', '2024-06-23 05:34:24'),
(347, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=51', '2024-06-23 05:34:50'),
(348, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 0', '2024-06-23 05:34:50'),
(349, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=51', '2024-06-23 05:38:58'),
(350, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 0', '2024-06-23 05:38:58'),
(351, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=51', '2024-06-23 05:38:58'),
(352, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 0', '2024-06-23 05:38:58'),
(353, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=51', '2024-06-23 05:39:00'),
(354, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 0', '2024-06-23 05:39:00'),
(355, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=51', '2024-06-23 05:43:17'),
(356, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 0', '2024-06-23 05:43:18'),
(357, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=51', '2024-06-23 05:43:26'),
(358, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 0', '2024-06-23 05:43:26'),
(359, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=51', '2024-06-23 16:55:12'),
(360, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 0', '2024-06-23 16:55:12'),
(361, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, '52: Register success. Congratulation!', '2024-06-23 17:29:36'),
(362, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, '53: Register success. Congratulation!', '2024-06-23 17:30:29'),
(363, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '53: Your account has verified successfully. Congratulation!', '2024-06-23 17:31:05'),
(364, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, '54: Register success. Congratulation!', '2024-06-23 17:33:11'),
(365, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '54: Verified code do not match!', '2024-06-23 17:33:32'),
(366, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '54: Your account has verified successfully. Congratulation!', '2024-06-23 17:33:37'),
(367, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=54', '2024-06-23 17:33:53'),
(368, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 1', '2024-06-23 17:33:53'),
(369, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=54', '2024-06-23 17:33:57'),
(370, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 1', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 2', '2024-06-23 17:33:57'),
(371, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, '55: Register success. Congratulation!', '2024-06-23 17:36:44'),
(372, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, '56: Register success. Congratulation!', '2024-06-23 17:37:42'),
(373, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, '57: Register success. Congratulation!', '2024-06-23 17:43:18'),
(374, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '57: Verified code do not match!', '2024-06-23 17:43:40'),
(375, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '57: Your account has verified successfully. Congratulation!', '2024-06-23 17:43:44'),
(376, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '57: Set verified status failed for your account', '2024-06-23 17:44:18'),
(377, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '57: Set verified status failed for your account', '2024-06-23 17:44:21'),
(378, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '57: Verified code do not match!', '2024-06-23 17:44:24'),
(379, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '57: Verified code do not match!', '2024-06-23 17:44:31'),
(380, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '57: Verified code do not match!', '2024-06-23 17:44:32'),
(381, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '57: Verified code do not match!', '2024-06-23 17:44:33'),
(382, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '57: Set verified status failed for your account', '2024-06-23 17:44:35'),
(383, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '57: Verified code do not match!', '2024-06-23 17:44:53'),
(384, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '57: Your account has verified successfully. Congratulation!', '2024-06-23 17:44:56'),
(385, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=57', '2024-06-23 17:45:10'),
(386, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 1', '2024-06-23 17:45:10'),
(387, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=57', '2024-06-23 17:45:12'),
(388, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 1', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 2', '2024-06-23 17:45:12'),
(389, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=57', '2024-06-23 17:45:12'),
(390, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 2', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 3', '2024-06-23 17:45:12'),
(391, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=57', '2024-06-23 17:45:12'),
(392, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 3', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 4', '2024-06-23 17:45:12'),
(393, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=57', '2024-06-23 17:45:18'),
(394, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 4', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 0', '2024-06-23 17:45:18'),
(395, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, '58: Register success. Congratulation!', '2024-06-23 18:22:37'),
(396, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, 'Load successfully with ID=58', '2024-06-23 18:23:20');
INSERT INTO `log` (`id`, `level_id`, `ip`, `address`, `pre_value`, `post_value`, `create_at`) VALUES
(397, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '58: Verified code do not match!', '2024-06-23 18:23:42'),
(398, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '58: Your account has verified successfully. Congratulation!', '2024-06-23 18:23:51'),
(399, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, 'Load failed with ID=null', '2024-06-23 19:20:54'),
(400, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, '59: Register success. Congratulation!', '2024-06-23 22:24:13'),
(401, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '21130556@st.hcmuaf.edu.vn: Verified code do not match!', '2024-06-23 22:24:50'),
(402, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '21130556@st.hcmuaf.edu.vn: Verified code do not match!', '2024-06-23 22:25:18'),
(403, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '21130556@st.hcmuaf.edu.vn: Your account has verified successfully. Congratulation!', '2024-06-23 22:25:24'),
(404, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=59', '2024-06-23 22:25:35'),
(405, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 0', '2024-06-23 22:25:35'),
(406, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=59', '2024-06-23 22:27:05'),
(407, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 0', '2024-06-23 22:27:05'),
(408, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:27:24'),
(409, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 1', '2024-06-23 22:27:24'),
(410, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:27:25'),
(411, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 1', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 2', '2024-06-23 22:27:25'),
(412, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:27:25'),
(413, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 2', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 3', '2024-06-23 22:27:25'),
(414, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:27:25'),
(415, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 3', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 4', '2024-06-23 22:27:25'),
(416, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:27:26'),
(417, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 4', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 5', '2024-06-23 22:27:26'),
(418, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:27:26'),
(419, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:27:45'),
(420, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 1', '2024-06-23 22:27:45'),
(421, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:27:49'),
(422, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 1', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 2', '2024-06-23 22:27:49'),
(423, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:27:49'),
(424, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 2', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 3', '2024-06-23 22:27:49'),
(425, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:27:50'),
(426, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 3', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 4', '2024-06-23 22:27:50'),
(427, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:27:50'),
(428, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 4', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 5', '2024-06-23 22:27:50'),
(429, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=59', '2024-06-23 22:28:19'),
(430, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 0', '2024-06-23 22:28:19'),
(431, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=59', '2024-06-23 22:28:22'),
(432, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 0', '2024-06-23 22:28:22'),
(433, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:28:31'),
(434, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 1', '2024-06-23 22:28:31'),
(435, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:28:33'),
(436, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 1', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 2', '2024-06-23 22:28:33'),
(437, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:28:33'),
(438, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 2', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 3', '2024-06-23 22:28:33'),
(439, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:28:34'),
(440, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 3', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 4', '2024-06-23 22:28:34'),
(441, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:28:35'),
(442, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 4', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 5', '2024-06-23 22:28:35'),
(443, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:29:31'),
(444, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 1', '2024-06-23 22:29:31'),
(445, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:29:32'),
(446, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 1', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 2', '2024-06-23 22:29:32'),
(447, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:29:33'),
(448, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 2', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 3', '2024-06-23 22:29:33'),
(449, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:29:33'),
(450, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 3', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 4', '2024-06-23 22:29:34'),
(451, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:29:34'),
(452, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 4', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 5', '2024-06-23 22:29:34'),
(453, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-06-23 22:30:05'),
(454, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=59', '2024-06-23 22:30:19'),
(455, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=59', '2024-06-23 22:30:21'),
(456, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=59', '2024-06-23 22:30:21'),
(457, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=59', '2024-06-23 22:30:22'),
(458, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=59', '2024-06-23 22:30:23'),
(459, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=59', '2024-06-23 22:32:57'),
(460, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 0', '2024-06-23 22:32:57'),
(461, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=59', '2024-06-23 22:32:59'),
(462, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 0', '2024-06-23 22:32:59'),
(463, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:33:12'),
(464, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 1', '2024-06-23 22:33:12'),
(465, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:33:14'),
(466, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 1', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 2', '2024-06-23 22:33:14'),
(467, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:33:14'),
(468, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 2', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 3', '2024-06-23 22:33:14'),
(469, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:33:14'),
(470, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 3', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 4', '2024-06-23 22:33:15'),
(471, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:33:15'),
(472, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 4', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 5', '2024-06-23 22:33:15'),
(473, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=59', '2024-06-23 22:33:26'),
(474, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=59', '2024-06-23 22:33:31'),
(475, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=59', '2024-06-23 22:33:31'),
(476, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=59', '2024-06-23 22:33:32'),
(477, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=59', '2024-06-23 22:33:38'),
(478, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=59', '2024-06-23 22:33:38'),
(479, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=59', '2024-06-23 22:33:38'),
(480, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=59', '2024-06-23 22:33:39'),
(481, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=59', '2024-06-23 22:33:39'),
(482, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=59', '2024-06-23 22:33:39'),
(483, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=59', '2024-06-23 22:33:39'),
(484, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=59', '2024-06-23 22:33:40'),
(485, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=59', '2024-06-23 22:33:40'),
(486, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=59', '2024-06-23 22:33:40'),
(487, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=59', '2024-06-23 22:34:25'),
(488, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=59', '2024-06-23 22:34:29'),
(489, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=59', '2024-06-23 22:34:30'),
(490, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=59', '2024-06-23 22:34:32'),
(491, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=59', '2024-06-23 22:34:36'),
(492, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=59', '2024-06-23 22:35:55'),
(493, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=59', '2024-06-23 22:35:56'),
(494, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:36:55'),
(495, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 1', '2024-06-23 22:36:55'),
(496, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:36:57'),
(497, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 1', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 2', '2024-06-23 22:36:57'),
(498, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:36:58'),
(499, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 2', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 3', '2024-06-23 22:36:58'),
(500, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:36:59'),
(501, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 3', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 4', '2024-06-23 22:36:59'),
(502, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:37:00'),
(503, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 4', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 5', '2024-06-23 22:37:00'),
(504, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=59', '2024-06-23 22:37:17'),
(505, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=59', '2024-06-23 22:37:17'),
(506, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=59', '2024-06-23 22:37:49'),
(507, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:44:07'),
(508, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 1', '2024-06-23 22:44:07'),
(509, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:44:08'),
(510, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 1', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 2', '2024-06-23 22:44:09'),
(511, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:44:09'),
(512, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 2', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 3', '2024-06-23 22:44:09'),
(513, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:44:10'),
(514, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 3', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 4', '2024-06-23 22:44:10'),
(515, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:44:10'),
(516, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 4', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 5', '2024-06-23 22:44:10'),
(517, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-06-23 22:44:18'),
(518, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:44:22'),
(519, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:44:24'),
(520, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:45:03'),
(521, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:45:08'),
(522, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:45:22'),
(523, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=59', '2024-06-23 22:45:27'),
(524, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=59', '2024-06-23 22:45:35'),
(525, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=59', '2024-06-23 22:45:45'),
(526, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=59', '2024-06-23 22:47:00'),
(527, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 0', '2024-06-23 22:47:00'),
(528, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:47:04'),
(529, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 1', '2024-06-23 22:47:04'),
(530, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:47:05'),
(531, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 1', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 2', '2024-06-23 22:47:05'),
(532, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:47:05'),
(533, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 2', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 3', '2024-06-23 22:47:05'),
(534, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:47:06'),
(535, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 3', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 4', '2024-06-23 22:47:06'),
(536, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:47:06'),
(537, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 4', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 5', '2024-06-23 22:47:06'),
(538, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:47:08'),
(539, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:47:09'),
(540, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:47:10'),
(541, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:47:10'),
(542, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:47:10'),
(543, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=59', '2024-06-23 22:47:45'),
(544, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 0', '2024-06-23 22:47:45'),
(545, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=59', '2024-06-23 22:47:54'),
(546, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 0', '2024-06-23 22:47:54'),
(547, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:48:00'),
(548, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 1', '2024-06-23 22:48:00'),
(549, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:48:04'),
(550, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 1', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 2', '2024-06-23 22:48:04'),
(551, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:48:05'),
(552, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 2', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 3', '2024-06-23 22:48:05'),
(553, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:48:06'),
(554, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 3', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 4', '2024-06-23 22:48:06'),
(555, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:48:06'),
(556, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 4', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 5', '2024-06-23 22:48:06'),
(557, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:48:07'),
(558, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=59', '2024-06-23 22:51:31'),
(559, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 0', '2024-06-23 22:51:31'),
(560, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:51:40'),
(561, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 1', '2024-06-23 22:51:40'),
(562, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:51:41'),
(563, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 1', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 2', '2024-06-23 22:51:41'),
(564, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:51:41'),
(565, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 2', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 3', '2024-06-23 22:51:41'),
(566, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:51:41'),
(567, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 3', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 4', '2024-06-23 22:51:41'),
(568, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:51:41'),
(569, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 4', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 5', '2024-06-23 22:51:41'),
(570, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:51:42'),
(571, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:51:44'),
(572, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:55:02'),
(573, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 1', '2024-06-23 22:55:02'),
(574, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:55:03'),
(575, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 1', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 2', '2024-06-23 22:55:03'),
(576, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:55:03'),
(577, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 2', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 3', '2024-06-23 22:55:03'),
(578, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:55:04'),
(579, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 3', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 4', '2024-06-23 22:55:04'),
(580, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:55:04'),
(581, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 4', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 5', '2024-06-23 22:55:04'),
(582, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:55:05'),
(583, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:56:15'),
(584, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=59', '2024-06-23 22:56:49'),
(585, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 0', '2024-06-23 22:56:49'),
(586, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:57:03'),
(587, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 1', '2024-06-23 22:57:03'),
(588, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:57:03'),
(589, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 1', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 2', '2024-06-23 22:57:03'),
(590, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:57:04'),
(591, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 2', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 3', '2024-06-23 22:57:04'),
(592, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:57:04'),
(593, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 3', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 4', '2024-06-23 22:57:04'),
(594, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:57:04'),
(595, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 4', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 5', '2024-06-23 22:57:04'),
(596, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:57:05'),
(597, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:57:06'),
(598, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=59', '2024-06-23 22:59:42'),
(599, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, 'null: Verified code is timeout!', '2024-06-23 23:04:53'),
(600, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, 'null: Verified code is timeout!', '2024-06-23 23:04:54'),
(601, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, 'null: Verified code is timeout!', '2024-06-23 23:04:59'),
(602, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, 'null: Verified code is timeout!', '2024-06-23 23:05:03'),
(603, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, 'null: Verified code is timeout!', '2024-06-23 23:05:13'),
(604, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, 'null: Verified code is timeout!', '2024-06-23 23:05:20'),
(605, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, 'null: Verified code is invalid!', '2024-06-23 23:08:08'),
(606, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, '60: Register success. Congratulation!', '2024-06-23 23:39:24'),
(607, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '21130556@st.hcmuaf.edu.vn: Your account has verified successfully. Congratulation!', '2024-06-23 23:39:47'),
(608, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, '61: Register success. Congratulation!', '2024-06-23 23:44:15'),
(609, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '21130556@st.hcmuaf.edu.vn: Your account has verified successfully. Congratulation!', '2024-06-23 23:44:35'),
(610, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, '62: Register success. Congratulation!', '2024-06-24 00:32:25'),
(611, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '21130556@st.hcmuaf.edu.vn: Verified code do not match!', '2024-06-24 00:32:52'),
(612, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, '63: Register success. Congratulation!', '2024-06-24 00:33:48'),
(613, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '21130556@st.hcmuaf.edu.vn: Verified code do not match!', '2024-06-24 00:34:05'),
(614, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, '64: Register success. Congratulation!', '2024-06-24 00:35:58'),
(615, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '21130556@st.hcmuaf.edu.vn: Verified code do not match!', '2024-06-24 00:36:13'),
(616, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '21130556@st.hcmuaf.edu.vn: Verified code do not match!', '2024-06-24 00:36:34'),
(617, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '21130556@st.hcmuaf.edu.vn: Your account has verified successfully. Congratulation!', '2024-06-24 00:36:44'),
(618, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '21130556@st.hcmuaf.edu.vn: Set verified status failed for your account', '2024-06-24 00:46:52'),
(619, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '21130556@st.hcmuaf.edu.vn: Set verified status failed for your account', '2024-06-24 00:51:01'),
(620, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '21130556@st.hcmuaf.edu.vn: Verified code do not match!', '2024-06-24 01:07:41'),
(621, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '21130556@st.hcmuaf.edu.vn: Verified code do not match!', '2024-06-24 01:07:43'),
(622, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, '65: Register success. Congratulation!', '2024-06-24 01:10:28'),
(623, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, '66: Register success. Congratulation!', '2024-06-24 01:17:09'),
(624, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '21130556@st.hcmuaf.edu.vn: Your account has verified successfully. Congratulation!', '2024-06-24 01:18:05'),
(625, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=66', '2024-06-24 01:18:24'),
(626, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 1', '2024-06-24 01:18:24'),
(627, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=66', '2024-06-24 01:18:24'),
(628, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 1', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 2', '2024-06-24 01:18:24'),
(629, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=66', '2024-06-24 01:18:25'),
(630, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 2', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 3', '2024-06-24 01:18:25'),
(631, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=66', '2024-06-24 01:18:25'),
(632, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 3', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 4', '2024-06-24 01:18:25'),
(633, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=66', '2024-06-24 01:18:26'),
(634, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 4', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 5', '2024-06-24 01:18:26'),
(635, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=66', '2024-06-24 01:19:07'),
(636, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=66', '2024-06-24 01:19:21'),
(637, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=66', '2024-06-24 01:19:26'),
(638, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=66', '2024-06-24 01:19:29'),
(639, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=66', '2024-06-24 01:19:31'),
(640, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=66', '2024-06-24 01:19:35'),
(641, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=66', '2024-06-24 01:21:23'),
(642, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=66', '2024-06-24 01:26:17'),
(643, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=66', '2024-06-24 01:26:30'),
(644, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '21130556@st.hcmuaf.edu.vn: Your account has verified successfully. Congratulation!', '2024-06-24 01:27:27'),
(645, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=66', '2024-06-24 01:27:36'),
(646, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '21130556@st.hcmuaf.edu.vn: Verified code do not match!', '2024-06-24 03:54:46'),
(647, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '21130556@st.hcmuaf.edu.vn: Your account has verified successfully. Congratulation!', '2024-06-24 03:55:02'),
(648, 1, '0:0:0:0:0:0:0:1', '/user/verify', 'Login times of email=21130556@st.hcmuaf.edu.vn are null', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 0', '2024-06-24 03:55:33'),
(649, 1, '0:0:0:0:0:0:0:1', '/user/verify', 'Login times of email=21130556@st.hcmuaf.edu.vn are null', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 0', '2024-06-24 03:56:14'),
(650, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '21130556@st.hcmuaf.edu.vn: Verified code do not match!', '2024-06-24 04:15:11'),
(651, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '21130556@st.hcmuaf.edu.vn: Verified code do not match!', '2024-06-24 04:15:36'),
(652, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '21130556@st.hcmuaf.edu.vn: Your account has been verified!', '2024-06-24 04:22:15'),
(653, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '21130556@st.hcmuaf.edu.vn: Verified code do not match!', '2024-06-24 04:23:54'),
(654, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '21130556@st.hcmuaf.edu.vn: Your account has been verified!', '2024-06-24 04:24:12'),
(655, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '21130556@st.hcmuaf.edu.vn: Verified code do not match!', '2024-06-24 04:24:44'),
(656, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '21130556@st.hcmuaf.edu.vn: Verified code do not match!', '2024-06-24 04:26:51'),
(657, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '21130556@st.hcmuaf.edu.vn: Verified code is invalid!', '2024-06-24 04:27:33'),
(658, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '21130556@st.hcmuaf.edu.vn: Verified code is invalid!', '2024-06-24 04:27:41'),
(659, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=66', '2024-06-24 04:37:51'),
(660, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-06-24 04:37:51'),
(661, 1, '0:0:0:0:0:0:0:1', '/user/verify', 'Old password of ID=66 is $2a$10$tHZrXa6ZSacMVVoOgq67b.ZEYV.UxtaO91Hy5nCax7NJmcTL5CUza', 'Update password successfully! New password of ID=66 is $2a$10$tHZrXa6ZSacMVVoOgq67b.ZEYV.UxtaO91Hy5nCax7NJmcTL5CUza', '2024-06-24 23:03:09'),
(662, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=66', '2024-06-24 23:03:50'),
(663, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-06-24 23:03:50'),
(664, 3, '0:0:0:0:0:0:0:1', '/user/loginByGoogle', NULL, 'Login failed. The new user is not in database!', '2024-06-25 01:04:15'),
(665, 3, '0:0:0:0:0:0:0:1', '/user/loginByGoogle', NULL, 'Login failed. The new user is not in database!', '2024-06-25 01:04:36'),
(666, 3, '0:0:0:0:0:0:0:1', '/user/loginByGoogle', NULL, 'Login failed. The new user is not in database!', '2024-06-25 01:04:45'),
(667, 3, '0:0:0:0:0:0:0:1', '/user/loginByGoogle', NULL, 'Login failed. The new user is not in database!', '2024-06-25 01:05:35'),
(668, 3, '0:0:0:0:0:0:0:1', '/user/loginByGoogle', NULL, 'Login failed. The new user is not in database!', '2024-06-25 01:16:39'),
(669, 3, '0:0:0:0:0:0:0:1', '/user/loginByGoogle', NULL, 'Login failed. The new user is not in database!', '2024-06-25 01:17:34'),
(670, 3, '0:0:0:0:0:0:0:1', '/user/loginByGoogle', NULL, 'Login failed. The new user is not in database!', '2024-06-25 01:20:58'),
(671, 2, '0:0:0:0:0:0:0:1', '/user/loginByGoogle', NULL, 'Login failed. The new user is not in database!', '2024-06-25 01:30:15'),
(672, 1, '0:0:0:0:0:0:0:1', '/user/loginByGoogle', NULL, '67: Login by Google success. Congratulation!', '2024-06-25 01:31:33'),
(673, 2, '0:0:0:0:0:0:0:1', '/user/loginByGoogle', NULL, 'Login failed. The user is using normal login!', '2024-06-25 01:58:02'),
(674, 2, '0:0:0:0:0:0:0:1', '/user/loginByGoogle', NULL, 'Login failed. The user is using normal login!', '2024-06-25 01:59:20'),
(675, 2, '0:0:0:0:0:0:0:1', '/user/loginByGoogle', NULL, 'Login failed. The user is using normal login!', '2024-06-25 02:00:07'),
(676, 2, '0:0:0:0:0:0:0:1', '/user/loginByGoogle', NULL, 'Login failed. The user is using normal login!', '2024-06-25 02:00:14'),
(677, 2, '0:0:0:0:0:0:0:1', '/user/loginByGoogle', NULL, 'Login failed. The user is using normal login!', '2024-06-25 02:00:36'),
(678, 2, '122oskfep', 'dsaipjidf', NULL, 'Login failed. The new user is not in database!', '2024-06-25 02:02:00'),
(679, 2, '122oskfep', 'dsaipjidf', NULL, 'Login failed. The new user is not in database!', '2024-06-25 02:03:09'),
(680, 1, '122oskfep', 'dsaipjidf', NULL, 'thuandangnam@gmail.com: Login success. User has already in database!', '2024-06-25 02:05:21'),
(681, 2, '0:0:0:0:0:0:0:1', '/user/loginByGoogle', NULL, 'Login failed. The user is using normal login!', '2024-06-25 02:07:01'),
(682, 1, '0:0:0:0:0:0:0:1', '/user/loginByGoogle', NULL, 'thuandangnam@gmail.com: Login success. User has already in database!', '2024-06-25 02:07:08'),
(683, 1, '0:0:0:0:0:0:0:1', '/user/loginByGoogle', NULL, '68: Login by Google success. Congratulation!', '2024-06-25 02:07:15'),
(684, 1, '0:0:0:0:0:0:0:1', '/user/loginByGoogle', NULL, 'dnamthuan@gmail.com: Login success. User has already in database!', '2024-06-25 02:07:22'),
(685, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-06-25 02:07:38'),
(686, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-06-25 02:07:44'),
(687, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=thuandangnam@gmail.com are 0', 'Update success. Login times of email=thuandangnam@gmail.com are 1', '2024-06-25 02:09:53'),
(688, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=thuandangnam@gmail.com are 1', 'Update success. Login times of email=thuandangnam@gmail.com are 2', '2024-06-25 02:09:59'),
(689, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=thuandangnam@gmail.com are 2', 'Update success. Login times of email=thuandangnam@gmail.com are 3', '2024-06-25 02:09:59'),
(690, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=thuandangnam@gmail.com are 3', 'Update success. Login times of email=thuandangnam@gmail.com are 4', '2024-06-25 02:10:00'),
(691, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=thuandangnam@gmail.com are 4', 'Update success. Login times of email=thuandangnam@gmail.com are 5', '2024-06-25 02:10:00'),
(692, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-06-25 02:16:50'),
(693, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=66', '2024-06-25 02:16:58'),
(694, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-06-25 02:16:58'),
(695, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=66', '2024-06-25 02:17:04'),
(696, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 1', '2024-06-25 02:17:04'),
(697, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=66', '2024-06-25 02:17:06'),
(698, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 1', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 2', '2024-06-25 02:17:06'),
(699, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=66', '2024-06-25 02:17:07'),
(700, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 2', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 3', '2024-06-25 02:17:07'),
(701, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=66', '2024-06-25 02:17:07'),
(702, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 3', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 4', '2024-06-25 02:17:07'),
(703, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=66', '2024-06-25 02:17:22'),
(704, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 4', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 5', '2024-06-25 02:17:22'),
(705, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-06-25 02:18:04'),
(706, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-06-25 02:18:08'),
(707, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-06-25 02:18:10'),
(708, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-06-25 02:18:10'),
(709, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-06-25 02:18:11'),
(710, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-06-25 02:18:13'),
(711, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-06-25 02:18:15'),
(712, 1, '0:0:0:0:0:0:0:1', '/user/loginByGoogle', NULL, 'thuandangnam@gmail.com: Login success. User has already in database!', '2024-06-25 04:10:53'),
(713, 1, '0:0:0:0:0:0:0:1', '/user/loginByGoogle', NULL, 'thuandangnam@gmail.com: Login success. User has already in database!', '2024-06-25 04:18:40'),
(714, 1, '0:0:0:0:0:0:0:1', '/user/loginByGoogle', NULL, 'thuandangnam@gmail.com: Login success. User has already in database!', '2024-06-25 04:19:36'),
(715, 1, '0:0:0:0:0:0:0:1', '/user/loginByGoogle', NULL, 'dnamthuan@gmail.com: Login success. User has already in database!', '2024-06-25 04:27:40'),
(716, 2, '0:0:0:0:0:0:0:1', '/user/loginByGoogle', NULL, 'Login failed. The user is using normal login!', '2024-06-25 04:44:48'),
(717, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '68: Login by Google success. Congratulation!', '2024-06-25 18:14:46'),
(718, 2, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, 'Login failed. The new user is not in database!', '2024-06-25 19:35:00'),
(719, 2, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, 'Login failed. The new user is not in database!', '2024-06-25 19:35:04'),
(720, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '69: Login by Google success. Congratulation!', '2024-06-25 19:36:04'),
(721, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '69: Login by Google success. Congratulation!', '2024-06-25 19:45:29'),
(722, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '69: Login by Google success. Congratulation!', '2024-06-25 20:51:32'),
(723, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '69: Login by Google success. Congratulation!', '2024-06-25 20:53:07'),
(724, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '70: Login by Google success. Congratulation!', '2024-06-25 21:15:30'),
(725, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '69: Login by Google success. Congratulation!', '2024-06-25 21:15:39'),
(726, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '70: Login by Google success. Congratulation!', '2024-06-25 21:15:47'),
(727, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '69: Login by Google success. Congratulation!', '2024-06-25 21:15:52'),
(728, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-06-25 21:17:10'),
(729, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-06-25 21:17:12'),
(730, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-06-25 21:17:13'),
(731, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-06-25 21:17:13'),
(732, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-06-25 21:17:13'),
(733, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-06-25 21:17:14'),
(734, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-06-25 21:17:14'),
(735, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-06-25 21:17:14'),
(736, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-06-25 21:17:15'),
(737, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-06-25 21:17:15'),
(738, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-06-25 21:17:17'),
(739, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-06-25 21:17:20'),
(740, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-06-25 21:18:21'),
(741, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-06-25 21:18:24'),
(742, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-06-25 21:18:24'),
(743, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-06-25 21:18:25'),
(744, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-06-25 21:18:25'),
(745, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with the invalid username: null', '2024-06-25 21:18:25'),
(746, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=66', '2024-06-25 21:20:01'),
(747, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=66', '2024-06-25 21:20:26'),
(748, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 1', '2024-06-25 21:20:26'),
(749, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=66', '2024-06-25 21:20:29'),
(750, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 1', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 2', '2024-06-25 21:20:29'),
(751, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=66', '2024-06-25 21:20:38'),
(752, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 2', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 3', '2024-06-25 21:20:38'),
(753, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=66', '2024-06-25 21:20:39'),
(754, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 3', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 4', '2024-06-25 21:20:39'),
(755, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=66', '2024-06-25 21:20:39'),
(756, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 4', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 5', '2024-06-25 21:20:39'),
(757, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=66', '2024-06-25 21:22:19'),
(758, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 1', '2024-06-25 21:22:20'),
(759, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=66', '2024-06-25 21:22:22'),
(760, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 1', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 2', '2024-06-25 21:22:22'),
(761, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=66', '2024-06-25 21:22:23'),
(762, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 2', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 3', '2024-06-25 21:22:23'),
(763, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=66', '2024-06-25 21:27:16'),
(764, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 1', '2024-06-25 21:27:16'),
(765, 1, '0:0:0:0:0:0:0:1', '/user/verify', 'Old password of ID=66 is $2a$10$PnuTH.qDP9.EO/aR8p2TlOLEyhGG6LCSmafsnOUSi9h79vZr7uKXK', 'Update password successfully! New password of ID=66 is $2a$10$PnuTH.qDP9.EO/aR8p2TlOLEyhGG6LCSmafsnOUSi9h79vZr7uKXK', '2024-06-25 21:27:36'),
(766, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=66', '2024-06-25 21:28:08'),
(767, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-06-25 21:28:08'),
(768, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=66', '2024-06-25 21:28:15'),
(769, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 1', '2024-06-25 21:28:15'),
(770, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=66', '2024-06-25 21:28:17');
INSERT INTO `log` (`id`, `level_id`, `ip`, `address`, `pre_value`, `post_value`, `create_at`) VALUES
(771, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 1', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 2', '2024-06-25 21:28:17'),
(772, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=66', '2024-06-25 21:28:18'),
(773, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 2', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 3', '2024-06-25 21:28:18'),
(774, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=66', '2024-06-25 21:28:18'),
(775, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 3', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 4', '2024-06-25 21:28:18'),
(776, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=66', '2024-06-25 21:28:21'),
(777, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-06-25 21:28:21'),
(778, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '67: Login by API 1 success. Congratulation!', '2024-06-26 20:28:25'),
(779, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '69: Login by API 2 success. Congratulation!', '2024-06-26 20:28:30'),
(780, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '69: Login by API 2 success. Congratulation!', '2024-06-26 21:13:02'),
(781, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '70: Login by API 1 success. Congratulation!', '2024-06-26 21:13:14'),
(782, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '69: Login by Google success. Congratulation!', '2024-06-26 22:29:41'),
(783, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '70: Login by Google success. Congratulation!', '2024-06-26 22:29:54'),
(784, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '69: Login by Google success. Congratulation!', '2024-06-26 23:48:42'),
(785, 2, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, 'Login failed. The new user is not in database!', '2024-06-27 00:16:39'),
(786, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, '71: Register success. Congratulation!', '2024-06-27 00:58:30'),
(787, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '21130556@st.hcmuaf.edu.vn: Verified code do not match!', '2024-06-27 00:59:32'),
(788, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '21130556@st.hcmuaf.edu.vn: Verified code do not match!', '2024-06-27 00:59:38'),
(789, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '21130556@st.hcmuaf.edu.vn: Verified code do not match!', '2024-06-27 00:59:42'),
(790, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '21130556@st.hcmuaf.edu.vn: Verified code do not match!', '2024-06-27 00:59:42'),
(791, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '21130556@st.hcmuaf.edu.vn: Verified code do not match!', '2024-06-27 00:59:42'),
(792, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '21130556@st.hcmuaf.edu.vn: Verified code do not match!', '2024-06-27 00:59:42'),
(793, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '21130556@st.hcmuaf.edu.vn: Verified code do not match!', '2024-06-27 00:59:42'),
(794, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '21130556@st.hcmuaf.edu.vn: Verified code do not match!', '2024-06-27 00:59:43'),
(795, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '21130556@st.hcmuaf.edu.vn: Verified code do not match!', '2024-06-27 00:59:43'),
(796, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '21130556@st.hcmuaf.edu.vn: Verified code do not match!', '2024-06-27 00:59:43'),
(797, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '21130556@st.hcmuaf.edu.vn: Verified code do not match!', '2024-06-27 00:59:43'),
(798, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '21130556@st.hcmuaf.edu.vn: Verified code do not match!', '2024-06-27 00:59:43'),
(799, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '21130556@st.hcmuaf.edu.vn: Verified code do not match!', '2024-06-27 00:59:43'),
(800, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '21130556@st.hcmuaf.edu.vn: Verified code do not match!', '2024-06-27 00:59:44'),
(801, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '21130556@st.hcmuaf.edu.vn: Verified code do not match!', '2024-06-27 00:59:46'),
(802, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '21130556@st.hcmuaf.edu.vn: Verified code do not match!', '2024-06-27 00:59:46'),
(803, 1, '0:0:0:0:0:0:0:1', '/user/verify', NULL, '21130556@st.hcmuaf.edu.vn: Verified code do not match!', '2024-06-27 00:59:46'),
(804, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=66', '2024-06-27 00:59:49'),
(805, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-06-27 00:59:49'),
(806, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '69: Login by 2 success. Congratulation!', '2024-06-27 02:33:17'),
(807, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '70: Login by 1 success. Congratulation!', '2024-06-27 02:33:26'),
(808, 2, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, 'Login failed. The new user is not in database!', '2024-06-27 02:36:06'),
(809, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '72: Login by 3 success. Congratulation!', '2024-06-27 02:39:49'),
(810, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login fail with ID=66', '2024-06-27 02:40:38'),
(811, 1, '0:0:0:0:0:0:0:1', '/user/signin', 'Login times of email=21130556@st.hcmuaf.edu.vn are 0', 'Update success. Login times of email=21130556@st.hcmuaf.edu.vn are 1', '2024-06-27 02:40:38'),
(812, 2, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, 'Login failed. The new user is not in database!', '2024-06-27 19:15:53'),
(813, 2, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, 'Login failed. The new user is not in database!', '2024-06-27 19:52:42'),
(814, 2, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, 'Login failed. The new user is not in database!', '2024-06-27 20:00:38'),
(815, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '72: Login by 3 success. Congratulation!', '2024-06-27 21:15:01'),
(816, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '73: Login by 4 success. Congratulation!', '2024-06-27 21:15:14'),
(817, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '73: Login by 4 success. Congratulation!', '2024-06-27 21:15:24'),
(818, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '74: Login by 5 success. Congratulation!', '2024-06-28 08:11:07'),
(819, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '74: Login by 5 success. Congratulation!', '2024-06-28 08:11:19'),
(820, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '73: Login by 4 success. Congratulation!', '2024-06-29 00:21:39'),
(821, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '70: Login by 1 success. Congratulation!', '2024-07-01 22:09:40'),
(822, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, 'hoangnv: Email is existed!', '2024-07-03 00:46:03'),
(823, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, 'hghghg: Email is existed!', '2024-07-03 00:46:09'),
(824, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, 'hghghg: Email is existed!', '2024-07-03 00:46:16'),
(825, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, 'hghghg: Email is existed!', '2024-07-03 00:46:17'),
(826, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, 'hghghg: Email is existed!', '2024-07-03 00:46:19'),
(827, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, 'hghghg: Email is existed!', '2024-07-03 00:46:19'),
(828, 1, '0:0:0:0:0:0:0:1', '/user/signup', NULL, 'hghghg: Email is existed!', '2024-07-03 00:46:19'),
(829, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '74: Login by 5 success. Congratulation!', '2024-07-03 03:25:44'),
(830, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '72: Login by 3 success. Congratulation!', '2024-07-03 03:25:54');

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

INSERT INTO `products` (`id`, `productName`, `cate_id`, `sale_percent`, `price`, `quantity`, `purpose`, `contraindications`, `ingredients`, `dosage`, `instructions`, `warrantyPeriod`, `storageCondition`, `type_id`, `supplier_id`, `active`) VALUES
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
INSERT INTO `products` (`id`, `productName`, `cate_id`, `sale_percent`, `price`, `quantity`, `purpose`, `contraindications`, `ingredients`, `dosage`, `instructions`, `warrantyPeriod`, `storageCondition`, `type_id`, `supplier_id`, `active`) VALUES
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
  `username` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
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
(66, 'chuotcon', '21130556@st.hcmuaf.edu.vn', '$2a$10$00FCoRTwPuoYIZSmf4IOQeuU/dul4BucVLGpX86SoPGfvD8dRuz3i', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2024-06-24 01:17:09'),
(67, 'Nam Thuận', 'thuandangnam@gmail.com', NULL, 'Nam Thuận Đặng', NULL, NULL, NULL, NULL, NULL, NULL, 'https://lh3.googleusercontent.com/a/ACg8ocJrI9-OL0XD1YeUPT5NDzI1NPtgsI4pGQo7jJl9sxnhznJ_Z24=s96-c', 1, 1, 0, 1, '2024-06-25 01:31:33'),
(68, 'Rựa', 'dnamthuan@gmail.com', NULL, 'Rựa Đực', NULL, NULL, NULL, NULL, NULL, NULL, 'https://lh3.googleusercontent.com/a/ACg8ocIjaL52zPg17MWOLhehbJfci6fABX4ZmdPYZeV1KqKBI5BQPHI=s96-c', 1, 1, 0, 1, '2024-06-25 02:07:15'),
(69, 'Đặng Nam Thuận', '21130556@st.hcmuaf.edu.vn', NULL, 'Đặng Nam Thuận', NULL, NULL, NULL, NULL, NULL, NULL, 'https://scontent-hkg4-2.xx.fbcdn.net/v/t1.30497-1/84628273_176159830277856_972693363922829312_n.jpg?stp=c15.0.50.50a_cp0_dst-jpg_p50x50&_nc_cat=1&ccb=1-7&_nc_sid=7565cd&_nc_eui2=AeGNlck_Ci0n0VQuBLi066dWik--Qfnh2B6KT75B-eHYHqM37wnh4sYcNki_GK1hPY3gFDX86wilfJrZGNQTkIhU&_nc_ohc=difA8UY_M0wQ7kNvgG3Yttp&_nc_ht=scontent-hkg4-2.xx&edm=AP4hL3IEAAAA&oh=00_AYCUYyfDoxXSpnR3JXq31MGZr0xAp0DM0XPj4ceYjBKMpQ&oe=66A21819', 1, 2, 0, 1, '2024-06-25 19:36:04'),
(70, 'Đặng Nam', '21130556@st.hcmuaf.edu.vn', NULL, 'Đặng Nam Thuận', NULL, NULL, NULL, NULL, NULL, NULL, 'https://lh3.googleusercontent.com/a/ACg8ocLRN9ohOUxOWR5xr0fch3t6YlgEXwZEmjDyvtSQUs3bTC-BIsQ=s96-c', 1, 1, 0, 1, '2024-06-25 21:15:30'),
(71, 'DMX5KK8Q', 'thuandangnam@gmail.com', '$2a$10$2oBReSoSttQjmw4kgMMwsOTT5LvLIDxBvTcwFURjSdJgPFiZ7XWBa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2024-06-27 00:58:29'),
(72, 'thuanhahahihi', 'thuanhahahihi@users.noreply.twitter.com', NULL, 'Nam Thuận Đặng', NULL, NULL, NULL, NULL, NULL, NULL, 'https://pbs.twimg.com/profile_images/1806013098832384000/BQ8FcjbK_normal.jpg', 1, 3, 0, 1, '2024-06-27 02:39:49'),
(73, 'namthuan2k3', 'thuandangnam@gmail.com', NULL, 'Southwind', NULL, NULL, NULL, NULL, NULL, NULL, 'c6ae0d72fd50ad23b2b138691677fa15', 1, 4, 0, 1, '2024-06-27 21:15:14'),
(74, 'namthuan2304', 'namthuan2304@users.noreply.github.com', NULL, 'Đặng Nam Thuận', NULL, NULL, NULL, NULL, NULL, NULL, 'https://avatars.githubusercontent.com/u/146423539?v=4', 1, 5, 0, 1, '2024-06-28 08:11:07');

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
  ADD KEY `fk_products_category` (`cate_id`),
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
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=831;

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
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

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
  ADD CONSTRAINT `fk_products_category` FOREIGN KEY (`cate_id`) REFERENCES `product_categories` (`id`),
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