-- userPrimary
DROP TABLE IF EXISTS Users;

-- UserBookInfo
DROP TABLE IF EXISTS TABLE2;

-- Book
DROP TABLE IF EXISTS Book;

-- 스터디모임
DROP TABLE IF EXISTS StudyGroup;

-- Room
DROP TABLE IF EXISTS Room;

-- UserMessage
DROP TABLE IF EXISTS Messanger;

-- Board
DROP TABLE IF EXISTS FreeBoard;

-- 게시판첨부파일
DROP TABLE IF EXISTS FreeBoardFile;

-- 방옵션
DROP TABLE IF EXISTS RoomOption;

-- 방등록페이지
DROP TABLE IF EXISTS RoomEnroll;

-- 등록페이지첨부파일
DROP TABLE IF EXISTS RoomFile;

-- 게시판타입
DROP TABLE IF EXISTS BoardType;

-- 스터디맴버
DROP TABLE IF EXISTS StudyMember;

-- 새 테이블
DROP TABLE IF EXISTS RecruitComments;

-- 새 테이블2
DROP TABLE IF EXISTS FreeLikes;

-- 새 테이블3
DROP TABLE IF EXISTS Admin;

-- 새 테이블4
DROP TABLE IF EXISTS StudyType;

-- 새 테이블5
DROP TABLE IF EXISTS BookMark;

-- 새 테이블6
DROP TABLE IF EXISTS Studyboard;

-- Board2
DROP TABLE IF EXISTS AskBoard;

-- Board3
DROP TABLE IF EXISTS ReviewBoard;

-- Board4
DROP TABLE IF EXISTS RecruitBoard;

-- 새 테이블7
DROP TABLE IF EXISTS RvLikes;

-- 새 테이블8
DROP TABLE IF EXISTS Likes2;

-- 새 테이블9
DROP TABLE IF EXISTS RvComments;

-- 새 테이블10
DROP TABLE IF EXISTS FreeComments;

-- 게시판첨부파일2
DROP TABLE IF EXISTS RBoardFile;

-- userPrimary
CREATE TABLE Users (
		u_Id VARCHAR2(50) NOT NULL,
		u_pw VARCHAR2(30) NOT NULL,
		u_name VARCHAR2(20) NOT NULL,
		u_nickname VARCHAR2(20) NULL,
		u_phone VARCHAR2(13) NULL,
		u_tel VARCHAR2(13) NOT NULL,
		u_image VARCHAR2(100) NOT NULL,
		u_email VARCHAR2(50) NOT NULL,
		u_addr VARCHAR2(100) NOT NULL,
		u_birth DATE NOT NULL,
		u_status NUMBER(1) NOT NULL
);

-- userPrimary
ALTER TABLE Users
	ADD CONSTRAINT PK_Users -- userPrimary 기본키
	PRIMARY KEY (
		u_Id -- userId
	);

-- UserBookInfo
CREATE TABLE TABLE2 (
);

-- Book
CREATE TABLE Book (
		bk_no NUMBER(10) NOT NULL,
		bk_date DATE NOT NULL,
		bk_stime TIMESTAMP NOT NULL,
		bk_status NUMBER(1) NOT NULL,
		bk_people NUMBER(2) NOT NULL,
		bk_etime TIMESTAMP NOT NULL,
		u_Id VARCHAR2(50) NOT NULL,
		r_No NUMBER(10) NULL
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
		r_image VARCHAR2(100) NOT NULL,
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
		m_No NUMBER(10) NOT NULL,
		m_title VARCHAR2(30) NOT NULL,
		m_content VARCHAR2(160) NOT NULL,
		m_status NUMBER(1) NOT NULL,
		u_reciever VARCHAR2(50) NOT NULL,
		u_sender VARCHAR2(50) NOT NULL
);

-- UserMessage
ALTER TABLE Messanger
	ADD CONSTRAINT PK_Messanger -- UserMessage 기본키
	PRIMARY KEY (
		m_No -- MessageNo
	);

-- Board
CREATE TABLE FreeBoard (
		fb_no NUMBER(10) NOT NULL,
		fb_name VARCHAR2(100) NOT NULL,
		fb_content CLOB NOT NULL,
		fb_status NUMBER(1) NOT NULL,
		fb_hit NUMBER(4) NOT NULL,
		u_Id VARCHAR2(50) NULL,
		a_id VARCHAR2(100) NULL
);

-- Board
ALTER TABLE FreeBoard
	ADD CONSTRAINT PK_FreeBoard -- Board 기본키
	PRIMARY KEY (
		fb_no -- 자유게시판번호
	);

-- 게시판첨부파일
CREATE TABLE FreeBoardFile (
		bf_no NUMBER(10) NOT NULL,
		bf_name VARCHAR2(100) NOT NULL,
		bf_ori VARCHAR2(100) NOT NULL,
		bf_size INT NOT NULL,
		fb_no NUMBER(10) NOT NULL
);

-- 게시판첨부파일
ALTER TABLE FreeBoardFile
	ADD CONSTRAINT PK_FreeBoardFile -- 게시판첨부파일 기본키
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
CREATE TABLE RecruitComments (
		c_no NUMBER(10) NOT NULL,
		u_Id VARCHAR2(50) NOT NULL,
		c_content VARCHAR2(400) NOT NULL,
		c_status NUMBER(1) NOT NULL,
		rb_no NUMBER(10) NULL
);

-- 새 테이블
ALTER TABLE RecruitComments
	ADD CONSTRAINT PK_RecruitComments -- 새 테이블 기본키
	PRIMARY KEY (
		c_no -- 댓글 번호
	);

-- 새 테이블2
CREATE TABLE FreeLikes (
		likeno NUMBER(10) NOT NULL,
		fb_no NUMBER(10) NULL,
		u_Id VARCHAR2(50) NULL
);

-- 새 테이블2
ALTER TABLE FreeLikes
	ADD CONSTRAINT PK_FreeLikes -- 새 테이블2 기본키
	PRIMARY KEY (
		likeno -- 좋아요 번호
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

-- 새 테이블5
CREATE TABLE BookMark (
		bm_no <데이터 타입 없음> NULL,
		bm_name <데이터 타입 없음> NULL
);

-- 새 테이블6
CREATE TABLE Studyboard (
		sb_no NUMBER(10) NOT NULL,
		sb_title VARCHAR2(100) NOT NULL,
		sb_content CLOB NOT NULL,
		sb_hit NUMBER(4) NOT NULL,
		sb_status NUMBER(1) NOT NULL,
		sg_no NUMBER(10) NOT NULL,
		u_Id VARCHAR2(50) NOT NULL
);

-- 새 테이블6
ALTER TABLE Studyboard
	ADD CONSTRAINT PK_Studyboard -- 새 테이블6 기본키
	PRIMARY KEY (
		sb_no -- 스터디게시판 번호
	);

-- Board2
CREATE TABLE AskBoard (
		ab_no NUMBER(10) NOT NULL,
		ab_name VARCHAR2(100) NOT NULL,
		ab_content CLOB NOT NULL,
		ab_status NUMBER(1) NOT NULL,
		ab_hit NUMBER(4) NULL,
		u_Id VARCHAR2(50) NULL,
		a_id VARCHAR2(100) NULL
);

-- Board2
ALTER TABLE AskBoard
	ADD CONSTRAINT PK_AskBoard -- Board2 기본키
	PRIMARY KEY (
		ab_no -- 문의게시판번호
	);

-- Board3
CREATE TABLE ReviewBoard (
		rv_no NUMBER(10) NOT NULL,
		rv_name VARCHAR2(100) NOT NULL,
		rv_content CLOB NOT NULL,
		rv_status NUMBER(1) NOT NULL,
		rv_hit NUMBER(4) NULL,
		u_Id VARCHAR2(50) NULL
);

-- Board3
ALTER TABLE ReviewBoard
	ADD CONSTRAINT PK_ReviewBoard -- Board3 기본키
	PRIMARY KEY (
		rv_no -- 후기게시판번호
	);

-- Board4
CREATE TABLE RecruitBoard (
		rb_no NUMBER(10) NOT NULL,
		rb_name VARCHAR2(100) NOT NULL,
		rb_content CLOB NOT NULL,
		rb_status NUMBER(1) NOT NULL,
		rb_hit NUMBER(4) NULL,
		u_Id VARCHAR2(50) NULL
);

-- Board4
ALTER TABLE RecruitBoard
	ADD CONSTRAINT PK_RecruitBoard -- Board4 기본키
	PRIMARY KEY (
		rb_no -- 모집게시판번호
	);

-- 새 테이블7
CREATE TABLE RvLikes (
		likeno NUMBER(10) NOT NULL,
		rv_no NUMBER(10) NULL,
		u_Id VARCHAR2(50) NULL
);

-- 새 테이블7
ALTER TABLE RvLikes
	ADD CONSTRAINT PK_RvLikes -- 새 테이블7 기본키
	PRIMARY KEY (
		likeno -- 좋아요 번호
	);

-- 새 테이블8
CREATE TABLE Likes2 (
		likeno NUMBER(10) NOT NULL
);

-- 새 테이블8
ALTER TABLE Likes2
	ADD CONSTRAINT PK_Likes2 -- 새 테이블8 기본키
	PRIMARY KEY (
		likeno -- 좋아요 번호
	);

-- 새 테이블9
CREATE TABLE RvComments (
		c_no NUMBER(10) NOT NULL,
		c_content VARCHAR2(400) NOT NULL,
		c_status NUMBER(1) NOT NULL,
		rv_no NUMBER(10) NULL,
		u_Id VARCHAR2(50) NULL
);

-- 새 테이블9
ALTER TABLE RvComments
	ADD CONSTRAINT PK_RvComments -- 새 테이블9 기본키
	PRIMARY KEY (
		c_no -- 댓글 번호
	);

-- 새 테이블10
CREATE TABLE FreeComments (
		c_no NUMBER(10) NOT NULL,
		u_Id VARCHAR2(50) NOT NULL,
		c_content VARCHAR2(400) NOT NULL,
		c_status NUMBER(1) NOT NULL,
		fb_no NUMBER(10) NULL
);

-- 새 테이블10
ALTER TABLE FreeComments
	ADD CONSTRAINT PK_FreeComments -- 새 테이블10 기본키
	PRIMARY KEY (
		c_no -- 댓글 번호
	);

-- 게시판첨부파일2
CREATE TABLE RBoardFile (
		bf_no NUMBER(10) NOT NULL,
		bf_name VARCHAR2(100) NOT NULL,
		bf_ori VARCHAR2(100) NOT NULL,
		bf_size INT NOT NULL,
		rv_no NUMBER(10) NULL
);

-- 게시판첨부파일2
ALTER TABLE RBoardFile
	ADD CONSTRAINT PK_RBoardFile -- 게시판첨부파일2 기본키
	PRIMARY KEY (
		bf_no -- 파일번호
	);

-- Book
ALTER TABLE Book
	ADD CONSTRAINT FK_Users_TO_Book -- userPrimary -> Book
	FOREIGN KEY (
		u_Id -- userId
	)
	REFERENCES Users ( -- userPrimary
		u_Id -- userId
	);

-- Book
ALTER TABLE Book
	ADD CONSTRAINT FK_Room_TO_Book -- Room -> Book
	FOREIGN KEY (
		r_No -- 방번호
	)
	REFERENCES Room ( -- Room
		r_No -- 방번호
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
		u_reciever -- 수신자
	)
	REFERENCES Users ( -- userPrimary
		u_Id -- userId
	);

-- UserMessage
ALTER TABLE Messanger
	ADD CONSTRAINT FK_Users_TO_Messanger2 -- userPrimary -> UserMessage2
	FOREIGN KEY (
		u_sender -- 발신자
	)
	REFERENCES Users ( -- userPrimary
		u_Id -- userId
	);

-- Board
ALTER TABLE FreeBoard
	ADD CONSTRAINT FK_Users_TO_FreeBoard -- userPrimary -> Board
	FOREIGN KEY (
		u_Id -- userId
	)
	REFERENCES Users ( -- userPrimary
		u_Id -- userId
	);

-- Board
ALTER TABLE FreeBoard
	ADD CONSTRAINT FK_Admin_TO_FreeBoard -- 새 테이블3 -> Board
	FOREIGN KEY (
		a_id -- 관리자아이디
	)
	REFERENCES Admin ( -- 새 테이블3
		a_id -- 관리자아이디
	);

-- 게시판첨부파일
ALTER TABLE FreeBoardFile
	ADD CONSTRAINT FK_FreeBoard_TO_FreeBoardFile -- Board -> 게시판첨부파일
	FOREIGN KEY (
		fb_no -- 자유게시판번호
	)
	REFERENCES FreeBoard ( -- Board
		fb_no -- 자유게시판번호
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
ALTER TABLE RecruitComments
	ADD CONSTRAINT FK_Users_TO_RecruitComments -- userPrimary -> 새 테이블
	FOREIGN KEY (
		u_Id -- userId
	)
	REFERENCES Users ( -- userPrimary
		u_Id -- userId
	);

-- 새 테이블
ALTER TABLE RecruitComments
	ADD CONSTRAINT FK_RecruitBoard_TO_RecruitCo -- Board4 -> 새 테이블
	FOREIGN KEY (
		rb_no -- 모집게시판번호
	)
	REFERENCES RecruitBoard ( -- Board4
		rb_no -- 모집게시판번호
	);

-- 새 테이블2
ALTER TABLE FreeLikes
	ADD CONSTRAINT FK_FreeBoard_TO_FreeLikes -- Board -> 새 테이블2
	FOREIGN KEY (
		fb_no -- 자유게시판번호
	)
	REFERENCES FreeBoard ( -- Board
		fb_no -- 자유게시판번호
	);

-- 새 테이블2
ALTER TABLE FreeLikes
	ADD CONSTRAINT FK_Users_TO_FreeLikes -- userPrimary -> 새 테이블2
	FOREIGN KEY (
		u_Id -- userId
	)
	REFERENCES Users ( -- userPrimary
		u_Id -- userId
	);

-- 새 테이블6
ALTER TABLE Studyboard
	ADD CONSTRAINT FK_StudyGroup_TO_Studyboard -- 스터디모임 -> 새 테이블6
	FOREIGN KEY (
		sg_no -- 스터디번호
	)
	REFERENCES StudyGroup ( -- 스터디모임
		sg_no -- 스터디번호
	);

-- 새 테이블6
ALTER TABLE Studyboard
	ADD CONSTRAINT FK_Users_TO_Studyboard -- userPrimary -> 새 테이블6
	FOREIGN KEY (
		u_Id -- userId
	)
	REFERENCES Users ( -- userPrimary
		u_Id -- userId
	);

-- Board2
ALTER TABLE AskBoard
	ADD CONSTRAINT FK_Users_TO_AskBoard -- userPrimary -> Board2
	FOREIGN KEY (
		u_Id -- userId
	)
	REFERENCES Users ( -- userPrimary
		u_Id -- userId
	);

-- Board2
ALTER TABLE AskBoard
	ADD CONSTRAINT FK_Admin_TO_AskBoard -- 새 테이블3 -> Board2
	FOREIGN KEY (
		a_id -- 관리자아이디
	)
	REFERENCES Admin ( -- 새 테이블3
		a_id -- 관리자아이디
	);

-- Board3
ALTER TABLE ReviewBoard
	ADD CONSTRAINT FK_Users_TO_ReviewBoard -- userPrimary -> Board3
	FOREIGN KEY (
		u_Id -- userId
	)
	REFERENCES Users ( -- userPrimary
		u_Id -- userId
	);

-- Board4
ALTER TABLE RecruitBoard
	ADD CONSTRAINT FK_Users_TO_RecruitBoard -- userPrimary -> Board4
	FOREIGN KEY (
		u_Id -- userId
	)
	REFERENCES Users ( -- userPrimary
		u_Id -- userId
	);

-- 새 테이블7
ALTER TABLE RvLikes
	ADD CONSTRAINT FK_ReviewBoard_TO_RvLikes -- Board3 -> 새 테이블7
	FOREIGN KEY (
		rv_no -- 후기게시판번호
	)
	REFERENCES ReviewBoard ( -- Board3
		rv_no -- 후기게시판번호
	);

-- 새 테이블7
ALTER TABLE RvLikes
	ADD CONSTRAINT FK_Users_TO_RvLikes -- userPrimary -> 새 테이블7
	FOREIGN KEY (
		u_Id -- userId
	)
	REFERENCES Users ( -- userPrimary
		u_Id -- userId
	);

-- 새 테이블9
ALTER TABLE RvComments
	ADD CONSTRAINT FK_ReviewBoard_TO_RvComments -- Board3 -> 새 테이블9
	FOREIGN KEY (
		rv_no -- 후기게시판번호
	)
	REFERENCES ReviewBoard ( -- Board3
		rv_no -- 후기게시판번호
	);

-- 새 테이블9
ALTER TABLE RvComments
	ADD CONSTRAINT FK_Users_TO_RvComments -- userPrimary -> 새 테이블9
	FOREIGN KEY (
		u_Id -- userId
	)
	REFERENCES Users ( -- userPrimary
		u_Id -- userId
	);

-- 새 테이블10
ALTER TABLE FreeComments
	ADD CONSTRAINT FK_FreeBoard_TO_FreeComments -- Board -> 새 테이블10
	FOREIGN KEY (
		fb_no -- 자유게시판번호
	)
	REFERENCES FreeBoard ( -- Board
		fb_no -- 자유게시판번호
	);

-- 새 테이블10
ALTER TABLE FreeComments
	ADD CONSTRAINT FK_Users_TO_FreeComments -- userPrimary -> 새 테이블10
	FOREIGN KEY (
		u_Id -- userId
	)
	REFERENCES Users ( -- userPrimary
		u_Id -- userId
	);

-- 게시판첨부파일2
ALTER TABLE RBoardFile
	ADD CONSTRAINT FK_ReviewBoard_TO_RBoardFile -- Board3 -> 게시판첨부파일2
	FOREIGN KEY (
		rv_no -- 후기게시판번호
	)
	REFERENCES ReviewBoard ( -- Board3
		rv_no -- 후기게시판번호
	);