
-- DB 생성 쿼리
CREATE DATABASE snsboard;
-- 계정 및 권한 설정 쿼리
CREATE USER 'admin'@'localhost' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON snsboard.* TO 'admin'@'localhost';
FLUSH PRIVILEGES;

-- user 정보 테이블 생성 쿼리
CREATE TABLE user_info
(
	user_no INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	id VARCHAR(20) NOT NULL UNIQUE,
	pw VARCHAR(30) NOT NULL,
	name VARCHAR(30) NOT NULL,
	phone VARCHAR(12) NOT NULL,
	addr VARCHAR(30),
	birth DATE NOT NULL,
	authority_no INT NOT NULL NOT NULL,
	pic_name VARCHAR(30)
);

-- 게시판 정보 생성 테이블
CREATE TABLE board_info
(
	post_no INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR(100) NOT NULL,
	content TEXT NOT NULL,	
	post_time VARCHAR(20) NOT NULL,
	user_no INT NOT NULL,
	view_no INT NOT NULL,
	like_no INT NOT NULL
);
-- 덧글 정보 생성 테이블
CREATE TABLE comment_info
(
	comment_no int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	post_no INT NOT NULL,
	user_no INT NOT NULL,
	comment_content VARCHAR(500) NOT NULL,
	write_time VARCHAR(20) NOT NULL
);

-- 첨부 파일 정보 생성 테이블
CREATE TABLE file_info
(
	file_no INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	post_no INT NOT NULL,
	file_name VARCHAR(100) NOT NULL
);

-- 권한 정보 테이블 1: 관리자 2: 일반회원 3: 손님
CREATE TABLE authority_info
(
	authority_no INT NOT NULL PRIMARY KEY,
	authority VARCHAR(20) NOT NULL
);

-- 테이블 컬럼 정보 조회
DESC user_info;
DESC board_info;
DESC comment_info;
DESC file_info;
DESC authority_info;

-- 개별 테이블 조회
SELECT * FROM user_info;
SELECT * from board_info;
SELECT * FROM comment_info;
SELECT * FROM file_info;
SELECT * FROM authority_info;