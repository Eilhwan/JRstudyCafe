-- userPrimary
DROP TABLE Users;

-- UserBookInfo
DROP TABLE TABLE2;

-- Book
DROP TABLE Book;

-- 스터디모임
DROP TABLE StudyGroup;

-- Room
DROP TABLE Room;

-- UserMessage
DROP TABLE Messanger;

-- Board
DROP TABLE Board;

-- 게시판첨부파일
DROP TABLE BoardFile;

-- 방옵션
DROP TABLE RoomOption;

-- 방등록페이지
DROP TABLE RoomEnroll;

-- 등록페이지첨부파일
DROP TABLE RoomFile;

-- 게시판타입
DROP TABLE BoardType;

-- 스터디맴버
DROP TABLE StudyMember;

-- 새 테이블
DROP TABLE Comment;

-- 새 테이블2
DROP TABLE Like;

-- 새 테이블3
DROP TABLE Admin;

-- 새 테이블4
DROP TABLE StudyType;

-- userPrimary
CREATE TABLE Users (
		u_Id VARCHAR2(50) NOT NULL,
		u_pw VARCHAR2(30) NOT NULL,
		u_name VARCHAR2(20) NOT NULL,
		u_nickname VARCHAR2(20) NULL,
		u_phone VARCHAR2(13) NULL,
		u_tel VARCHAR2(13) NOT NULL,
		u_email VARCHAR2(50) NOT NULL,
		u_addr VARCHAR2(100) NOT NULL,
		u_birth DATE NOT NULL,
		u_status NUMBER(1) NOT NULL
);

-- userPrimary
ALTER TABLE Users
	ADD CONSTRAINT PK_User -- userPrimary 기본키
	PRIMARY KEY (
		u_Id -- userId
	);


-- Book
CREATE TABLE Book (
		bk_no NUMBER(10) NOT NULL,
		bk_date DATE NOT NULL,
		bk_stime TIMESTAMP NOT NULL,
		bk_status NUMBER(1) NOT NULL,
		bk_people NUMBER(2) NOT NULL,
		bk_etime TIMESTAMP NOT NULL,
		u_Id VARCHAR2(50) NOT NULL
);

-- Book
ALTER TABLE Book
	ADD CONSTRAINT PK_Book -- Book 기본키
	PRIMARY KEY (
		bk_no -- 예약번호
	);

-- 스터디모임
CREATE TABLE StudyGroup (
		sg_no NUMBER(10) NOT NULL,
		sg_name VARCHAR2(100) NOT NULL,
		u_Id VARCHAR2(50) NULL,
		sg_person NUMBER(2) NOT NULL,
		sg_explain CLOB NOT NULL,
		st_no NUMBER(10) NULL
);

-- 스터디모임
ALTER TABLE StudyGroup
	ADD CONSTRAINT PK_StudyGroup -- 스터디모임 기본키
	PRIMARY KEY (
		sg_no -- 스터디번호
	);

-- Room
CREATE TABLE Room (
		r_No NUMBER(10) NOT NULL,
		r_name VARCHAR2(100) NOT NULL,
		r_ppr NUMBER(2) NOT NULL,
		r_pph NUMBER(10) NOT NULL,
		r_status NUMBER(1) NOT NULL
);

-- Room
ALTER TABLE Room
	ADD CONSTRAINT PK_Room -- Room 기본키
	PRIMARY KEY (
		r_No -- 방번호
	);

-- UserMessage
CREATE TABLE Messanger (
		mNo NUMBER(10) NOT NULL,
		m_title VARCHAR2(30) NOT NULL,
		m_content VARCHAR2(160) NOT NULL,
		m_status NUMBER(1) NOT NULL,
		u_Id VARCHAR2(50) NOT NULL
);

-- UserMessage
ALTER TABLE Messanger
	ADD CONSTRAINT PK_Messanger -- UserMessage 기본키
	PRIMARY KEY (
		mNo -- MessageNo
	);

-- Board
CREATE TABLE Board (
		b_no NUMBER(10) NOT NULL,
		b_name VARCHAR2(100) NOT NULL,
		b_content CLOB NOT NULL,
		b_status NUMBER(1) NOT NULL,
		b_hit NUMBER(4) NULL,
		u_Id VARCHAR2(50) NULL,
		a_id VARCHAR2(100) NULL,
		bt_No NUMBER(10) NOT NULL
);

-- Board
ALTER TABLE Board
	ADD CONSTRAINT PK_Board -- Board 기본키
	PRIMARY KEY (
		b_no -- 게시판번호
	);

-- 게시판첨부파일
CREATE TABLE BoardFile (
		bf_no NUMBER(10) NOT NULL,
		bf_name VARCHAR2(100) NOT NULL,
		bf_ori VARCHAR2(100) NOT NULL,
		bf_size INT NOT NULL,
		b_no NUMBER(10) NOT NULL
);

-- 게시판첨부파일
ALTER TABLE BoardFile
	ADD CONSTRAINT PK_BoardFile -- 게시판첨부파일 기본키
	PRIMARY KEY (
		bf_no -- 파일번호
	);

-- 방옵션
CREATE TABLE RoomOption (
		r_No NUMBER(10) NOT NULL,
		ro_air NUMBER(1) NOT NULL,
		ro_chair NUMBER(1) NOT NULL,
		ro_print NUMBER(1) NOT NULL,
		ro_smoke NUMBER(1) NOT NULL,
		ro_pc NUMBER(1) NOT NULL,
		ro_tv NUMBER(1) NOT NULL,
		ro_wifi NUMBER(1) NOT NULL,
		ro_board NUMBER(1) NOT NULL
);

-- 방옵션
ALTER TABLE RoomOption
	ADD CONSTRAINT PK_RoomOption -- 방옵션 기본키
	PRIMARY KEY (
		r_No -- 방번호
	);

-- 방등록페이지
CREATE TABLE RoomEnroll (
		re_no NUMBER(10) NOT NULL,
		re_name VARCHAR2(100) NOT NULL,
		re_sub VARCHAR2(100) NOT NULL,
		re_content CLOB NOT NULL,
		r_No NUMBER(10) NULL
);

-- 방등록페이지
ALTER TABLE RoomEnroll
	ADD CONSTRAINT PK_RoomEnroll -- 방등록페이지 기본키
	PRIMARY KEY (
		re_no -- 방등록번호
	);

-- 등록페이지첨부파일
CREATE TABLE RoomFile (
		rf_no NUMBER(10) NOT NULL,
		rf_name VARCHAR2(100) NOT NULL,
		rf_ori VARCHAR2(100) NOT NULL,
		rf_size INT NOT NULL,
		re_no NUMBER(10) NOT NULL
);

-- 등록페이지첨부파일
ALTER TABLE RoomFile
	ADD CONSTRAINT PK_RoomFile -- 등록페이지첨부파일 기본키
	PRIMARY KEY (
		rf_no -- 파일번호
	);

-- 게시판타입
CREATE TABLE BoardType (
		bt_No NUMBER(10) NOT NULL,
		bt_Name VARCHAR2(20) NOT NULL,
		bt_Type VARCHAR2(20) NOT NULL
);

-- 게시판타입
ALTER TABLE BoardType
	ADD CONSTRAINT PK_BoardType -- 게시판타입 기본키
	PRIMARY KEY (
		bt_No -- 타입번호
	);

-- 스터디맴버
CREATE TABLE StudyMember (
		sm_no NUMBER(10) NOT NULL,
		u_Id VARCHAR2(50) NOT NULL,
		sg_no NUMBER(10) NOT NULL
);

-- 스터디맴버
ALTER TABLE StudyMember
	ADD CONSTRAINT PK_StudyMember -- 스터디맴버 기본키
	PRIMARY KEY (
		sm_no -- 맴버번호
	);

-- 새 테이블
CREATE TABLE Comments (
		c_no NUMBER(10) NOT NULL,
		u_Id VARCHAR2(50) NOT NULL,
		b_no NUMBER(10) NOT NULL,
		c_content VARCHAR2(400) NOT NULL,
		c_status NUMBER(1) NOT NULL
);

-- 새 테이블
ALTER TABLE Comments
	ADD CONSTRAINT PK_Comment -- 새 테이블 기본키
	PRIMARY KEY (
		c_no -- 댓글 번호
	);

-- 새 테이블2
CREATE TABLE Likes (
		b_no NUMBER(10) NOT NULL,
		l_cnt NUMBER(3) NULL,
		u_Id VARCHAR2(50) NULL
);

-- 새 테이블2
ALTER TABLE Likes
	ADD CONSTRAINT PK_Like -- 새 테이블2 기본키
	PRIMARY KEY (
		b_no -- 게시판번호
	);

-- 새 테이블3
CREATE TABLE Admin (
		a_id VARCHAR2(100) NOT NULL,
		a_pw VARCHAR2(30) NULL,
		a_name VARCHAR2(20) NULL,
		a_status NUMBER(1) NULL
);

-- 새 테이블3
ALTER TABLE Admin
	ADD CONSTRAINT PK_Admin -- 새 테이블3 기본키
	PRIMARY KEY (
		a_id -- 관리자아이디
	);

-- 새 테이블4
CREATE TABLE StudyType (
		st_no NUMBER(10) NOT NULL,
		st_name VARCHAR2(20) NOT NULL
);

-- 새 테이블4
ALTER TABLE StudyType
	ADD CONSTRAINT PK_StudyType -- 새 테이블4 기본키
	PRIMARY KEY (
		st_no -- 스터디타입 번호
	);

-- Book
ALTER TABLE Book
	ADD CONSTRAINT FK_Users_TO_Book
	FOREIGN KEY (
		u_Id -- userId
	)
	REFERENCES Users ( -- userPrimary
		u_Id -- userId
	);

-- 스터디모임
ALTER TABLE StudyGroup
	ADD CONSTRAINT FK_Users_TO_StudyGroup -- userPrimary -> 스터디모임
	FOREIGN KEY (
		u_Id -- 방장
	)
	REFERENCES Users ( -- userPrimary
		u_Id -- userId
	);

-- 스터디모임
ALTER TABLE StudyGroup
	ADD CONSTRAINT FK_StudyType_TO_StudyGroup -- 새 테이블4 -> 스터디모임
	FOREIGN KEY (
		st_no -- 스터디타입 번호
	)
	REFERENCES StudyType ( -- 새 테이블4
		st_no -- 스터디타입 번호
	);

-- UserMessage
ALTER TABLE Messanger
	ADD CONSTRAINT FK_Users_TO_Messanger -- userPrimary -> UserMessage
	FOREIGN KEY (
		u_Id -- userId
	)
	REFERENCES Users ( -- userPrimary
		u_Id -- userId
	);

-- Board
ALTER TABLE Board
	ADD CONSTRAINT FK_Users_TO_Board -- userPrimary -> Board
	FOREIGN KEY (
		u_Id -- userId
	)
	REFERENCES Users ( -- userPrimary
		u_Id -- userId
	);

-- Board
ALTER TABLE Board
	ADD CONSTRAINT FK_BoardType_TO_Board -- 게시판타입 -> Board
	FOREIGN KEY (
		bt_No -- 타입번호
	)
	REFERENCES BoardType ( -- 게시판타입
		bt_No -- 타입번호
	);

-- Board
ALTER TABLE Board
	ADD CONSTRAINT FK_Admin_TO_Board -- 새 테이블3 -> Board
	FOREIGN KEY (
		a_id -- 관리자아이디
	)
	REFERENCES Admin ( -- 새 테이블3
		a_id -- 관리자아이디
	);

-- 게시판첨부파일
ALTER TABLE BoardFile
	ADD CONSTRAINT FK_Board_TO_BoardFile -- Board -> 게시판첨부파일
	FOREIGN KEY (
		b_no -- 게시판번호
	)
	REFERENCES Board ( -- Board
		b_no -- 게시판번호
	);

-- 방옵션
ALTER TABLE RoomOption
	ADD CONSTRAINT FK_Room_TO_RoomOption -- Room -> 방옵션
	FOREIGN KEY (
		r_No -- 방번호
	)
	REFERENCES Room ( -- Room
		r_No -- 방번호
	);

-- 방등록페이지
ALTER TABLE RoomEnroll
	ADD CONSTRAINT FK_Room_TO_RoomEnroll -- Room -> 방등록페이지
	FOREIGN KEY (
		r_No -- 방번호
	)
	REFERENCES Room ( -- Room
		r_No -- 방번호
	);

-- 등록페이지첨부파일
ALTER TABLE RoomFile
	ADD CONSTRAINT FK_RoomEnroll_TO_RoomFile -- 방등록페이지 -> 등록페이지첨부파일
	FOREIGN KEY (
		re_no -- 방등록번호
	)
	REFERENCES RoomEnroll ( -- 방등록페이지
		re_no -- 방등록번호
	);

-- 스터디맴버
ALTER TABLE StudyMember
	ADD CONSTRAINT FK_Users_TO_StudyMember -- userPrimary -> 스터디맴버
	FOREIGN KEY (
		u_Id -- userId
	)
	REFERENCES Users ( -- userPrimary
		u_Id -- userId
	);

-- 스터디맴버
ALTER TABLE StudyMember
	ADD CONSTRAINT FK_StudyGroup_TO_StudyMember -- 스터디모임 -> 스터디맴버
	FOREIGN KEY (
		sg_no -- 스터디번호
	)
	REFERENCES StudyGroup ( -- 스터디모임
		sg_no -- 스터디번호
	);

-- 새 테이블
ALTER TABLE Comments
	ADD CONSTRAINT FK_Users_TO_Comments -- userPrimary -> 새 테이블
	FOREIGN KEY (
		u_Id -- userId
	)
	REFERENCES Users ( -- userPrimary
		u_Id -- userId
	);

-- 새 테이블
ALTER TABLE Comments
	ADD CONSTRAINT FK_Board_TO_Comments -- Board -> 새 테이블
	FOREIGN KEY (
		b_no -- 게시판번호
	)
	REFERENCES Board ( -- Board
		b_no -- 게시판번호
	);

-- 새 테이블2
ALTER TABLE Likes
	ADD CONSTRAINT FK_Board_TO_Likes -- Board -> 새 테이블2
	FOREIGN KEY (
		b_no -- 게시판번호
	)
	REFERENCES Board ( -- Board
		b_no -- 게시판번호
	);

-- 새 테이블2
ALTER TABLE Likes
	ADD CONSTRAINT FK_User_TO_Likes -- userPrimary -> 새 테이블2
	FOREIGN KEY (
		u_Id -- userId
	)
	REFERENCES Users ( -- userPrimary
		u_Id -- userId
	);