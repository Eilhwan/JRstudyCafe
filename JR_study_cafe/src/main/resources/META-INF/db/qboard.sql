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
        VALUES('Admin', '111', '������', 1);
-- Board2
ALTER TABLE AskBoard
	ADD CONSTRAINT PK_AskBoard -- Board2 �⺻Ű
	PRIMARY KEY (
		ab_no -- ���ǰԽ��ǹ�ȣ
	);

ALTER TABLE Users
	ADD CONSTRAINT PK_Users -- userPrimary �⺻Ű
	PRIMARY KEY (
		u_Id -- userId
	);
    ALTER TABLE Admin
	ADD CONSTRAINT PK_Users -- userPrimary �⺻Ű
	PRIMARY KEY (
		u_Id -- userId
	);

INSERT INTO ASKBOARD (ab_no, ab_name, ab_content, ab_group, ab_step, ab_indent, u_id)
    VALUES(ASKBOARD_SEQ.NEXTVAL, '����5', '����5', ASKBOARD_SEQ.CURRVAL, 0, 0, 'aaaaaa');
INSERT INTO ASKBOARD (ab_no, ab_name, ab_content, ab_group, ab_step, ab_indent, u_id)
    VALUES(ASKBOARD_SEQ.NEXTVAL, '����3', '����3', ASKBOARD_SEQ.CURRVAL, 0, 0, 'aaaaa');
INSERT INTO ASKBOARD (ab_no, ab_name, ab_content, ab_group, ab_step, ab_indent)
    VALUES(ASKBOARD_SEQ.NEXTVAL, '����3', '����3', ASKBOARD_SEQ.CURRVAL, 0, 0);

-- �۸�� (startRow, endRow����)
SELECT * FROM ASKBOARD ORDER BY AB_NO DESC;
SELECT * FROM (SELECT ROWNUM RN, A.* FROM
    (SELECT ab_no, (SELECT u_name FROM ASKBOARD B, Users U WHERE B.u_id=U.u_id AND ASKBOARD.ab_no=ab_no)|| 
        (SELECT a_name FROM ASKBOARD B, Admin A WHERE A.a_id=B.a_id AND askboard.ab_no=ab_no) WRITER,
    ab_name, ab_content, ab_hit, ab_rdate, ab_group, ab_step, ab_indent
    from ASKBOARD WHERE ab_status !=0 ORDER BY ab_group DESC, ab_step) A)
    WHERE RN BETWEEN 1 AND 20;
-- ��ü �� ����
SELECT COUNT(*) FROM ASKBOARD;
-- ���۾���
INSERT INTO ASKBOARD (ab_no, ab_name, ab_content, ab_group, ab_step, ab_indent, u_id)
    VALUES(ASKBOARD_SEQ.NEXTVAL, '����6', '����6', ASKBOARD_SEQ.CURRVAL, 0, 0, 'aaaaaa');

-- bId�� ��ȸ�� 1ȸ �ø���
UPDATE ASKBOARD SET AB_HIT = AB_HIT+1 WHERE AB_NO=1;
-- �󼼱ۺ���(bId�� dto��������)
SELECT * FROM ASKBOARD WHERE AB_NO=1;
-- �亯�� ������ step A
 UPDATE ASKBOARD SET AB_STEP = AB_STEP+1 WHERE AB_GROUP=1 AND AB_STEP>0;
-- �亯�� ����
 INSERT INTO ASKBOARD (ab_no, ab_name, ab_content, ab_group, ab_step, ab_indent,u_id, a_id)
     VALUES (ASKBOARD_SEQ.NEXTVAL, '����1 ù��', '����1�亯', 2, 1, 1, 'aaaaa', 'Admin');
-- �ۼ����ϱ�
 UPDATE ASKBOARD SET ab_name='�ٲ�����', ab_content='�ٲﳻ��' WHERE ab_no=1;
-- �ۻ����ϱ�
 UPDATE ASKBOARD SET ab_status=0 where ab_no=5;
 commit;
 rollback;
 


 
  
 
 