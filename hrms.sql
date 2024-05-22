-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 22, 2024 lúc 04:03 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `hrms`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `benefits`
--

CREATE TABLE `benefits` (
  `id` bigint(20) NOT NULL,
  `allowance` float DEFAULT NULL,
  `bonus` float DEFAULT NULL,
  `disability_allowance` float DEFAULT NULL,
  `health_insurance` float DEFAULT NULL,
  `maternity_insurance` float DEFAULT NULL,
  `social_insurance` float DEFAULT NULL,
  `work_accident_insurance` float DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `benefits`
--

INSERT INTO `benefits` (`id`, `allowance`, `bonus`, `disability_allowance`, `health_insurance`, `maternity_insurance`, `social_insurance`, `work_accident_insurance`, `user_id`) VALUES
(1, 1000000, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 1000000, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) NOT NULL,
  `create_at` datetime(6) DEFAULT NULL,
  `update_at` datetime(6) DEFAULT NULL,
  `manager_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `departments`
--

INSERT INTO `departments` (`id`, `create_at`, `update_at`, `manager_id`, `name`) VALUES
(1, '2024-04-22 19:03:17.000000', '2024-04-22 19:03:17.000000', '19', 'Nhân sự'),
(2, '2024-04-22 19:03:48.000000', '2024-04-22 19:03:48.000000', '19', 'Kinh doanh'),
(3, '2024-04-22 19:04:07.000000', '2024-04-22 19:04:07.000000', '18', 'Kế toán'),
(4, '2024-04-22 19:04:53.000000', '2024-04-22 19:04:53.000000', '17', 'ICT'),
(5, '2024-04-22 19:07:47.000000', '2024-04-22 19:07:47.000000', '16', 'SYSTEM'),
(6, NULL, '2024-04-22 19:24:42.000000', '1', 'ICT');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `departments_details`
--

CREATE TABLE `departments_details` (
  `id` bigint(20) NOT NULL,
  `department_id` bigint(20) DEFAULT NULL,
  `employee_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) NOT NULL,
  `address` varchar(300) DEFAULT NULL,
  `avatar_url` varchar(255) DEFAULT NULL,
  `contact_end_date` date DEFAULT NULL,
  `contact_start_date` date DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `education` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `department_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `remaining_overtime_hours` float DEFAULT NULL,
  `remaining_paid_leave_days` float DEFAULT NULL,
  `remaining_remote_days` float DEFAULT NULL,
  `hourly_wage` float DEFAULT NULL,
  `benifit` bigint(20) DEFAULT NULL,
  `payroll` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `employees`
--

INSERT INTO `employees` (`id`, `address`, `avatar_url`, `contact_end_date`, `contact_start_date`, `date_of_birth`, `education`, `email`, `full_name`, `gender`, `phone_number`, `position`, `department_id`, `user_id`, `remaining_overtime_hours`, `remaining_paid_leave_days`, `remaining_remote_days`, `hourly_wage`, `benifit`, `payroll`) VALUES
(1, 'Ha noi', '/image/65b09ff0-7df3-43c1-a48a-a411815118fb_home.jpg', '2026-11-11', '2020-11-11', '1999-11-11', 'Kỹ sư', 'a@gmail.com', 'Nguyen Van A', 'Nam', '0987654321', 'Nhân viên', 1, 2, 480, 12, 48, 0, NULL, NULL),
(2, 'Hai Ba Trung , Ha Noi', '/image/17588fc6-da91-4a87-ae90-b725f5a55695_home.jpg', '2026-11-11', '2020-11-11', '1999-11-11', 'Kỹ sư', 'a@gmail.com', 'Nguyen Van B', 'Nam', '09876543', 'Nhân viên', 1, 3, 480, 12, 48, 0, NULL, NULL),
(3, 'Ha noi', '/image/fbbdb7bd-18ee-40a0-9340-688bca126459_home.jpg', '2026-11-11', '2020-11-11', '1999-11-11', 'Kỹ sư', 'a@gmail.com', 'Nguyen Van C', 'Nam', '0987654321', 'Nhân viên', 1, 4, 480, 6, 29, 0, NULL, NULL),
(4, 'Ha noi', '/image/9f41b1bd-3ff2-4f4f-b043-b40569cef79a_home.jpg', '2026-11-11', '2020-11-11', '1999-11-11', 'Kỹ sư', 'a@gmail.com', 'Nguyen Van D', 'Nam', '0987654321', 'Nhân viên', 1, 5, 480, 12, 48, 0, NULL, NULL),
(5, 'Ha noi', '/image/1bbd6366-b2f2-44c8-b147-b336333603f2_home.jpg', '2026-11-11', '2020-11-11', '1999-11-11', 'Kỹ sư', 'a@gmail.com', 'Nguyen Van E', 'Nam', '0987654321', 'Nhân viên', 1, 6, 480, 12, 48, 0, NULL, NULL),
(6, 'Ha noi', '/image/97e49fde-ca73-4829-a251-f1a938ac372b_home.jpg', '2026-11-11', '2020-11-11', '1999-11-11', 'Kỹ sư', 'a@gmail.com', 'Nguyen Van F', 'Nam', '0987654321', 'Nhân viên', 1, 7, 480, 12, 48, 0, NULL, NULL),
(7, 'Ha noi', '/image/3bb1f7d0-e4ce-4bd8-b978-0fd41b15d7ec_home.jpg', '2026-11-11', '2020-11-11', '1999-11-11', 'Kỹ sư', 'a@gmail.com', 'Nguyen Van G', 'Nam', '0987654321', 'Nhân viên', 1, 8, 480, 6, 48, 0, NULL, NULL),
(8, 'Ha noi', '/image/9f24dc87-5b4b-4d6c-adcd-da563bc71ec9_home.jpg', '2026-11-11', '2020-11-11', '1999-11-11', 'Kỹ sư', 'a@gmail.com', 'Nguyen Van H', 'Nam', '0987654321', 'Nhân viên', 1, 9, 480, 12, 48, 0, NULL, NULL),
(9, 'Ha noi', '/image/3cdbce7e-5b96-4c0d-a2ee-80a40a1cc1f2_home.jpg', '2026-11-11', '2020-11-11', '1999-11-11', 'Kỹ sư', 'a@gmail.com', 'Nguyen Van I', 'Nam', '0987654321', 'Nhân viên', 1, 10, 480, 12, 48, 0, NULL, NULL),
(10, 'Ha noi', '/image/03311120-ec33-4887-9f70-fa7b911d2789_home.jpg', '2026-11-11', '2020-11-11', '1999-11-11', 'Kỹ sư', 'a@gmail.com', 'Nguyen Van K', 'Nam', '0987654321', 'Nhân viên', 1, 11, 480, 12, 48, 0, NULL, NULL),
(11, 'Ha noi', '/image/f42e94b1-8b05-4a2b-9998-cae68dd24e06_home.jpg', '2026-11-11', '2020-11-11', '1999-11-11', 'Kỹ sư', 'a@gmail.com', 'Nguyen Van L', 'Nam', '0987654321', 'Nhân viên', 1, 12, 480, 12, 48, 0, NULL, NULL),
(12, 'Ha noi', '/image/2186873f-09c6-453c-8b69-d3134e672413_home.jpg', '2026-11-11', '2020-11-11', '1999-11-11', 'Kỹ sư', 'a@gmail.com', 'Nguyen Van M', 'Nam', '0987654321', 'Nhân viên', 2, 13, 480, 12, 48, 0, NULL, NULL),
(16, 'Ha noi', '/image/23f03d93-9905-4aa6-bc72-06194cc4dced_home.jpg', '2026-11-11', '2020-11-11', '1999-11-11', 'Kỹ sư', 'a@gmail.com', 'Nguyen Van O', 'Nam', '0987654321', 'Nhân viên', NULL, 20, 0, 0, 0, 0, 1, 1),
(17, 'Ha noi', NULL, '2026-11-11', '2020-11-11', '1999-11-11', 'Kỹ sư', 'a@gmail.com', 'Nguyen Van O', 'Nam', '0987654321', 'Nhân viên', NULL, 21, 0, 0, 0, 0, 2, 2),
(18, 'Hoàng Mai', NULL, NULL, NULL, NULL, '', 'duc.leanh0312@gmail.com', 'Lê Anh Đức', 'Female', '0352457241', '', NULL, NULL, 0, 0, 0, 0, 3, 3),
(19, 'Hoàng Mai', NULL, '2024-03-12', '2019-03-12', '2001-03-12', 'Đại học', 'duc.leanh0312@gmail.com', 'Lê Anh Đức', 'Male', '0352457241', 'Kỹ sư', NULL, 22, 0, 0, 0, 0, 4, 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `holidays`
--

CREATE TABLE `holidays` (
  `id` bigint(20) NOT NULL,
  `date` datetime(6) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `in_out_forget`
--

CREATE TABLE `in_out_forget` (
  `id` bigint(20) NOT NULL,
  `create_at` datetime(6) DEFAULT NULL,
  `update_at` datetime(6) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `evident` varchar(255) DEFAULT NULL,
  `in_time` datetime(6) DEFAULT NULL,
  `out_time` datetime(6) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `total_hours` float DEFAULT NULL,
  `approver_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `leaves`
--

CREATE TABLE `leaves` (
  `id` bigint(20) NOT NULL,
  `create_at` datetime(6) DEFAULT NULL,
  `update_at` datetime(6) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `evident` varchar(255) DEFAULT NULL,
  `from_datetime` datetime(6) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `to_datetime` datetime(6) DEFAULT NULL,
  `total_hours` float DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `approver_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `leaves`
--

INSERT INTO `leaves` (`id`, `create_at`, `update_at`, `comment`, `evident`, `from_datetime`, `reason`, `status`, `to_datetime`, `total_hours`, `type`, `approver_id`, `user_id`, `code`) VALUES
(1, '2024-04-22 22:56:20.000000', '2024-04-22 22:56:20.000000', 'Approved. Enjoy your vacation!', 'http://example.com/evidence.pdf', '2024-04-25 08:00:00.000000', 'Vacation', 'Approved', '2024-04-25 17:00:00.000000', NULL, 'Annual', NULL, 8, NULL),
(2, '2024-04-22 22:58:02.000000', '2024-04-22 22:58:02.000000', 'Approved. Enjoy your vacation!', 'http://example.com/evidence.pdf', '2024-04-25 08:00:00.000000', 'Vacation', 'Approved', '2024-04-25 17:00:00.000000', NULL, 'Annual', NULL, 8, NULL),
(3, '2024-04-22 23:01:07.000000', '2024-04-22 23:01:07.000000', 'Approved. Enjoy your vacation!', 'http://example.com/evidence.pdf', '2024-04-25 08:00:00.000000', 'Vacation', 'Approved', '2024-04-25 17:00:00.000000', NULL, 'Annual', NULL, 8, NULL),
(4, '2024-04-22 23:35:06.000000', '2024-04-22 23:35:06.000000', 'Approved. Enjoy your vacation!', 'http://example.com/evidence.pdf', '2024-04-25 08:00:00.000000', 'Vacation', 'Approved', '2024-04-25 17:00:00.000000', NULL, 'Annual', NULL, 8, NULL),
(5, '2024-04-22 23:35:06.000000', '2024-04-22 23:35:06.000000', 'Approved. Enjoy your vacation!', 'http://example.com/evidence.pdf', '2024-04-25 08:00:00.000000', 'Vacation', 'Approved', '2024-04-25 17:00:00.000000', NULL, 'Annual', NULL, 8, NULL),
(6, '2024-04-22 23:36:13.000000', '2024-04-22 23:36:13.000000', 'Approved. Enjoy your vacation!', 'http://example.com/evidence.pdf', '2024-04-25 08:00:00.000000', 'Vacation', 'Approved', '2024-04-25 17:00:00.000000', NULL, 'Annual', NULL, 7, NULL),
(7, '2024-04-24 20:23:33.000000', '2024-04-24 20:23:33.000000', 'Approved. Enjoy your vacation!', 'http://example.com/evidence.pdf', '2024-04-26 08:00:00.000000', 'Vacation', 'Approved', '2024-04-26 17:00:00.000000', NULL, 'Annual', NULL, 7, NULL),
(8, '2024-05-09 13:08:48.000000', '2024-05-09 13:08:48.000000', 'task1', NULL, '2024-05-12 15:10:00.000000', 'test', 'Approved', '2024-05-12 19:08:00.000000', NULL, NULL, NULL, 3, NULL),
(9, '2024-05-09 13:08:48.000000', '2024-05-09 13:08:48.000000', 'task1', NULL, '2024-05-12 15:10:00.000000', 'test', 'Approved', '2024-05-12 19:08:00.000000', NULL, NULL, NULL, 3, NULL),
(10, '2024-05-09 13:11:28.000000', '2024-05-09 13:11:28.000000', 'a', NULL, '2024-05-17 13:11:00.000000', 'âs', 'Approved', '2024-05-17 19:11:00.000000', NULL, NULL, NULL, 3, NULL),
(11, '2024-05-09 13:11:37.000000', '2024-05-09 13:11:37.000000', 'a', NULL, '2024-05-17 13:11:00.000000', 'âs', 'Approved', '2024-05-17 19:11:00.000000', NULL, NULL, NULL, 3, NULL),
(12, '2024-05-09 13:16:45.000000', '2024-05-09 13:16:45.000000', 'a', NULL, '2024-05-17 06:16:00.000000', 'axa', 'Approved', '2024-05-17 18:16:00.000000', NULL, NULL, NULL, 3, NULL),
(13, '2024-05-09 13:20:49.000000', '2024-05-09 13:20:49.000000', 'a', NULL, '2024-05-17 06:16:00.000000', 'axa', 'Approved', '2024-05-17 18:16:00.000000', NULL, NULL, NULL, 3, NULL),
(14, '2024-05-11 13:31:30.000000', '2024-05-11 13:31:30.000000', 'check1', NULL, '2024-05-14 13:31:00.000000', 'check ', 'Approved', '2024-05-14 19:31:00.000000', NULL, NULL, NULL, 3, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `news`
--

CREATE TABLE `news` (
  `id` bigint(20) NOT NULL,
  `content` text DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `author_id` bigint(20) DEFAULT NULL,
  `time` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `news`
--

INSERT INTO `news` (`id`, `content`, `title`, `author_id`, `time`) VALUES
(1, '<p>Engaging in morning exercise can improve concentration and boost energy for the day ahead. xya</p>', 'Morning Exercise Session', NULL, '2024-04-22 18:32:29.000000'),
(4, '<figure class=\"table\"><table><tbody><tr><td><strong>q</strong></td><td>q</td><td>q</td><td>q</td><td>q</td></tr><tr><td>q</td><td>q</td><td>q</td><td>q</td><td>q</td></tr><tr><td>q</td><td>q</td><td>q</td><td>q</td><td>q</td></tr></tbody></table></figure><p>Test</p>', 'Test news', 1, '2024-05-13 10:05:42.000000'),
(5, '<p><strong>Sứ mệnh:</strong> Nâng tầm trí tuệ nhân tạo, mang đến giải pháp công nghệ đột phá cho mọi doanh nghiệp.</p><p><strong>Tầm nhìn:</strong> Trở thành nhà cung cấp giải pháp trí tuệ nhân tạo hàng đầu Việt Nam, góp phần thúc đẩy chuyển đổi số và phát triển kinh tế - xã hội.</p><p><strong>Giá trị cốt lõi:</strong> Chuyên nghiệp - Sáng tạo - Hiệu quả - Trách nhiệm.</p><p><strong>Điểm khác biệt:</strong> Đội ngũ chuyên gia giàu kinh nghiệm, am hiểu sâu về trí tuệ nhân tạo; Nền tảng công nghệ tiên tiến, hiện đại; Giải pháp sáng tạo, đáp ứng mọi nhu cầu của khách hàng.</p><p>&nbsp;</p>', 'Ra mắt Công Ty TNHH Trách Nhiệm Hữu Hạn Công Nghệ Trí Tuệ Nhân Tạo Staff Zen', 1, '2024-05-13 10:13:13.000000'),
(6, '<p>&nbsp;</p><p><strong>Ngày thành lập:</strong> 13/05/2024.</p><p><strong>Đội ngũ:</strong> Gồm các chuyên gia, kỹ sư, nhà nghiên cứu hàng đầu trong lĩnh vực trí tuệ nhân tạo.</p><p><strong>Mục tiêu:</strong> Trở thành đối tác tin cậy của mọi doanh nghiệp trong hành trình chuyển đổi số, mang đến giải pháp trí tuệ nhân tạo hiệu quả, giúp doanh nghiệp tối ưu hóa hoạt động, tăng năng suất và lợi nhuận.</p><p><strong>Hình ảnh:</strong> [Hình ảnh đội ngũ nhân viên của Công Ty TNHH Trách Nhiệm Hữu Hạn Công Nghệ Trí Tuệ Nhân Tạo Staff Zen].</p>', 'Staff Zen Chính Thức Đi Vào Hoạt Động', 1, '2024-05-13 10:14:16.000000'),
(7, '<p><strong>Nội dung chính:</strong> Quy định về giờ giấc làm việc, trang phục, đạo đức nghề nghiệp, quy trình làm việc,...</p><p><strong>Tầm quan trọng:</strong> Giúp tạo môi trường làm việc chuyên nghiệp, hiệu quả, đồng thời đảm bảo quyền lợi cho người lao động.</p><p><strong>Bảng:</strong> Tóm tắt các quy định chính trong nội quy công ty.</p><figure class=\"table\"><table><thead><tr><th>Nội dung</th><th>Quy định</th></tr></thead><tbody><tr><td>Giờ giấc làm việc</td><td>- Thứ Hai đến Thứ Sáu: 8:00 - 17:00 (nghỉ trưa: 12:00 - 13:00)&lt;br&gt;- Thứ Bảy: 8:00 - 12:00&lt;br&gt;- Chủ Nhật: Nghỉ</td></tr><tr><td>Trang phục</td><td>- Lịch sự, gọn gàng, phù hợp với môi trường công sở&lt;br&gt;- Không mặc đồ quá hở hang, phản cảm</td></tr><tr><td>Đạo đức nghề nghiệp</td><td>- Luôn tôn trọng khách hàng, đồng nghiệp và cấp trên&lt;br&gt;- Hoàn thành tốt công việc được giao&lt;br&gt;- Giữ gìn bí mật công ty&lt;br&gt;- Thể hiện tinh thần trách nhiệm cao</td></tr><tr><td>Quy trình làm việc</td><td>- Áp dụng quy trình chung cho tất cả các bộ phận&lt;br&gt;- Tuân thủ các quy định về an toàn lao động&lt;br&gt;- Sử dụng hiệu quả tài sản công ty</td></tr></tbody></table></figure>', ' Ban Hành Nội Quy Công Ty', 1, '2024-05-13 10:17:14.000000'),
(8, '<p><strong>Công việc:</strong> Nghiên cứu, phát triển và ứng dụng các giải pháp trí tuệ nhân tạo.</p><p><strong>Yêu cầu:</strong> Có trình độ đại học chuyên ngành Khoa học Máy tính, Công nghệ Thông tin hoặc lĩnh vực liên quan; Có kinh nghiệm làm việc với các ngôn ngữ lập trình Python, Java, C++,...; Có khả năng tư duy logic, sáng tạo và giải quyết vấn đề.</p><p><strong>Quyền lợi:</strong> Mức lương hấp dẫn, chế độ đãi ngộ tốt, môi trường làm việc chuyên nghiệp, năng động.</p><p><strong>Ứng tuyển:</strong> Gửi CV và thư xin việc đến email: [đã xoá địa chỉ email].</p><p><strong>Liên hệ:</strong> Website: <a href=\"https://blog.google/technology/ai/bard-google-ai-search-updates/\">https://blog.google/technology/ai/bard-google-ai-search-updates/</a>, Email: [đã xoá địa chỉ email].</p><p><strong>Hình ảnh:</strong> [Hình ảnh minh họa cho vị trí Kỹ Sư Trí Tuệ Nhân Tạo].</p>', 'Tuyển Dụng Nhân Viên Cho Vị Trí Kỹ Sư Trí Tuệ Nhân Tạo', 1, '2024-05-13 10:17:45.000000'),
(9, '<p><strong>Tên sản phẩm/dịch vụ:</strong> Bard Chat.</p><p><strong>Tính năng:</strong> Trả lời câu hỏi tự động, hỗ trợ khách hàng, tư vấn sản phẩm, giải quyết khiếu nại,...</p><p><strong>Lợi ích:</strong> Tăng hiệu quả chăm sóc khách hàng, tiết kiệm chi phí nhân công, nâng cao trải nghiệm khách hàng.</p><p><strong>Giá cả:</strong> Miễn phí.</p><p><strong>Đối tượng khách hàng:</strong> Doanh nghiệp mọi quy mô.</p><p><strong>Marketing:</strong> Quảng cáo trực tuyến, tiếp thị qua mạng xã hội, hợp tác với các đối tác.</p><p><strong>Hình ảnh:</strong> [Hình ảnh giao diện hệ thống chatbot Bard Chat].</p>', 'Ra Mắt Hệ Thống Chatbot Trí Tuệ Nhân Tạo', 1, '2024-05-13 10:18:11.000000'),
(10, '<p><strong>Gian hàng:</strong> Giới thiệu các giải pháp trí tuệ nhân tạo do Bard cung cấp.</p><p><strong>Hoạt động:</strong> Triển lãm sản phẩm, tư vấn giải pháp, tổ chức hội thảo, minigame,...</p><p><strong>Khuyến mãi:</strong> Giảm giá 20% cho tất cả các dịch vụ trí tuệ nhân tạo.</p><p><strong>Hình ảnh:</strong> [Hình ảnh gian hàng của Bard tại hội chợ Techfest 2024].</p><p>&nbsp;</p>', 'Tham Gia Hội Chợ Triển Lãm Công Nghệ Techfest 2024', 1, '2024-05-13 10:18:34.000000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `overtimes`
--

CREATE TABLE `overtimes` (
  `id` bigint(20) NOT NULL,
  `create_at` datetime(6) DEFAULT NULL,
  `update_at` datetime(6) DEFAULT NULL,
  `allowed_hours` float DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `evident` varchar(255) DEFAULT NULL,
  `from_datetime` datetime(6) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `to_datetime` datetime(6) DEFAULT NULL,
  `worked_hours` float DEFAULT NULL,
  `approver_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `overtimes`
--

INSERT INTO `overtimes` (`id`, `create_at`, `update_at`, `allowed_hours`, `comment`, `evident`, `from_datetime`, `reason`, `status`, `to_datetime`, `worked_hours`, `approver_id`, `user_id`, `code`, `type`) VALUES
(1, '2024-05-11 13:47:44.000000', '2024-05-11 13:47:44.000000', NULL, 'Approved', 'Vacation request form attached', '2024-05-13 08:00:00.000000', 'Annual leave', 'Approved', '2024-05-13 17:00:00.000000', NULL, NULL, 3, NULL, NULL),
(2, '2024-05-11 14:13:33.000000', '2024-05-11 14:13:33.000000', NULL, 'check', NULL, '2024-05-15 14:13:00.000000', 'check', 'Approved', '2024-05-15 20:13:00.000000', NULL, NULL, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payroll`
--

CREATE TABLE `payroll` (
  `id` bigint(20) NOT NULL,
  `basic_salary` float DEFAULT NULL,
  `benefit` float DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  `late_deduction` float DEFAULT NULL,
  `overtime_salary` float DEFAULT NULL,
  `total_salary` float DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `tax` float DEFAULT NULL,
  `quarterly_award` float DEFAULT NULL,
  `total_hours_overtime` float DEFAULT NULL,
  `total_hours_worked` float DEFAULT NULL,
  `basic_salary_received` float DEFAULT NULL,
  `create_at` datetime(6) DEFAULT NULL,
  `update_at` datetime(6) DEFAULT NULL,
  `insurance` float DEFAULT NULL,
  `permitted_leave` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `payroll`
--

INSERT INTO `payroll` (`id`, `basic_salary`, `benefit`, `date`, `late_deduction`, `overtime_salary`, `total_salary`, `user_id`, `tax`, `quarterly_award`, `total_hours_overtime`, `total_hours_worked`, `basic_salary_received`, `create_at`, `update_at`, `insurance`, `permitted_leave`) VALUES
(1, 8000000, 1000000, '2024-05-21 13:13:32.000000', NULL, 3040000, 8266670, NULL, 0, NULL, 96, 152, 5066670, NULL, '2024-05-21 13:13:36.000000', 840000, NULL),
(2, 9000000, 1000000, '2024-05-21 13:13:32.000000', NULL, 3420000, 9175000, NULL, 0, NULL, 96, 152, 5700000, NULL, '2024-05-21 13:13:36.000000', 945000, NULL),
(3, 10000000, 1000000, '2024-05-21 13:13:32.000000', NULL, 3800000, 10076700, NULL, 6666.7, NULL, 96, 152, 6333330, NULL, '2024-05-21 13:13:37.000000', 1050000, NULL),
(4, 11000000, 1000000, '2024-05-21 13:13:32.000000', NULL, 4180000, 10934300, 22, 57333.3, NULL, 96, 152, 6966670, NULL, '2024-05-21 13:13:38.000000', 1155000, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `remotes`
--

CREATE TABLE `remotes` (
  `id` bigint(20) NOT NULL,
  `create_at` datetime(6) DEFAULT NULL,
  `update_at` datetime(6) DEFAULT NULL,
  `allowed_hours` float DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `evident` varchar(255) DEFAULT NULL,
  `from_datetime` datetime(6) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `to_datetime` datetime(6) DEFAULT NULL,
  `worked_hours` float DEFAULT NULL,
  `approver_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `remotes`
--

INSERT INTO `remotes` (`id`, `create_at`, `update_at`, `allowed_hours`, `comment`, `evident`, `from_datetime`, `reason`, `status`, `to_datetime`, `worked_hours`, `approver_id`, `user_id`, `code`, `type`) VALUES
(1, '2024-05-07 20:52:25.000000', '2024-05-07 20:52:25.000000', NULL, 'Approved', 'Vacation request form attached', '2024-05-09 08:00:00.000000', 'Annual leave', 'Approved', '2024-05-09 17:00:00.000000', NULL, NULL, 3, NULL, NULL),
(2, '2024-05-08 09:00:03.000000', '2024-05-08 09:00:03.000000', NULL, 'Approved', 'Vacation request form attached', '2024-05-10 08:00:00.000000', 'Annual leave', 'Approved', '2024-05-10 17:00:00.000000', NULL, NULL, 3, NULL, NULL),
(3, '2024-05-08 09:43:20.000000', '2024-05-08 09:43:20.000000', NULL, 'task1', NULL, '2024-05-11 09:42:00.000000', 'táks', 'Approved', '2024-05-11 21:43:00.000000', NULL, NULL, 3, NULL, NULL),
(4, '2024-05-08 09:43:25.000000', '2024-05-08 09:43:25.000000', NULL, 'task1', NULL, '2024-05-11 09:42:00.000000', 'táks', 'Approved', '2024-05-11 21:43:00.000000', NULL, NULL, 3, NULL, NULL),
(5, '2024-05-08 10:18:42.000000', '2024-05-08 10:18:42.000000', NULL, 'task1', NULL, '2024-05-11 10:18:00.000000', 'tass', 'Approved', '2024-05-11 22:18:00.000000', NULL, NULL, 3, NULL, NULL),
(6, '2024-05-08 10:18:47.000000', '2024-05-08 10:18:47.000000', NULL, 'task1', NULL, '2024-05-11 10:18:00.000000', 'tass', 'Approved', '2024-05-11 22:18:00.000000', NULL, NULL, 3, NULL, NULL),
(7, '2024-05-11 13:30:31.000000', '2024-05-11 13:30:31.000000', NULL, 'Test1', NULL, '2024-05-13 13:30:00.000000', 'Test', 'Approved', '2024-05-13 19:30:00.000000', NULL, NULL, 3, NULL, NULL),
(8, '2024-05-11 13:30:31.000000', '2024-05-11 13:30:31.000000', NULL, 'Test1', NULL, '2024-05-13 13:30:00.000000', 'Test', 'Approved', '2024-05-13 19:30:00.000000', NULL, NULL, 3, NULL, NULL),
(9, '2024-05-11 14:28:46.000000', '2024-05-11 14:28:46.000000', NULL, 'Approved', 'Vacation request form attached', '2024-05-15 08:00:00.000000', 'Annual leave', 'Approved', '2024-05-15 17:00:00.000000', NULL, NULL, 3, NULL, NULL),
(10, '2024-05-11 14:29:02.000000', '2024-05-11 14:29:02.000000', NULL, 'Approved', 'Vacation request form attached', '2024-05-13 08:00:00.000000', 'Annual leave', 'Approved', '2024-05-13 17:00:00.000000', NULL, NULL, 3, NULL, NULL),
(11, '2024-05-11 14:36:15.000000', '2024-05-11 14:36:15.000000', NULL, 'Approved', 'Vacation request form attached', '2024-05-13 08:00:00.000000', 'Annual leave', 'Approved', '2024-05-13 17:00:00.000000', 9, NULL, 3, NULL, NULL),
(12, '2024-05-11 15:00:19.000000', '2024-05-11 15:00:19.000000', NULL, 'Approved', 'Vacation request form attached', '2024-05-14 08:00:00.000000', 'Annual leave', 'Approved', '2024-05-14 12:00:00.000000', 4, NULL, 3, NULL, NULL),
(13, '2024-05-11 23:42:40.000000', '2024-05-11 23:42:40.000000', NULL, 'Check API', NULL, '2024-05-16 08:38:00.000000', 'Remote', 'Approved', '2024-05-16 16:57:00.000000', 8, NULL, 3, NULL, NULL),
(14, '2024-05-11 23:42:40.000000', '2024-05-11 23:42:40.000000', NULL, 'Check API', NULL, '2024-05-16 08:38:00.000000', 'Remote', 'Approved', '2024-05-16 16:57:00.000000', 8, NULL, 3, NULL, NULL),
(15, '2024-05-11 23:45:14.000000', '2024-05-11 23:45:14.000000', NULL, 'a', NULL, '2024-05-17 11:44:00.000000', 'a', 'Approved', '2024-05-17 16:44:00.000000', 5, NULL, 3, NULL, NULL),
(16, '2024-05-12 00:14:22.000000', '2024-05-12 00:14:22.000000', NULL, 'a', NULL, '2024-05-18 08:10:00.000000', 'a', 'Approved', '2024-05-18 17:10:00.000000', 9, NULL, 3, NULL, NULL),
(17, '2024-05-12 00:22:17.000000', '2024-05-12 00:22:17.000000', NULL, 'a', NULL, '2024-05-19 08:17:00.000000', 'a', 'Approved', '2024-05-19 16:17:00.000000', 8, NULL, 3, NULL, NULL),
(18, '2024-05-12 00:24:15.000000', '2024-05-12 00:24:15.000000', NULL, 'a', NULL, '2024-05-19 16:22:00.000000', 'a', 'Approved', '2024-05-19 17:22:00.000000', 1, NULL, 3, NULL, NULL),
(19, '2024-05-12 00:28:44.000000', '2024-05-12 00:28:44.000000', NULL, 'x', NULL, '2024-05-20 08:25:00.000000', 'x', 'Approved', '2024-05-20 00:25:00.000000', -8, NULL, 3, NULL, NULL),
(20, '2024-05-12 00:31:14.000000', '2024-05-12 00:31:14.000000', NULL, 'a', NULL, '2024-05-21 08:29:00.000000', 'a', 'Approved', '2024-05-21 09:29:00.000000', 1, NULL, 3, NULL, NULL),
(21, '2024-05-12 00:34:49.000000', '2024-05-12 00:34:49.000000', NULL, 'a', NULL, '2024-05-21 10:29:00.000000', 'a', 'Approved', '2024-05-21 11:29:00.000000', 1, NULL, 3, NULL, NULL),
(22, '2024-05-12 00:37:02.000000', '2024-05-12 00:37:02.000000', NULL, 'x', NULL, '2024-05-21 13:36:00.000000', 'x', 'Pending', '2024-05-21 14:36:00.000000', NULL, NULL, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'admin'),
(2, 'manager'),
(3, 'user');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `time_sheets`
--

CREATE TABLE `time_sheets` (
  `id` bigint(20) NOT NULL,
  `check_in` datetime(6) DEFAULT NULL,
  `check_out` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `in_time` datetime(6) DEFAULT NULL,
  `leave_hours` float DEFAULT NULL,
  `out_time` datetime(6) DEFAULT NULL,
  `overtime_hours` float DEFAULT NULL,
  `record_date` date DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `type_work` varchar(255) DEFAULT NULL,
  `working_hours` float DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `time_sheets`
--

INSERT INTO `time_sheets` (`id`, `check_in`, `check_out`, `code`, `in_time`, `leave_hours`, `out_time`, `overtime_hours`, `record_date`, `status`, `type_work`, `working_hours`, `user_id`) VALUES
(1, '2024-05-08 11:08:39.000000', NULL, '2024-05-0885391060', '2024-05-08 11:08:39.000000', 0, NULL, 0, '2024-05-08', '', '', 0, 3),
(2, '2024-05-08 11:08:41.000000', NULL, '2024-05-0885391060', '2024-05-08 11:08:41.000000', 0, NULL, 0, '2024-05-08', '', '', 0, 3),
(3, '2024-05-09 10:40:57.000000', '2024-05-09 11:27:43.000000', '2024-05-0985391060', '2024-05-09 10:40:57.000000', 0, '2024-05-09 11:27:43.000000', 0, '2024-05-09', 'Đã check out', 'normal', 0, 3),
(4, '2024-05-10 09:36:00.000000', '2024-05-10 09:36:13.000000', '2024-05-1085391060', '2024-05-10 09:36:00.000000', 0, '2024-05-10 09:36:13.000000', 0, '2024-05-10', 'Đã check out', 'normal', 0, 3),
(5, '2024-05-11 13:29:48.000000', '2024-05-11 13:29:53.000000', '2024-05-1185391060', '2024-05-11 13:29:48.000000', 0, '2024-05-11 13:29:53.000000', 0, '2024-05-11', 'Đã check out', 'normal', 0, 3),
(6, '2024-05-12 01:58:48.000000', NULL, '2024-05-1285391060', '2024-05-12 01:58:48.000000', 0, '2024-05-11 18:57:52.000000', 0, '2024-05-12', '', 'Onsite', 0, 3),
(463, '2023-02-15 07:51:00.000000', '2023-02-15 17:49:00.000000', '0088271323', '2023-02-15 07:51:00.000000', 0, '2023-02-15 17:49:00.000000', 8, '2023-02-15', 'Completed', 'Overtime', 0, 22),
(464, '2023-02-16 08:15:00.000000', '2023-02-16 17:43:00.000000', '1016412363', '2023-02-16 08:15:00.000000', 0, '2023-02-16 17:43:00.000000', 0, '2023-02-16', 'Completed', 'Onsite', 8, 22),
(465, '2023-02-17 07:59:00.000000', '2023-02-17 17:33:00.000000', '1096338580', '2023-02-17 07:59:00.000000', 0, '2023-02-17 17:33:00.000000', 0, '2023-02-17', 'Completed', 'Remote', 8, 22),
(466, '2023-02-18 08:17:00.000000', '2023-02-18 17:40:00.000000', '107133882X', '2023-02-18 08:17:00.000000', 0, '2023-02-18 17:40:00.000000', 0, '2023-02-18', 'Completed', 'Onsite', 8, 22),
(467, '2023-02-19 07:58:00.000000', '2023-02-19 17:50:00.000000', '1993142738', '2023-02-19 07:58:00.000000', 0, '2023-02-19 17:50:00.000000', 0, '2023-02-19', 'Completed', 'Onsite', 8, 22),
(468, '2023-02-20 08:16:00.000000', '2023-02-20 17:31:00.000000', '1945403349', '2023-02-20 08:16:00.000000', 0, '2023-02-20 17:31:00.000000', 0, '2023-02-20', 'Completed', 'Onsite', 8, 22),
(469, '2023-02-21 08:00:00.000000', '2023-02-21 17:58:00.000000', '0016424905', '2023-02-21 08:00:00.000000', 0, '2023-02-21 17:58:00.000000', 0, '2023-02-21', 'Completed', 'Onsite', 8, 22),
(470, '2023-02-22 08:02:00.000000', '2023-02-22 17:50:00.000000', '1004885725', '2023-02-22 08:02:00.000000', 0, '2023-02-22 17:50:00.000000', 0, '2023-02-22', 'Completed', 'Onsite', 8, 22),
(471, '2023-02-23 08:02:00.000000', '2023-02-23 17:54:00.000000', '0961102314', '2023-02-23 08:02:00.000000', 0, '2023-02-23 17:54:00.000000', 8, '2023-02-23', 'Completed', 'Overtime', 0, 22),
(472, '2023-02-24 07:58:00.000000', '2023-02-24 17:59:00.000000', '195985514X', '2023-02-24 07:58:00.000000', 0, '2023-02-24 17:59:00.000000', 0, '2023-02-24', 'Completed', 'Remote', 8, 22),
(473, '2023-02-25 08:27:00.000000', '2023-02-25 17:56:00.000000', '1762674254', '2023-02-25 08:27:00.000000', 0, '2023-02-25 17:56:00.000000', 0, '2023-02-25', 'Completed', 'Onsite', 8, 22),
(474, '2023-02-26 07:55:00.000000', '2023-02-26 17:59:00.000000', '0852662084', '2023-02-26 07:55:00.000000', 0, '2023-02-26 17:59:00.000000', 8, '2023-02-26', 'Completed', 'Overtime', 0, 22),
(475, '2023-02-27 08:10:00.000000', '2023-02-27 17:55:00.000000', '1864187069', '2023-02-27 08:10:00.000000', 0, '2023-02-27 17:55:00.000000', 0, '2023-02-27', 'Completed', 'Remote', 8, 22),
(476, '2023-02-28 08:17:00.000000', '2023-02-28 17:55:00.000000', '0579815722', '2023-02-28 08:17:00.000000', 0, '2023-02-28 17:55:00.000000', 8, '2023-02-28', 'Completed', 'Overtime', 0, 22),
(477, '2023-03-01 08:14:00.000000', '2023-03-01 17:39:00.000000', '0858423197', '2023-03-01 08:14:00.000000', 0, '2023-03-01 17:39:00.000000', 8, '2023-03-01', 'Completed', 'Overtime', 0, 22),
(478, '2023-03-02 08:29:00.000000', '2023-03-02 17:59:00.000000', '0883148579', '2023-03-02 08:29:00.000000', 0, '2023-03-02 17:59:00.000000', 0, '2023-03-02', 'Completed', 'Onsite', 8, 22),
(479, '2023-03-03 08:03:00.000000', '2023-03-03 17:37:00.000000', '1762782065', '2023-03-03 08:03:00.000000', 0, '2023-03-03 17:37:00.000000', 0, '2023-03-03', 'Completed', 'Remote', 8, 22),
(480, '2023-03-04 08:03:00.000000', '2023-03-04 17:43:00.000000', '0533852013', '2023-03-04 08:03:00.000000', 0, '2023-03-04 17:43:00.000000', 8, '2023-03-04', 'Completed', 'Overtime', 0, 22),
(481, '2023-03-05 08:09:00.000000', '2023-03-05 17:37:00.000000', '1509429697', '2023-03-05 08:09:00.000000', 0, '2023-03-05 17:37:00.000000', 0, '2023-03-05', 'Completed', 'Remote', 8, 22),
(482, '2023-03-06 08:16:00.000000', '2023-03-06 17:48:00.000000', '1857726863', '2023-03-06 08:16:00.000000', 0, '2023-03-06 17:48:00.000000', 8, '2023-03-06', 'Completed', 'Overtime', 0, 22),
(483, '2023-03-07 08:29:00.000000', '2023-03-07 17:57:00.000000', '1840271671', '2023-03-07 08:29:00.000000', 0, '2023-03-07 17:57:00.000000', 8, '2023-03-07', 'Completed', 'Overtime', 0, 22),
(484, '2023-03-08 08:18:00.000000', '2023-03-08 17:55:00.000000', '1933909854', '2023-03-08 08:18:00.000000', 0, '2023-03-08 17:55:00.000000', 8, '2023-03-08', 'Completed', 'Overtime', 0, 22),
(485, '2023-03-09 07:59:00.000000', '2023-03-09 17:50:00.000000', '0628561881', '2023-03-09 07:59:00.000000', 0, '2023-03-09 17:50:00.000000', 0, '2023-03-09', 'Completed', 'Onsite', 8, 22),
(486, '2023-03-10 08:10:00.000000', '2023-03-10 17:57:00.000000', '1685184626', '2023-03-10 08:10:00.000000', 0, '2023-03-10 17:57:00.000000', 0, '2023-03-10', 'Completed', 'Remote', 8, 22),
(487, '2023-03-11 08:03:00.000000', '2023-03-11 17:31:00.000000', '1924819295', '2023-03-11 08:03:00.000000', 0, '2023-03-11 17:31:00.000000', 0, '2023-03-11', 'Completed', 'Remote', 8, 22),
(488, '2023-03-12 08:24:00.000000', '2023-03-12 17:36:00.000000', '1885454651', '2023-03-12 08:24:00.000000', 0, '2023-03-12 17:36:00.000000', 0, '2023-03-12', 'Completed', 'Remote', 8, 22),
(489, '2023-03-13 08:00:00.000000', '2023-03-13 17:35:00.000000', '1870468589', '2023-03-13 08:00:00.000000', 0, '2023-03-13 17:35:00.000000', 0, '2023-03-13', 'Completed', 'Remote', 8, 22),
(490, '2023-03-14 08:03:00.000000', '2023-03-14 17:52:00.000000', '1973393921', '2023-03-14 08:03:00.000000', 0, '2023-03-14 17:52:00.000000', 0, '2023-03-14', 'Completed', 'Onsite', 8, 22),
(491, '2023-03-15 08:27:00.000000', '2023-03-15 17:44:00.000000', '085713048X', '2023-03-15 08:27:00.000000', 0, '2023-03-15 17:44:00.000000', 0, '2023-03-15', 'Completed', 'Remote', 8, 22),
(492, '2023-03-16 08:16:00.000000', '2023-03-16 17:47:00.000000', '1251426034', '2023-03-16 08:16:00.000000', 0, '2023-03-16 17:47:00.000000', 8, '2023-03-16', 'Completed', 'Overtime', 0, 22),
(493, '2023-03-17 08:10:00.000000', '2023-03-17 17:36:00.000000', '092833581X', '2023-03-17 08:10:00.000000', 0, '2023-03-17 17:36:00.000000', 0, '2023-03-17', 'Completed', 'Onsite', 8, 22),
(494, '2023-03-18 08:08:00.000000', '2023-03-18 17:58:00.000000', '1926516052', '2023-03-18 08:08:00.000000', 0, '2023-03-18 17:58:00.000000', 0, '2023-03-18', 'Completed', 'Onsite', 8, 22),
(495, '2023-03-19 08:28:00.000000', '2023-03-19 17:41:00.000000', '1933307862', '2023-03-19 08:28:00.000000', 0, '2023-03-19 17:41:00.000000', 8, '2023-03-19', 'Completed', 'Overtime', 0, 22),
(496, '2023-03-20 07:52:00.000000', '2023-03-20 17:48:00.000000', '0988815141', '2023-03-20 07:52:00.000000', 0, '2023-03-20 17:48:00.000000', 0, '2023-03-20', 'Completed', 'Remote', 8, 22),
(497, '2023-03-21 08:04:00.000000', '2023-03-21 17:37:00.000000', '1501554565', '2023-03-21 08:04:00.000000', 0, '2023-03-21 17:37:00.000000', 8, '2023-03-21', 'Completed', 'Overtime', 0, 22),
(498, '2023-03-22 07:50:00.000000', '2023-03-22 17:55:00.000000', '0972995072', '2023-03-22 07:50:00.000000', 0, '2023-03-22 17:55:00.000000', 8, '2023-03-22', 'Completed', 'Overtime', 0, 22),
(499, '2023-03-23 07:56:00.000000', '2023-03-23 17:37:00.000000', '1876941774', '2023-03-23 07:56:00.000000', 0, '2023-03-23 17:37:00.000000', 0, '2023-03-23', 'Completed', 'Onsite', 8, 22),
(500, '2023-03-24 08:06:00.000000', '2023-03-24 17:47:00.000000', '0854872728', '2023-03-24 08:06:00.000000', 0, '2023-03-24 17:47:00.000000', 0, '2023-03-24', 'Completed', 'Onsite', 8, 22),
(501, '2023-03-25 08:20:00.000000', '2023-03-25 17:37:00.000000', '0949466263', '2023-03-25 08:20:00.000000', 0, '2023-03-25 17:37:00.000000', 0, '2023-03-25', 'Completed', 'Onsite', 8, 22),
(502, '2023-03-26 08:17:00.000000', '2023-03-26 17:33:00.000000', '1959082760', '2023-03-26 08:17:00.000000', 0, '2023-03-26 17:33:00.000000', 0, '2023-03-26', 'Completed', 'Remote', 8, 22),
(503, '2023-03-27 07:52:00.000000', '2023-03-27 17:57:00.000000', '0090836235', '2023-03-27 07:52:00.000000', 0, '2023-03-27 17:57:00.000000', 0, '2023-03-27', 'Completed', 'Remote', 8, 22),
(504, '2023-03-28 08:22:00.000000', '2023-03-28 17:50:00.000000', '1527123146', '2023-03-28 08:22:00.000000', 0, '2023-03-28 17:50:00.000000', 0, '2023-03-28', 'Completed', 'Remote', 8, 22),
(505, '2023-03-29 08:07:00.000000', '2023-03-29 17:49:00.000000', '0921688709', '2023-03-29 08:07:00.000000', 0, '2023-03-29 17:49:00.000000', 0, '2023-03-29', 'Completed', 'Remote', 8, 22),
(506, '2023-03-30 08:23:00.000000', '2023-03-30 17:45:00.000000', '1996230700', '2023-03-30 08:23:00.000000', 0, '2023-03-30 17:45:00.000000', 8, '2023-03-30', 'Completed', 'Overtime', 0, 22),
(507, '2023-03-31 07:59:00.000000', '2023-03-31 17:43:00.000000', '1947326686', '2023-03-31 07:59:00.000000', 0, '2023-03-31 17:43:00.000000', 0, '2023-03-31', 'Completed', 'Remote', 8, 22),
(508, '2023-04-01 07:54:00.000000', '2023-04-01 17:56:00.000000', '0396712444', '2023-04-01 07:54:00.000000', 0, '2023-04-01 17:56:00.000000', 8, '2023-04-01', 'Completed', 'Overtime', 0, 22),
(509, '2023-04-02 08:29:00.000000', '2023-04-02 17:59:00.000000', '1030850011', '2023-04-02 08:29:00.000000', 0, '2023-04-02 17:59:00.000000', 0, '2023-04-02', 'Completed', 'Onsite', 8, 22),
(510, '2023-04-03 08:23:00.000000', '2023-04-03 17:58:00.000000', '0881187569', '2023-04-03 08:23:00.000000', 0, '2023-04-03 17:58:00.000000', 0, '2023-04-03', 'Completed', 'Remote', 8, 22),
(511, '2023-04-04 08:12:00.000000', '2023-04-04 17:41:00.000000', '1938283015', '2023-04-04 08:12:00.000000', 0, '2023-04-04 17:41:00.000000', 0, '2023-04-04', 'Completed', 'Remote', 8, 22),
(512, '2023-04-05 08:20:00.000000', '2023-04-05 17:54:00.000000', '0341933740', '2023-04-05 08:20:00.000000', 0, '2023-04-05 17:54:00.000000', 8, '2023-04-05', 'Completed', 'Overtime', 0, 22),
(513, '2023-04-06 08:26:00.000000', '2023-04-06 17:54:00.000000', '0898772710', '2023-04-06 08:26:00.000000', 0, '2023-04-06 17:54:00.000000', 0, '2023-04-06', 'Completed', 'Onsite', 8, 22),
(514, '2023-04-07 08:13:00.000000', '2023-04-07 17:53:00.000000', '0003121658', '2023-04-07 08:13:00.000000', 0, '2023-04-07 17:53:00.000000', 0, '2023-04-07', 'Completed', 'Onsite', 8, 22),
(515, '2023-04-08 08:26:00.000000', '2023-04-08 17:39:00.000000', '0013374125', '2023-04-08 08:26:00.000000', 0, '2023-04-08 17:39:00.000000', 8, '2023-04-08', 'Completed', 'Overtime', 0, 22),
(516, '2023-04-09 08:02:00.000000', '2023-04-09 17:33:00.000000', '0794361218', '2023-04-09 08:02:00.000000', 0, '2023-04-09 17:33:00.000000', 0, '2023-04-09', 'Completed', 'Onsite', 8, 22),
(517, '2023-04-10 08:18:00.000000', '2023-04-10 17:43:00.000000', '0768841682', '2023-04-10 08:18:00.000000', 0, '2023-04-10 17:43:00.000000', 8, '2023-04-10', 'Completed', 'Overtime', 0, 22),
(518, '2023-04-11 08:25:00.000000', '2023-04-11 17:30:00.000000', '1548425028', '2023-04-11 08:25:00.000000', 0, '2023-04-11 17:30:00.000000', 0, '2023-04-11', 'Completed', 'Onsite', 8, 22),
(519, '2023-04-12 08:00:00.000000', '2023-04-12 17:45:00.000000', '1899373217', '2023-04-12 08:00:00.000000', 0, '2023-04-12 17:45:00.000000', 0, '2023-04-12', 'Completed', 'Onsite', 8, 22),
(520, '2023-04-13 07:54:00.000000', '2023-04-13 17:59:00.000000', '1919056122', '2023-04-13 07:54:00.000000', 0, '2023-04-13 17:59:00.000000', 0, '2023-04-13', 'Completed', 'Remote', 8, 22),
(521, '2023-04-14 08:10:00.000000', '2023-04-14 17:54:00.000000', '0943145783', '2023-04-14 08:10:00.000000', 0, '2023-04-14 17:54:00.000000', 0, '2023-04-14', 'Completed', 'Remote', 8, 22),
(522, '2023-04-15 08:20:00.000000', '2023-04-15 17:35:00.000000', '0952751542', '2023-04-15 08:20:00.000000', 0, '2023-04-15 17:35:00.000000', 0, '2023-04-15', 'Completed', 'Remote', 8, 22),
(523, '2023-04-16 08:01:00.000000', '2023-04-16 17:57:00.000000', '1934246956', '2023-04-16 08:01:00.000000', 0, '2023-04-16 17:57:00.000000', 8, '2023-04-16', 'Completed', 'Overtime', 0, 22),
(524, '2023-04-17 07:59:00.000000', '2023-04-17 17:37:00.000000', '1293682128', '2023-04-17 07:59:00.000000', 0, '2023-04-17 17:37:00.000000', 8, '2023-04-17', 'Completed', 'Overtime', 0, 22),
(525, '2023-04-18 07:55:00.000000', '2023-04-18 17:55:00.000000', '0874885027', '2023-04-18 07:55:00.000000', 0, '2023-04-18 17:55:00.000000', 0, '2023-04-18', 'Completed', 'Onsite', 8, 22),
(526, '2023-04-19 08:14:00.000000', '2023-04-19 17:51:00.000000', '0895851040', '2023-04-19 08:14:00.000000', 0, '2023-04-19 17:51:00.000000', 8, '2023-04-19', 'Completed', 'Overtime', 0, 22),
(527, '2023-04-20 07:54:00.000000', '2023-04-20 17:40:00.000000', '1982175516', '2023-04-20 07:54:00.000000', 0, '2023-04-20 17:40:00.000000', 8, '2023-04-20', 'Completed', 'Overtime', 0, 22),
(528, '2023-04-21 08:05:00.000000', '2023-04-21 17:50:00.000000', '0873921380', '2023-04-21 08:05:00.000000', 0, '2023-04-21 17:50:00.000000', 8, '2023-04-21', 'Completed', 'Overtime', 0, 22),
(529, '2023-04-22 07:51:00.000000', '2023-04-22 17:32:00.000000', '1915539668', '2023-04-22 07:51:00.000000', 0, '2023-04-22 17:32:00.000000', 0, '2023-04-22', 'Completed', 'Onsite', 8, 22),
(530, '2023-04-23 07:57:00.000000', '2023-04-23 17:31:00.000000', '0889039100', '2023-04-23 07:57:00.000000', 0, '2023-04-23 17:31:00.000000', 0, '2023-04-23', 'Completed', 'Remote', 8, 22),
(531, '2023-04-24 07:57:00.000000', '2023-04-24 17:35:00.000000', '193813804X', '2023-04-24 07:57:00.000000', 0, '2023-04-24 17:35:00.000000', 0, '2023-04-24', 'Completed', 'Remote', 8, 22),
(532, '2023-04-25 08:19:00.000000', '2023-04-25 17:49:00.000000', '0854553339', '2023-04-25 08:19:00.000000', 0, '2023-04-25 17:49:00.000000', 8, '2023-04-25', 'Completed', 'Overtime', 0, 22),
(533, '2023-04-26 08:07:00.000000', '2023-04-26 17:37:00.000000', '145566555X', '2023-04-26 08:07:00.000000', 0, '2023-04-26 17:37:00.000000', 0, '2023-04-26', 'Completed', 'Remote', 8, 22),
(534, '2023-04-27 07:58:00.000000', '2023-04-27 17:37:00.000000', '0340871431', '2023-04-27 07:58:00.000000', 0, '2023-04-27 17:37:00.000000', 0, '2023-04-27', 'Completed', 'Onsite', 8, 22),
(535, '2023-04-28 08:06:00.000000', '2023-04-28 17:32:00.000000', '0002584360', '2023-04-28 08:06:00.000000', 0, '2023-04-28 17:32:00.000000', 8, '2023-04-28', 'Completed', 'Overtime', 0, 22),
(536, '2023-04-29 07:52:00.000000', '2023-04-29 17:47:00.000000', '1793903727', '2023-04-29 07:52:00.000000', 0, '2023-04-29 17:47:00.000000', 0, '2023-04-29', 'Completed', 'Remote', 8, 22),
(537, '2023-04-30 07:53:00.000000', '2023-04-30 17:47:00.000000', '1883179580', '2023-04-30 07:53:00.000000', 0, '2023-04-30 17:47:00.000000', 8, '2023-04-30', 'Completed', 'Overtime', 0, 22),
(538, '2023-05-01 08:13:00.000000', '2023-05-01 17:47:00.000000', '108358264X', '2023-05-01 08:13:00.000000', 0, '2023-05-01 17:47:00.000000', 0, '2023-05-01', 'Completed', 'Onsite', 8, 22),
(539, '2023-05-02 08:11:00.000000', '2023-05-02 17:40:00.000000', '172519984X', '2023-05-02 08:11:00.000000', 0, '2023-05-02 17:40:00.000000', 8, '2023-05-02', 'Completed', 'Overtime', 0, 22),
(540, '2023-05-03 08:18:00.000000', '2023-05-03 17:50:00.000000', '1732472211', '2023-05-03 08:18:00.000000', 0, '2023-05-03 17:50:00.000000', 0, '2023-05-03', 'Completed', 'Remote', 8, 22),
(541, '2023-05-04 08:28:00.000000', '2023-05-04 17:42:00.000000', '1072338084', '2023-05-04 08:28:00.000000', 0, '2023-05-04 17:42:00.000000', 8, '2023-05-04', 'Completed', 'Overtime', 0, 22),
(542, '2023-05-05 08:26:00.000000', '2023-05-05 17:39:00.000000', '1051260175', '2023-05-05 08:26:00.000000', 0, '2023-05-05 17:39:00.000000', 0, '2023-05-05', 'Completed', 'Remote', 8, 22),
(543, '2023-05-06 08:03:00.000000', '2023-05-06 17:52:00.000000', '1967704309', '2023-05-06 08:03:00.000000', 0, '2023-05-06 17:52:00.000000', 0, '2023-05-06', 'Completed', 'Remote', 8, 22),
(544, '2023-05-07 08:16:00.000000', '2023-05-07 17:58:00.000000', '1994938684', '2023-05-07 08:16:00.000000', 0, '2023-05-07 17:58:00.000000', 0, '2023-05-07', 'Completed', 'Onsite', 8, 22),
(545, '2023-05-08 08:10:00.000000', '2023-05-08 17:35:00.000000', '1282529641', '2023-05-08 08:10:00.000000', 0, '2023-05-08 17:35:00.000000', 8, '2023-05-08', 'Completed', 'Overtime', 0, 22),
(546, '2023-05-09 08:28:00.000000', '2023-05-09 17:40:00.000000', '1948876000', '2023-05-09 08:28:00.000000', 0, '2023-05-09 17:40:00.000000', 0, '2023-05-09', 'Completed', 'Remote', 8, 22),
(547, '2023-05-10 08:15:00.000000', '2023-05-10 17:42:00.000000', '0942603826', '2023-05-10 08:15:00.000000', 0, '2023-05-10 17:42:00.000000', 0, '2023-05-10', 'Completed', 'Onsite', 8, 22),
(548, '2023-05-11 07:57:00.000000', '2023-05-11 17:51:00.000000', '1340667819', '2023-05-11 07:57:00.000000', 0, '2023-05-11 17:51:00.000000', 0, '2023-05-11', 'Completed', 'Onsite', 8, 22),
(549, '2023-05-12 08:13:00.000000', '2023-05-12 17:47:00.000000', '093049363X', '2023-05-12 08:13:00.000000', 0, '2023-05-12 17:47:00.000000', 0, '2023-05-12', 'Completed', 'Onsite', 8, 22),
(550, '2023-05-13 08:15:00.000000', '2023-05-13 17:51:00.000000', '098134397X', '2023-05-13 08:15:00.000000', 0, '2023-05-13 17:51:00.000000', 8, '2023-05-13', 'Completed', 'Overtime', 0, 22),
(551, '2023-05-14 07:51:00.000000', '2023-05-14 17:57:00.000000', '177960064X', '2023-05-14 07:51:00.000000', 0, '2023-05-14 17:57:00.000000', 0, '2023-05-14', 'Completed', 'Remote', 8, 22),
(552, '2023-05-15 07:54:00.000000', '2023-05-15 17:58:00.000000', '098329576X', '2023-05-15 07:54:00.000000', 0, '2023-05-15 17:58:00.000000', 0, '2023-05-15', 'Completed', 'Remote', 8, 22),
(553, '2023-05-16 08:08:00.000000', '2023-05-16 17:30:00.000000', '0967228565', '2023-05-16 08:08:00.000000', 0, '2023-05-16 17:30:00.000000', 8, '2023-05-16', 'Completed', 'Overtime', 0, 22),
(554, '2023-05-17 08:14:00.000000', '2023-05-17 17:45:00.000000', '1949693732', '2023-05-17 08:14:00.000000', 0, '2023-05-17 17:45:00.000000', 0, '2023-05-17', 'Completed', 'Onsite', 8, 22),
(555, '2023-05-18 08:21:00.000000', '2023-05-18 17:42:00.000000', '1934972177', '2023-05-18 08:21:00.000000', 0, '2023-05-18 17:42:00.000000', 0, '2023-05-18', 'Completed', 'Remote', 8, 22),
(556, '2023-05-19 08:05:00.000000', '2023-05-19 17:50:00.000000', '1666555843', '2023-05-19 08:05:00.000000', 0, '2023-05-19 17:50:00.000000', 0, '2023-05-19', 'Completed', 'Remote', 8, 22),
(557, '2023-05-20 08:25:00.000000', '2023-05-20 17:38:00.000000', '1852572647', '2023-05-20 08:25:00.000000', 0, '2023-05-20 17:38:00.000000', 8, '2023-05-20', 'Completed', 'Overtime', 0, 22),
(558, '2023-05-21 08:21:00.000000', '2023-05-21 17:39:00.000000', '1043358331', '2023-05-21 08:21:00.000000', 0, '2023-05-21 17:39:00.000000', 0, '2023-05-21', 'Completed', 'Onsite', 8, 22),
(559, '2023-05-22 08:25:00.000000', '2023-05-22 17:49:00.000000', '1867861275', '2023-05-22 08:25:00.000000', 0, '2023-05-22 17:49:00.000000', 0, '2023-05-22', 'Completed', 'Remote', 8, 22),
(560, '2023-05-23 08:27:00.000000', '2023-05-23 17:44:00.000000', '1874152772', '2023-05-23 08:27:00.000000', 0, '2023-05-23 17:44:00.000000', 0, '2023-05-23', 'Completed', 'Onsite', 8, 22),
(561, '2023-05-24 08:11:00.000000', '2023-05-24 17:41:00.000000', '1901299449', '2023-05-24 08:11:00.000000', 0, '2023-05-24 17:41:00.000000', 8, '2023-05-24', 'Completed', 'Overtime', 0, 22),
(562, '2023-05-25 07:55:00.000000', '2023-05-25 17:53:00.000000', '0981817106', '2023-05-25 07:55:00.000000', 0, '2023-05-25 17:53:00.000000', 0, '2023-05-25', 'Completed', 'Onsite', 8, 22),
(563, '2023-05-26 08:22:00.000000', '2023-05-26 17:32:00.000000', '1939992435', '2023-05-26 08:22:00.000000', 0, '2023-05-26 17:32:00.000000', 0, '2023-05-26', 'Completed', 'Remote', 8, 22),
(564, '2023-05-27 07:52:00.000000', '2023-05-27 17:47:00.000000', '1666987352', '2023-05-27 07:52:00.000000', 0, '2023-05-27 17:47:00.000000', 0, '2023-05-27', 'Completed', 'Remote', 8, 22),
(565, '2023-05-28 07:51:00.000000', '2023-05-28 17:53:00.000000', '1875085440', '2023-05-28 07:51:00.000000', 0, '2023-05-28 17:53:00.000000', 8, '2023-05-28', 'Completed', 'Overtime', 0, 22),
(566, '2023-05-29 08:10:00.000000', '2023-05-29 17:34:00.000000', '0843744308', '2023-05-29 08:10:00.000000', 0, '2023-05-29 17:34:00.000000', 0, '2023-05-29', 'Completed', 'Onsite', 8, 22),
(567, '2023-05-30 08:27:00.000000', '2023-05-30 17:57:00.000000', '1920247866', '2023-05-30 08:27:00.000000', 0, '2023-05-30 17:57:00.000000', 0, '2023-05-30', 'Completed', 'Remote', 8, 22),
(568, '2023-05-31 08:12:00.000000', '2023-05-31 17:37:00.000000', '192852477X', '2023-05-31 08:12:00.000000', 0, '2023-05-31 17:37:00.000000', 0, '2023-05-31', 'Completed', 'Onsite', 8, 22),
(569, '2023-06-01 07:50:00.000000', '2023-06-01 17:43:00.000000', '0654289565', '2023-06-01 07:50:00.000000', 0, '2023-06-01 17:43:00.000000', 0, '2023-06-01', 'Completed', 'Onsite', 8, 22),
(570, '2023-06-02 08:21:00.000000', '2023-06-02 17:50:00.000000', '0885975561', '2023-06-02 08:21:00.000000', 0, '2023-06-02 17:50:00.000000', 0, '2023-06-02', 'Completed', 'Remote', 8, 22),
(571, '2023-06-03 08:25:00.000000', '2023-06-03 17:30:00.000000', '1275746500', '2023-06-03 08:25:00.000000', 0, '2023-06-03 17:30:00.000000', 0, '2023-06-03', 'Completed', 'Remote', 8, 22),
(572, '2023-06-04 08:26:00.000000', '2023-06-04 17:51:00.000000', '0903218518', '2023-06-04 08:26:00.000000', 0, '2023-06-04 17:51:00.000000', 0, '2023-06-04', 'Completed', 'Remote', 8, 22),
(573, '2023-06-05 07:58:00.000000', '2023-06-05 17:55:00.000000', '0965189538', '2023-06-05 07:58:00.000000', 0, '2023-06-05 17:55:00.000000', 0, '2023-06-05', 'Completed', 'Onsite', 8, 22),
(574, '2023-06-06 08:23:00.000000', '2023-06-06 17:44:00.000000', '0834362856', '2023-06-06 08:23:00.000000', 0, '2023-06-06 17:44:00.000000', 0, '2023-06-06', 'Completed', 'Remote', 8, 22),
(575, '2023-06-07 08:07:00.000000', '2023-06-07 17:46:00.000000', '1061383598', '2023-06-07 08:07:00.000000', 0, '2023-06-07 17:46:00.000000', 0, '2023-06-07', 'Completed', 'Remote', 8, 22),
(576, '2023-06-08 07:57:00.000000', '2023-06-08 17:54:00.000000', '0998621137', '2023-06-08 07:57:00.000000', 0, '2023-06-08 17:54:00.000000', 0, '2023-06-08', 'Completed', 'Remote', 8, 22),
(577, '2023-06-09 08:20:00.000000', '2023-06-09 17:35:00.000000', '0891772847', '2023-06-09 08:20:00.000000', 0, '2023-06-09 17:35:00.000000', 0, '2023-06-09', 'Completed', 'Onsite', 8, 22),
(578, '2023-06-10 07:59:00.000000', '2023-06-10 17:36:00.000000', '1881523144', '2023-06-10 07:59:00.000000', 0, '2023-06-10 17:36:00.000000', 0, '2023-06-10', 'Completed', 'Onsite', 8, 22),
(579, '2023-06-11 07:54:00.000000', '2023-06-11 17:56:00.000000', '092310822X', '2023-06-11 07:54:00.000000', 0, '2023-06-11 17:56:00.000000', 8, '2023-06-11', 'Completed', 'Overtime', 0, 22),
(580, '2023-06-12 08:15:00.000000', '2023-06-12 17:59:00.000000', '0287851990', '2023-06-12 08:15:00.000000', 0, '2023-06-12 17:59:00.000000', 0, '2023-06-12', 'Completed', 'Remote', 8, 22),
(581, '2023-06-13 07:58:00.000000', '2023-06-13 17:45:00.000000', '004531599X', '2023-06-13 07:58:00.000000', 0, '2023-06-13 17:45:00.000000', 8, '2023-06-13', 'Completed', 'Overtime', 0, 22),
(582, '2023-06-14 08:16:00.000000', '2023-06-14 17:50:00.000000', '0891892168', '2023-06-14 08:16:00.000000', 0, '2023-06-14 17:50:00.000000', 0, '2023-06-14', 'Completed', 'Remote', 8, 22),
(583, '2023-06-15 08:28:00.000000', '2023-06-15 17:59:00.000000', '1411451287', '2023-06-15 08:28:00.000000', 0, '2023-06-15 17:59:00.000000', 0, '2023-06-15', 'Completed', 'Remote', 8, 22),
(584, '2023-06-16 08:16:00.000000', '2023-06-16 17:41:00.000000', '1946399531', '2023-06-16 08:16:00.000000', 0, '2023-06-16 17:41:00.000000', 8, '2023-06-16', 'Completed', 'Overtime', 0, 22),
(585, '2023-06-17 08:15:00.000000', '2023-06-17 17:34:00.000000', '1811933211', '2023-06-17 08:15:00.000000', 0, '2023-06-17 17:34:00.000000', 0, '2023-06-17', 'Completed', 'Remote', 8, 22),
(586, '2023-06-18 08:19:00.000000', '2023-06-18 17:50:00.000000', '0999315676', '2023-06-18 08:19:00.000000', 0, '2023-06-18 17:50:00.000000', 8, '2023-06-18', 'Completed', 'Overtime', 0, 22),
(587, '2023-06-19 07:59:00.000000', '2023-06-19 17:56:00.000000', '1911881574', '2023-06-19 07:59:00.000000', 0, '2023-06-19 17:56:00.000000', 0, '2023-06-19', 'Completed', 'Remote', 8, 22),
(588, '2023-06-20 07:54:00.000000', '2023-06-20 17:33:00.000000', '0773105255', '2023-06-20 07:54:00.000000', 0, '2023-06-20 17:33:00.000000', 0, '2023-06-20', 'Completed', 'Remote', 8, 22),
(589, '2023-06-21 08:06:00.000000', '2023-06-21 17:47:00.000000', '1776744179', '2023-06-21 08:06:00.000000', 0, '2023-06-21 17:47:00.000000', 8, '2023-06-21', 'Completed', 'Overtime', 0, 22),
(590, '2023-06-22 07:57:00.000000', '2023-06-22 17:36:00.000000', '1802606718', '2023-06-22 07:57:00.000000', 0, '2023-06-22 17:36:00.000000', 0, '2023-06-22', 'Completed', 'Onsite', 8, 22),
(591, '2023-06-23 07:51:00.000000', '2023-06-23 17:32:00.000000', '1036351068', '2023-06-23 07:51:00.000000', 0, '2023-06-23 17:32:00.000000', 8, '2023-06-23', 'Completed', 'Overtime', 0, 22),
(592, '2023-06-24 08:25:00.000000', '2023-06-24 17:59:00.000000', '001362055X', '2023-06-24 08:25:00.000000', 0, '2023-06-24 17:59:00.000000', 8, '2023-06-24', 'Completed', 'Overtime', 0, 22),
(593, '2023-06-25 08:21:00.000000', '2023-06-25 17:33:00.000000', '0059091819', '2023-06-25 08:21:00.000000', 0, '2023-06-25 17:33:00.000000', 8, '2023-06-25', 'Completed', 'Overtime', 0, 22),
(594, '2023-06-26 08:07:00.000000', '2023-06-26 17:34:00.000000', '1972006401', '2023-06-26 08:07:00.000000', 0, '2023-06-26 17:34:00.000000', 0, '2023-06-26', 'Completed', 'Onsite', 8, 22),
(595, '2023-06-27 08:05:00.000000', '2023-06-27 17:52:00.000000', '0960441425', '2023-06-27 08:05:00.000000', 0, '2023-06-27 17:52:00.000000', 0, '2023-06-27', 'Completed', 'Onsite', 8, 22),
(596, '2023-06-28 08:21:00.000000', '2023-06-28 17:53:00.000000', '0801711932', '2023-06-28 08:21:00.000000', 0, '2023-06-28 17:53:00.000000', 0, '2023-06-28', 'Completed', 'Remote', 8, 22),
(597, '2023-06-29 08:27:00.000000', '2023-06-29 17:42:00.000000', '0901785563', '2023-06-29 08:27:00.000000', 0, '2023-06-29 17:42:00.000000', 0, '2023-06-29', 'Completed', 'Onsite', 8, 22),
(598, '2023-06-30 08:14:00.000000', '2023-06-30 17:31:00.000000', '1956524703', '2023-06-30 08:14:00.000000', 0, '2023-06-30 17:31:00.000000', 0, '2023-06-30', 'Completed', 'Remote', 8, 22),
(599, '2023-07-01 07:57:00.000000', '2023-07-01 17:54:00.000000', '096583042X', '2023-07-01 07:57:00.000000', 0, '2023-07-01 17:54:00.000000', 0, '2023-07-01', 'Completed', 'Remote', 8, 22),
(600, '2023-07-02 08:16:00.000000', '2023-07-02 17:30:00.000000', '0947490698', '2023-07-02 08:16:00.000000', 0, '2023-07-02 17:30:00.000000', 0, '2023-07-02', 'Completed', 'Onsite', 8, 22),
(601, '2023-07-03 07:51:00.000000', '2023-07-03 17:46:00.000000', '1871133971', '2023-07-03 07:51:00.000000', 0, '2023-07-03 17:46:00.000000', 0, '2023-07-03', 'Completed', 'Remote', 8, 22),
(602, '2023-07-04 08:04:00.000000', '2023-07-04 17:58:00.000000', '099283614X', '2023-07-04 08:04:00.000000', 0, '2023-07-04 17:58:00.000000', 0, '2023-07-04', 'Completed', 'Remote', 8, 22),
(603, '2023-07-05 07:56:00.000000', '2023-07-05 17:43:00.000000', '180445561X', '2023-07-05 07:56:00.000000', 0, '2023-07-05 17:43:00.000000', 0, '2023-07-05', 'Completed', 'Remote', 8, 22),
(604, '2023-07-06 08:11:00.000000', '2023-07-06 17:53:00.000000', '0074313908', '2023-07-06 08:11:00.000000', 0, '2023-07-06 17:53:00.000000', 0, '2023-07-06', 'Completed', 'Remote', 8, 22),
(605, '2023-07-07 08:15:00.000000', '2023-07-07 17:42:00.000000', '0909924430', '2023-07-07 08:15:00.000000', 0, '2023-07-07 17:42:00.000000', 0, '2023-07-07', 'Completed', 'Remote', 8, 22),
(606, '2023-07-08 08:27:00.000000', '2023-07-08 17:48:00.000000', '003815658X', '2023-07-08 08:27:00.000000', 0, '2023-07-08 17:48:00.000000', 0, '2023-07-08', 'Completed', 'Remote', 8, 22),
(607, '2023-07-09 07:54:00.000000', '2023-07-09 17:38:00.000000', '0991678664', '2023-07-09 07:54:00.000000', 0, '2023-07-09 17:38:00.000000', 8, '2023-07-09', 'Completed', 'Overtime', 0, 22),
(608, '2023-07-10 08:11:00.000000', '2023-07-10 17:48:00.000000', '0976207184', '2023-07-10 08:11:00.000000', 0, '2023-07-10 17:48:00.000000', 0, '2023-07-10', 'Completed', 'Remote', 8, 22),
(609, '2023-07-11 08:14:00.000000', '2023-07-11 17:43:00.000000', '075779128X', '2023-07-11 08:14:00.000000', 0, '2023-07-11 17:43:00.000000', 0, '2023-07-11', 'Completed', 'Onsite', 8, 22),
(610, '2023-07-12 08:03:00.000000', '2023-07-12 17:56:00.000000', '1071728806', '2023-07-12 08:03:00.000000', 0, '2023-07-12 17:56:00.000000', 0, '2023-07-12', 'Completed', 'Onsite', 8, 22),
(611, '2023-07-13 08:21:00.000000', '2023-07-13 17:32:00.000000', '094810631X', '2023-07-13 08:21:00.000000', 0, '2023-07-13 17:32:00.000000', 0, '2023-07-13', 'Completed', 'Onsite', 8, 22),
(612, '2023-07-14 08:12:00.000000', '2023-07-14 17:43:00.000000', '0016854829', '2023-07-14 08:12:00.000000', 0, '2023-07-14 17:43:00.000000', 8, '2023-07-14', 'Completed', 'Overtime', 0, 22),
(613, '2023-07-15 08:00:00.000000', '2023-07-15 17:35:00.000000', '1859964117', '2023-07-15 08:00:00.000000', 0, '2023-07-15 17:35:00.000000', 0, '2023-07-15', 'Completed', 'Remote', 8, 22),
(614, '2023-07-16 08:29:00.000000', '2023-07-16 17:40:00.000000', '1286233860', '2023-07-16 08:29:00.000000', 0, '2023-07-16 17:40:00.000000', 8, '2023-07-16', 'Completed', 'Overtime', 0, 22),
(615, '2023-07-17 08:17:00.000000', '2023-07-17 17:37:00.000000', '1940618444', '2023-07-17 08:17:00.000000', 0, '2023-07-17 17:37:00.000000', 0, '2023-07-17', 'Completed', 'Onsite', 8, 22),
(616, '2023-07-18 08:15:00.000000', '2023-07-18 17:41:00.000000', '1990098762', '2023-07-18 08:15:00.000000', 0, '2023-07-18 17:41:00.000000', 0, '2023-07-18', 'Completed', 'Onsite', 8, 22),
(617, '2023-07-19 08:21:00.000000', '2023-07-19 17:38:00.000000', '1016695330', '2023-07-19 08:21:00.000000', 0, '2023-07-19 17:38:00.000000', 0, '2023-07-19', 'Completed', 'Remote', 8, 22),
(618, '2023-07-20 07:51:00.000000', '2023-07-20 17:45:00.000000', '0719126126', '2023-07-20 07:51:00.000000', 0, '2023-07-20 17:45:00.000000', 8, '2023-07-20', 'Completed', 'Overtime', 0, 22),
(619, '2023-07-21 08:21:00.000000', '2023-07-21 17:57:00.000000', '1870908384', '2023-07-21 08:21:00.000000', 0, '2023-07-21 17:57:00.000000', 0, '2023-07-21', 'Completed', 'Remote', 8, 22),
(620, '2023-07-22 08:03:00.000000', '2023-07-22 17:44:00.000000', '0948101725', '2023-07-22 08:03:00.000000', 0, '2023-07-22 17:44:00.000000', 8, '2023-07-22', 'Completed', 'Overtime', 0, 22),
(621, '2023-07-23 08:24:00.000000', '2023-07-23 17:35:00.000000', '1938525183', '2023-07-23 08:24:00.000000', 0, '2023-07-23 17:35:00.000000', 0, '2023-07-23', 'Completed', 'Onsite', 8, 22),
(622, '2023-07-24 08:05:00.000000', '2023-07-24 17:42:00.000000', '1940527066', '2023-07-24 08:05:00.000000', 0, '2023-07-24 17:42:00.000000', 8, '2023-07-24', 'Completed', 'Overtime', 0, 22),
(623, '2023-07-25 07:52:00.000000', '2023-07-25 17:51:00.000000', '0910449104', '2023-07-25 07:52:00.000000', 0, '2023-07-25 17:51:00.000000', 8, '2023-07-25', 'Completed', 'Overtime', 0, 22),
(624, '2023-07-26 08:16:00.000000', '2023-07-26 17:42:00.000000', '1762764067', '2023-07-26 08:16:00.000000', 0, '2023-07-26 17:42:00.000000', 0, '2023-07-26', 'Completed', 'Remote', 8, 22),
(625, '2023-07-27 08:21:00.000000', '2023-07-27 17:57:00.000000', '0037204181', '2023-07-27 08:21:00.000000', 0, '2023-07-27 17:57:00.000000', 0, '2023-07-27', 'Completed', 'Remote', 8, 22),
(626, '2023-07-28 08:21:00.000000', '2023-07-28 17:43:00.000000', '1917099649', '2023-07-28 08:21:00.000000', 0, '2023-07-28 17:43:00.000000', 8, '2023-07-28', 'Completed', 'Overtime', 0, 22),
(627, '2023-07-29 08:06:00.000000', '2023-07-29 17:31:00.000000', '1859731147', '2023-07-29 08:06:00.000000', 0, '2023-07-29 17:31:00.000000', 0, '2023-07-29', 'Completed', 'Remote', 8, 22),
(628, '2023-07-30 07:54:00.000000', '2023-07-30 17:52:00.000000', '1985735725', '2023-07-30 07:54:00.000000', 0, '2023-07-30 17:52:00.000000', 0, '2023-07-30', 'Completed', 'Onsite', 8, 22),
(629, '2023-07-31 08:13:00.000000', '2023-07-31 17:49:00.000000', '0054821665', '2023-07-31 08:13:00.000000', 0, '2023-07-31 17:49:00.000000', 8, '2023-07-31', 'Completed', 'Overtime', 0, 22),
(630, '2023-08-01 08:16:00.000000', '2023-08-01 17:54:00.000000', '1909396109', '2023-08-01 08:16:00.000000', 0, '2023-08-01 17:54:00.000000', 8, '2023-08-01', 'Completed', 'Overtime', 0, 22),
(631, '2023-08-02 07:50:00.000000', '2023-08-02 17:40:00.000000', '1910946478', '2023-08-02 07:50:00.000000', 0, '2023-08-02 17:40:00.000000', 0, '2023-08-02', 'Completed', 'Remote', 8, 22),
(632, '2023-08-03 08:27:00.000000', '2023-08-03 17:51:00.000000', '1920297189', '2023-08-03 08:27:00.000000', 0, '2023-08-03 17:51:00.000000', 8, '2023-08-03', 'Completed', 'Overtime', 0, 22),
(633, '2023-08-04 08:15:00.000000', '2023-08-04 17:41:00.000000', '1682228622', '2023-08-04 08:15:00.000000', 0, '2023-08-04 17:41:00.000000', 0, '2023-08-04', 'Completed', 'Onsite', 8, 22),
(634, '2023-08-05 07:52:00.000000', '2023-08-05 17:57:00.000000', '0750225769', '2023-08-05 07:52:00.000000', 0, '2023-08-05 17:57:00.000000', 0, '2023-08-05', 'Completed', 'Remote', 8, 22),
(635, '2023-08-06 08:04:00.000000', '2023-08-06 17:57:00.000000', '0028858107', '2023-08-06 08:04:00.000000', 0, '2023-08-06 17:57:00.000000', 0, '2023-08-06', 'Completed', 'Remote', 8, 22),
(636, '2023-08-07 08:26:00.000000', '2023-08-07 17:31:00.000000', '1985441551', '2023-08-07 08:26:00.000000', 0, '2023-08-07 17:31:00.000000', 0, '2023-08-07', 'Completed', 'Onsite', 8, 22),
(637, '2023-08-08 08:09:00.000000', '2023-08-08 17:32:00.000000', '0669502782', '2023-08-08 08:09:00.000000', 0, '2023-08-08 17:32:00.000000', 0, '2023-08-08', 'Completed', 'Remote', 8, 22),
(638, '2023-08-09 08:13:00.000000', '2023-08-09 17:51:00.000000', '0801920507', '2023-08-09 08:13:00.000000', 0, '2023-08-09 17:51:00.000000', 8, '2023-08-09', 'Completed', 'Overtime', 0, 22),
(639, '2023-08-10 07:54:00.000000', '2023-08-10 17:30:00.000000', '1594640726', '2023-08-10 07:54:00.000000', 0, '2023-08-10 17:30:00.000000', 0, '2023-08-10', 'Completed', 'Onsite', 8, 22),
(640, '2023-08-11 08:24:00.000000', '2023-08-11 17:38:00.000000', '0933068441', '2023-08-11 08:24:00.000000', 0, '2023-08-11 17:38:00.000000', 8, '2023-08-11', 'Completed', 'Overtime', 0, 22),
(641, '2023-08-12 08:25:00.000000', '2023-08-12 17:54:00.000000', '0598018166', '2023-08-12 08:25:00.000000', 0, '2023-08-12 17:54:00.000000', 0, '2023-08-12', 'Completed', 'Remote', 8, 22),
(642, '2023-08-13 08:11:00.000000', '2023-08-13 17:46:00.000000', '1863346279', '2023-08-13 08:11:00.000000', 0, '2023-08-13 17:46:00.000000', 8, '2023-08-13', 'Completed', 'Overtime', 0, 22),
(643, '2023-08-14 07:54:00.000000', '2023-08-14 17:33:00.000000', '0926443283', '2023-08-14 07:54:00.000000', 0, '2023-08-14 17:33:00.000000', 8, '2023-08-14', 'Completed', 'Overtime', 0, 22),
(644, '2023-08-15 08:14:00.000000', '2023-08-15 17:35:00.000000', '176793405X', '2023-08-15 08:14:00.000000', 0, '2023-08-15 17:35:00.000000', 0, '2023-08-15', 'Completed', 'Onsite', 8, 22),
(645, '2023-08-16 08:08:00.000000', '2023-08-16 17:58:00.000000', '1948658046', '2023-08-16 08:08:00.000000', 0, '2023-08-16 17:58:00.000000', 0, '2023-08-16', 'Completed', 'Remote', 8, 22),
(646, '2023-08-17 08:27:00.000000', '2023-08-17 17:36:00.000000', '0872782794', '2023-08-17 08:27:00.000000', 0, '2023-08-17 17:36:00.000000', 0, '2023-08-17', 'Completed', 'Onsite', 8, 22),
(647, '2023-08-18 08:02:00.000000', '2023-08-18 17:34:00.000000', '079018303X', '2023-08-18 08:02:00.000000', 0, '2023-08-18 17:34:00.000000', 8, '2023-08-18', 'Completed', 'Overtime', 0, 22),
(648, '2023-08-19 08:01:00.000000', '2023-08-19 17:30:00.000000', '0876651856', '2023-08-19 08:01:00.000000', 0, '2023-08-19 17:30:00.000000', 8, '2023-08-19', 'Completed', 'Overtime', 0, 22),
(649, '2023-08-20 08:16:00.000000', '2023-08-20 17:37:00.000000', '0852708572', '2023-08-20 08:16:00.000000', 0, '2023-08-20 17:37:00.000000', 0, '2023-08-20', 'Completed', 'Onsite', 8, 22),
(650, '2023-08-21 08:02:00.000000', '2023-08-21 17:44:00.000000', '1937510271', '2023-08-21 08:02:00.000000', 0, '2023-08-21 17:44:00.000000', 0, '2023-08-21', 'Completed', 'Remote', 8, 22),
(651, '2023-08-22 08:07:00.000000', '2023-08-22 17:44:00.000000', '0995432074', '2023-08-22 08:07:00.000000', 0, '2023-08-22 17:44:00.000000', 8, '2023-08-22', 'Completed', 'Overtime', 0, 22),
(652, '2023-08-23 08:21:00.000000', '2023-08-23 17:59:00.000000', '1880812193', '2023-08-23 08:21:00.000000', 0, '2023-08-23 17:59:00.000000', 0, '2023-08-23', 'Completed', 'Remote', 8, 22),
(653, '2023-08-24 08:16:00.000000', '2023-08-24 17:52:00.000000', '0998186449', '2023-08-24 08:16:00.000000', 0, '2023-08-24 17:52:00.000000', 0, '2023-08-24', 'Completed', 'Onsite', 8, 22),
(654, '2023-08-25 07:52:00.000000', '2023-08-25 17:41:00.000000', '1365507513', '2023-08-25 07:52:00.000000', 0, '2023-08-25 17:41:00.000000', 0, '2023-08-25', 'Completed', 'Remote', 8, 22),
(655, '2023-08-26 07:53:00.000000', '2023-08-26 17:34:00.000000', '0345985206', '2023-08-26 07:53:00.000000', 0, '2023-08-26 17:34:00.000000', 0, '2023-08-26', 'Completed', 'Remote', 8, 22),
(656, '2023-08-27 08:15:00.000000', '2023-08-27 17:46:00.000000', '1929992092', '2023-08-27 08:15:00.000000', 0, '2023-08-27 17:46:00.000000', 0, '2023-08-27', 'Completed', 'Onsite', 8, 22),
(657, '2023-08-28 08:22:00.000000', '2023-08-28 17:36:00.000000', '0920467164', '2023-08-28 08:22:00.000000', 0, '2023-08-28 17:36:00.000000', 0, '2023-08-28', 'Completed', 'Onsite', 8, 22),
(658, '2023-08-29 08:05:00.000000', '2023-08-29 17:30:00.000000', '1809265568', '2023-08-29 08:05:00.000000', 0, '2023-08-29 17:30:00.000000', 0, '2023-08-29', 'Completed', 'Remote', 8, 22),
(659, '2023-08-30 08:11:00.000000', '2023-08-30 17:53:00.000000', '0973402784', '2023-08-30 08:11:00.000000', 0, '2023-08-30 17:53:00.000000', 8, '2023-08-30', 'Completed', 'Overtime', 0, 22),
(660, '2023-08-31 08:26:00.000000', '2023-08-31 17:41:00.000000', '105798034X', '2023-08-31 08:26:00.000000', 0, '2023-08-31 17:41:00.000000', 0, '2023-08-31', 'Completed', 'Onsite', 8, 22),
(661, '2023-09-01 08:01:00.000000', '2023-09-01 17:49:00.000000', '1081258012', '2023-09-01 08:01:00.000000', 0, '2023-09-01 17:49:00.000000', 8, '2023-09-01', 'Completed', 'Overtime', 0, 22),
(662, '2023-09-02 07:53:00.000000', '2023-09-02 17:34:00.000000', '095940838X', '2023-09-02 07:53:00.000000', 0, '2023-09-02 17:34:00.000000', 0, '2023-09-02', 'Completed', 'Onsite', 8, 22),
(663, '2023-09-03 08:10:00.000000', '2023-09-03 17:43:00.000000', '0641258305', '2023-09-03 08:10:00.000000', 0, '2023-09-03 17:43:00.000000', 8, '2023-09-03', 'Completed', 'Overtime', 0, 22),
(664, '2023-09-04 07:50:00.000000', '2023-09-04 17:47:00.000000', '0071467262', '2023-09-04 07:50:00.000000', 0, '2023-09-04 17:47:00.000000', 8, '2023-09-04', 'Completed', 'Overtime', 0, 22),
(665, '2023-09-05 08:12:00.000000', '2023-09-05 17:35:00.000000', '1730768229', '2023-09-05 08:12:00.000000', 0, '2023-09-05 17:35:00.000000', 0, '2023-09-05', 'Completed', 'Onsite', 8, 22),
(666, '2023-09-06 08:27:00.000000', '2023-09-06 17:33:00.000000', '1977244718', '2023-09-06 08:27:00.000000', 0, '2023-09-06 17:33:00.000000', 0, '2023-09-06', 'Completed', 'Remote', 8, 22),
(667, '2023-09-07 07:56:00.000000', '2023-09-07 17:50:00.000000', '1068135506', '2023-09-07 07:56:00.000000', 0, '2023-09-07 17:50:00.000000', 8, '2023-09-07', 'Completed', 'Overtime', 0, 22),
(668, '2023-09-08 08:26:00.000000', '2023-09-08 17:30:00.000000', '100762731X', '2023-09-08 08:26:00.000000', 0, '2023-09-08 17:30:00.000000', 8, '2023-09-08', 'Completed', 'Overtime', 0, 22),
(669, '2023-09-09 07:57:00.000000', '2023-09-09 17:39:00.000000', '0945871368', '2023-09-09 07:57:00.000000', 0, '2023-09-09 17:39:00.000000', 8, '2023-09-09', 'Completed', 'Overtime', 0, 22),
(670, '2023-09-10 08:23:00.000000', '2023-09-10 17:37:00.000000', '1020444525', '2023-09-10 08:23:00.000000', 0, '2023-09-10 17:37:00.000000', 0, '2023-09-10', 'Completed', 'Onsite', 8, 22),
(671, '2023-09-11 07:53:00.000000', '2023-09-11 17:38:00.000000', '1808579453', '2023-09-11 07:53:00.000000', 0, '2023-09-11 17:38:00.000000', 8, '2023-09-11', 'Completed', 'Overtime', 0, 22),
(672, '2023-09-12 08:00:00.000000', '2023-09-12 17:58:00.000000', '0381458679', '2023-09-12 08:00:00.000000', 0, '2023-09-12 17:58:00.000000', 0, '2023-09-12', 'Completed', 'Onsite', 8, 22),
(673, '2023-09-13 07:55:00.000000', '2023-09-13 17:34:00.000000', '0885064119', '2023-09-13 07:55:00.000000', 0, '2023-09-13 17:34:00.000000', 8, '2023-09-13', 'Completed', 'Overtime', 0, 22),
(674, '2023-09-14 07:59:00.000000', '2023-09-14 17:40:00.000000', '0991865553', '2023-09-14 07:59:00.000000', 0, '2023-09-14 17:40:00.000000', 8, '2023-09-14', 'Completed', 'Overtime', 0, 22),
(675, '2023-09-15 07:54:00.000000', '2023-09-15 17:52:00.000000', '0014340011', '2023-09-15 07:54:00.000000', 0, '2023-09-15 17:52:00.000000', 8, '2023-09-15', 'Completed', 'Overtime', 0, 22),
(676, '2023-09-16 08:25:00.000000', '2023-09-16 17:32:00.000000', '1843401649', '2023-09-16 08:25:00.000000', 0, '2023-09-16 17:32:00.000000', 8, '2023-09-16', 'Completed', 'Overtime', 0, 22),
(677, '2023-09-17 08:02:00.000000', '2023-09-17 17:55:00.000000', '0881206083', '2023-09-17 08:02:00.000000', 0, '2023-09-17 17:55:00.000000', 0, '2023-09-17', 'Completed', 'Remote', 8, 22),
(678, '2023-09-18 08:13:00.000000', '2023-09-18 17:40:00.000000', '1978016921', '2023-09-18 08:13:00.000000', 0, '2023-09-18 17:40:00.000000', 0, '2023-09-18', 'Completed', 'Remote', 8, 22),
(679, '2023-09-19 08:28:00.000000', '2023-09-19 17:52:00.000000', '0896836428', '2023-09-19 08:28:00.000000', 0, '2023-09-19 17:52:00.000000', 8, '2023-09-19', 'Completed', 'Overtime', 0, 22),
(680, '2023-09-20 08:16:00.000000', '2023-09-20 17:52:00.000000', '0999938452', '2023-09-20 08:16:00.000000', 0, '2023-09-20 17:52:00.000000', 0, '2023-09-20', 'Completed', 'Remote', 8, 22),
(681, '2023-09-21 08:04:00.000000', '2023-09-21 17:39:00.000000', '1904873901', '2023-09-21 08:04:00.000000', 0, '2023-09-21 17:39:00.000000', 0, '2023-09-21', 'Completed', 'Remote', 8, 22),
(682, '2023-09-22 08:09:00.000000', '2023-09-22 17:36:00.000000', '1984308106', '2023-09-22 08:09:00.000000', 0, '2023-09-22 17:36:00.000000', 0, '2023-09-22', 'Completed', 'Remote', 8, 22),
(683, '2023-09-23 07:58:00.000000', '2023-09-23 17:43:00.000000', '1003782353', '2023-09-23 07:58:00.000000', 0, '2023-09-23 17:43:00.000000', 0, '2023-09-23', 'Completed', 'Onsite', 8, 22),
(684, '2023-09-24 08:22:00.000000', '2023-09-24 17:58:00.000000', '1974152650', '2023-09-24 08:22:00.000000', 0, '2023-09-24 17:58:00.000000', 0, '2023-09-24', 'Completed', 'Onsite', 8, 22),
(685, '2023-09-25 08:14:00.000000', '2023-09-25 17:44:00.000000', '0720440238', '2023-09-25 08:14:00.000000', 0, '2023-09-25 17:44:00.000000', 8, '2023-09-25', 'Completed', 'Overtime', 0, 22),
(686, '2023-09-26 08:03:00.000000', '2023-09-26 17:45:00.000000', '0934273553', '2023-09-26 08:03:00.000000', 0, '2023-09-26 17:45:00.000000', 0, '2023-09-26', 'Completed', 'Remote', 8, 22),
(687, '2023-09-27 07:59:00.000000', '2023-09-27 17:49:00.000000', '1851795057', '2023-09-27 07:59:00.000000', 0, '2023-09-27 17:49:00.000000', 8, '2023-09-27', 'Completed', 'Overtime', 0, 22),
(688, '2023-09-28 07:54:00.000000', '2023-09-28 17:35:00.000000', '0935719849', '2023-09-28 07:54:00.000000', 0, '2023-09-28 17:35:00.000000', 0, '2023-09-28', 'Completed', 'Onsite', 8, 22),
(689, '2023-09-29 08:04:00.000000', '2023-09-29 17:31:00.000000', '1022597736', '2023-09-29 08:04:00.000000', 0, '2023-09-29 17:31:00.000000', 8, '2023-09-29', 'Completed', 'Overtime', 0, 22),
(690, '2023-09-30 08:14:00.000000', '2023-09-30 17:49:00.000000', '1458036383', '2023-09-30 08:14:00.000000', 0, '2023-09-30 17:49:00.000000', 0, '2023-09-30', 'Completed', 'Onsite', 8, 22),
(691, '2023-10-01 08:13:00.000000', '2023-10-01 17:41:00.000000', '0728111721', '2023-10-01 08:13:00.000000', 0, '2023-10-01 17:41:00.000000', 0, '2023-10-01', 'Completed', 'Onsite', 8, 22),
(692, '2023-10-02 08:27:00.000000', '2023-10-02 17:33:00.000000', '0023470267', '2023-10-02 08:27:00.000000', 0, '2023-10-02 17:33:00.000000', 8, '2023-10-02', 'Completed', 'Overtime', 0, 22),
(693, '2023-10-03 08:24:00.000000', '2023-10-03 17:57:00.000000', '1838480455', '2023-10-03 08:24:00.000000', 0, '2023-10-03 17:57:00.000000', 8, '2023-10-03', 'Completed', 'Overtime', 0, 22),
(694, '2023-10-04 08:12:00.000000', '2023-10-04 17:40:00.000000', '0994466110', '2023-10-04 08:12:00.000000', 0, '2023-10-04 17:40:00.000000', 0, '2023-10-04', 'Completed', 'Remote', 8, 22),
(695, '2023-10-05 08:03:00.000000', '2023-10-05 17:32:00.000000', '0758286619', '2023-10-05 08:03:00.000000', 0, '2023-10-05 17:32:00.000000', 0, '2023-10-05', 'Completed', 'Onsite', 8, 22),
(696, '2023-10-06 08:05:00.000000', '2023-10-06 17:40:00.000000', '1024869016', '2023-10-06 08:05:00.000000', 0, '2023-10-06 17:40:00.000000', 0, '2023-10-06', 'Completed', 'Onsite', 8, 22),
(697, '2023-10-07 08:26:00.000000', '2023-10-07 17:34:00.000000', '1529470951', '2023-10-07 08:26:00.000000', 0, '2023-10-07 17:34:00.000000', 0, '2023-10-07', 'Completed', 'Onsite', 8, 22),
(698, '2023-10-08 08:01:00.000000', '2023-10-08 17:49:00.000000', '1733274839', '2023-10-08 08:01:00.000000', 0, '2023-10-08 17:49:00.000000', 0, '2023-10-08', 'Completed', 'Remote', 8, 22),
(699, '2023-10-09 07:54:00.000000', '2023-10-09 17:32:00.000000', '0412221721', '2023-10-09 07:54:00.000000', 0, '2023-10-09 17:32:00.000000', 8, '2023-10-09', 'Completed', 'Overtime', 0, 22),
(700, '2023-10-10 07:59:00.000000', '2023-10-10 17:59:00.000000', '1854238620', '2023-10-10 07:59:00.000000', 0, '2023-10-10 17:59:00.000000', 0, '2023-10-10', 'Completed', 'Remote', 8, 22),
(701, '2023-10-11 08:04:00.000000', '2023-10-11 17:35:00.000000', '1873094531', '2023-10-11 08:04:00.000000', 0, '2023-10-11 17:35:00.000000', 8, '2023-10-11', 'Completed', 'Overtime', 0, 22),
(702, '2023-10-12 07:59:00.000000', '2023-10-12 17:30:00.000000', '0948442271', '2023-10-12 07:59:00.000000', 0, '2023-10-12 17:30:00.000000', 0, '2023-10-12', 'Completed', 'Remote', 8, 22),
(703, '2023-10-13 08:24:00.000000', '2023-10-13 17:49:00.000000', '1804117536', '2023-10-13 08:24:00.000000', 0, '2023-10-13 17:49:00.000000', 0, '2023-10-13', 'Completed', 'Remote', 8, 22),
(704, '2023-10-14 08:06:00.000000', '2023-10-14 17:33:00.000000', '1922728071', '2023-10-14 08:06:00.000000', 0, '2023-10-14 17:33:00.000000', 0, '2023-10-14', 'Completed', 'Onsite', 8, 22),
(705, '2023-10-15 08:04:00.000000', '2023-10-15 17:45:00.000000', '0959640118', '2023-10-15 08:04:00.000000', 0, '2023-10-15 17:45:00.000000', 0, '2023-10-15', 'Completed', 'Remote', 8, 22),
(706, '2023-10-16 08:16:00.000000', '2023-10-16 17:34:00.000000', '0011175095', '2023-10-16 08:16:00.000000', 0, '2023-10-16 17:34:00.000000', 8, '2023-10-16', 'Completed', 'Overtime', 0, 22),
(707, '2023-10-17 08:01:00.000000', '2023-10-17 17:32:00.000000', '0999152513', '2023-10-17 08:01:00.000000', 0, '2023-10-17 17:32:00.000000', 0, '2023-10-17', 'Completed', 'Remote', 8, 22),
(708, '2023-10-18 08:18:00.000000', '2023-10-18 17:39:00.000000', '0597862060', '2023-10-18 08:18:00.000000', 0, '2023-10-18 17:39:00.000000', 0, '2023-10-18', 'Completed', 'Remote', 8, 22),
(709, '2023-10-19 08:28:00.000000', '2023-10-19 17:48:00.000000', '0392749726', '2023-10-19 08:28:00.000000', 0, '2023-10-19 17:48:00.000000', 8, '2023-10-19', 'Completed', 'Overtime', 0, 22),
(710, '2023-10-20 07:57:00.000000', '2023-10-20 17:39:00.000000', '0070808821', '2023-10-20 07:57:00.000000', 0, '2023-10-20 17:39:00.000000', 8, '2023-10-20', 'Completed', 'Overtime', 0, 22),
(711, '2023-10-21 08:25:00.000000', '2023-10-21 17:51:00.000000', '1946906468', '2023-10-21 08:25:00.000000', 0, '2023-10-21 17:51:00.000000', 8, '2023-10-21', 'Completed', 'Overtime', 0, 22),
(712, '2023-10-22 08:13:00.000000', '2023-10-22 17:33:00.000000', '003812226X', '2023-10-22 08:13:00.000000', 0, '2023-10-22 17:33:00.000000', 0, '2023-10-22', 'Completed', 'Remote', 8, 22),
(713, '2023-10-23 08:07:00.000000', '2023-10-23 17:35:00.000000', '1921004029', '2023-10-23 08:07:00.000000', 0, '2023-10-23 17:35:00.000000', 0, '2023-10-23', 'Completed', 'Onsite', 8, 22),
(714, '2023-10-24 07:56:00.000000', '2023-10-24 17:56:00.000000', '0866540830', '2023-10-24 07:56:00.000000', 0, '2023-10-24 17:56:00.000000', 8, '2023-10-24', 'Completed', 'Overtime', 0, 22),
(715, '2023-10-25 08:10:00.000000', '2023-10-25 17:52:00.000000', '1908384719', '2023-10-25 08:10:00.000000', 0, '2023-10-25 17:52:00.000000', 0, '2023-10-25', 'Completed', 'Onsite', 8, 22),
(716, '2023-10-26 08:11:00.000000', '2023-10-26 17:49:00.000000', '0028404564', '2023-10-26 08:11:00.000000', 0, '2023-10-26 17:49:00.000000', 0, '2023-10-26', 'Completed', 'Onsite', 8, 22),
(717, '2023-10-27 08:21:00.000000', '2023-10-27 17:31:00.000000', '1960944614', '2023-10-27 08:21:00.000000', 0, '2023-10-27 17:31:00.000000', 0, '2023-10-27', 'Completed', 'Onsite', 8, 22),
(718, '2023-10-28 08:06:00.000000', '2023-10-28 17:58:00.000000', '1978769911', '2023-10-28 08:06:00.000000', 0, '2023-10-28 17:58:00.000000', 0, '2023-10-28', 'Completed', 'Remote', 8, 22),
(719, '2023-10-29 07:56:00.000000', '2023-10-29 17:51:00.000000', '1880238144', '2023-10-29 07:56:00.000000', 0, '2023-10-29 17:51:00.000000', 0, '2023-10-29', 'Completed', 'Remote', 8, 22);
INSERT INTO `time_sheets` (`id`, `check_in`, `check_out`, `code`, `in_time`, `leave_hours`, `out_time`, `overtime_hours`, `record_date`, `status`, `type_work`, `working_hours`, `user_id`) VALUES
(720, '2023-10-30 08:05:00.000000', '2023-10-30 17:43:00.000000', '0059574925', '2023-10-30 08:05:00.000000', 0, '2023-10-30 17:43:00.000000', 0, '2023-10-30', 'Completed', 'Remote', 8, 22),
(721, '2023-10-31 08:09:00.000000', '2023-10-31 17:46:00.000000', '0873093585', '2023-10-31 08:09:00.000000', 0, '2023-10-31 17:46:00.000000', 8, '2023-10-31', 'Completed', 'Overtime', 0, 22),
(722, '2023-11-01 08:20:00.000000', '2023-11-01 17:42:00.000000', '1202214703', '2023-11-01 08:20:00.000000', 0, '2023-11-01 17:42:00.000000', 8, '2023-11-01', 'Completed', 'Overtime', 0, 22),
(723, '2023-11-02 07:59:00.000000', '2023-11-02 17:38:00.000000', '1219500615', '2023-11-02 07:59:00.000000', 0, '2023-11-02 17:38:00.000000', 0, '2023-11-02', 'Completed', 'Onsite', 8, 22),
(724, '2023-11-03 08:10:00.000000', '2023-11-03 17:57:00.000000', '183584491X', '2023-11-03 08:10:00.000000', 0, '2023-11-03 17:57:00.000000', 0, '2023-11-03', 'Completed', 'Onsite', 8, 22),
(725, '2023-11-04 08:19:00.000000', '2023-11-04 17:47:00.000000', '0920746748', '2023-11-04 08:19:00.000000', 0, '2023-11-04 17:47:00.000000', 0, '2023-11-04', 'Completed', 'Onsite', 8, 22),
(726, '2023-11-05 08:18:00.000000', '2023-11-05 17:32:00.000000', '0432500855', '2023-11-05 08:18:00.000000', 0, '2023-11-05 17:32:00.000000', 8, '2023-11-05', 'Completed', 'Overtime', 0, 22),
(727, '2023-11-06 08:04:00.000000', '2023-11-06 17:37:00.000000', '103276662X', '2023-11-06 08:04:00.000000', 0, '2023-11-06 17:37:00.000000', 0, '2023-11-06', 'Completed', 'Remote', 8, 22),
(728, '2023-11-07 08:01:00.000000', '2023-11-07 17:49:00.000000', '1012866904', '2023-11-07 08:01:00.000000', 0, '2023-11-07 17:49:00.000000', 0, '2023-11-07', 'Completed', 'Onsite', 8, 22),
(729, '2023-11-08 07:52:00.000000', '2023-11-08 17:42:00.000000', '0854251650', '2023-11-08 07:52:00.000000', 0, '2023-11-08 17:42:00.000000', 0, '2023-11-08', 'Completed', 'Onsite', 8, 22),
(730, '2023-11-09 08:28:00.000000', '2023-11-09 17:52:00.000000', '1270015478', '2023-11-09 08:28:00.000000', 0, '2023-11-09 17:52:00.000000', 0, '2023-11-09', 'Completed', 'Remote', 8, 22),
(731, '2023-11-10 08:07:00.000000', '2023-11-10 17:54:00.000000', '100634134X', '2023-11-10 08:07:00.000000', 0, '2023-11-10 17:54:00.000000', 8, '2023-11-10', 'Completed', 'Overtime', 0, 22),
(732, '2023-11-11 07:54:00.000000', '2023-11-11 17:56:00.000000', '1550368672', '2023-11-11 07:54:00.000000', 0, '2023-11-11 17:56:00.000000', 8, '2023-11-11', 'Completed', 'Overtime', 0, 22),
(733, '2023-11-12 07:50:00.000000', '2023-11-12 17:33:00.000000', '0042297400', '2023-11-12 07:50:00.000000', 0, '2023-11-12 17:33:00.000000', 0, '2023-11-12', 'Completed', 'Remote', 8, 22),
(734, '2023-11-13 08:11:00.000000', '2023-11-13 17:38:00.000000', '1022538888', '2023-11-13 08:11:00.000000', 0, '2023-11-13 17:38:00.000000', 0, '2023-11-13', 'Completed', 'Remote', 8, 22),
(735, '2023-11-14 08:12:00.000000', '2023-11-14 17:52:00.000000', '1846847117', '2023-11-14 08:12:00.000000', 0, '2023-11-14 17:52:00.000000', 8, '2023-11-14', 'Completed', 'Overtime', 0, 22),
(736, '2023-11-15 08:28:00.000000', '2023-11-15 17:33:00.000000', '0269026177', '2023-11-15 08:28:00.000000', 0, '2023-11-15 17:33:00.000000', 0, '2023-11-15', 'Completed', 'Remote', 8, 22),
(737, '2023-11-16 07:57:00.000000', '2023-11-16 17:46:00.000000', '1806863944', '2023-11-16 07:57:00.000000', 0, '2023-11-16 17:46:00.000000', 0, '2023-11-16', 'Completed', 'Remote', 8, 22),
(738, '2023-11-17 08:05:00.000000', '2023-11-17 17:59:00.000000', '0990433358', '2023-11-17 08:05:00.000000', 0, '2023-11-17 17:59:00.000000', 0, '2023-11-17', 'Completed', 'Remote', 8, 22),
(739, '2023-11-18 07:52:00.000000', '2023-11-18 17:50:00.000000', '0929786513', '2023-11-18 07:52:00.000000', 0, '2023-11-18 17:50:00.000000', 0, '2023-11-18', 'Completed', 'Onsite', 8, 22),
(740, '2023-11-19 08:12:00.000000', '2023-11-19 17:37:00.000000', '1681898608', '2023-11-19 08:12:00.000000', 0, '2023-11-19 17:37:00.000000', 8, '2023-11-19', 'Completed', 'Overtime', 0, 22),
(741, '2023-11-20 08:19:00.000000', '2023-11-20 17:58:00.000000', '1924403269', '2023-11-20 08:19:00.000000', 0, '2023-11-20 17:58:00.000000', 8, '2023-11-20', 'Completed', 'Overtime', 0, 22),
(742, '2023-11-21 08:11:00.000000', '2023-11-21 17:43:00.000000', '1031808566', '2023-11-21 08:11:00.000000', 0, '2023-11-21 17:43:00.000000', 8, '2023-11-21', 'Completed', 'Overtime', 0, 22),
(743, '2023-11-22 08:17:00.000000', '2023-11-22 17:50:00.000000', '0954083261', '2023-11-22 08:17:00.000000', 0, '2023-11-22 17:50:00.000000', 0, '2023-11-22', 'Completed', 'Onsite', 8, 22),
(744, '2023-11-23 08:27:00.000000', '2023-11-23 17:54:00.000000', '100134782X', '2023-11-23 08:27:00.000000', 0, '2023-11-23 17:54:00.000000', 0, '2023-11-23', 'Completed', 'Onsite', 8, 22),
(745, '2023-11-24 07:52:00.000000', '2023-11-24 17:57:00.000000', '0869616862', '2023-11-24 07:52:00.000000', 0, '2023-11-24 17:57:00.000000', 0, '2023-11-24', 'Completed', 'Onsite', 8, 22),
(746, '2023-11-25 08:09:00.000000', '2023-11-25 17:58:00.000000', '0969622511', '2023-11-25 08:09:00.000000', 0, '2023-11-25 17:58:00.000000', 0, '2023-11-25', 'Completed', 'Onsite', 8, 22),
(747, '2023-11-26 08:20:00.000000', '2023-11-26 17:30:00.000000', '0369765915', '2023-11-26 08:20:00.000000', 0, '2023-11-26 17:30:00.000000', 0, '2023-11-26', 'Completed', 'Onsite', 8, 22),
(748, '2023-11-27 08:21:00.000000', '2023-11-27 17:54:00.000000', '172013796X', '2023-11-27 08:21:00.000000', 0, '2023-11-27 17:54:00.000000', 0, '2023-11-27', 'Completed', 'Onsite', 8, 22),
(749, '2023-11-28 08:19:00.000000', '2023-11-28 17:31:00.000000', '0897956834', '2023-11-28 08:19:00.000000', 0, '2023-11-28 17:31:00.000000', 0, '2023-11-28', 'Completed', 'Onsite', 8, 22),
(750, '2023-11-29 08:15:00.000000', '2023-11-29 17:40:00.000000', '1768484163', '2023-11-29 08:15:00.000000', 0, '2023-11-29 17:40:00.000000', 8, '2023-11-29', 'Completed', 'Overtime', 0, 22),
(751, '2023-11-30 07:54:00.000000', '2023-11-30 17:46:00.000000', '1503815242', '2023-11-30 07:54:00.000000', 0, '2023-11-30 17:46:00.000000', 8, '2023-11-30', 'Completed', 'Overtime', 0, 22),
(752, '2023-12-01 08:23:00.000000', '2023-12-01 17:31:00.000000', '1882681371', '2023-12-01 08:23:00.000000', 0, '2023-12-01 17:31:00.000000', 0, '2023-12-01', 'Completed', 'Remote', 8, 22),
(753, '2023-12-02 07:50:00.000000', '2023-12-02 17:34:00.000000', '0927540452', '2023-12-02 07:50:00.000000', 0, '2023-12-02 17:34:00.000000', 0, '2023-12-02', 'Completed', 'Onsite', 8, 22),
(754, '2023-12-03 07:52:00.000000', '2023-12-03 17:36:00.000000', '1924814323', '2023-12-03 07:52:00.000000', 0, '2023-12-03 17:36:00.000000', 0, '2023-12-03', 'Completed', 'Remote', 8, 22),
(755, '2023-12-04 08:11:00.000000', '2023-12-04 17:55:00.000000', '1799085317', '2023-12-04 08:11:00.000000', 0, '2023-12-04 17:55:00.000000', 0, '2023-12-04', 'Completed', 'Remote', 8, 22),
(756, '2023-12-05 08:14:00.000000', '2023-12-05 17:35:00.000000', '0916857026', '2023-12-05 08:14:00.000000', 0, '2023-12-05 17:35:00.000000', 0, '2023-12-05', 'Completed', 'Onsite', 8, 22),
(757, '2023-12-06 08:27:00.000000', '2023-12-06 17:34:00.000000', '1614031932', '2023-12-06 08:27:00.000000', 0, '2023-12-06 17:34:00.000000', 8, '2023-12-06', 'Completed', 'Overtime', 0, 22),
(758, '2023-12-07 07:54:00.000000', '2023-12-07 17:32:00.000000', '1821347226', '2023-12-07 07:54:00.000000', 0, '2023-12-07 17:32:00.000000', 8, '2023-12-07', 'Completed', 'Overtime', 0, 22),
(759, '2023-12-08 08:09:00.000000', '2023-12-08 17:37:00.000000', '1914276108', '2023-12-08 08:09:00.000000', 0, '2023-12-08 17:37:00.000000', 8, '2023-12-08', 'Completed', 'Overtime', 0, 22),
(760, '2023-12-09 07:54:00.000000', '2023-12-09 17:32:00.000000', '1962487059', '2023-12-09 07:54:00.000000', 0, '2023-12-09 17:32:00.000000', 0, '2023-12-09', 'Completed', 'Remote', 8, 22),
(761, '2023-12-10 08:02:00.000000', '2023-12-10 17:57:00.000000', '1874353824', '2023-12-10 08:02:00.000000', 0, '2023-12-10 17:57:00.000000', 0, '2023-12-10', 'Completed', 'Onsite', 8, 22),
(762, '2023-12-11 07:58:00.000000', '2023-12-11 17:45:00.000000', '1828856932', '2023-12-11 07:58:00.000000', 0, '2023-12-11 17:45:00.000000', 0, '2023-12-11', 'Completed', 'Remote', 8, 22),
(763, '2023-12-12 08:01:00.000000', '2023-12-12 17:47:00.000000', '1900556731', '2023-12-12 08:01:00.000000', 0, '2023-12-12 17:47:00.000000', 0, '2023-12-12', 'Completed', 'Remote', 8, 22),
(764, '2023-12-13 08:20:00.000000', '2023-12-13 17:48:00.000000', '1967325278', '2023-12-13 08:20:00.000000', 0, '2023-12-13 17:48:00.000000', 0, '2023-12-13', 'Completed', 'Remote', 8, 22),
(765, '2023-12-14 08:04:00.000000', '2023-12-14 17:33:00.000000', '0506049272', '2023-12-14 08:04:00.000000', 0, '2023-12-14 17:33:00.000000', 8, '2023-12-14', 'Completed', 'Overtime', 0, 22),
(766, '2023-12-15 08:23:00.000000', '2023-12-15 17:34:00.000000', '1972680676', '2023-12-15 08:23:00.000000', 0, '2023-12-15 17:34:00.000000', 0, '2023-12-15', 'Completed', 'Onsite', 8, 22),
(767, '2023-12-16 08:12:00.000000', '2023-12-16 17:37:00.000000', '1953192912', '2023-12-16 08:12:00.000000', 0, '2023-12-16 17:37:00.000000', 0, '2023-12-16', 'Completed', 'Onsite', 8, 22),
(768, '2023-12-17 08:20:00.000000', '2023-12-17 17:55:00.000000', '0012572268', '2023-12-17 08:20:00.000000', 0, '2023-12-17 17:55:00.000000', 0, '2023-12-17', 'Completed', 'Onsite', 8, 22),
(769, '2023-12-18 08:25:00.000000', '2023-12-18 17:56:00.000000', '081400234X', '2023-12-18 08:25:00.000000', 0, '2023-12-18 17:56:00.000000', 0, '2023-12-18', 'Completed', 'Remote', 8, 22),
(770, '2023-12-19 07:59:00.000000', '2023-12-19 17:41:00.000000', '0994281447', '2023-12-19 07:59:00.000000', 0, '2023-12-19 17:41:00.000000', 8, '2023-12-19', 'Completed', 'Overtime', 0, 22),
(771, '2023-12-20 08:01:00.000000', '2023-12-20 17:59:00.000000', '1922005886', '2023-12-20 08:01:00.000000', 0, '2023-12-20 17:59:00.000000', 8, '2023-12-20', 'Completed', 'Overtime', 0, 22),
(772, '2023-12-21 08:19:00.000000', '2023-12-21 17:43:00.000000', '1979474699', '2023-12-21 08:19:00.000000', 0, '2023-12-21 17:43:00.000000', 0, '2023-12-21', 'Completed', 'Onsite', 8, 22),
(773, '2023-12-22 08:12:00.000000', '2023-12-22 17:56:00.000000', '0058414541', '2023-12-22 08:12:00.000000', 0, '2023-12-22 17:56:00.000000', 0, '2023-12-22', 'Completed', 'Remote', 8, 22),
(774, '2023-12-23 08:16:00.000000', '2023-12-23 17:51:00.000000', '1959622714', '2023-12-23 08:16:00.000000', 0, '2023-12-23 17:51:00.000000', 0, '2023-12-23', 'Completed', 'Remote', 8, 22),
(775, '2023-12-24 08:02:00.000000', '2023-12-24 17:53:00.000000', '0666109265', '2023-12-24 08:02:00.000000', 0, '2023-12-24 17:53:00.000000', 8, '2023-12-24', 'Completed', 'Overtime', 0, 22),
(776, '2023-12-25 08:21:00.000000', '2023-12-25 17:54:00.000000', '1009898345', '2023-12-25 08:21:00.000000', 0, '2023-12-25 17:54:00.000000', 8, '2023-12-25', 'Completed', 'Overtime', 0, 22),
(777, '2023-12-26 07:51:00.000000', '2023-12-26 17:55:00.000000', '1084084562', '2023-12-26 07:51:00.000000', 0, '2023-12-26 17:55:00.000000', 0, '2023-12-26', 'Completed', 'Onsite', 8, 22),
(778, '2023-12-27 07:59:00.000000', '2023-12-27 17:45:00.000000', '1992624208', '2023-12-27 07:59:00.000000', 0, '2023-12-27 17:45:00.000000', 0, '2023-12-27', 'Completed', 'Onsite', 8, 22),
(779, '2023-12-28 08:19:00.000000', '2023-12-28 17:38:00.000000', '1929359721', '2023-12-28 08:19:00.000000', 0, '2023-12-28 17:38:00.000000', 0, '2023-12-28', 'Completed', 'Onsite', 8, 22),
(780, '2023-12-29 08:00:00.000000', '2023-12-29 17:33:00.000000', '1913703819', '2023-12-29 08:00:00.000000', 0, '2023-12-29 17:33:00.000000', 0, '2023-12-29', 'Completed', 'Remote', 8, 22),
(781, '2023-12-30 08:20:00.000000', '2023-12-30 17:32:00.000000', '0778270270', '2023-12-30 08:20:00.000000', 0, '2023-12-30 17:32:00.000000', 8, '2023-12-30', 'Completed', 'Overtime', 0, 22),
(782, '2023-12-31 07:57:00.000000', '2023-12-31 17:38:00.000000', '1755905238', '2023-12-31 07:57:00.000000', 0, '2023-12-31 17:38:00.000000', 0, '2023-12-31', 'Completed', 'Onsite', 8, 22),
(783, '2024-01-01 08:16:00.000000', '2024-01-01 17:56:00.000000', '1803006072', '2024-01-01 08:16:00.000000', 0, '2024-01-01 17:56:00.000000', 0, '2024-01-01', 'Completed', 'Remote', 8, 22),
(784, '2024-01-02 08:10:00.000000', '2024-01-02 17:38:00.000000', '0017302404', '2024-01-02 08:10:00.000000', 0, '2024-01-02 17:38:00.000000', 8, '2024-01-02', 'Completed', 'Overtime', 0, 22),
(785, '2024-01-03 07:57:00.000000', '2024-01-03 17:58:00.000000', '1046539396', '2024-01-03 07:57:00.000000', 0, '2024-01-03 17:58:00.000000', 0, '2024-01-03', 'Completed', 'Onsite', 8, 22),
(786, '2024-01-04 08:07:00.000000', '2024-01-04 17:56:00.000000', '0299480518', '2024-01-04 08:07:00.000000', 0, '2024-01-04 17:56:00.000000', 0, '2024-01-04', 'Completed', 'Remote', 8, 22),
(787, '2024-01-05 08:00:00.000000', '2024-01-05 17:45:00.000000', '1993236953', '2024-01-05 08:00:00.000000', 0, '2024-01-05 17:45:00.000000', 8, '2024-01-05', 'Completed', 'Overtime', 0, 22),
(788, '2024-01-06 08:08:00.000000', '2024-01-06 17:44:00.000000', '0793987768', '2024-01-06 08:08:00.000000', 0, '2024-01-06 17:44:00.000000', 0, '2024-01-06', 'Completed', 'Onsite', 8, 22),
(789, '2024-01-07 08:18:00.000000', '2024-01-07 17:40:00.000000', '097277288X', '2024-01-07 08:18:00.000000', 0, '2024-01-07 17:40:00.000000', 0, '2024-01-07', 'Completed', 'Remote', 8, 22),
(790, '2024-01-08 07:51:00.000000', '2024-01-08 17:54:00.000000', '0058550178', '2024-01-08 07:51:00.000000', 0, '2024-01-08 17:54:00.000000', 0, '2024-01-08', 'Completed', 'Remote', 8, 22),
(791, '2024-01-09 08:01:00.000000', '2024-01-09 17:59:00.000000', '0001236776', '2024-01-09 08:01:00.000000', 0, '2024-01-09 17:59:00.000000', 8, '2024-01-09', 'Completed', 'Overtime', 0, 22),
(792, '2024-01-10 07:57:00.000000', '2024-01-10 17:30:00.000000', '1944563202', '2024-01-10 07:57:00.000000', 0, '2024-01-10 17:30:00.000000', 0, '2024-01-10', 'Completed', 'Onsite', 8, 22),
(793, '2024-01-11 08:03:00.000000', '2024-01-11 17:51:00.000000', '1281658014', '2024-01-11 08:03:00.000000', 0, '2024-01-11 17:51:00.000000', 8, '2024-01-11', 'Completed', 'Overtime', 0, 22),
(794, '2024-01-12 07:59:00.000000', '2024-01-12 17:58:00.000000', '0444453873', '2024-01-12 07:59:00.000000', 0, '2024-01-12 17:58:00.000000', 0, '2024-01-12', 'Completed', 'Onsite', 8, 22),
(795, '2024-01-13 08:21:00.000000', '2024-01-13 17:55:00.000000', '1885375778', '2024-01-13 08:21:00.000000', 0, '2024-01-13 17:55:00.000000', 0, '2024-01-13', 'Completed', 'Onsite', 8, 22),
(796, '2024-01-14 08:26:00.000000', '2024-01-14 17:37:00.000000', '1925009068', '2024-01-14 08:26:00.000000', 0, '2024-01-14 17:37:00.000000', 8, '2024-01-14', 'Completed', 'Overtime', 0, 22),
(797, '2024-01-15 08:00:00.000000', '2024-01-15 17:47:00.000000', '0001675710', '2024-01-15 08:00:00.000000', 0, '2024-01-15 17:47:00.000000', 0, '2024-01-15', 'Completed', 'Remote', 8, 22),
(798, '2024-01-16 08:17:00.000000', '2024-01-16 17:38:00.000000', '1786391678', '2024-01-16 08:17:00.000000', 0, '2024-01-16 17:38:00.000000', 0, '2024-01-16', 'Completed', 'Remote', 8, 22),
(799, '2024-01-17 08:08:00.000000', '2024-01-17 17:32:00.000000', '1760585505', '2024-01-17 08:08:00.000000', 0, '2024-01-17 17:32:00.000000', 0, '2024-01-17', 'Completed', 'Onsite', 8, 22),
(800, '2024-01-18 08:14:00.000000', '2024-01-18 17:40:00.000000', '1969659742', '2024-01-18 08:14:00.000000', 0, '2024-01-18 17:40:00.000000', 0, '2024-01-18', 'Completed', 'Onsite', 8, 22),
(801, '2024-01-19 07:50:00.000000', '2024-01-19 17:34:00.000000', '1946938033', '2024-01-19 07:50:00.000000', 0, '2024-01-19 17:34:00.000000', 0, '2024-01-19', 'Completed', 'Onsite', 8, 22),
(802, '2024-01-20 08:12:00.000000', '2024-01-20 17:42:00.000000', '1776401719', '2024-01-20 08:12:00.000000', 0, '2024-01-20 17:42:00.000000', 0, '2024-01-20', 'Completed', 'Remote', 8, 22),
(803, '2024-01-21 08:25:00.000000', '2024-01-21 17:43:00.000000', '1009034251', '2024-01-21 08:25:00.000000', 0, '2024-01-21 17:43:00.000000', 0, '2024-01-21', 'Completed', 'Onsite', 8, 22),
(804, '2024-01-22 08:29:00.000000', '2024-01-22 17:42:00.000000', '0405220669', '2024-01-22 08:29:00.000000', 0, '2024-01-22 17:42:00.000000', 8, '2024-01-22', 'Completed', 'Overtime', 0, 22),
(805, '2024-01-23 07:52:00.000000', '2024-01-23 17:44:00.000000', '1944477829', '2024-01-23 07:52:00.000000', 0, '2024-01-23 17:44:00.000000', 8, '2024-01-23', 'Completed', 'Overtime', 0, 22),
(806, '2024-01-24 08:15:00.000000', '2024-01-24 17:55:00.000000', '1754101801', '2024-01-24 08:15:00.000000', 0, '2024-01-24 17:55:00.000000', 0, '2024-01-24', 'Completed', 'Onsite', 8, 22),
(807, '2024-01-25 08:27:00.000000', '2024-01-25 17:53:00.000000', '047733556X', '2024-01-25 08:27:00.000000', 0, '2024-01-25 17:53:00.000000', 0, '2024-01-25', 'Completed', 'Onsite', 8, 22),
(808, '2024-01-26 07:50:00.000000', '2024-01-26 17:31:00.000000', '0003175243', '2024-01-26 07:50:00.000000', 0, '2024-01-26 17:31:00.000000', 0, '2024-01-26', 'Completed', 'Remote', 8, 22),
(809, '2024-01-27 08:26:00.000000', '2024-01-27 17:36:00.000000', '0975911090', '2024-01-27 08:26:00.000000', 0, '2024-01-27 17:36:00.000000', 8, '2024-01-27', 'Completed', 'Overtime', 0, 22),
(810, '2024-01-28 08:05:00.000000', '2024-01-28 17:36:00.000000', '0447422766', '2024-01-28 08:05:00.000000', 0, '2024-01-28 17:36:00.000000', 0, '2024-01-28', 'Completed', 'Remote', 8, 22),
(811, '2024-01-29 08:29:00.000000', '2024-01-29 17:59:00.000000', '0075121816', '2024-01-29 08:29:00.000000', 0, '2024-01-29 17:59:00.000000', 0, '2024-01-29', 'Completed', 'Remote', 8, 22),
(812, '2024-01-30 08:28:00.000000', '2024-01-30 17:56:00.000000', '085430164X', '2024-01-30 08:28:00.000000', 0, '2024-01-30 17:56:00.000000', 0, '2024-01-30', 'Completed', 'Remote', 8, 22),
(813, '2024-01-31 08:11:00.000000', '2024-01-31 17:31:00.000000', '1884228321', '2024-01-31 08:11:00.000000', 0, '2024-01-31 17:31:00.000000', 0, '2024-01-31', 'Completed', 'Remote', 8, 22),
(814, '2024-02-01 08:10:00.000000', '2024-02-01 17:31:00.000000', '100613333X', '2024-02-01 08:10:00.000000', 0, '2024-02-01 17:31:00.000000', 8, '2024-02-01', 'Completed', 'Overtime', 0, 22),
(815, '2024-02-02 08:27:00.000000', '2024-02-02 17:46:00.000000', '1016783361', '2024-02-02 08:27:00.000000', 0, '2024-02-02 17:46:00.000000', 8, '2024-02-02', 'Completed', 'Overtime', 0, 22),
(816, '2024-02-03 08:16:00.000000', '2024-02-03 17:45:00.000000', '1891630261', '2024-02-03 08:16:00.000000', 0, '2024-02-03 17:45:00.000000', 0, '2024-02-03', 'Completed', 'Remote', 8, 22),
(817, '2024-02-04 08:11:00.000000', '2024-02-04 17:37:00.000000', '1891205757', '2024-02-04 08:11:00.000000', 0, '2024-02-04 17:37:00.000000', 8, '2024-02-04', 'Completed', 'Overtime', 0, 22),
(818, '2024-02-05 07:50:00.000000', '2024-02-05 17:35:00.000000', '0027394212', '2024-02-05 07:50:00.000000', 0, '2024-02-05 17:35:00.000000', 0, '2024-02-05', 'Completed', 'Remote', 8, 22),
(819, '2024-02-06 08:07:00.000000', '2024-02-06 17:46:00.000000', '0244040176', '2024-02-06 08:07:00.000000', 0, '2024-02-06 17:46:00.000000', 0, '2024-02-06', 'Completed', 'Remote', 8, 22),
(820, '2024-02-07 08:17:00.000000', '2024-02-07 17:44:00.000000', '1770984070', '2024-02-07 08:17:00.000000', 0, '2024-02-07 17:44:00.000000', 0, '2024-02-07', 'Completed', 'Onsite', 8, 22),
(821, '2024-02-08 08:00:00.000000', '2024-02-08 17:39:00.000000', '0269421335', '2024-02-08 08:00:00.000000', 0, '2024-02-08 17:39:00.000000', 8, '2024-02-08', 'Completed', 'Overtime', 0, 22),
(822, '2024-02-09 08:14:00.000000', '2024-02-09 17:38:00.000000', '1828823341', '2024-02-09 08:14:00.000000', 0, '2024-02-09 17:38:00.000000', 0, '2024-02-09', 'Completed', 'Remote', 8, 22),
(823, '2024-02-10 08:01:00.000000', '2024-02-10 17:45:00.000000', '0701881550', '2024-02-10 08:01:00.000000', 0, '2024-02-10 17:45:00.000000', 0, '2024-02-10', 'Completed', 'Onsite', 8, 22),
(824, '2024-02-11 08:09:00.000000', '2024-02-11 17:58:00.000000', '098740363X', '2024-02-11 08:09:00.000000', 0, '2024-02-11 17:58:00.000000', 0, '2024-02-11', 'Completed', 'Onsite', 8, 22),
(825, '2024-02-12 07:56:00.000000', '2024-02-12 17:37:00.000000', '1723935093', '2024-02-12 07:56:00.000000', 0, '2024-02-12 17:37:00.000000', 0, '2024-02-12', 'Completed', 'Remote', 8, 22),
(826, '2024-02-13 07:51:00.000000', '2024-02-13 17:40:00.000000', '0001492039', '2024-02-13 07:51:00.000000', 0, '2024-02-13 17:40:00.000000', 0, '2024-02-13', 'Completed', 'Remote', 8, 22),
(827, '2024-02-14 08:14:00.000000', '2024-02-14 17:47:00.000000', '0898497760', '2024-02-14 08:14:00.000000', 0, '2024-02-14 17:47:00.000000', 8, '2024-02-14', 'Completed', 'Overtime', 0, 22),
(828, '2024-02-15 08:15:00.000000', '2024-02-15 17:37:00.000000', '0043512151', '2024-02-15 08:15:00.000000', 0, '2024-02-15 17:37:00.000000', 0, '2024-02-15', 'Completed', 'Remote', 8, 22),
(829, '2024-02-16 07:51:00.000000', '2024-02-16 17:43:00.000000', '0973041242', '2024-02-16 07:51:00.000000', 0, '2024-02-16 17:43:00.000000', 0, '2024-02-16', 'Completed', 'Remote', 8, 22),
(830, '2024-02-17 07:52:00.000000', '2024-02-17 17:56:00.000000', '1989012701', '2024-02-17 07:52:00.000000', 0, '2024-02-17 17:56:00.000000', 8, '2024-02-17', 'Completed', 'Overtime', 0, 22),
(831, '2024-02-18 08:06:00.000000', '2024-02-18 17:34:00.000000', '0048693235', '2024-02-18 08:06:00.000000', 0, '2024-02-18 17:34:00.000000', 0, '2024-02-18', 'Completed', 'Onsite', 8, 22),
(832, '2024-02-19 08:29:00.000000', '2024-02-19 17:34:00.000000', '0962479276', '2024-02-19 08:29:00.000000', 0, '2024-02-19 17:34:00.000000', 8, '2024-02-19', 'Completed', 'Overtime', 0, 22),
(833, '2024-02-20 08:03:00.000000', '2024-02-20 17:30:00.000000', '0065745671', '2024-02-20 08:03:00.000000', 0, '2024-02-20 17:30:00.000000', 0, '2024-02-20', 'Completed', 'Onsite', 8, 22),
(834, '2024-02-21 07:51:00.000000', '2024-02-21 17:31:00.000000', '0736517847', '2024-02-21 07:51:00.000000', 0, '2024-02-21 17:31:00.000000', 0, '2024-02-21', 'Completed', 'Onsite', 8, 22),
(835, '2024-02-22 08:23:00.000000', '2024-02-22 17:39:00.000000', '0985629339', '2024-02-22 08:23:00.000000', 0, '2024-02-22 17:39:00.000000', 8, '2024-02-22', 'Completed', 'Overtime', 0, 22),
(836, '2024-02-23 08:12:00.000000', '2024-02-23 17:53:00.000000', '1528762738', '2024-02-23 08:12:00.000000', 0, '2024-02-23 17:53:00.000000', 8, '2024-02-23', 'Completed', 'Overtime', 0, 22),
(837, '2024-02-24 07:52:00.000000', '2024-02-24 17:39:00.000000', '1956802398', '2024-02-24 07:52:00.000000', 0, '2024-02-24 17:39:00.000000', 8, '2024-02-24', 'Completed', 'Overtime', 0, 22),
(838, '2024-02-25 07:53:00.000000', '2024-02-25 17:54:00.000000', '0056778201', '2024-02-25 07:53:00.000000', 0, '2024-02-25 17:54:00.000000', 8, '2024-02-25', 'Completed', 'Overtime', 0, 22),
(839, '2024-02-26 07:56:00.000000', '2024-02-26 17:56:00.000000', '101406550X', '2024-02-26 07:56:00.000000', 0, '2024-02-26 17:56:00.000000', 8, '2024-02-26', 'Completed', 'Overtime', 0, 22),
(840, '2024-02-27 07:52:00.000000', '2024-02-27 17:57:00.000000', '0769162770', '2024-02-27 07:52:00.000000', 0, '2024-02-27 17:57:00.000000', 0, '2024-02-27', 'Completed', 'Onsite', 8, 22),
(841, '2024-02-28 08:08:00.000000', '2024-02-28 17:58:00.000000', '0954560825', '2024-02-28 08:08:00.000000', 0, '2024-02-28 17:58:00.000000', 0, '2024-02-28', 'Completed', 'Remote', 8, 22),
(842, '2024-02-29 08:09:00.000000', '2024-02-29 17:53:00.000000', '0035465514', '2024-02-29 08:09:00.000000', 0, '2024-02-29 17:53:00.000000', 8, '2024-02-29', 'Completed', 'Overtime', 0, 22),
(843, '2024-03-01 08:01:00.000000', '2024-03-01 17:57:00.000000', '1815028440', '2024-03-01 08:01:00.000000', 0, '2024-03-01 17:57:00.000000', 0, '2024-03-01', 'Completed', 'Onsite', 8, 22),
(844, '2024-03-02 07:51:00.000000', '2024-03-02 17:45:00.000000', '1894842782', '2024-03-02 07:51:00.000000', 0, '2024-03-02 17:45:00.000000', 0, '2024-03-02', 'Completed', 'Remote', 8, 22),
(845, '2024-03-03 07:56:00.000000', '2024-03-03 17:46:00.000000', '1000282406', '2024-03-03 07:56:00.000000', 0, '2024-03-03 17:46:00.000000', 8, '2024-03-03', 'Completed', 'Overtime', 0, 22),
(846, '2024-03-04 07:50:00.000000', '2024-03-04 17:45:00.000000', '0966748808', '2024-03-04 07:50:00.000000', 0, '2024-03-04 17:45:00.000000', 0, '2024-03-04', 'Completed', 'Onsite', 8, 22),
(847, '2024-03-05 07:53:00.000000', '2024-03-05 17:44:00.000000', '0031471919', '2024-03-05 07:53:00.000000', 0, '2024-03-05 17:44:00.000000', 0, '2024-03-05', 'Completed', 'Remote', 8, 22),
(848, '2024-03-06 07:54:00.000000', '2024-03-06 17:41:00.000000', '1929611072', '2024-03-06 07:54:00.000000', 0, '2024-03-06 17:41:00.000000', 0, '2024-03-06', 'Completed', 'Remote', 8, 22),
(849, '2024-03-07 08:02:00.000000', '2024-03-07 17:47:00.000000', '1711031178', '2024-03-07 08:02:00.000000', 0, '2024-03-07 17:47:00.000000', 8, '2024-03-07', 'Completed', 'Overtime', 0, 22),
(850, '2024-03-08 08:20:00.000000', '2024-03-08 17:52:00.000000', '1962461742', '2024-03-08 08:20:00.000000', 0, '2024-03-08 17:52:00.000000', 8, '2024-03-08', 'Completed', 'Overtime', 0, 22),
(851, '2024-03-09 08:05:00.000000', '2024-03-09 17:33:00.000000', '0887168329', '2024-03-09 08:05:00.000000', 0, '2024-03-09 17:33:00.000000', 8, '2024-03-09', 'Completed', 'Overtime', 0, 22),
(852, '2024-03-10 08:10:00.000000', '2024-03-10 17:57:00.000000', '1981245111', '2024-03-10 08:10:00.000000', 0, '2024-03-10 17:57:00.000000', 0, '2024-03-10', 'Completed', 'Remote', 8, 22),
(853, '2024-03-11 08:20:00.000000', '2024-03-11 17:44:00.000000', '1091352402', '2024-03-11 08:20:00.000000', 0, '2024-03-11 17:44:00.000000', 0, '2024-03-11', 'Completed', 'Onsite', 8, 22),
(854, '2024-03-12 07:58:00.000000', '2024-03-12 17:30:00.000000', '0048028266', '2024-03-12 07:58:00.000000', 0, '2024-03-12 17:30:00.000000', 0, '2024-03-12', 'Completed', 'Onsite', 8, 22),
(855, '2024-03-13 08:10:00.000000', '2024-03-13 17:41:00.000000', '107173203X', '2024-03-13 08:10:00.000000', 0, '2024-03-13 17:41:00.000000', 0, '2024-03-13', 'Completed', 'Onsite', 8, 22),
(856, '2024-03-14 08:02:00.000000', '2024-03-14 17:47:00.000000', '1913690318', '2024-03-14 08:02:00.000000', 0, '2024-03-14 17:47:00.000000', 0, '2024-03-14', 'Completed', 'Onsite', 8, 22),
(857, '2024-03-15 08:16:00.000000', '2024-03-15 17:31:00.000000', '0874774888', '2024-03-15 08:16:00.000000', 0, '2024-03-15 17:31:00.000000', 8, '2024-03-15', 'Completed', 'Overtime', 0, 22),
(858, '2024-03-16 07:55:00.000000', '2024-03-16 17:52:00.000000', '1851619151', '2024-03-16 07:55:00.000000', 0, '2024-03-16 17:52:00.000000', 8, '2024-03-16', 'Completed', 'Overtime', 0, 22),
(859, '2024-03-17 08:24:00.000000', '2024-03-17 17:53:00.000000', '1856398463', '2024-03-17 08:24:00.000000', 0, '2024-03-17 17:53:00.000000', 0, '2024-03-17', 'Completed', 'Onsite', 8, 22),
(860, '2024-03-18 08:15:00.000000', '2024-03-18 17:45:00.000000', '1861335261', '2024-03-18 08:15:00.000000', 0, '2024-03-18 17:45:00.000000', 0, '2024-03-18', 'Completed', 'Remote', 8, 22),
(861, '2024-03-19 08:29:00.000000', '2024-03-19 17:36:00.000000', '0502171529', '2024-03-19 08:29:00.000000', 0, '2024-03-19 17:36:00.000000', 0, '2024-03-19', 'Completed', 'Onsite', 8, 22),
(862, '2024-03-20 08:19:00.000000', '2024-03-20 17:33:00.000000', '0000440833', '2024-03-20 08:19:00.000000', 0, '2024-03-20 17:33:00.000000', 0, '2024-03-20', 'Completed', 'Onsite', 8, 22),
(863, '2024-03-21 08:11:00.000000', '2024-03-21 17:42:00.000000', '1858200032', '2024-03-21 08:11:00.000000', 0, '2024-03-21 17:42:00.000000', 0, '2024-03-21', 'Completed', 'Onsite', 8, 22),
(864, '2024-03-22 08:12:00.000000', '2024-03-22 17:39:00.000000', '1957657154', '2024-03-22 08:12:00.000000', 0, '2024-03-22 17:39:00.000000', 8, '2024-03-22', 'Completed', 'Overtime', 0, 22),
(865, '2024-03-23 08:27:00.000000', '2024-03-23 17:34:00.000000', '0077320352', '2024-03-23 08:27:00.000000', 0, '2024-03-23 17:34:00.000000', 8, '2024-03-23', 'Completed', 'Overtime', 0, 22),
(866, '2024-03-24 07:50:00.000000', '2024-03-24 17:54:00.000000', '1995356700', '2024-03-24 07:50:00.000000', 0, '2024-03-24 17:54:00.000000', 0, '2024-03-24', 'Completed', 'Remote', 8, 22),
(867, '2024-03-25 08:01:00.000000', '2024-03-25 17:35:00.000000', '1025322835', '2024-03-25 08:01:00.000000', 0, '2024-03-25 17:35:00.000000', 0, '2024-03-25', 'Completed', 'Onsite', 8, 22),
(868, '2024-03-26 08:08:00.000000', '2024-03-26 17:34:00.000000', '0914911686', '2024-03-26 08:08:00.000000', 0, '2024-03-26 17:34:00.000000', 0, '2024-03-26', 'Completed', 'Onsite', 8, 22),
(869, '2024-03-27 08:14:00.000000', '2024-03-27 17:36:00.000000', '0958264813', '2024-03-27 08:14:00.000000', 0, '2024-03-27 17:36:00.000000', 0, '2024-03-27', 'Completed', 'Onsite', 8, 22),
(870, '2024-03-28 08:16:00.000000', '2024-03-28 17:32:00.000000', '0951402382', '2024-03-28 08:16:00.000000', 0, '2024-03-28 17:32:00.000000', 0, '2024-03-28', 'Completed', 'Remote', 8, 22),
(871, '2024-03-29 07:58:00.000000', '2024-03-29 17:42:00.000000', '1022702327', '2024-03-29 07:58:00.000000', 0, '2024-03-29 17:42:00.000000', 8, '2024-03-29', 'Completed', 'Overtime', 0, 22),
(872, '2024-03-30 08:05:00.000000', '2024-03-30 17:39:00.000000', '1922908150', '2024-03-30 08:05:00.000000', 0, '2024-03-30 17:39:00.000000', 8, '2024-03-30', 'Completed', 'Overtime', 0, 22),
(873, '2024-03-31 08:09:00.000000', '2024-03-31 17:35:00.000000', '0088638502', '2024-03-31 08:09:00.000000', 0, '2024-03-31 17:35:00.000000', 8, '2024-03-31', 'Completed', 'Overtime', 0, 22),
(874, '2024-04-01 08:26:00.000000', '2024-04-01 17:48:00.000000', '0037732102', '2024-04-01 08:26:00.000000', 0, '2024-04-01 17:48:00.000000', 0, '2024-04-01', 'Completed', 'Onsite', 8, 22),
(875, '2024-04-02 07:51:00.000000', '2024-04-02 17:38:00.000000', '103591767X', '2024-04-02 07:51:00.000000', 0, '2024-04-02 17:38:00.000000', 0, '2024-04-02', 'Completed', 'Onsite', 8, 22),
(876, '2024-04-03 08:14:00.000000', '2024-04-03 17:44:00.000000', '1986044238', '2024-04-03 08:14:00.000000', 0, '2024-04-03 17:44:00.000000', 8, '2024-04-03', 'Completed', 'Overtime', 0, 22),
(877, '2024-04-04 08:04:00.000000', '2024-04-04 17:36:00.000000', '175313143X', '2024-04-04 08:04:00.000000', 0, '2024-04-04 17:36:00.000000', 0, '2024-04-04', 'Completed', 'Remote', 8, 22),
(878, '2024-04-05 08:17:00.000000', '2024-04-05 17:37:00.000000', '0575967765', '2024-04-05 08:17:00.000000', 0, '2024-04-05 17:37:00.000000', 0, '2024-04-05', 'Completed', 'Onsite', 8, 22),
(879, '2024-04-06 08:06:00.000000', '2024-04-06 17:34:00.000000', '1346824061', '2024-04-06 08:06:00.000000', 0, '2024-04-06 17:34:00.000000', 0, '2024-04-06', 'Completed', 'Onsite', 8, 22),
(880, '2024-04-07 08:28:00.000000', '2024-04-07 17:38:00.000000', '0956430287', '2024-04-07 08:28:00.000000', 0, '2024-04-07 17:38:00.000000', 0, '2024-04-07', 'Completed', 'Onsite', 8, 22),
(881, '2024-04-08 07:57:00.000000', '2024-04-08 17:55:00.000000', '1805788612', '2024-04-08 07:57:00.000000', 0, '2024-04-08 17:55:00.000000', 8, '2024-04-08', 'Completed', 'Overtime', 0, 22),
(882, '2024-04-09 08:06:00.000000', '2024-04-09 17:44:00.000000', '1913133478', '2024-04-09 08:06:00.000000', 0, '2024-04-09 17:44:00.000000', 0, '2024-04-09', 'Completed', 'Onsite', 8, 22),
(883, '2024-04-10 07:57:00.000000', '2024-04-10 17:51:00.000000', '0353924458', '2024-04-10 07:57:00.000000', 0, '2024-04-10 17:51:00.000000', 0, '2024-04-10', 'Completed', 'Onsite', 8, 22),
(884, '2024-04-11 07:55:00.000000', '2024-04-11 17:50:00.000000', '0727533061', '2024-04-11 07:55:00.000000', 0, '2024-04-11 17:50:00.000000', 0, '2024-04-11', 'Completed', 'Remote', 8, 22),
(885, '2024-04-12 08:25:00.000000', '2024-04-12 17:41:00.000000', '0942780019', '2024-04-12 08:25:00.000000', 0, '2024-04-12 17:41:00.000000', 8, '2024-04-12', 'Completed', 'Overtime', 0, 22),
(886, '2024-04-13 08:19:00.000000', '2024-04-13 17:40:00.000000', '1002076455', '2024-04-13 08:19:00.000000', 0, '2024-04-13 17:40:00.000000', 0, '2024-04-13', 'Completed', 'Onsite', 8, 22),
(887, '2024-04-14 08:20:00.000000', '2024-04-14 17:41:00.000000', '1438124562', '2024-04-14 08:20:00.000000', 0, '2024-04-14 17:41:00.000000', 8, '2024-04-14', 'Completed', 'Overtime', 0, 22),
(888, '2024-04-15 08:10:00.000000', '2024-04-15 17:37:00.000000', '1680072242', '2024-04-15 08:10:00.000000', 0, '2024-04-15 17:37:00.000000', 0, '2024-04-15', 'Completed', 'Remote', 8, 22),
(889, '2024-04-16 07:54:00.000000', '2024-04-16 17:44:00.000000', '1624263089', '2024-04-16 07:54:00.000000', 0, '2024-04-16 17:44:00.000000', 0, '2024-04-16', 'Completed', 'Remote', 8, 22),
(890, '2024-04-17 08:02:00.000000', '2024-04-17 17:55:00.000000', '077822113X', '2024-04-17 08:02:00.000000', 0, '2024-04-17 17:55:00.000000', 0, '2024-04-17', 'Completed', 'Onsite', 8, 22),
(891, '2024-04-18 08:07:00.000000', '2024-04-18 17:42:00.000000', '187563438X', '2024-04-18 08:07:00.000000', 0, '2024-04-18 17:42:00.000000', 0, '2024-04-18', 'Completed', 'Onsite', 8, 22),
(892, '2024-04-19 08:13:00.000000', '2024-04-19 17:52:00.000000', '1677883626', '2024-04-19 08:13:00.000000', 0, '2024-04-19 17:52:00.000000', 0, '2024-04-19', 'Completed', 'Onsite', 8, 22),
(893, '2024-04-20 07:52:00.000000', '2024-04-20 17:48:00.000000', '0742500748', '2024-04-20 07:52:00.000000', 0, '2024-04-20 17:48:00.000000', 8, '2024-04-20', 'Completed', 'Overtime', 0, 22),
(894, '2024-04-21 08:15:00.000000', '2024-04-21 17:32:00.000000', '0085248290', '2024-04-21 08:15:00.000000', 0, '2024-04-21 17:32:00.000000', 0, '2024-04-21', 'Completed', 'Onsite', 8, 22),
(895, '2024-04-22 08:03:00.000000', '2024-04-22 17:47:00.000000', '0746436262', '2024-04-22 08:03:00.000000', 0, '2024-04-22 17:47:00.000000', 8, '2024-04-22', 'Completed', 'Overtime', 0, 22),
(896, '2024-04-23 07:50:00.000000', '2024-04-23 17:34:00.000000', '0089084462', '2024-04-23 07:50:00.000000', 0, '2024-04-23 17:34:00.000000', 8, '2024-04-23', 'Completed', 'Overtime', 0, 22),
(897, '2024-04-24 08:29:00.000000', '2024-04-24 17:47:00.000000', '0905512405', '2024-04-24 08:29:00.000000', 0, '2024-04-24 17:47:00.000000', 0, '2024-04-24', 'Completed', 'Onsite', 8, 22),
(898, '2024-04-25 08:09:00.000000', '2024-04-25 17:47:00.000000', '0976474875', '2024-04-25 08:09:00.000000', 0, '2024-04-25 17:47:00.000000', 0, '2024-04-25', 'Completed', 'Remote', 8, 22),
(899, '2024-04-26 08:14:00.000000', '2024-04-26 17:47:00.000000', '0965645908', '2024-04-26 08:14:00.000000', 0, '2024-04-26 17:47:00.000000', 8, '2024-04-26', 'Completed', 'Overtime', 0, 22),
(900, '2024-04-27 08:25:00.000000', '2024-04-27 17:41:00.000000', '1782516948', '2024-04-27 08:25:00.000000', 0, '2024-04-27 17:41:00.000000', 0, '2024-04-27', 'Completed', 'Onsite', 8, 22),
(901, '2024-04-28 08:04:00.000000', '2024-04-28 17:45:00.000000', '0011268158', '2024-04-28 08:04:00.000000', 0, '2024-04-28 17:45:00.000000', 0, '2024-04-28', 'Completed', 'Remote', 8, 22),
(902, '2024-04-29 07:53:00.000000', '2024-04-29 17:40:00.000000', '0047459239', '2024-04-29 07:53:00.000000', 0, '2024-04-29 17:40:00.000000', 8, '2024-04-29', 'Completed', 'Overtime', 0, 22),
(903, '2024-04-30 08:20:00.000000', '2024-04-30 17:57:00.000000', '1631318349', '2024-04-30 08:20:00.000000', 0, '2024-04-30 17:57:00.000000', 8, '2024-04-30', 'Completed', 'Overtime', 0, 22),
(904, '2024-05-01 08:11:00.000000', '2024-05-01 17:50:00.000000', '1965873138', '2024-05-01 08:11:00.000000', 0, '2024-05-01 17:50:00.000000', 8, '2024-05-01', 'Completed', 'Overtime', 0, 22),
(905, '2024-05-02 08:07:00.000000', '2024-05-02 17:56:00.000000', '100700102X', '2024-05-02 08:07:00.000000', 0, '2024-05-02 17:56:00.000000', 8, '2024-05-02', 'Completed', 'Overtime', 0, 22),
(906, '2024-05-03 07:56:00.000000', '2024-05-03 17:43:00.000000', '073053359X', '2024-05-03 07:56:00.000000', 0, '2024-05-03 17:43:00.000000', 0, '2024-05-03', 'Completed', 'Remote', 8, 22),
(907, '2024-05-04 08:10:00.000000', '2024-05-04 17:48:00.000000', '1545462704', '2024-05-04 08:10:00.000000', 0, '2024-05-04 17:48:00.000000', 0, '2024-05-04', 'Completed', 'Remote', 8, 22),
(908, '2024-05-05 08:09:00.000000', '2024-05-05 17:40:00.000000', '0960411380', '2024-05-05 08:09:00.000000', 0, '2024-05-05 17:40:00.000000', 8, '2024-05-05', 'Completed', 'Overtime', 0, 22),
(909, '2024-05-06 08:06:00.000000', '2024-05-06 17:54:00.000000', '1895771382', '2024-05-06 08:06:00.000000', 0, '2024-05-06 17:54:00.000000', 0, '2024-05-06', 'Completed', 'Onsite', 8, 22),
(910, '2024-05-07 08:14:00.000000', '2024-05-07 17:56:00.000000', '1044243546', '2024-05-07 08:14:00.000000', 0, '2024-05-07 17:56:00.000000', 8, '2024-05-07', 'Completed', 'Overtime', 0, 22),
(911, '2024-05-08 08:28:00.000000', '2024-05-08 17:30:00.000000', '1947628054', '2024-05-08 08:28:00.000000', 0, '2024-05-08 17:30:00.000000', 0, '2024-05-08', 'Completed', 'Onsite', 8, 22),
(912, '2024-05-09 08:17:00.000000', '2024-05-09 17:53:00.000000', '0082503877', '2024-05-09 08:17:00.000000', 0, '2024-05-09 17:53:00.000000', 8, '2024-05-09', 'Completed', 'Overtime', 0, 22),
(913, '2024-05-10 07:50:00.000000', '2024-05-10 17:34:00.000000', '1020778091', '2024-05-10 07:50:00.000000', 0, '2024-05-10 17:34:00.000000', 0, '2024-05-10', 'Completed', 'Onsite', 8, 22),
(914, '2024-05-11 07:54:00.000000', '2024-05-11 17:51:00.000000', '0339112255', '2024-05-11 07:54:00.000000', 0, '2024-05-11 17:51:00.000000', 0, '2024-05-11', 'Completed', 'Remote', 8, 22),
(915, '2024-05-12 07:53:00.000000', '2024-05-12 17:31:00.000000', '1075838436', '2024-05-12 07:53:00.000000', 0, '2024-05-12 17:31:00.000000', 8, '2024-05-12', 'Completed', 'Overtime', 0, 22),
(916, '2024-05-13 08:21:00.000000', '2024-05-13 17:44:00.000000', '0974163457', '2024-05-13 08:21:00.000000', 0, '2024-05-13 17:44:00.000000', 0, '2024-05-13', 'Completed', 'Remote', 8, 22),
(917, '2024-05-14 08:19:00.000000', '2024-05-14 17:46:00.000000', '0962205230', '2024-05-14 08:19:00.000000', 0, '2024-05-14 17:46:00.000000', 0, '2024-05-14', 'Completed', 'Onsite', 8, 22),
(918, '2024-05-15 07:52:00.000000', '2024-05-15 17:57:00.000000', '1936038773', '2024-05-15 07:52:00.000000', 0, '2024-05-15 17:57:00.000000', 0, '2024-05-15', 'Completed', 'Remote', 8, 22);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tokens`
--

CREATE TABLE `tokens` (
  `id` bigint(20) NOT NULL,
  `expiration_date` datetime(6) DEFAULT NULL,
  `expired` bit(1) NOT NULL,
  `is_mobile` tinyint(1) DEFAULT NULL,
  `refresh_expiration_date` datetime(6) DEFAULT NULL,
  `refresh_token` varchar(255) DEFAULT NULL,
  `revoked` bit(1) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `token_type` varchar(50) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `total_hours`
--

CREATE TABLE `total_hours` (
  `id` bigint(20) NOT NULL,
  `create_at` datetime(6) DEFAULT NULL,
  `update_at` datetime(6) DEFAULT NULL,
  `total_leave_hours` float DEFAULT NULL,
  `total_overtime_hours` float DEFAULT NULL,
  `total_working_hours` float DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `create_at` datetime(6) DEFAULT NULL,
  `update_at` datetime(6) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `department_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `create_at`, `update_at`, `email`, `full_name`, `password`, `username`, `department_id`, `role_id`) VALUES
(1, '2024-04-22 12:59:06.000000', '2024-04-22 12:59:06.000000', 'admin2@gmail.com', NULL, '$2a$10$N1JZL8QdSWqdxP1Qysn56e82HKAvlE28tgAET.0nK1b/ClOAS9v/W', 'admin', NULL, 1),
(2, '2024-04-22 13:02:26.000000', '2024-04-22 13:02:26.000000', 'a@gmail.com', 'Nguyen Van A', '$2a$10$3XlGABLiJL/pxNkP.GpVDOx/HR1VVZ4g8NYgOH8d6.3XB83fi5IbG', '64768031', NULL, 3),
(3, '2024-04-22 13:02:45.000000', '2024-05-12 03:28:44.000000', 'a@gmail.com', 'Nguyen Van B', '$2a$10$VKGT1tL.jBfNKeHVyr3DfeaKC6rZ7mAqRt0jVMI84EmZhT7MTH9.i', '85391060', NULL, 3),
(4, '2024-04-22 13:02:51.000000', '2024-04-22 13:02:51.000000', 'a@gmail.com', 'Nguyen Van C', '$2a$10$mbjpKbxj32CSncDb36PMSegZyNefIp3mMFcGMFnX.WTH/kLkaLf56', '95191476', NULL, 3),
(5, '2024-04-22 13:02:58.000000', '2024-04-22 13:02:58.000000', 'a@gmail.com', 'Nguyen Van D', '$2a$10$8Hf3F/Y9zL7bQk7VGEinxeEHu1.dQPbdNLxg.nY4vteEzvC9XJTa2', '57875602', NULL, 3),
(6, '2024-04-22 13:03:05.000000', '2024-04-22 13:03:05.000000', 'a@gmail.com', 'Nguyen Van E', '$2a$10$XVkoH.bjrrqbg4pqgd88XOTmjWnIU2QxOZ8977yYr66jjDQRCmB5e', '84189984', NULL, 3),
(7, '2024-04-22 13:03:10.000000', '2024-04-22 13:03:10.000000', 'a@gmail.com', 'Nguyen Van F', '$2a$10$fUZR7RTuToW4o2zXcQiGbeD42khbVwmAn/70ai44deheT4Cq.raOe', '25401837', NULL, 3),
(8, '2024-04-22 13:03:16.000000', '2024-04-22 13:03:16.000000', 'a@gmail.com', 'Nguyen Van G', '$2a$10$zlM1zPR70dv3TyNYHjff0uGksjbpy/pn9fpat.MENlvUWw8E.L.Em', '70714218', NULL, 3),
(9, '2024-04-22 13:03:20.000000', '2024-04-22 13:03:20.000000', 'a@gmail.com', 'Nguyen Van H', '$2a$10$aIfC/Wki2EPtB0pNXmZXWe2RfbKYbvuIkg4JA6C90kFVIjZqg0aju', '31696352', NULL, 3),
(10, '2024-04-22 13:04:13.000000', '2024-04-22 13:04:13.000000', 'a@gmail.com', 'Nguyen Van I', '$2a$10$SaC9.b26jG0GuNJsIX3F1uADvNZnYnPeGxWcwqpupaXEo4TaGdGJq', '26493413', NULL, 3),
(11, '2024-04-22 13:04:17.000000', '2024-04-22 13:04:17.000000', 'a@gmail.com', 'Nguyen Van K', '$2a$10$uXZ6PgcXb0oQh.dd7/V/D.X7tOYE6EzYYfGCVl/0IPZzS/CwlgBhO', '66236874', NULL, 3),
(12, '2024-04-22 13:04:21.000000', '2024-04-22 13:04:21.000000', 'a@gmail.com', 'Nguyen Van L', '$2a$10$bKMG/Z5tuLVHOxoqSJe4POzvyxmNmSK4XULuPO5TAkJgG3AnyUJqe', '19689411', NULL, 3),
(13, '2024-04-22 13:04:24.000000', '2024-04-22 13:04:24.000000', 'a@gmail.com', 'Nguyen Van M', '$2a$10$Y.hlynuRn/gtwrv3IzExr.oiHf2A0gYSw1iH.5Yb2lvzRG0r7VEGi', '83341356', NULL, 3),
(16, '2024-04-22 19:44:55.000000', '2024-04-22 19:44:55.000000', 'manager1@gmail.com', NULL, '$2a$10$OqoleQC0avtaHbG3U7Dy3u2raWaX0qPy5Yte6PvHE8NL.V2kPf.eS', 'Manager_1', NULL, 2),
(17, '2024-04-22 19:45:05.000000', '2024-04-22 19:45:05.000000', 'manager1@gmail.com', NULL, '$2a$10$n47ekav3WgynJTbbvblWe.IkfnM0/JroU92inNnL1eA6umHLRNoMW', 'Manager_2', NULL, 2),
(18, '2024-04-22 19:45:09.000000', '2024-04-22 19:45:09.000000', 'manager1@gmail.com', NULL, '$2a$10$0/sOu3DUDqWa4UXi8pxrz.xY3nBvpgSnrDWRnvr5RDhL.V5E3MECK', 'Manager_3', NULL, 2),
(19, '2024-04-22 19:45:19.000000', '2024-04-22 19:45:19.000000', 'manager1@gmail.com', NULL, '$2a$10$YGi5Er7dDOmLLIPAx2xD/usAwdBigjQhQoHD9JFw/KAtJ1FMeCovy', 'Manager_4', NULL, 2),
(20, '2024-05-20 13:41:33.000000', '2024-05-20 13:41:33.000000', 'a@gmail.com', 'Nguyen Van O', '$2a$10$aw/wCcvWrBcESR4g2sCsdezBmIYESa.T2SYAc4j74t6gsIW0nEPs2', '89566939', NULL, 3),
(21, '2024-05-20 13:53:24.000000', '2024-05-20 13:53:24.000000', 'a@gmail.com', 'Nguyen Van O', '$2a$10$uOpKYFqHiorcTlhUPHVNte7dSNJi/S0JrClfi2m4A4g/ttxXLQw0C', '46172442', NULL, 3),
(22, '2024-05-20 16:03:25.000000', '2024-05-20 16:03:25.000000', 'duc.leanh0312@gmail.com', 'Lê Anh Đức', '$2a$10$jBOWzTIJR9PTjSP52WCvRO92nBbT6W/2qKdC.n34APgmzmbKfqlte', '43218335', NULL, 3);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `benefits`
--
ALTER TABLE `benefits`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_7gmwxbnbpch9998lhtc92v7m` (`user_id`);

--
-- Chỉ mục cho bảng `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `departments_details`
--
ALTER TABLE `departments_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKp356e9rjl9cb7qe8vgs1lc5p1` (`department_id`),
  ADD KEY `FK7hf2i9uwj2jqugicw6mpo9m0l` (`employee_id`);

--
-- Chỉ mục cho bảng `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_j2dmgsma6pont6kf7nic9elpd` (`user_id`),
  ADD UNIQUE KEY `UK_gr4mvp5x91uswwni3uxf0ddlk` (`benifit`),
  ADD UNIQUE KEY `UK_1pquum693bxjobqb5ppu6d49u` (`payroll`),
  ADD KEY `FKgy4qe3dnqrm3ktd76sxp7n4c2` (`department_id`);

--
-- Chỉ mục cho bảng `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `in_out_forget`
--
ALTER TABLE `in_out_forget`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKq5y2augeucnse68nkhpem2dt2` (`approver_id`),
  ADD KEY `FKff8xky132db0x8m2oq2jl74gf` (`user_id`);

--
-- Chỉ mục cho bảng `leaves`
--
ALTER TABLE `leaves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKnsi0vy810arunkqmpcpj32c9s` (`approver_id`),
  ADD KEY `FKa3vfaevh5a44ccfq2wodxoxig` (`user_id`);

--
-- Chỉ mục cho bảng `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK3qvva8ftw201mxkeuirniflgb` (`author_id`);

--
-- Chỉ mục cho bảng `overtimes`
--
ALTER TABLE `overtimes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK2tbbwnejvb9w1wo9bicw9e0jt` (`approver_id`),
  ADD KEY `FKbef68wmnxvvharfehmtrbepp3` (`user_id`);

--
-- Chỉ mục cho bảng `payroll`
--
ALTER TABLE `payroll`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_8txmgflvd6qfdegi8aivbpfyu` (`user_id`);

--
-- Chỉ mục cho bảng `remotes`
--
ALTER TABLE `remotes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKi279i6filtw4sgnubghswxj4n` (`approver_id`),
  ADD KEY `FKkwg06vpb1vf7txvckemxxy1nm` (`user_id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `time_sheets`
--
ALTER TABLE `time_sheets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKrya2n0ndau74fhqewp3p8ttb6` (`user_id`);

--
-- Chỉ mục cho bảng `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK2dylsfo39lgjyqml2tbe0b0ss` (`user_id`);

--
-- Chỉ mục cho bảng `total_hours`
--
ALTER TABLE `total_hours`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_hiub74s0xo4jf4b37vj0hl0j9` (`user_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKsbg59w8q63i0oo53rlgvlcnjq` (`department_id`),
  ADD KEY `FKp56c1712k691lhsyewcssf40f` (`role_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `benefits`
--
ALTER TABLE `benefits`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `departments_details`
--
ALTER TABLE `departments_details`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `in_out_forget`
--
ALTER TABLE `in_out_forget`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `leaves`
--
ALTER TABLE `leaves`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `news`
--
ALTER TABLE `news`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `overtimes`
--
ALTER TABLE `overtimes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `payroll`
--
ALTER TABLE `payroll`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `remotes`
--
ALTER TABLE `remotes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `time_sheets`
--
ALTER TABLE `time_sheets`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=919;

--
-- AUTO_INCREMENT cho bảng `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `total_hours`
--
ALTER TABLE `total_hours`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `benefits`
--
ALTER TABLE `benefits`
  ADD CONSTRAINT `FKohgk23jmp90u78n2fyjter7dx` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `departments_details`
--
ALTER TABLE `departments_details`
  ADD CONSTRAINT `FK7hf2i9uwj2jqugicw6mpo9m0l` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `FKp356e9rjl9cb7qe8vgs1lc5p1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`);

--
-- Các ràng buộc cho bảng `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `FK69x3vjuy1t5p18a5llb8h2fjx` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKgy4qe3dnqrm3ktd76sxp7n4c2` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  ADD CONSTRAINT `FKhmlfdwyydemhjdvmp4andyd7s` FOREIGN KEY (`benifit`) REFERENCES `benefits` (`id`),
  ADD CONSTRAINT `FKiaklkgaxbj2wye6i2ipjq3wr4` FOREIGN KEY (`payroll`) REFERENCES `payroll` (`id`);

--
-- Các ràng buộc cho bảng `in_out_forget`
--
ALTER TABLE `in_out_forget`
  ADD CONSTRAINT `FKff8xky132db0x8m2oq2jl74gf` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKq5y2augeucnse68nkhpem2dt2` FOREIGN KEY (`approver_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `leaves`
--
ALTER TABLE `leaves`
  ADD CONSTRAINT `FKa3vfaevh5a44ccfq2wodxoxig` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKnsi0vy810arunkqmpcpj32c9s` FOREIGN KEY (`approver_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `FK3qvva8ftw201mxkeuirniflgb` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `overtimes`
--
ALTER TABLE `overtimes`
  ADD CONSTRAINT `FK2tbbwnejvb9w1wo9bicw9e0jt` FOREIGN KEY (`approver_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKbef68wmnxvvharfehmtrbepp3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `payroll`
--
ALTER TABLE `payroll`
  ADD CONSTRAINT `FKmlesr2hfrhtmj68jqpe8rj4qx` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `remotes`
--
ALTER TABLE `remotes`
  ADD CONSTRAINT `FKi279i6filtw4sgnubghswxj4n` FOREIGN KEY (`approver_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKkwg06vpb1vf7txvckemxxy1nm` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `time_sheets`
--
ALTER TABLE `time_sheets`
  ADD CONSTRAINT `FKrya2n0ndau74fhqewp3p8ttb6` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `tokens`
--
ALTER TABLE `tokens`
  ADD CONSTRAINT `FK2dylsfo39lgjyqml2tbe0b0ss` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `total_hours`
--
ALTER TABLE `total_hours`
  ADD CONSTRAINT `FKmwd0dcg5fuudj0uy4vn2ju7u4` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FKp56c1712k691lhsyewcssf40f` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `FKsbg59w8q63i0oo53rlgvlcnjq` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
