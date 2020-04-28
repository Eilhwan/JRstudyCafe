select * from USERS;
SELECT * FROM admin;
select * from askboard;
DROP TABLE AskBoard CASCADE CONSTRAINTS;
DROP TABLE USERS;
DROP TABLE ADMIN;
DROP TABLE AskBoard;
DROP SEQUENCE ASKBOARD_SEQ;
CREATE SEQUENCE ASKBOARD_SEQ MAXVALUE 999999 NOCACHE NOCYCLE;
CREATE TABLE AskBoard (
		ab_no NUMBER(10) NOT NULL,
		ab_name VARCHAR2(100) NOT NULL,
		ab_content CLOB NOT NULL,
        ab_rdate DATE DEFAULT SYSDATE NOT NULL,
		ab_status NUMBER(1) DEFAULT 1 NOT NULL,
		ab_hit NUMBER(4) DEFAULT 0 NOT NULL,
        ab_group NUMBER(6) NOT NULL,
        ab_step NUMBER(3) NOT NULL,
        ab_indent NUMBER(3) NOT NULL,
		u_id VARCHAR2(50) REFERENCES USERS(U_ID) NULL,
		a_id VARCHAR2(100) REFERENCES ADMIN(A_ID) NULL
);
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
		u_status NUMBER(1) NOT NULL,
        u_image VARCHAR2(100) DEFAULT 'noImg.png' NOT NULL
);
CREATE TABLE Admin (
		a_id VARCHAR2(100) PRIMARY KEY NOT NULL,
		a_pw VARCHAR2(30) NULL,
		a_name VARCHAR2(20) NULL,
		a_status NUMBER(1) NULL;
);
INSERT INTO Admin(a_id, a_pw, a_name, a_status)
        VALUES('Admin', '111', '관리자', 1);
-- Board2
ALTER TABLE AskBoard
	ADD CONSTRAINT PK_AskBoard -- Board2 기본키
	PRIMARY KEY (
		ab_no -- 문의게시판번호
	);

ALTER TABLE Users
	ADD CONSTRAINT PK_Users -- userPrimary 기본키
	PRIMARY KEY (
		u_Id -- userId
	);
    ALTER TABLE Admin
	ADD CONSTRAINT PK_Users -- userPrimary 기본키
	PRIMARY KEY (
		u_Id -- userId
	);

INSERT INTO ASKBOARD (ab_no, ab_name, ab_content, ab_group, ab_step, ab_indent, u_id)
    VALUES(ASKBOARD_SEQ.NEXTVAL, '제목5', '본문5', ASKBOARD_SEQ.CURRVAL, 0, 0, 'aaaaaa');
INSERT INTO ASKBOARD (ab_no, ab_name, ab_content, ab_group, ab_step, ab_indent, u_id)
    VALUES(ASKBOARD_SEQ.NEXTVAL, '제목3', '본문3', ASKBOARD_SEQ.CURRVAL, 0, 0, 'aaaaa');
INSERT INTO ASKBOARD (ab_no, ab_name, ab_content, ab_group, ab_step, ab_indent)
    VALUES(ASKBOARD_SEQ.NEXTVAL, '제목3', '본문3', ASKBOARD_SEQ.CURRVAL, 0, 0);

-- 글목록 (startRow, endRow까지)
SELECT * FROM ASKBOARD ORDER BY AB_NO DESC;
SELECT * FROM (SELECT ROWNUM RN, A.* FROM
    (SELECT ab_no, (SELECT u_name FROM ASKBOARD B, Users U WHERE B.u_id=U.u_id AND ASKBOARD.ab_no=ab_no)|| 
        (SELECT a_name FROM ASKBOARD B, Admin A WHERE A.a_id=B.a_id AND askboard.ab_no=ab_no) WRITER,
    ab_name, ab_content, ab_hit, ab_rdate, ab_group, ab_step, ab_indent
    from ASKBOARD WHERE ab_status !=0 ORDER BY ab_group DESC, ab_step) A)
    WHERE RN BETWEEN 1 AND 20;
-- 전체 글 갯수
SELECT COUNT(*) FROM ASKBOARD;
-- 원글쓰기
INSERT INTO ASKBOARD (ab_no, ab_name, ab_content, ab_group, ab_step, ab_indent, u_id)
    VALUES(ASKBOARD_SEQ.NEXTVAL, '제목6', '본문6', ASKBOARD_SEQ.CURRVAL, 0, 0, 'aaaaaa');

-- bId글 조회수 1회 올리기
UPDATE ASKBOARD SET AB_HIT = AB_HIT+1 WHERE AB_NO=1;
-- 상세글보기(bId로 dto가져오기)
SELECT * FROM ASKBOARD WHERE AB_NO=1;
-- 답변글 쓰기전 step A
 UPDATE ASKBOARD SET AB_STEP = AB_STEP+1 WHERE AB_GROUP=1 AND AB_STEP>0;
-- 답변글 쓰기
 INSERT INTO ASKBOARD (ab_no, ab_name, ab_content, ab_group, ab_step, ab_indent,u_id, a_id)
     VALUES (ASKBOARD_SEQ.NEXTVAL, '제목1 첫답', '본문1답변', 2, 1, 1, 'aaaaa', 'Admin');
-- 글수정하기
 UPDATE ASKBOARD SET ab_name='바뀐제목', ab_content='바뀐내용' WHERE ab_no=1;
-- 글삭제하기
 UPDATE ASKBOARD SET ab_status=0 where ab_no=5;
 commit;
 rollback;
 


 
  
 
 