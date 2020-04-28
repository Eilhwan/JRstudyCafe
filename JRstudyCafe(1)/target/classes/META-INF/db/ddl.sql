-- userPrimary
DROP TABLE Users CASCADE CONSTRAINTS PURGE;

-- UserBookInfo
DROP TABLE TABLE2 CASCADE CONSTRAINTS PURGE;

-- Book
DROP TABLE Book CASCADE CONSTRAINTS PURGE;

<<<<<<< HEAD
-- 스터디모임
DROP TABLE StudyGroup CASCADE CONSTRAINTS PURGE;
=======
-- ���͵����
DROP TABLE IF EXISTS StudyGroup;
>>>>>>> origin/ba

-- Room
DROP TABLE Room CASCADE CONSTRAINTS PURGE;

-- UserMessage
DROP TABLE Messanger CASCADE CONSTRAINTS PURGE;

-- Board
DROP TABLE FreeBoard CASCADE CONSTRAINTS PURGE;

<<<<<<< HEAD
-- 게시판첨부파일
DROP TABLE FreeBoardFile CASCADE CONSTRAINTS PURGE;

-- 방옵션
DROP TABLE RoomOption CASCADE CONSTRAINTS PURGE;

-- 방등록페이지
DROP TABLE RoomEnroll CASCADE CONSTRAINTS PURGE;

-- 등록페이지첨부파일
DROP TABLE RoomFile CASCADE CONSTRAINTS PURGE;

-- 게시판타입
DROP TABLE BoardType CASCADE CONSTRAINTS PURGE;

-- 스터디맴버
DROP TABLE StudyMember CASCADE CONSTRAINTS PURGE;

-- 새 테이블
DROP TABLE RecruitComments CASCADE CONSTRAINTS PURGE;

-- 새 테이블2
DROP TABLE FreeLikes CASCADE CONSTRAINTS PURGE;

-- 새 테이블3
DROP TABLE Admin CASCADE CONSTRAINTS PURGE;

-- 새 테이블4
DROP TABLE StudyType CASCADE CONSTRAINTS PURGE;

-- 새 테이블5
DROP TABLE BookMark CASCADE CONSTRAINTS PURGE;

-- 새 테이블6
DROP TABLE Studyboard CASCADE CONSTRAINTS PURGE;
=======
-- �Խ���÷������
DROP TABLE IF EXISTS FreeBoardFile;

-- ��ɼ�
DROP TABLE IF EXISTS RoomOption;

-- ����������
DROP TABLE IF EXISTS RoomEnroll;

-- ���������÷������
DROP TABLE IF EXISTS RoomFile;

-- �Խ���Ÿ��
DROP TABLE IF EXISTS BoardType;

-- ���͵�ɹ�
DROP TABLE IF EXISTS StudyMember;

-- �� ���̺�
DROP TABLE IF EXISTS RecruitComments;

-- �� ���̺�2
DROP TABLE IF EXISTS FreeLikes;

-- �� ���̺�3
DROP TABLE IF EXISTS Admin;

-- �� ���̺�4
DROP TABLE IF EXISTS StudyType;

-- �� ���̺�5
DROP TABLE IF EXISTS BookMark;

-- �� ���̺�6
DROP TABLE IF EXISTS Studyboard;
>>>>>>> origin/ba

-- Board2
DROP TABLE AskBoard CASCADE CONSTRAINTS PURGE;

-- Board3
DROP TABLE ReviewBoard CASCADE CONSTRAINTS PURGE;

-- Board4
DROP TABLE RecruitBoard CASCADE CONSTRAINTS PURGE;

<<<<<<< HEAD
-- 새 테이블7
DROP TABLE RvLikes CASCADE CONSTRAINTS PURGE;

-- 새 테이블8
DROP TABLE Likes2 CASCADE CONSTRAINTS PURGE;

-- 새 테이블9
DROP TABLE RvComments CASCADE CONSTRAINTS PURGE;

-- 새 테이블10
DROP TABLE FreeComments CASCADE CONSTRAINTS PURGE;

-- 게시판첨부파일2
DROP TABLE RBoardFile CASCADE CONSTRAINTS PURGE;
=======
-- �� ���̺�7
DROP TABLE IF EXISTS RvLikes;

-- �� ���̺�8
DROP TABLE IF EXISTS Likes2;

-- �� ���̺�9
DROP TABLE IF EXISTS RvComments;

-- �� ���̺�10
DROP TABLE IF EXISTS FreeComments;

-- �Խ���÷������2
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
	ADD CONSTRAINT PK_Users -- userPrimary �⺻Ű
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
	ADD CONSTRAINT PK_Book -- Book �⺻Ű
	PRIMARY KEY (
		bk_no -- �����ȣ
	);

-- ���͵����
CREATE TABLE StudyGroup (
		sg_no NUMBER(10) NOT NULL,
		sg_name VARCHAR2(100) NOT NULL,
		u_Id VARCHAR2(50) NULL,
		sg_person NUMBER(2) NOT NULL,
		sg_explain CLOB NOT NULL,
		st_no NUMBER(10) NULL
);

-- ���͵����
ALTER TABLE StudyGroup
	ADD CONSTRAINT PK_StudyGroup -- ���͵���� �⺻Ű
	PRIMARY KEY (
		sg_no -- ���͵��ȣ
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
	ADD CONSTRAINT PK_Room -- Room �⺻Ű
	PRIMARY KEY (
		r_No -- ���ȣ
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
	ADD CONSTRAINT PK_Messanger -- UserMessage �⺻Ű
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
	ADD CONSTRAINT PK_FreeBoard -- Board �⺻Ű
	PRIMARY KEY (
		fb_no -- �����Խ��ǹ�ȣ
	);

-- �Խ���÷������
CREATE TABLE FreeBoardFile (
		bf_no NUMBER(10) NOT NULL,
		bf_name VARCHAR2(100) NOT NULL,
		bf_ori VARCHAR2(100) NOT NULL,
		bf_size INT NOT NULL,
		fb_no NUMBER(10) NOT NULL
);

-- �Խ���÷������
ALTER TABLE FreeBoardFile
	ADD CONSTRAINT PK_FreeBoardFile -- �Խ���÷������ �⺻Ű
	PRIMARY KEY (
		bf_no -- ���Ϲ�ȣ
	);

-- ��ɼ�
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

-- ��ɼ�
ALTER TABLE RoomOption
	ADD CONSTRAINT PK_RoomOption -- ��ɼ� �⺻Ű
	PRIMARY KEY (
		r_No -- ���ȣ
	);

-- ����������
CREATE TABLE RoomEnroll (
		re_no NUMBER(10) NOT NULL,
		re_name VARCHAR2(100) NOT NULL,
		re_sub VARCHAR2(100) NOT NULL,
		re_content CLOB NOT NULL,
		r_No NUMBER(10) NULL
);

-- ����������
ALTER TABLE RoomEnroll
	ADD CONSTRAINT PK_RoomEnroll -- ���������� �⺻Ű
	PRIMARY KEY (
		re_no -- ���Ϲ�ȣ
	);

-- ���������÷������
CREATE TABLE RoomFile (
		rf_no NUMBER(10) NOT NULL,
		rf_name VARCHAR2(100) NOT NULL,
		rf_ori VARCHAR2(100) NOT NULL,
		rf_size INT NOT NULL,
		re_no NUMBER(10) NOT NULL
);

-- ���������÷������
ALTER TABLE RoomFile
	ADD CONSTRAINT PK_RoomFile -- ���������÷������ �⺻Ű
	PRIMARY KEY (
		rf_no -- ���Ϲ�ȣ
	);

-- �Խ���Ÿ��
CREATE TABLE BoardType (
		bt_No NUMBER(10) NOT NULL,
		bt_Name VARCHAR2(20) NOT NULL,
		bt_Type VARCHAR2(20) NOT NULL
);

-- �Խ���Ÿ��
ALTER TABLE BoardType
	ADD CONSTRAINT PK_BoardType -- �Խ���Ÿ�� �⺻Ű
	PRIMARY KEY (
		bt_No -- Ÿ�Թ�ȣ
	);

-- ���͵�ɹ�
CREATE TABLE StudyMember (
		sm_no NUMBER(10) NOT NULL,
		u_Id VARCHAR2(50) NOT NULL,
		sg_no NUMBER(10) NOT NULL
);

-- ���͵�ɹ�
ALTER TABLE StudyMember
	ADD CONSTRAINT PK_StudyMember -- ���͵�ɹ� �⺻Ű
	PRIMARY KEY (
		sm_no -- �ɹ���ȣ
	);

-- �� ���̺�
CREATE TABLE RecruitComments (
		c_no NUMBER(10) NOT NULL,
		u_Id VARCHAR2(50) NOT NULL,
		c_content VARCHAR2(400) NOT NULL,
		c_status NUMBER(1) NOT NULL,
		rb_no NUMBER(10) NULL
);

-- �� ���̺�
ALTER TABLE RecruitComments
	ADD CONSTRAINT PK_RecruitComments -- �� ���̺� �⺻Ű
	PRIMARY KEY (
		c_no -- ��� ��ȣ
	);

-- �� ���̺�2
CREATE TABLE FreeLikes (
		likeno NUMBER(10) NOT NULL,
		fb_no NUMBER(10) NULL,
		u_Id VARCHAR2(50) NULL
);

-- �� ���̺�2
ALTER TABLE FreeLikes
	ADD CONSTRAINT PK_FreeLikes -- �� ���̺�2 �⺻Ű
	PRIMARY KEY (
		likeno -- ���ƿ� ��ȣ
	);

-- �� ���̺�3
CREATE TABLE Admin (
		a_id VARCHAR2(100) NOT NULL,
		a_pw VARCHAR2(30) NULL,
		a_name VARCHAR2(20) NULL,
		a_status NUMBER(1) NULL
);

-- �� ���̺�3
ALTER TABLE Admin
	ADD CONSTRAINT PK_Admin -- �� ���̺�3 �⺻Ű
	PRIMARY KEY (
		a_id -- �����ھ��̵�
	);

-- �� ���̺�4
CREATE TABLE StudyType (
		st_no NUMBER(10) NOT NULL,
		st_name VARCHAR2(20) NOT NULL
);

-- �� ���̺�4
ALTER TABLE StudyType
	ADD CONSTRAINT PK_StudyType -- �� ���̺�4 �⺻Ű
	PRIMARY KEY (
		st_no -- ���͵�Ÿ�� ��ȣ
	);

-- �� ���̺�5
CREATE TABLE BookMark (
		bm_no <������ Ÿ�� ����> NULL,
		bm_name <������ Ÿ�� ����> NULL
);

-- �� ���̺�6
CREATE TABLE Studyboard (
		sb_no NUMBER(10) NOT NULL,
		sb_title VARCHAR2(100) NOT NULL,
		sb_content CLOB NOT NULL,
		sb_hit NUMBER(4) NOT NULL,
		sb_status NUMBER(1) NOT NULL,
		sg_no NUMBER(10) NOT NULL,
		u_Id VARCHAR2(50) NOT NULL
);

-- �� ���̺�6
ALTER TABLE Studyboard
	ADD CONSTRAINT PK_Studyboard -- �� ���̺�6 �⺻Ű
	PRIMARY KEY (
		sb_no -- ���͵�Խ��� ��ȣ
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
	ADD CONSTRAINT PK_AskBoard -- Board2 �⺻Ű
	PRIMARY KEY (
		ab_no -- ���ǰԽ��ǹ�ȣ
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
	ADD CONSTRAINT PK_ReviewBoard -- Board3 �⺻Ű
	PRIMARY KEY (
		rv_no -- �ı�Խ��ǹ�ȣ
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
	ADD CONSTRAINT PK_RecruitBoard -- Board4 �⺻Ű
	PRIMARY KEY (
		rb_no -- �����Խ��ǹ�ȣ
	);

-- �� ���̺�7
CREATE TABLE RvLikes (
		likeno NUMBER(10) NOT NULL,
		rv_no NUMBER(10) NULL,
		u_Id VARCHAR2(50) NULL
);

-- �� ���̺�7
ALTER TABLE RvLikes
	ADD CONSTRAINT PK_RvLikes -- �� ���̺�7 �⺻Ű
	PRIMARY KEY (
		likeno -- ���ƿ� ��ȣ
	);

-- �� ���̺�8
CREATE TABLE Likes2 (
		likeno NUMBER(10) NOT NULL
);

-- �� ���̺�8
ALTER TABLE Likes2
	ADD CONSTRAINT PK_Likes2 -- �� ���̺�8 �⺻Ű
	PRIMARY KEY (
		likeno -- ���ƿ� ��ȣ
	);

-- �� ���̺�9
CREATE TABLE RvComments (
		c_no NUMBER(10) NOT NULL,
		c_content VARCHAR2(400) NOT NULL,
		c_status NUMBER(1) NOT NULL,
		rv_no NUMBER(10) NULL,
		u_Id VARCHAR2(50) NULL
);

-- �� ���̺�9
ALTER TABLE RvComments
	ADD CONSTRAINT PK_RvComments -- �� ���̺�9 �⺻Ű
	PRIMARY KEY (
		c_no -- ��� ��ȣ
	);

-- �� ���̺�10
CREATE TABLE FreeComments (
		c_no NUMBER(10) NOT NULL,
		u_Id VARCHAR2(50) NOT NULL,
		c_content VARCHAR2(400) NOT NULL,
		c_status NUMBER(1) NOT NULL,
		fb_no NUMBER(10) NULL
);

-- �� ���̺�10
ALTER TABLE FreeComments
	ADD CONSTRAINT PK_FreeComments -- �� ���̺�10 �⺻Ű
	PRIMARY KEY (
		c_no -- ��� ��ȣ
	);

-- �Խ���÷������2
CREATE TABLE RBoardFile (
		bf_no NUMBER(10) NOT NULL,
		bf_name VARCHAR2(100) NOT NULL,
		bf_ori VARCHAR2(100) NOT NULL,
		bf_size INT NOT NULL,
		rv_no NUMBER(10) NULL
);

-- �Խ���÷������2
ALTER TABLE RBoardFile
	ADD CONSTRAINT PK_RBoardFile -- �Խ���÷������2 �⺻Ű
	PRIMARY KEY (
		bf_no -- ���Ϲ�ȣ
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
		r_No -- ���ȣ
	)
	REFERENCES Room ( -- Room
		r_No -- ���ȣ
	);

-- ���͵����
ALTER TABLE StudyGroup
	ADD CONSTRAINT FK_Users_TO_StudyGroup -- userPrimary -> ���͵����
	FOREIGN KEY (
		u_Id -- ����
	)
	REFERENCES Users ( -- userPrimary
		u_Id -- userId
	);

-- ���͵����
ALTER TABLE StudyGroup
	ADD CONSTRAINT FK_StudyType_TO_StudyGroup -- �� ���̺�4 -> ���͵����
	FOREIGN KEY (
		st_no -- ���͵�Ÿ�� ��ȣ
	)
	REFERENCES StudyType ( -- �� ���̺�4
		st_no -- ���͵�Ÿ�� ��ȣ
	);

-- UserMessage
ALTER TABLE Messanger
	ADD CONSTRAINT FK_Users_TO_Messanger -- userPrimary -> UserMessage
	FOREIGN KEY (
		u_reciever -- ������
	)
	REFERENCES Users ( -- userPrimary
		u_Id -- userId
	);

-- UserMessage
ALTER TABLE Messanger
	ADD CONSTRAINT FK_Users_TO_Messanger2 -- userPrimary -> UserMessage2
	FOREIGN KEY (
		u_sender -- �߽���
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
	ADD CONSTRAINT FK_Admin_TO_FreeBoard -- �� ���̺�3 -> Board
	FOREIGN KEY (
		a_id -- �����ھ��̵�
	)
	REFERENCES Admin ( -- �� ���̺�3
		a_id -- �����ھ��̵�
	);

-- �Խ���÷������
ALTER TABLE FreeBoardFile
	ADD CONSTRAINT FK_FreeBoard_TO_FreeBoardFile -- Board -> �Խ���÷������
	FOREIGN KEY (
		fb_no -- �����Խ��ǹ�ȣ
	)
	REFERENCES FreeBoard ( -- Board
		fb_no -- �����Խ��ǹ�ȣ
	);

-- ��ɼ�
ALTER TABLE RoomOption
	ADD CONSTRAINT FK_Room_TO_RoomOption -- Room -> ��ɼ�
	FOREIGN KEY (
		r_No -- ���ȣ
	)
	REFERENCES Room ( -- Room
		r_No -- ���ȣ
	);

-- ����������
ALTER TABLE RoomEnroll
	ADD CONSTRAINT FK_Room_TO_RoomEnroll -- Room -> ����������
	FOREIGN KEY (
		r_No -- ���ȣ
	)
	REFERENCES Room ( -- Room
		r_No -- ���ȣ
	);

-- ���������÷������
ALTER TABLE RoomFile
	ADD CONSTRAINT FK_RoomEnroll_TO_RoomFile -- ���������� -> ���������÷������
	FOREIGN KEY (
		re_no -- ���Ϲ�ȣ
	)
	REFERENCES RoomEnroll ( -- ����������
		re_no -- ���Ϲ�ȣ
	);

-- ���͵�ɹ�
ALTER TABLE StudyMember
	ADD CONSTRAINT FK_Users_TO_StudyMember -- userPrimary -> ���͵�ɹ�
	FOREIGN KEY (
		u_Id -- userId
	)
	REFERENCES Users ( -- userPrimary
		u_Id -- userId
	);

-- ���͵�ɹ�
ALTER TABLE StudyMember
	ADD CONSTRAINT FK_StudyGroup_TO_StudyMember -- ���͵���� -> ���͵�ɹ�
	FOREIGN KEY (
		sg_no -- ���͵��ȣ
	)
	REFERENCES StudyGroup ( -- ���͵����
		sg_no -- ���͵��ȣ
	);

-- �� ���̺�
ALTER TABLE RecruitComments
	ADD CONSTRAINT FK_Users_TO_RecruitComments -- userPrimary -> �� ���̺�
	FOREIGN KEY (
		u_Id -- userId
	)
	REFERENCES Users ( -- userPrimary
		u_Id -- userId
	);

-- �� ���̺�
ALTER TABLE RecruitComments
	ADD CONSTRAINT FK_RecruitBoard_TO_RecruitCo -- Board4 -> �� ���̺�
	FOREIGN KEY (
		rb_no -- �����Խ��ǹ�ȣ
	)
	REFERENCES RecruitBoard ( -- Board4
		rb_no -- �����Խ��ǹ�ȣ
	);

-- �� ���̺�2
ALTER TABLE FreeLikes
	ADD CONSTRAINT FK_FreeBoard_TO_FreeLikes -- Board -> �� ���̺�2
	FOREIGN KEY (
		fb_no -- �����Խ��ǹ�ȣ
	)
	REFERENCES FreeBoard ( -- Board
		fb_no -- �����Խ��ǹ�ȣ
	);

-- �� ���̺�2
ALTER TABLE FreeLikes
	ADD CONSTRAINT FK_Users_TO_FreeLikes -- userPrimary -> �� ���̺�2
	FOREIGN KEY (
		u_Id -- userId
	)
	REFERENCES Users ( -- userPrimary
		u_Id -- userId
	);

-- �� ���̺�6
ALTER TABLE Studyboard
	ADD CONSTRAINT FK_StudyGroup_TO_Studyboard -- ���͵���� -> �� ���̺�6
	FOREIGN KEY (
		sg_no -- ���͵��ȣ
	)
	REFERENCES StudyGroup ( -- ���͵����
		sg_no -- ���͵��ȣ
	);

-- �� ���̺�6
ALTER TABLE Studyboard
	ADD CONSTRAINT FK_Users_TO_Studyboard -- userPrimary -> �� ���̺�6
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
	ADD CONSTRAINT FK_Admin_TO_AskBoard -- �� ���̺�3 -> Board2
	FOREIGN KEY (
		a_id -- �����ھ��̵�
	)
	REFERENCES Admin ( -- �� ���̺�3
		a_id -- �����ھ��̵�
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

-- �� ���̺�7
ALTER TABLE RvLikes
	ADD CONSTRAINT FK_ReviewBoard_TO_RvLikes -- Board3 -> �� ���̺�7
	FOREIGN KEY (
		rv_no -- �ı�Խ��ǹ�ȣ
	)
	REFERENCES ReviewBoard ( -- Board3
		rv_no -- �ı�Խ��ǹ�ȣ
	);

-- �� ���̺�7
ALTER TABLE RvLikes
	ADD CONSTRAINT FK_Users_TO_RvLikes -- userPrimary -> �� ���̺�7
	FOREIGN KEY (
		u_Id -- userId
	)
	REFERENCES Users ( -- userPrimary
		u_Id -- userId
	);

-- �� ���̺�9
ALTER TABLE RvComments
	ADD CONSTRAINT FK_ReviewBoard_TO_RvComments -- Board3 -> �� ���̺�9
	FOREIGN KEY (
		rv_no -- �ı�Խ��ǹ�ȣ
	)
	REFERENCES ReviewBoard ( -- Board3
		rv_no -- �ı�Խ��ǹ�ȣ
	);

-- �� ���̺�9
ALTER TABLE RvComments
	ADD CONSTRAINT FK_Users_TO_RvComments -- userPrimary -> �� ���̺�9
	FOREIGN KEY (
		u_Id -- userId
	)
	REFERENCES Users ( -- userPrimary
		u_Id -- userId
	);

-- �� ���̺�10
ALTER TABLE FreeComments
	ADD CONSTRAINT FK_FreeBoard_TO_FreeComments -- Board -> �� ���̺�10
	FOREIGN KEY (
		fb_no -- �����Խ��ǹ�ȣ
	)
	REFERENCES FreeBoard ( -- Board
		fb_no -- �����Խ��ǹ�ȣ
	);

-- �� ���̺�10
ALTER TABLE FreeComments
	ADD CONSTRAINT FK_Users_TO_FreeComments -- userPrimary -> �� ���̺�10
	FOREIGN KEY (
		u_Id -- userId
	)
	REFERENCES Users ( -- userPrimary
		u_Id -- userId
	);

-- �Խ���÷������2
ALTER TABLE RBoardFile
	ADD CONSTRAINT FK_ReviewBoard_TO_RBoardFile -- Board3 -> �Խ���÷������2
	FOREIGN KEY (
		rv_no -- �ı�Խ��ǹ�ȣ
	)
	REFERENCES ReviewBoard ( -- Board3
		rv_no -- �ı�Խ��ǹ�ȣ
	);