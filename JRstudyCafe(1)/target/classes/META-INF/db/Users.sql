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
	ADD CONSTRAINT PK_User -- userPrimary ±âº»Å°
	PRIMARY KEY (
		u_Id -- userId
);

ALTER TABLE Users ADD u_image VARCHAR(100) DEFAULT 'noImg.png' NOT NULL;

ALTER TABLE SAMPLE DROP COLUMN TEST_VARCHAR2;

-- ÀÏ¹Ý È¸¿ø°¡ÀÔ Users.xml / id = u_join        u_status= 0(È¸¿øÅ»Åð) / 1 (°¡ÀÔµÈ»óÅÂ)

INSERT INTO USERS (u_id, u_pw, u_name, u_nickname, u_phone, u_tel, u_email, u_addr, u_birth, u_status, u_image)
<<<<<<< HEAD
    VALUES ('aaa','111','ì´ë¦„','ë‹‰ë„´','','01049337210','sss111@gamil.com','ì£¼ì†Œ','2000-01-01',1,'noImg.png');
    
INSERT INTO USERS (u_id, u_pw, u_name, u_nickname, u_phone, u_tel, u_email, u_addr, u_birth, u_status)
    VALUES ('bbb','111','È«ï¿½æµ¿','ï¿½Ð³ï¿½ï¿½ï¿½','','01049337210','sss111@gamil.com','ï¿½Ö¼ï¿½','2000-01-01',1);

select * from Users;
-- ï¿½ï¿½ï¿½Ìµï¿½ ï¿½ßºï¿½Ã¼Å© Users.xml / id = u_idCofirm 
=======
    VALUES ('aaa','111','È«±æµ¿','´Ð³×ÀÓ','','01049337210','sss111@gamil.com','ÁÖ¼Ò','2000-01-01',1,'noImg.png');
    
INSERT INTO USERS (u_id, u_pw, u_name, u_nickname, u_phone, u_tel, u_email, u_addr, u_birth, u_status)
    VALUES ('bbb','111','È«±æµ¿','´Ð³×ÀÓ','','01049337210','sss111@gamil.com','ÁÖ¼Ò','2000-01-01',1);

select * from Users;
-- ¾ÆÀÌµð Áßº¹Ã¼Å© Users.xml / id = u_idCofirm 
>>>>>>> origin/ba

SELECT COUNT(*) FROM USERS WHERE u_Id='aaa';

-- À¯Àú DTO °¡Á® ¿À±â  Users.xml / id = u_getUsers

SELECT * FROM USERS WHERE u_id ='aaa';

-- ¾ÆÀÌµð Ã£±â Users.xml / id = u_idfind   
SELECT * FROM USERS WHERE u_email='sss222@gamil.com' AND u_name='È«±æµ¿';

-- È¸¿ø Á¤º¸ ¼öÁ¤ Users.xml / id = u_modify 
UPDATE Users SET u_pw='222',
                 u_nickname='´Ð³Û',
                 u_phone='01099999999',
                 u_tel='01088888888',
                 u_email='sss222@gamil.com',
                 u_addr='ÁÖ¼Ò',
                 u_birth='1999-02-11',
                 u_image='noImg.png'
                 WHERE u_id='bbb';
                
UPDATE USERS SET u_status=0 WHERE u_id='aaa';

COMMIT;
