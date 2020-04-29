DROP TABLE Users;

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

-- userPrimary
ALTER TABLE Users
	ADD CONSTRAINT PK_User -- userPrimary �⺻Ű
	PRIMARY KEY (
		u_Id -- userId
);

ALTER TABLE Users ADD u_image VARCHAR(100) DEFAULT 'noImg.png' NOT NULL;

ALTER TABLE SAMPLE DROP COLUMN TEST_VARCHAR2;

-- �Ϲ� ȸ������ Users.xml / id = u_join        u_status= 0(ȸ��Ż��) / 1 (���ԵȻ���)

INSERT INTO USERS (u_id, u_pw, u_name, u_nickname, u_phone, u_tel, u_email, u_addr, u_birth, u_status, u_image)
    VALUES ('aaa','111','ȫ�浿','�г���','','01049337210','sss111@gamil.com','�ּ�','2000-01-01',1,'noImg.png');
    
INSERT INTO USERS (u_id, u_pw, u_name, u_nickname, u_phone, u_tel, u_email, u_addr, u_birth, u_status)
    VALUES ('bbb','111','이도엽','�г���','','01049337210','sss111@gamil.com','�ּ�','2000-01-01',1);

select * from Users;
-- ���̵� �ߺ�üũ Users.xml / id = u_idCofirm 
UPDATE USERS SET U_STATUS = 0 WHERE U_ID = 'aaa';
SELECT COUNT(*) FROM USERS WHERE u_Id='aaa';

-- ���� DTO ���� ����  Users.xml / id = u_getUsers

SELECT * FROM USERS WHERE u_id ='aaa';

-- ���̵� ã�� Users.xml / id = u_idfind   
SELECT * FROM USERS WHERE u_email='sss222@gamil.com' AND u_name='ȫ�浿';

-- ȸ�� ���� ���� Users.xml / id = u_modify 
UPDATE Users SET u_pw='222',
                 u_nickname='�г�',
                 u_phone='01099999999',
                 u_tel='01088888888',
                 u_email='sss222@gamil.com',
                 u_addr='�ּ�',
                 u_birth='1999-02-11',
                 u_image='noImg.png'
                 WHERE u_id='bbb';
SELECT * FROM USERS;
UPDATE USERS SET u_status=1;

COMMIT;


SELECT * FROM USERS U, FREEBOARD F, RECRUITBOARD RB, REVIEWBOARD RV, ASKBOARD A WHERE F.U_ID = U.U_ID AND RB.U_ID = U.U_ID AND RV.U_ID = U.U_ID;