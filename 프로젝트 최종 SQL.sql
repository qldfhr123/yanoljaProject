-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        11.2.0-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- yanolja 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `yanolja` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `yanolja`;

-- 테이블 yanolja.admin 구조 내보내기
CREATE TABLE IF NOT EXISTS `admin` (
  `admin_location` varchar(60) NOT NULL,
  `region` varchar(50) NOT NULL,
  `admin_pw` varchar(60) DEFAULT NULL,
  `business_number` varchar(60) NOT NULL,
  `admin_mobile` varchar(20) NOT NULL,
  `admin_id` varchar(20) NOT NULL,
  `admin_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`admin_location`,`region`,`business_number`,`admin_mobile`,`admin_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- 테이블 데이터 yanolja.admin:~1 rows (대략적) 내보내기
INSERT INTO `admin` (`admin_location`, `region`, `admin_pw`, `business_number`, `admin_mobile`, `admin_id`, `admin_name`) VALUES
	('03722 서울 서대문구 연세로 50 , 연세대학교 ', '서울', '$2a$10$g9GvG29vxaH6oWBlsvJm4eLPwtm2ro8vstS/nOkOTgqhNTRvYi8Qi', '1231651531', '010-1234-1234', 'test1', '테스트일');

-- 테이블 yanolja.admin_review 구조 내보내기
CREATE TABLE IF NOT EXISTS `admin_review` (
  `admin_content` varchar(100) DEFAULT NULL,
  `rese_num` varchar(20) DEFAULT NULL,
  `host_name` varchar(100) DEFAULT NULL,
  `admin_name` varchar(20) DEFAULT NULL,
  `region` varchar(20) DEFAULT NULL,
  `lod_type` varchar(20) DEFAULT NULL,
  `room_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- 테이블 데이터 yanolja.admin_review:~0 rows (대략적) 내보내기

-- 테이블 yanolja.cart 구조 내보내기
CREATE TABLE IF NOT EXISTS `cart` (
  `rese_num` varchar(20) DEFAULT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `user_id` varchar(20) NOT NULL,
  `user_mobile` varchar(60) NOT NULL,
  `host_name` varchar(100) DEFAULT NULL,
  `room_name` varchar(40) NOT NULL,
  `admin_name` varchar(20) DEFAULT NULL,
  `region` varchar(40) DEFAULT NULL,
  `room_info` varchar(400) DEFAULT NULL,
  `room_type` varchar(20) DEFAULT NULL,
  `room_price` varchar(20) DEFAULT NULL,
  `id_select_lod` varchar(20) DEFAULT NULL,
  `children` varchar(20) DEFAULT NULL,
  `people` varchar(20) DEFAULT NULL,
  `check_in` varchar(20) NOT NULL,
  `check_out` varchar(20) DEFAULT NULL,
  `people_plus` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`room_name`,`check_in`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- 테이블 데이터 yanolja.cart:~0 rows (대략적) 내보내기

-- 테이블 yanolja.member 구조 내보내기
CREATE TABLE IF NOT EXISTS `member` (
  `user_name` varchar(20) DEFAULT NULL,
  `user_id` varchar(20) NOT NULL,
  `user_pw` varchar(60) DEFAULT NULL,
  `user_mobile` varchar(60) NOT NULL,
  `user_dob` varchar(60) DEFAULT NULL,
  `user_email` varchar(60) DEFAULT NULL,
  `user_snsC` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`user_mobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- 테이블 데이터 yanolja.member:~1 rows (대략적) 내보내기
INSERT INTO `member` (`user_name`, `user_id`, `user_pw`, `user_mobile`, `user_dob`, `user_email`, `user_snsC`) VALUES
	('유저일', 'user1', '$2a$10$VrkyEN52mZVFwmkf0tplO.sR8A1WXGUHGO9BMO6DK3dvjA6NG6Num', '010-1234-0001', '19480218', 'jh@mail.com', '회원가입');

-- 테이블 yanolja.rental 구조 내보내기
CREATE TABLE IF NOT EXISTS `rental` (
  `host_name` varchar(50) DEFAULT NULL,
  `room_name` varchar(40) DEFAULT NULL,
  `room_img` varchar(200) DEFAULT NULL,
  `region` varchar(50) DEFAULT NULL,
  `min_people` varchar(50) DEFAULT NULL,
  `max_people` varchar(50) DEFAULT NULL,
  `room_pay` varchar(20) DEFAULT NULL,
  `room_num` varchar(20) DEFAULT NULL,
  `address` varchar(60) DEFAULT NULL,
  `lod_type` varchar(20) DEFAULT NULL,
  `info` varchar(60) DEFAULT NULL,
  `service` varchar(150) DEFAULT NULL,
  `Rental_type` varchar(20) DEFAULT NULL,
  `deadline_C` varchar(20) DEFAULT NULL,
  `sleep_type` varchar(20) DEFAULT NULL,
  `startTime` varchar(20) DEFAULT NULL,
  `endTime` varchar(20) DEFAULT NULL,
  `useTime` varchar(20) DEFAULT NULL,
  `Representative_photo` varchar(150) DEFAULT NULL,
  `admin_id` varchar(20) DEFAULT NULL,
  `admin_name` varchar(20) DEFAULT NULL,
  `admin_location` varchar(60) DEFAULT NULL,
  `admin_mobile` varchar(20) DEFAULT NULL,
  `Business_Number` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- 테이블 데이터 yanolja.rental:~29 rows (대략적) 내보내기
INSERT INTO `rental` (`host_name`, `room_name`, `room_img`, `region`, `min_people`, `max_people`, `room_pay`, `room_num`, `address`, `lod_type`, `info`, `service`, `Rental_type`, `deadline_C`, `sleep_type`, `startTime`, `endTime`, `useTime`, `Representative_photo`, `admin_id`, `admin_name`, `admin_location`, `admin_mobile`, `Business_Number`) VALUES
	('라마다프라자 호텔', '디럭스 패밀리 온돌 하프오션', '2.jpg', '경기', '2', '4', '580000', NULL, '서울 강남구 가로수길 9테스트주소', NULL, '테스트안내', '와이파이,객실금연,수화물보관', '모텔', '가능', '대실', '10시', '16시', NULL, '2.jpg', 'test1', '테스트일', NULL, NULL, NULL),
	('라마다프라자 호텔', '슈페리어 트윈 마운틴', '2.jpg', '경기', '2', '2', '100000', NULL, '서울 강남구 가로수길 9테스트주소', NULL, '테스트안내', '와이파이,객실금연,수화물보관', '호텔/리조트', '가능', '숙박', '10시', '20시', '10시간', '2.jpg', 'test1', '테스트일', NULL, NULL, NULL),
	('라마다프라자 호텔', '디럭스 온돌 하프오션', '2.jpg', '경기', '2', '4', '580000', NULL, '서울 강남구 가로수길 9테스트주소', NULL, '테스트안내', '와이파이,객실금연,수화물보관', '캠핑/글램핑', '가능', '숙박', '10시', '16시', NULL, '2.jpg', 'test1', '테스트일', NULL, NULL, NULL),
	('소피텔 앰배서더 서울 호텔&서비스드 레지던스', '레이크 트윈', '3.jpg', '서울', '2', '4', '580000', NULL, '서울 강남구 가로수길 9테스트주소', NULL, '테스트안내', '와이파이,객실금연,수화물보관', '펜션/풀빌라', '가능', '숙박', '10시', '16시', NULL, '3.jpg', 'test1', '테스트일', NULL, NULL, NULL),
	('이그제큐티브 풀빌라', '스탠다드 커플', '5.jpg', '서울', '2', '4', '580000', NULL, '서울 강남구 가로수길 9테스트주소', NULL, '테스트안내', '와이파이,객실금연,수화물보관', '모텔', '가능', '숙박', '10시', '16시', NULL, '5.jpg', 'test1', '테스트일', NULL, NULL, NULL),
	('웨스트힐스 프라이빗 풀빌라', '스탠다드 트윈', '4.jpg', '인천', '2', '4', '580000', NULL, '서울 강남구 가로수길 9테스트주소', NULL, '테스트안내', '와이파이,객실금연,수화물보관', '펜션/풀빌라', '가능', '숙박', '10시', '16시', NULL, '4.jpg', 'test1', '테스트일', NULL, NULL, NULL),
	('웨스트힐스 프라이빗 풀빌라', '스탠다드 커플', '4.jpg', '인천', '2', '4', '580000', NULL, '서울 강남구 가로수길 9테스트주소', NULL, '테스트안내', '와이파이,객실금연,수화물보관', '펜션/풀빌라', '가능', '숙박', '10시', '16시', NULL, '4.jpg', 'test1', '테스트일', NULL, NULL, NULL),
	('웨스트힐스 프라이빗 풀빌라', '디럭스 패밀리', '4.jpg', '인천', '2', '4', '580000', NULL, '서울 강남구 가로수길 9테스트주소', NULL, '테스트안내', '와이파이,객실금연,수화물보관', '펜션/풀빌라', '가능', '숙박', '10시', '16시', NULL, '4.jpg', 'test1', '테스트일', NULL, NULL, NULL),
	('이그제큐티브 풀빌라', '스탠다드 트윈', '5.jpg', '서울', '2', '4', '580000', NULL, '서울 강남구 가로수길 9테스트주소', NULL, '테스트안내', '와이파이,객실금연,수화물보관', '펜션/풀빌라', '가능', '숙박', '10시', '16시', NULL, '5.jpg', 'test1', '테스트일', NULL, NULL, NULL),
	('이그제큐티브 풀빌라', '디럭스 패밀리', '5.jpg', '서울', '2', '4', '580000', NULL, '서울 강남구 가로수길 9테스트주소', NULL, '테스트안내', '와이파이,객실금연,수화물보관', '모텔', '가능', '숙박', '10시', '16시', NULL, '5.jpg', 'test1', '테스트일', NULL, NULL, NULL),
	('라마다프라자 호텔', '슈페리어 트윈 마운틴', '2.jpg', '서울', '2', '4', '580000', NULL, '서울 강남구 가로수길 9테스트주소', NULL, '테스트안내', '와이파이,객실금연,수화물보관', '모텔', '가능', '숙박', '10시', '16시', NULL, '2.jpg', 'test1', '테스트일', NULL, NULL, NULL),
	('소피텔 앰배서더 서울 호텔&서비스드 레지던스', '디럭스 패밀리', '3.jpg', '서울', '2', '4', '580000', NULL, '서울 강남구 가로수길 9테스트주소', NULL, '테스트안내', '와이파이,객실금연,수화물보관', '모텔', '가능', '숙박', '10시', '16시', NULL, '3.jpg', 'test1', '테스트일', NULL, NULL, NULL),
	('소피텔 앰배서더 서울 호텔&서비스드 레지던스', '스탠다드 커플', '3.jpg', '서울', '2', '4', '580000', NULL, '서울 강남구 가로수길 9테스트주소', NULL, '테스트안내', '와이파이,객실금연,수화물보관', '모텔', '가능', '숙박', '10시', '16시', NULL, '3.jpg', 'test1', '테스트일', NULL, NULL, NULL),
	('베네치아 호텔 앤리조트', '파노라마 스위트', '7.jpg', '제주', '2', '4', '580000', NULL, '서울 강남구 가로수길 9테스트주소', NULL, '테스트안내', '와이파이,객실금연,수화물보관', '모텔', '가능', '숙박', '10시', '16시', NULL, '7.jpg', 'test1', '테스트일', NULL, NULL, NULL),
	('베네치아 호텔 앤리조트', '스탠다드 커플', '7.jpg', '제주', '2', '4', '580000', NULL, '서울 강남구 가로수길 9테스트주소', NULL, '테스트안내', '와이파이,객실금연,수화물보관', '모텔', '가능', '숙박', '10시', '16시', NULL, '7.jpg', 'test1', '테스트일', NULL, NULL, NULL),
	('베네치아 호텔 앤리조트', '디럭스 패밀리', '7.jpg', '제주', '2', '4', '580000', NULL, '서울 강남구 가로수길 9테스트주소', NULL, '테스트안내', '와이파이,객실금연,수화물보관', '모텔', '가능', '숙박', '10시', '16시', NULL, '7.jpg', 'test1', '테스트일', NULL, NULL, NULL),
	('그랜드 인터컨티넨탈 서울 파르나스', '시니어 스위트 킹', 'a1.jpg', '서울', '2', '4', '580000', NULL, '서울 강남구 가로수길 9테스트주소', NULL, '테스트안내', '와이파이,객실금연,수화물보관', '호텔/리조트', '가능', '숙박', '10시', '16시', NULL, 'a1.jpg', 'test1', '테스트일', NULL, NULL, NULL),
	('그랜드 인터컨티넨탈 서울 파르나스', '디럭스 키즈 패밀리룸', 'a1.jpg', '서울', '2', '4', '580000', NULL, '서울 강남구 가로수길 9테스트주소', NULL, '테스트안내', '와이파이,객실금연,수화물보관', '호텔/리조트', '가능', '대실', '10시', '16시', NULL, 'a1.jpg', 'test1', '테스트일', NULL, NULL, NULL),
	('그랜드 인터컨티넨탈 서울 파르나스', '주니어 스위트 킹', 'a1.jpg', '서울', '2', '4', '580000', NULL, '서울 강남구 가로수길 9테스트주소', NULL, '테스트안내', '와이파이,객실금연,수화물보관', '호텔/리조트', '가능', '숙박', '10시', '16시', NULL, 'a1.jpg', 'test1', '테스트일', NULL, NULL, NULL),
	('인터컨티넨탈 알펜시아 평창', '스탠다드 킹', '6.jpg', '강원', '2', '4', '580000', NULL, '서울 강남구 가로수길 9테스트주소', NULL, '테스트안내', '와이파이,객실금연,수화물보관', '캠핑/글램핑', '가능', '숙박', '10시', '16시', NULL, '6.jpg', 'test1', '테스트일', NULL, NULL, NULL),
	('인터컨티넨탈 알펜시아 평창', '스탠다드 커플', '6.jpg', '강원', '2', '4', '580000', NULL, '서울 강남구 가로수길 9테스트주소', NULL, '테스트안내', '와이파이,객실금연,수화물보관', '모텔', '가능', '숙박', '10시', '16시', NULL, '6.jpg', 'test1', '테스트일', NULL, NULL, NULL),
	('인터컨티넨탈 알펜시아 평창', '디럭스 키즈 패밀리룸', '6.jpg', '강원', '2', '4', '580000', NULL, '서울 강남구 가로수길 9테스트주소', NULL, '테스트안내', '와이파이,객실금연,수화물보관', '모텔', '가능', '숙박', '10시', '16시', NULL, '6.jpg', 'test1', '테스트일', NULL, NULL, NULL),
	('평창 라마다호텔&스위트 바이 윈덤', '디럭스 키즈 패밀리룸', 'a1.jpg', '서울', '2', '4', '580000', NULL, '서울 강남구 가로수길 9테스트주소', NULL, '테스트안내', '와이파이,객실금연,수화물보관', '캠핑/글램핑', '가능', '숙박', '10시', '16시', NULL, 'a1.jpg', 'test1', '테스트일', NULL, NULL, NULL),
	('평창 라마다호텔&스위트 바이 윈덤', '디럭스 키즈 패밀리룸', 'a1.jpg', '서울', '2', '4', '580000', NULL, '서울 강남구 가로수길 9테스트주소', NULL, '테스트안내', '와이파이,객실금연,수화물보관', '호텔/리조트', '가능', '숙박', '10시', '16시', NULL, 'a1.jpg', 'test1', '테스트일', NULL, NULL, NULL),
	('평창 라마다호텔&스위트 바이 윈덤', '디럭스 키즈 패밀리룸', 'a1.jpg', '서울', '2', '4', '580000', NULL, '서울 강남구 가로수길 9테스트주소', NULL, '테스트안내', '와이파이,객실금연,수화물보관', '모텔', '가능', '숙박', '10시', '16시', NULL, 'a1.jpg', 'test1', '테스트일', NULL, NULL, NULL),
	('호텔1', '객실1', '2.jpg', '서울', '2', '3', '15000', NULL, '서울 서대문구 연세로 1111', NULL, '안내', '주차가능,객실금연', '호텔/리조트', '가능', '숙박', '14시', '14시', '14시간', 'beverly-hills-hotel-2455977_640.jpg', NULL, NULL, NULL, NULL, NULL),
	('호텔1', '객실1', '2.jpg', '서울', '2', '3', '15000', NULL, '서울 서대문구 연세로 1111', NULL, '안내', '주차가능,객실금연', '호텔/리조트', '가능', '대실', '14시', '14시', '14시간', 'beverly-hills-hotel-2455977_640.jpg', NULL, NULL, NULL, NULL, NULL),
	('호텔1', '객실1', '2.jpg', '서울', '2', '3', '15000', NULL, '서울 서대문구 연세로 1111', NULL, '안내', '주차가능,객실금연', '호텔/리조트', '가능', '대실', '14시', '14시', '14시간', 'beverly-hills-hotel-2455977_640.jpg', NULL, NULL, NULL, NULL, NULL),
	('라마다프라자 호텔', '디럭스 패밀리 온돌 하프오션', '2.jpg', '경기', '2', '4', '580000', NULL, '서울 강남구 가로수길 9테스트주소', NULL, '테스트안내', '와이파이,객실금연,수화물보관', '모텔', '가능', '숙박', '10시', '16시', NULL, '2.jpg', 'test1', '테스트일', NULL, NULL, NULL);

-- 테이블 yanolja.reservation 구조 내보내기
CREATE TABLE IF NOT EXISTS `reservation` (
  `rese_num` varchar(12) NOT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `user_id` varchar(20) NOT NULL,
  `user_mobile` varchar(60) NOT NULL,
  `host_name` varchar(100) DEFAULT NULL,
  `room_name` varchar(40) NOT NULL,
  `admin_name` varchar(20) DEFAULT NULL,
  `region` varchar(40) DEFAULT NULL,
  `room_info` varchar(400) DEFAULT NULL,
  `room_type` varchar(20) DEFAULT NULL,
  `room_price` varchar(20) DEFAULT NULL,
  `id_select_lod` varchar(20) DEFAULT NULL,
  `representative_img` varchar(150) DEFAULT NULL,
  `children` varchar(20) DEFAULT NULL,
  `people` varchar(20) DEFAULT NULL,
  `check_in` varchar(20) NOT NULL,
  `check_out` varchar(20) DEFAULT NULL,
  `click_check_in` varchar(20) DEFAULT NULL,
  `click_check_out` varchar(20) DEFAULT NULL,
  `review_state` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`rese_num`,`room_name`,`check_in`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- 테이블 데이터 yanolja.reservation:~9 rows (대략적) 내보내기
INSERT INTO `reservation` (`rese_num`, `user_name`, `user_id`, `user_mobile`, `host_name`, `room_name`, `admin_name`, `region`, `room_info`, `room_type`, `room_price`, `id_select_lod`, `representative_img`, `children`, `people`, `check_in`, `check_out`, `click_check_in`, `click_check_out`, `review_state`) VALUES
	('202209052256', '유저일', 'user1', '010-1111-1111', '신천(잠실새내) FOREST 2호점 (포레스타2)', 'Deluxe', '테스트일', '숙소위치', '필요할 경우 작성', '숙박/대실', '250000', '123456789', 'img/test.JPG', '2', '2', '2023.07.24 (월) 06:00', '2023.07.25 (화) 13:00', '202308252230', '202308262256', '후기작성완료'),
	('202209262256', '유저일', 'user1', '010-1111-1111', '신천(잠실새내) FOREST 2호점 (포레스타2)', 'Deluxe', '테스트일', '숙소위치', '필요할 경우 작성', '숙박/대실', '34000', '123456789', 'img/test.JPG', '2', '2', '2023.07.24 (월) 06:00', '2023.07.25 (화) 13:00', '202308252230', '202308262256', '후기작성완료'),
	('202304262246', '유저일', 'user1', '010-1111-1111', '신천(잠실새내) FOREST 2호점 (포레스타2)', 'Deluxe', '테스트일', '숙소위치', '필요할 경우 작성', '숙박/대실', '126000', '123456789', 'img/test.JPG', '2', '2', '2023.07.24 (월) 06:00', '2023.07.25 (화) 13:00', '202308252230', '202308262256', '후기작성완료'),
	('202306122256', '유저일', 'user1', '010-1111-1111', '신천(잠실새내) FOREST 2호점 (포레스타2)', 'Deluxe', '테스트일', '숙소위치', '필요할 경우 작성', '숙박/대실', '180000', '123456789', 'img/test.JPG', '2', '2', '2023.07.24 (월) 06:00', '2023.07.25 (화) 13:00', '202308252230', '202308262256', '(NULL)'),
	('202308281647', '유저일', 'user1', '010-1111-1111', '신천(잠실새내) FOREST 2호점 (포레스타2)', 'Deluxe', '테스트일', '숙소위치', '필요할 경우 작성', '숙박/대실', '50000', NULL, 'img/test.JPG', '2', '3', '2023.07.24 (월) 06:00', '2023.07.25 (화) 13:00', NULL, NULL, NULL),
	('202308281649', '유저일', 'user1', '010-1111-1111', '신천(잠실새내) FOREST 2호점 (포레스타2)', 'Deluxe', '테스트일', '숙소위치', '필요할 경우 작성', '숙박/대실', '50000', NULL, 'img/test.JPG', '2', '3', '2023.07.24 (월) 06:00', '2023.07.25 (화) 13:00', NULL, NULL, NULL),
	('202308281650', '유저일', 'user1', '010-1111-1111', '신천(잠실새내) FOREST 2호점 (포레스타2)', 'Deluxe', '테스트일', '숙소위치', '필요할 경우 작성', '숙박/대실', '50000', NULL, 'img/test.JPG', '2', '3', '2023.07.24 (월) 06:00', '2023.07.25 (화) 13:00', NULL, NULL, NULL),
	('202308281654', '유저일', 'user1', '010-1111-1111', '신천(잠실새내) FOREST 2호점 (포레스타2)', 'Deluxe', '테스트일', '숙소위치', '필요할 경우 작성', '숙박/대실', '50000', NULL, 'img/test.JPG', '2', '3', '2023.07.24 (월) 06:00', '2023.07.25 (화) 13:00', '202382811659', '202382811659', '후기작성완료'),
	('202308291251', '유저일', 'user1', '010-1234-0001', '라마다프라자 호텔', '디럭스 패밀리 온돌 하프오션', '테스트일', '', NULL, '모텔', '580000', NULL, 'img\\a1.jpg', '3', '2', '2023.09.04 (월) 02:30', '2023.09.06 (수) 11:30', NULL, NULL, NULL);

-- 테이블 yanolja.review 구조 내보내기
CREATE TABLE IF NOT EXISTS `review` (
  `user_id` varchar(20) DEFAULT NULL,
  `rese_num` varchar(20) DEFAULT NULL,
  `room_name` varchar(40) DEFAULT NULL,
  `host_name` varchar(100) DEFAULT NULL,
  `content` varchar(100) DEFAULT NULL,
  `write_date` varchar(60) DEFAULT NULL,
  `review_point` int(11) DEFAULT NULL,
  `admin_id` varchar(50) DEFAULT NULL,
  `admin_content` varchar(50) DEFAULT NULL,
  `admin_write_date` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- 테이블 데이터 yanolja.review:~4 rows (대략적) 내보내기
INSERT INTO `review` (`user_id`, `rese_num`, `room_name`, `host_name`, `content`, `write_date`, `review_point`, `admin_id`, `admin_content`, `admin_write_date`) VALUES
	('user1', '200012121212', 'DELUXE', '신천(잠실새내) FOREST 2호점 (포레스타2)', '잘 놀다 갑니다~', '202308261212', 4, '사업자이름', '리뷰 답변', '2023.08.28'),
	('user1', '200012121212', 'LUNA', '가평 푸른하늘', '방 깨끗하고 사장님 친절합니다.', '202308261212', 5, '사업자이름', '리뷰 답변', '2023.08.28'),
	('user1', '202308281654', 'Deluxe', '신천(잠실새내) FOREST 2호점 (포레스타2)', '28분에 리뷰 작성함', '202308281700', 3, NULL, '리뷰 감사합니다.', '2023.08.28'),
	('user1', '202308291113', '슈페리어 트윈 마운틴', '라마다프라자 호텔', '별로임 진짜', '202308291117', 1, NULL, '', '');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
