-- userPrimary
DROP TABLE Users;

-- UserBookInfo
DROP TABLE TABLE2;

-- Book
DROP TABLE Book;

-- ���͵����
DROP TABLE StudyGroup;

-- Room
DROP TABLE Room;

-- UserMessage
DROP TABLE Messanger;

-- Board
DROP TABLE Board;

-- �Խ���÷������
DROP TABLE BoardFile;

-- ��ɼ�
DROP TABLE RoomOption;

-- ����������
DROP TABLE RoomEnroll;

-- ���������÷������
DROP TABLE RoomFile;

-- �Խ���Ÿ��
DROP TABLE BoardType;

-- ���͵�ɹ�
DROP TABLE StudyMember;

-- �� ���̺�
DROP TABLE Comment;

-- �� ���̺�2
DROP TABLE Like;

-- �� ���̺�3
DROP TABLE Admin;

-- �� ���̺�4
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
	ADD CONSTRAINT PK_User -- userPrimary �⺻Ű
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
		mNo NUMBER(10) NOT NULL,
		m_title VARCHAR2(30) NOT NULL,
		m_content VARCHAR2(160) NOT NULL,
		m_status NUMBER(1) NOT NULL,
		u_Id VARCHAR2(50) NOT NULL
);

-- UserMessage
ALTER TABLE Messanger
	ADD CONSTRAINT PK_Messanger -- UserMessage �⺻Ű
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
	ADD CONSTRAINT PK_Board -- Board �⺻Ű
	PRIMARY KEY (
		b_no -- �Խ��ǹ�ȣ
	);

-- �Խ���÷������
CREATE TABLE BoardFile (
		bf_no NUMBER(10) NOT NULL,
		bf_name VARCHAR2(100) NOT NULL,
		bf_ori VARCHAR2(100) NOT NULL,
		bf_size INT NOT NULL,
		b_no NUMBER(10) NOT NULL
);

-- �Խ���÷������
ALTER TABLE BoardFile
	ADD CONSTRAINT PK_BoardFile -- �Խ���÷������ �⺻Ű
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
CREATE TABLE Comments (
		c_no NUMBER(10) NOT NULL,
		u_Id VARCHAR2(50) NOT NULL,
		b_no NUMBER(10) NOT NULL,
		c_content VARCHAR2(400) NOT NULL,
		c_status NUMBER(1) NOT NULL
);

-- �� ���̺�
ALTER TABLE Comments
	ADD CONSTRAINT PK_Comment -- �� ���̺� �⺻Ű
	PRIMARY KEY (
		c_no -- ��� ��ȣ
	);

-- �� ���̺�2
CREATE TABLE Likes (
		b_no NUMBER(10) NOT NULL,
		l_cnt NUMBER(3) NULL,
		u_Id VARCHAR2(50) NULL
);

-- �� ���̺�2
ALTER TABLE Likes
	ADD CONSTRAINT PK_Like -- �� ���̺�2 �⺻Ű
	PRIMARY KEY (
		b_no -- �Խ��ǹ�ȣ
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

-- Book
ALTER TABLE Book
	ADD CONSTRAINT FK_Users_TO_Book
	FOREIGN KEY (
		u_Id -- userId
	)
	REFERENCES Users ( -- userPrimary
		u_Id -- userId
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
	ADD CONSTRAINT FK_BoardType_TO_Board -- �Խ���Ÿ�� -> Board
	FOREIGN KEY (
		bt_No -- Ÿ�Թ�ȣ
	)
	REFERENCES BoardType ( -- �Խ���Ÿ��
		bt_No -- Ÿ�Թ�ȣ
	);

-- Board
ALTER TABLE Board
	ADD CONSTRAINT FK_Admin_TO_Board -- �� ���̺�3 -> Board
	FOREIGN KEY (
		a_id -- �����ھ��̵�
	)
	REFERENCES Admin ( -- �� ���̺�3
		a_id -- �����ھ��̵�
	);

-- �Խ���÷������
ALTER TABLE BoardFile
	ADD CONSTRAINT FK_Board_TO_BoardFile -- Board -> �Խ���÷������
	FOREIGN KEY (
		b_no -- �Խ��ǹ�ȣ
	)
	REFERENCES Board ( -- Board
		b_no -- �Խ��ǹ�ȣ
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
ALTER TABLE Comments
	ADD CONSTRAINT FK_Users_TO_Comments -- userPrimary -> �� ���̺�
	FOREIGN KEY (
		u_Id -- userId
	)
	REFERENCES Users ( -- userPrimary
		u_Id -- userId
	);

-- �� ���̺�
ALTER TABLE Comments
	ADD CONSTRAINT FK_Board_TO_Comments -- Board -> �� ���̺�
	FOREIGN KEY (
		b_no -- �Խ��ǹ�ȣ
	)
	REFERENCES Board ( -- Board
		b_no -- �Խ��ǹ�ȣ
	);

-- �� ���̺�2
ALTER TABLE Likes
	ADD CONSTRAINT FK_Board_TO_Likes -- Board -> �� ���̺�2
	FOREIGN KEY (
		b_no -- �Խ��ǹ�ȣ
	)
	REFERENCES Board ( -- Board
		b_no -- �Խ��ǹ�ȣ
	);

-- �� ���̺�2
ALTER TABLE Likes
	ADD CONSTRAINT FK_User_TO_Likes -- userPrimary -> �� ���̺�2
	FOREIGN KEY (
		u_Id -- userId
	)
	REFERENCES Users ( -- userPrimary
		u_Id -- userId
	);