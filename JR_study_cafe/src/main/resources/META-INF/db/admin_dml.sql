
-- USER DETAIL
SELECT * FROM ADMIN WHERE A_ID = 'admin';
-- login check
select count(*) from admin where a_id = 'admin' and a_pw = '123';
--admin join
INSERT INTO ADMIN VALUES('admin', '123', 'Admin', 1);

--USER List
SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM USERS ORDER BY U_ID) A) WHERE RN BETWEEN 1 AND 10;
--Users Tot
SELECT count(*) FROM USERS WHERE U_STATUS > 0;

INSERT INTO USERS (U_ID, U_PW, U_NAME, U_NICKNAME, U_PHONE, U_TEL, U_IMAGE, U_EMAIL, U_ADDR, U_BIRTH, U_STATUS)
                VALUES('admin', '123', '관리자', '123', '123', '123', 'ggg.jpg', 'name@naver.com', 'jongro', sysdate ,1);
SELECT * FROM USERS;
commit;

--USER SEARCH
SELECT * FROM USERS WHERE U_NAME LIKE '%'||'go'||'%';

    SELECT * FROM USERS WHERE U_ID = 'aaa';

SELECT * FROM MESSANGER;
DESC MESSANGER;
CREATE SEQUENCE M_NO_SQ;

INSERT INTO MESSANGER (M_NO, M_TITLE, M_CONTENT, M_STATUS, U_RECIEVER, U_SENDER)
            VALUES(M_NO_SQ.NEXTVAL, '첫번째 메시지', '내용', 1, 'aaa', 'aaa');