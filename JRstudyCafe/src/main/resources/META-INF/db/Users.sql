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
	ADD CONSTRAINT PK_User -- userPrimary 기본키
	PRIMARY KEY (
		u_Id -- userId
);

ALTER TABLE Users ADD u_image VARCHAR(100) DEFAULT 'noImg.png' NOT NULL;

ALTER TABLE SAMPLE DROP COLUMN TEST_VARCHAR2;

-- 일반 회원가입 Users.xml / id = u_join        u_status= 0(회원탈퇴) / 1 (가입된상태)

INSERT INTO USERS (u_id, u_pw, u_name, u_nickname, u_phone, u_tel, u_email, u_addr, u_birth, u_status, u_image)
    VALUES ('aaa','111','홍길동','닉네임','','01049337210','sss111@gamil.com','주소','2000-01-01',1,'noImg.png');
    
INSERT INTO USERS (u_id, u_pw, u_name, u_nickname, u_phone, u_tel, u_email, u_addr, u_birth, u_status)
    VALUES ('bbb','111','홍길동','닉네임','','01049337210','sss111@gamil.com','주소','2000-01-01',1);

select * from Users;
-- 아이디 중복체크 Users.xml / id = u_idCofirm 

SELECT COUNT(*) FROM USERS WHERE u_Id='aaa';

-- 유저 DTO 가져 오기  Users.xml / id = u_getUsers

SELECT * FROM USERS WHERE u_id ='aaa';

-- 아이디 찾기 Users.xml / id = u_idfind   
SELECT * FROM USERS WHERE u_email='sss222@gamil.com' AND u_name='홍길동';

-- 회원 정보 수정 Users.xml / id = u_modify 
UPDATE Users SET u_pw='222',
                 u_nickname='닉넴',
                 u_phone='01099999999',
                 u_tel='01088888888',
                 u_email='sss222@gamil.com',
                 u_addr='주소',
                 u_birth='1999-02-11',
                 u_image='noImg.png'
                 WHERE u_id='bbb';
                
UPDATE USERS SET u_status=0 WHERE u_id='aaa';

COMMIT;
