-- userPrimary
DROP TABLE Users CASCADE CONSTRAINTS PURGE;

-- UserBookInfo
DROP TABLE TABLE2 CASCADE CONSTRAINTS PURGE;

-- Book
DROP TABLE Book CASCADE CONSTRAINTS PURGE;

<<<<<<< HEAD
-- ìŠ¤í„°ë””ëª¨ìž„
DROP TABLE StudyGroup CASCADE CONSTRAINTS PURGE;
=======
-- ½ºÅÍµð¸ðÀÓ
DROP TABLE IF EXISTS StudyGroup;
>>>>>>> origin/ba

-- Room
DROP TABLE Room CASCADE CONSTRAINTS PURGE;

-- UserMessage
DROP TABLE Messanger CASCADE CONSTRAINTS PURGE;

-- Board
DROP TABLE FreeBoard CASCADE CONSTRAINTS PURGE;

<<<<<<< HEAD
-- ê²Œì‹œíŒì²¨ë¶€íŒŒì¼
DROP TABLE FreeBoardFile CASCADE CONSTRAINTS PURGE;

-- ë°©ì˜µì…˜
DROP TABLE RoomOption CASCADE CONSTRAINTS PURGE;

-- ë°©ë“±ë¡íŽ˜ì´ì§€
DROP TABLE RoomEnroll CASCADE CONSTRAINTS PURGE;

-- ë“±ë¡íŽ˜ì´ì§€ì²¨ë¶€íŒŒì¼
DROP TABLE RoomFile CASCADE CONSTRAINTS PURGE;

-- ê²Œì‹œíŒíƒ€ìž…
DROP TABLE BoardType CASCADE CONSTRAINTS PURGE;

-- ìŠ¤í„°ë””ë§´ë²„
DROP TABLE StudyMember CASCADE CONSTRAINTS PURGE;

-- ìƒˆ í…Œì´ë¸”
DROP TABLE RecruitComments CASCADE CONSTRAINTS PURGE;

-- ìƒˆ í…Œì´ë¸”2
DROP TABLE FreeLikes CASCADE CONSTRAINTS PURGE;

-- ìƒˆ í…Œì´ë¸”3
DROP TABLE Admin CASCADE CONSTRAINTS PURGE;

-- ìƒˆ í…Œì´ë¸”4
DROP TABLE StudyType CASCADE CONSTRAINTS PURGE;

-- ìƒˆ í…Œì´ë¸”5
DROP TABLE BookMark CASCADE CONSTRAINTS PURGE;

-- ìƒˆ í…Œì´ë¸”6
DROP TABLE Studyboard CASCADE CONSTRAINTS PURGE;
=======
-- °Ô½ÃÆÇÃ·ºÎÆÄÀÏ
DROP TABLE IF EXISTS FreeBoardFile;

-- ¹æ¿É¼Ç
DROP TABLE IF EXISTS RoomOption;

-- ¹æµî·ÏÆäÀÌÁö
DROP TABLE IF EXISTS RoomEnroll;

-- µî·ÏÆäÀÌÁöÃ·ºÎÆÄÀÏ
DROP TABLE IF EXISTS RoomFile;

-- °Ô½ÃÆÇÅ¸ÀÔ
DROP TABLE IF EXISTS BoardType;

-- ½ºÅÍµð¸É¹ö
DROP TABLE IF EXISTS StudyMember;

-- »õ Å×ÀÌºí
DROP TABLE IF EXISTS RecruitComments;

-- »õ Å×ÀÌºí2
DROP TABLE IF EXISTS FreeLikes;

-- »õ Å×ÀÌºí3
DROP TABLE IF EXISTS Admin;

-- »õ Å×ÀÌºí4
DROP TABLE IF EXISTS StudyType;

-- »õ Å×ÀÌºí5
DROP TABLE IF EXISTS BookMark;

-- »õ Å×ÀÌºí6
DROP TABLE IF EXISTS Studyboard;
>>>>>>> origin/ba

-- Board2
DROP TABLE AskBoard CASCADE CONSTRAINTS PURGE;

-- Board3
DROP TABLE ReviewBoard CASCADE CONSTRAINTS PURGE;

-- Board4
DROP TABLE RecruitBoard CASCADE CONSTRAINTS PURGE;

<<<<<<< HEAD
-- ìƒˆ í…Œì´ë¸”7
DROP TABLE RvLikes CASCADE CONSTRAINTS PURGE;

-- ìƒˆ í…Œì´ë¸”8
DROP TABLE Likes2 CASCADE CONSTRAINTS PURGE;

-- ìƒˆ í…Œì´ë¸”9
DROP TABLE RvComments CASCADE CONSTRAINTS PURGE;

-- ìƒˆ í…Œì´ë¸”10
DROP TABLE FreeComments CASCADE CONSTRAINTS PURGE;

-- ê²Œì‹œíŒì²¨ë¶€íŒŒì¼2
DROP TABLE RBoardFile CASCADE CONSTRAINTS PURGE;
=======
-- »õ Å×ÀÌºí7
DROP TABLE IF EXISTS RvLikes;

-- »õ Å×ÀÌºí8
DROP TABLE IF EXISTS Likes2;

-- »õ Å×ÀÌºí9
DROP TABLE IF EXISTS RvComments;

-- »õ Å×ÀÌºí10
DROP TABLE IF EXISTS FreeComments;

-- °Ô½ÃÆÇÃ·ºÎÆÄÀÏ2
DROP TABLE IF EXISTS RBoardFile;
>>>>>>> origin/ba

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
	ADD CONSTRAINT PK_Users -- userPrimary ±âº»Å°
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
	ADD CONSTRAINT PK_Book -- Book ±âº»Å°
	PRIMARY KEY (
		bk_no -- ¿¹¾à¹øÈ£
	);

-- ½ºÅÍµð¸ðÀÓ
CREATE TABLE StudyGroup (
		sg_no NUMBER(10) NOT NULL,
		sg_name VARCHAR2(100) NOT NULL,
		u_Id VARCHAR2(50) NULL,
		sg_person NUMBER(2) NOT NULL,
		sg_explain CLOB NOT NULL,
		st_no NUMBER(10) NULL
);

-- ½ºÅÍµð¸ðÀÓ
ALTER TABLE StudyGroup
	ADD CONSTRAINT PK_StudyGroup -- ½ºÅÍµð¸ðÀÓ ±âº»Å°
	PRIMARY KEY (
		sg_no -- ½ºÅÍµð¹øÈ£
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
	ADD CONSTRAINT PK_Room -- Room ±âº»Å°
	PRIMARY KEY (
		r_No -- ¹æ¹øÈ£
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
	ADD CONSTRAINT PK_Messanger -- UserMessage ±âº»Å°
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
	ADD CONSTRAINT PK_FreeBoard -- Board ±âº»Å°
	PRIMARY KEY (
		fb_no -- ÀÚÀ¯°Ô½ÃÆÇ¹øÈ£
	);

-- °Ô½ÃÆÇÃ·ºÎÆÄÀÏ
CREATE TABLE FreeBoardFile (
		bf_no NUMBER(10) NOT NULL,
		bf_name VARCHAR2(100) NOT NULL,
		bf_ori VARCHAR2(100) NOT NULL,
		bf_size INT NOT NULL,
		fb_no NUMBER(10) NOT NULL
);

-- °Ô½ÃÆÇÃ·ºÎÆÄÀÏ
ALTER TABLE FreeBoardFile
	ADD CONSTRAINT PK_FreeBoardFile -- °Ô½ÃÆÇÃ·ºÎÆÄÀÏ ±âº»Å°
	PRIMARY KEY (
		bf_no -- ÆÄÀÏ¹øÈ£
	);

-- ¹æ¿É¼Ç
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

-- ¹æ¿É¼Ç
ALTER TABLE RoomOption
	ADD CONSTRAINT PK_RoomOption -- ¹æ¿É¼Ç ±âº»Å°
	PRIMARY KEY (
		r_No -- ¹æ¹øÈ£
	);

-- ¹æµî·ÏÆäÀÌÁö
CREATE TABLE RoomEnroll (
		re_no NUMBER(10) NOT NULL,
		re_name VARCHAR2(100) NOT NULL,
		re_sub VARCHAR2(100) NOT NULL,
		re_content CLOB NOT NULL,
		r_No NUMBER(10) NULL
);

-- ¹æµî·ÏÆäÀÌÁö
ALTER TABLE RoomEnroll
	ADD CONSTRAINT PK_RoomEnroll -- ¹æµî·ÏÆäÀÌÁö ±âº»Å°
	PRIMARY KEY (
		re_no -- ¹æµî·Ï¹øÈ£
	);

-- µî·ÏÆäÀÌÁöÃ·ºÎÆÄÀÏ
CREATE TABLE RoomFile (
		rf_no NUMBER(10) NOT NULL,
		rf_name VARCHAR2(100) NOT NULL,
		rf_ori VARCHAR2(100) NOT NULL,
		rf_size INT NOT NULL,
		re_no NUMBER(10) NOT NULL
);

-- µî·ÏÆäÀÌÁöÃ·ºÎÆÄÀÏ
ALTER TABLE RoomFile
	ADD CONSTRAINT PK_RoomFile -- µî·ÏÆäÀÌÁöÃ·ºÎÆÄÀÏ ±âº»Å°
	PRIMARY KEY (
		rf_no -- ÆÄÀÏ¹øÈ£
	);

-- °Ô½ÃÆÇÅ¸ÀÔ
CREATE TABLE BoardType (
		bt_No NUMBER(10) NOT NULL,
		bt_Name VARCHAR2(20) NOT NULL,
		bt_Type VARCHAR2(20) NOT NULL
);

-- °Ô½ÃÆÇÅ¸ÀÔ
ALTER TABLE BoardType
	ADD CONSTRAINT PK_BoardType -- °Ô½ÃÆÇÅ¸ÀÔ ±âº»Å°
	PRIMARY KEY (
		bt_No -- Å¸ÀÔ¹øÈ£
	);

-- ½ºÅÍµð¸É¹ö
CREATE TABLE StudyMember (
		sm_no NUMBER(10) NOT NULL,
		u_Id VARCHAR2(50) NOT NULL,
		sg_no NUMBER(10) NOT NULL
);

-- ½ºÅÍµð¸É¹ö
ALTER TABLE StudyMember
	ADD CONSTRAINT PK_StudyMember -- ½ºÅÍµð¸É¹ö ±âº»Å°
	PRIMARY KEY (
		sm_no -- ¸É¹ö¹øÈ£
	);

-- »õ Å×ÀÌºí
CREATE TABLE RecruitComments (
		c_no NUMBER(10) NOT NULL,
		u_Id VARCHAR2(50) NOT NULL,
		c_content VARCHAR2(400) NOT NULL,
		c_status NUMBER(1) NOT NULL,
		rb_no NUMBER(10) NULL
);

-- »õ Å×ÀÌºí
ALTER TABLE RecruitComments
	ADD CONSTRAINT PK_RecruitComments -- »õ Å×ÀÌºí ±âº»Å°
	PRIMARY KEY (
		c_no -- ´ñ±Û ¹øÈ£
	);

-- »õ Å×ÀÌºí2
CREATE TABLE FreeLikes (
		likeno NUMBER(10) NOT NULL,
		fb_no NUMBER(10) NULL,
		u_Id VARCHAR2(50) NULL
);

-- »õ Å×ÀÌºí2
ALTER TABLE FreeLikes
	ADD CONSTRAINT PK_FreeLikes -- »õ Å×ÀÌºí2 ±âº»Å°
	PRIMARY KEY (
		likeno -- ÁÁ¾Æ¿ä ¹øÈ£
	);

-- »õ Å×ÀÌºí3
CREATE TABLE Admin (
		a_id VARCHAR2(100) NOT NULL,
		a_pw VARCHAR2(30) NULL,
		a_name VARCHAR2(20) NULL,
		a_status NUMBER(1) NULL
);

-- »õ Å×ÀÌºí3
ALTER TABLE Admin
	ADD CONSTRAINT PK_Admin -- »õ Å×ÀÌºí3 ±âº»Å°
	PRIMARY KEY (
		a_id -- °ü¸®ÀÚ¾ÆÀÌµð
	);

-- »õ Å×ÀÌºí4
CREATE TABLE StudyType (
		st_no NUMBER(10) NOT NULL,
		st_name VARCHAR2(20) NOT NULL
);

-- »õ Å×ÀÌºí4
ALTER TABLE StudyType
	ADD CONSTRAINT PK_StudyType -- »õ Å×ÀÌºí4 ±âº»Å°
	PRIMARY KEY (
		st_no -- ½ºÅÍµðÅ¸ÀÔ ¹øÈ£
	);

-- »õ Å×ÀÌºí5
CREATE TABLE BookMark (
		bm_no <µ¥ÀÌÅÍ Å¸ÀÔ ¾øÀ½> NULL,
		bm_name <µ¥ÀÌÅÍ Å¸ÀÔ ¾øÀ½> NULL
);

-- »õ Å×ÀÌºí6
CREATE TABLE Studyboard (
		sb_no NUMBER(10) NOT NULL,
		sb_title VARCHAR2(100) NOT NULL,
		sb_content CLOB NOT NULL,
		sb_hit NUMBER(4) NOT NULL,
		sb_status NUMBER(1) NOT NULL,
		sg_no NUMBER(10) NOT NULL,
		u_Id VARCHAR2(50) NOT NULL
);

-- »õ Å×ÀÌºí6
ALTER TABLE Studyboard
	ADD CONSTRAINT PK_Studyboard -- »õ Å×ÀÌºí6 ±âº»Å°
	PRIMARY KEY (
		sb_no -- ½ºÅÍµð°Ô½ÃÆÇ ¹øÈ£
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
	ADD CONSTRAINT PK_AskBoard -- Board2 ±âº»Å°
	PRIMARY KEY (
		ab_no -- ¹®ÀÇ°Ô½ÃÆÇ¹øÈ£
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
	ADD CONSTRAINT PK_ReviewBoard -- Board3 ±âº»Å°
	PRIMARY KEY (
		rv_no -- ÈÄ±â°Ô½ÃÆÇ¹øÈ£
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
	ADD CONSTRAINT PK_RecruitBoard -- Board4 ±âº»Å°
	PRIMARY KEY (
		rb_no -- ¸ðÁý°Ô½ÃÆÇ¹øÈ£
	);

-- »õ Å×ÀÌºí7
CREATE TABLE RvLikes (
		likeno NUMBER(10) NOT NULL,
		rv_no NUMBER(10) NULL,
		u_Id VARCHAR2(50) NULL
);

-- »õ Å×ÀÌºí7
ALTER TABLE RvLikes
	ADD CONSTRAINT PK_RvLikes -- »õ Å×ÀÌºí7 ±âº»Å°
	PRIMARY KEY (
		likeno -- ÁÁ¾Æ¿ä ¹øÈ£
	);

-- »õ Å×ÀÌºí8
CREATE TABLE Likes2 (
		likeno NUMBER(10) NOT NULL
);

-- »õ Å×ÀÌºí8
ALTER TABLE Likes2
	ADD CONSTRAINT PK_Likes2 -- »õ Å×ÀÌºí8 ±âº»Å°
	PRIMARY KEY (
		likeno -- ÁÁ¾Æ¿ä ¹øÈ£
	);

-- »õ Å×ÀÌºí9
CREATE TABLE RvComments (
		c_no NUMBER(10) NOT NULL,
		c_content VARCHAR2(400) NOT NULL,
		c_status NUMBER(1) NOT NULL,
		rv_no NUMBER(10) NULL,
		u_Id VARCHAR2(50) NULL
);

-- »õ Å×ÀÌºí9
ALTER TABLE RvComments
	ADD CONSTRAINT PK_RvComments -- »õ Å×ÀÌºí9 ±âº»Å°
	PRIMARY KEY (
		c_no -- ´ñ±Û ¹øÈ£
	);

-- »õ Å×ÀÌºí10
CREATE TABLE FreeComments (
		c_no NUMBER(10) NOT NULL,
		u_Id VARCHAR2(50) NOT NULL,
		c_content VARCHAR2(400) NOT NULL,
		c_status NUMBER(1) NOT NULL,
		fb_no NUMBER(10) NULL
);

-- »õ Å×ÀÌºí10
ALTER TABLE FreeComments
	ADD CONSTRAINT PK_FreeComments -- »õ Å×ÀÌºí10 ±âº»Å°
	PRIMARY KEY (
		c_no -- ´ñ±Û ¹øÈ£
	);

-- °Ô½ÃÆÇÃ·ºÎÆÄÀÏ2
CREATE TABLE RBoardFile (
		bf_no NUMBER(10) NOT NULL,
		bf_name VARCHAR2(100) NOT NULL,
		bf_ori VARCHAR2(100) NOT NULL,
		bf_size INT NOT NULL,
		rv_no NUMBER(10) NULL
);

-- °Ô½ÃÆÇÃ·ºÎÆÄÀÏ2
ALTER TABLE RBoardFile
	ADD CONSTRAINT PK_RBoardFile -- °Ô½ÃÆÇÃ·ºÎÆÄÀÏ2 ±âº»Å°
	PRIMARY KEY (
		bf_no -- ÆÄÀÏ¹øÈ£
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
		r_No -- ¹æ¹øÈ£
	)
	REFERENCES Room ( -- Room
		r_No -- ¹æ¹øÈ£
	);

-- ½ºÅÍµð¸ðÀÓ
ALTER TABLE StudyGroup
	ADD CONSTRAINT FK_Users_TO_StudyGroup -- userPrimary -> ½ºÅÍµð¸ðÀÓ
	FOREIGN KEY (
		u_Id -- ¹æÀå
	)
	REFERENCES Users ( -- userPrimary
		u_Id -- userId
	);

-- ½ºÅÍµð¸ðÀÓ
ALTER TABLE StudyGroup
	ADD CONSTRAINT FK_StudyType_TO_StudyGroup -- »õ Å×ÀÌºí4 -> ½ºÅÍµð¸ðÀÓ
	FOREIGN KEY (
		st_no -- ½ºÅÍµðÅ¸ÀÔ ¹øÈ£
	)
	REFERENCES StudyType ( -- »õ Å×ÀÌºí4
		st_no -- ½ºÅÍµðÅ¸ÀÔ ¹øÈ£
	);

-- UserMessage
ALTER TABLE Messanger
	ADD CONSTRAINT FK_Users_TO_Messanger -- userPrimary -> UserMessage
	FOREIGN KEY (
		u_reciever -- ¼ö½ÅÀÚ
	)
	REFERENCES Users ( -- userPrimary
		u_Id -- userId
	);

-- UserMessage
ALTER TABLE Messanger
	ADD CONSTRAINT FK_Users_TO_Messanger2 -- userPrimary -> UserMessage2
	FOREIGN KEY (
		u_sender -- ¹ß½ÅÀÚ
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
	ADD CONSTRAINT FK_Admin_TO_FreeBoard -- »õ Å×ÀÌºí3 -> Board
	FOREIGN KEY (
		a_id -- °ü¸®ÀÚ¾ÆÀÌµð
	)
	REFERENCES Admin ( -- »õ Å×ÀÌºí3
		a_id -- °ü¸®ÀÚ¾ÆÀÌµð
	);

-- °Ô½ÃÆÇÃ·ºÎÆÄÀÏ
ALTER TABLE FreeBoardFile
	ADD CONSTRAINT FK_FreeBoard_TO_FreeBoardFile -- Board -> °Ô½ÃÆÇÃ·ºÎÆÄÀÏ
	FOREIGN KEY (
		fb_no -- ÀÚÀ¯°Ô½ÃÆÇ¹øÈ£
	)
	REFERENCES FreeBoard ( -- Board
		fb_no -- ÀÚÀ¯°Ô½ÃÆÇ¹øÈ£
	);

-- ¹æ¿É¼Ç
ALTER TABLE RoomOption
	ADD CONSTRAINT FK_Room_TO_RoomOption -- Room -> ¹æ¿É¼Ç
	FOREIGN KEY (
		r_No -- ¹æ¹øÈ£
	)
	REFERENCES Room ( -- Room
		r_No -- ¹æ¹øÈ£
	);

-- ¹æµî·ÏÆäÀÌÁö
ALTER TABLE RoomEnroll
	ADD CONSTRAINT FK_Room_TO_RoomEnroll -- Room -> ¹æµî·ÏÆäÀÌÁö
	FOREIGN KEY (
		r_No -- ¹æ¹øÈ£
	)
	REFERENCES Room ( -- Room
		r_No -- ¹æ¹øÈ£
	);

-- µî·ÏÆäÀÌÁöÃ·ºÎÆÄÀÏ
ALTER TABLE RoomFile
	ADD CONSTRAINT FK_RoomEnroll_TO_RoomFile -- ¹æµî·ÏÆäÀÌÁö -> µî·ÏÆäÀÌÁöÃ·ºÎÆÄÀÏ
	FOREIGN KEY (
		re_no -- ¹æµî·Ï¹øÈ£
	)
	REFERENCES RoomEnroll ( -- ¹æµî·ÏÆäÀÌÁö
		re_no -- ¹æµî·Ï¹øÈ£
	);

-- ½ºÅÍµð¸É¹ö
ALTER TABLE StudyMember
	ADD CONSTRAINT FK_Users_TO_StudyMember -- userPrimary -> ½ºÅÍµð¸É¹ö
	FOREIGN KEY (
		u_Id -- userId
	)
	REFERENCES Users ( -- userPrimary
		u_Id -- userId
	);

-- ½ºÅÍµð¸É¹ö
ALTER TABLE StudyMember
	ADD CONSTRAINT FK_StudyGroup_TO_StudyMember -- ½ºÅÍµð¸ðÀÓ -> ½ºÅÍµð¸É¹ö
	FOREIGN KEY (
		sg_no -- ½ºÅÍµð¹øÈ£
	)
	REFERENCES StudyGroup ( -- ½ºÅÍµð¸ðÀÓ
		sg_no -- ½ºÅÍµð¹øÈ£
	);

-- »õ Å×ÀÌºí
ALTER TABLE RecruitComments
	ADD CONSTRAINT FK_Users_TO_RecruitComments -- userPrimary -> »õ Å×ÀÌºí
	FOREIGN KEY (
		u_Id -- userId
	)
	REFERENCES Users ( -- userPrimary
		u_Id -- userId
	);

-- »õ Å×ÀÌºí
ALTER TABLE RecruitComments
	ADD CONSTRAINT FK_RecruitBoard_TO_RecruitCo -- Board4 -> »õ Å×ÀÌºí
	FOREIGN KEY (
		rb_no -- ¸ðÁý°Ô½ÃÆÇ¹øÈ£
	)
	REFERENCES RecruitBoard ( -- Board4
		rb_no -- ¸ðÁý°Ô½ÃÆÇ¹øÈ£
	);

-- »õ Å×ÀÌºí2
ALTER TABLE FreeLikes
	ADD CONSTRAINT FK_FreeBoard_TO_FreeLikes -- Board -> »õ Å×ÀÌºí2
	FOREIGN KEY (
		fb_no -- ÀÚÀ¯°Ô½ÃÆÇ¹øÈ£
	)
	REFERENCES FreeBoard ( -- Board
		fb_no -- ÀÚÀ¯°Ô½ÃÆÇ¹øÈ£
	);

-- »õ Å×ÀÌºí2
ALTER TABLE FreeLikes
	ADD CONSTRAINT FK_Users_TO_FreeLikes -- userPrimary -> »õ Å×ÀÌºí2
	FOREIGN KEY (
		u_Id -- userId
	)
	REFERENCES Users ( -- userPrimary
		u_Id -- userId
	);

-- »õ Å×ÀÌºí6
ALTER TABLE Studyboard
	ADD CONSTRAINT FK_StudyGroup_TO_Studyboard -- ½ºÅÍµð¸ðÀÓ -> »õ Å×ÀÌºí6
	FOREIGN KEY (
		sg_no -- ½ºÅÍµð¹øÈ£
	)
	REFERENCES StudyGroup ( -- ½ºÅÍµð¸ðÀÓ
		sg_no -- ½ºÅÍµð¹øÈ£
	);

-- »õ Å×ÀÌºí6
ALTER TABLE Studyboard
	ADD CONSTRAINT FK_Users_TO_Studyboard -- userPrimary -> »õ Å×ÀÌºí6
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
	ADD CONSTRAINT FK_Admin_TO_AskBoard -- »õ Å×ÀÌºí3 -> Board2
	FOREIGN KEY (
		a_id -- °ü¸®ÀÚ¾ÆÀÌµð
	)
	REFERENCES Admin ( -- »õ Å×ÀÌºí3
		a_id -- °ü¸®ÀÚ¾ÆÀÌµð
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

-- »õ Å×ÀÌºí7
ALTER TABLE RvLikes
	ADD CONSTRAINT FK_ReviewBoard_TO_RvLikes -- Board3 -> »õ Å×ÀÌºí7
	FOREIGN KEY (
		rv_no -- ÈÄ±â°Ô½ÃÆÇ¹øÈ£
	)
	REFERENCES ReviewBoard ( -- Board3
		rv_no -- ÈÄ±â°Ô½ÃÆÇ¹øÈ£
	);

-- »õ Å×ÀÌºí7
ALTER TABLE RvLikes
	ADD CONSTRAINT FK_Users_TO_RvLikes -- userPrimary -> »õ Å×ÀÌºí7
	FOREIGN KEY (
		u_Id -- userId
	)
	REFERENCES Users ( -- userPrimary
		u_Id -- userId
	);

-- »õ Å×ÀÌºí9
ALTER TABLE RvComments
	ADD CONSTRAINT FK_ReviewBoard_TO_RvComments -- Board3 -> »õ Å×ÀÌºí9
	FOREIGN KEY (
		rv_no -- ÈÄ±â°Ô½ÃÆÇ¹øÈ£
	)
	REFERENCES ReviewBoard ( -- Board3
		rv_no -- ÈÄ±â°Ô½ÃÆÇ¹øÈ£
	);

-- »õ Å×ÀÌºí9
ALTER TABLE RvComments
	ADD CONSTRAINT FK_Users_TO_RvComments -- userPrimary -> »õ Å×ÀÌºí9
	FOREIGN KEY (
		u_Id -- userId
	)
	REFERENCES Users ( -- userPrimary
		u_Id -- userId
	);

-- »õ Å×ÀÌºí10
ALTER TABLE FreeComments
	ADD CONSTRAINT FK_FreeBoard_TO_FreeComments -- Board -> »õ Å×ÀÌºí10
	FOREIGN KEY (
		fb_no -- ÀÚÀ¯°Ô½ÃÆÇ¹øÈ£
	)
	REFERENCES FreeBoard ( -- Board
		fb_no -- ÀÚÀ¯°Ô½ÃÆÇ¹øÈ£
	);

-- »õ Å×ÀÌºí10
ALTER TABLE FreeComments
	ADD CONSTRAINT FK_Users_TO_FreeComments -- userPrimary -> »õ Å×ÀÌºí10
	FOREIGN KEY (
		u_Id -- userId
	)
	REFERENCES Users ( -- userPrimary
		u_Id -- userId
	);

-- °Ô½ÃÆÇÃ·ºÎÆÄÀÏ2
ALTER TABLE RBoardFile
	ADD CONSTRAINT FK_ReviewBoard_TO_RBoardFile -- Board3 -> °Ô½ÃÆÇÃ·ºÎÆÄÀÏ2
	FOREIGN KEY (
		rv_no -- ÈÄ±â°Ô½ÃÆÇ¹øÈ£
	)
	REFERENCES ReviewBoard ( -- Board3
		rv_no -- ÈÄ±â°Ô½ÃÆÇ¹øÈ£
	);