CREATE TABLE ReviewBoard (
		rv_no NUMBER(10) NOT NULL,
		rv_name VARCHAR2(100) NOT NULL,
		rv_content CLOB NOT NULL,
		rv_status NUMBER(1) NOT NULL,
		rv_hit NUMBER(4) NULL,
        rv_date DATE DEFAULT SYSDATE,
		u_Id VARCHAR2(50) NULL
);


-- 리뷰테이블 
ALTER TABLE ReviewBoard 
    ADD (r_No NUMBER(10) NOT NULL); -- 방번호 추가

ALTER TABLE ReviewBoard
    ADD CONSTRAINT FK_ROOM_TO_ReviewBoard
    FOREIGN KEY(
        r_No
    ) REFERENCES ROOM(
        r_No
);


CREATE SEQUENCE RV_NO_SQ
        NOCACHE
        NOCYCLE
        MAXVALUE 1000;
DROP SEQUENCE RV_NO_SQ;


SELECT * FROM ReviewBoard;


INSERT INTO ReviewBoard (rv_no, rv_name, rv_content, rv_status, rv_hit, u_Id, r_No) 
    VALUES (RV_NO_SQ.NEXTVAL, '이런', '하나크123', 1, 0, 'aaa', 1);

SELECT R.*, (SELECT COUNT(*) FROM RvLikes WHERE RV_NO =R.rv_no) LIKECNT FROM ReviewBoard R ORDER BY rv_date DESC;

SELECT * FROM (SELECT ROWNUM RN, A.*
                    FROM( SELECT R.*, (SELECT COUNT(*) FROM RvLikes WHERE RV_NO =R.rv_no) LIKECNT FROM ReviewBoard R ORDER BY rv_date DESC)A) 
            WHERE RN BETWEEN 1 AND 5;



-- 리뷰 게시판 목록

SELECT * FROM (SELECT ROWNUM RN, A.*
                    FROM( SELECT R.*,u.u_nickname, (SELECT COUNT(*) FROM RvLikes WHERE RV_NO =R.rv_no) LIKECNT 
                            FROM ReviewBoard R, USERS U WHERE U.U_ID=R.U_ID AND rv_status=1 ORDER BY rv_date DESC )A) 
            WHERE RN BETWEEN 1 AND 30;
            
SELECT * FROM (SELECT ROWNUM RN, A.*
                    FROM( SELECT R.*,u.u_nickname, (SELECT COUNT(*) FROM RvLikes WHERE RV_NO =R.rv_no) LIKECNT 
                            FROM ReviewBoard R, USERS U WHERE U.U_ID=R.U_ID AND rv_status=1 AND (u.u_nickname LIKE '%'||'123'||'%' OR  rv_name LIKE '%'||'123'||'%' ) ORDER BY rv_date DESC )A) 
            WHERE RN BETWEEN 1 AND 200;
            
SELECT * FROM (SELECT ROWNUM RN, A.*
                    FROM( SELECT R.*,u.u_nickname, (SELECT COUNT(*) FROM RvLikes WHERE RV_NO =R.rv_no) LIKECNT 
                            FROM ReviewBoard R, USERS U WHERE U.U_ID=R.U_ID AND rv_status=1 AND u.u_nickname LIKE '%'||''||'%' ORDER BY rv_date DESC )A) 
            WHERE RN BETWEEN 1 AND 5;
            
SELECT * FROM (SELECT ROWNUM RN, A.*
                    FROM( SELECT R.*,u.u_nickname,  (SELECT COUNT(*) FROM RvLikes WHERE RV_NO =R.rv_no) LIKECNT 
                            FROM ReviewBoard R , USERS U WHERE U.U_ID=R.U_ID AND rv_status=1 AND rv_name LIKE '%'||'3'||'%' ORDER BY rv_date DESC )A) 
            WHERE RN BETWEEN 1 AND 5;
   
-- 리뷰 게시판 글갯수
SELECT COUNT(*) FROM ReviewBoard WHERE rv_status=1;

SELECT COUNT(*) FROM ReviewBoard R, USERS U WHERE U.U_ID=R.U_ID and rv_status=1 AND  (u.u_nickname LIKE '%'||''||'%' OR  rv_name LIKE '%'||'3'||'%' );

SELECT COUNT(*) FROM ReviewBoard R, USERS U WHERE U.U_ID=R.U_ID and rv_status=1 AND u.u_nickname LIKE '%'||'달'||'%';

SELECT COUNT(*) FROM ReviewBoard WHERE rv_status=1 AND rv_name LIKE '%'||'3'||'%';

-- 리뷰 글 쓰기
INSERT INTO ReviewBoard (rv_no, rv_name, rv_content, rv_status, rv_hit, u_Id, r_No) 
    VALUES (RV_NO_SQ.NEXTVAL, '제목3', '내용3', 1, 0, 'aaa', 1);

INSERT INTO ReviewBoard (rv_no, rv_name, rv_content, rv_status, rv_hit, u_id)
    VALUES (RV_NO_SQ.NEXTVAL, '제목3', '내용3', 1, 0, 'aaa');

-- 리뷰 조회수 올리기
UPDATE ReviewBoard SET 
                rv_hit= rv_hit+1
                WHERE rv_no= 3; 

-- 리뷰 글 수정
UPDATE ReviewBoard SET 
                rv_name= '제목수정',
                rv_content= '내용수정'
                WHERE rv_no= 3; 

-- 리뷰 DTO 가져오기 ID = review_detail
SELECT R.*,U.U_NICKNAME,
      (SELECT COUNT(*) FROM RvLikes WHERE RV_NO =R.rv_no) LIKECNT 
      FROM ReviewBoard R, USERS U WHERE R.U_ID=U.U_ID AND rv_no= 3;


-- 리뷰 삭제
UPDATE ReviewBoard SET 
                rv_status= 0
                WHERE rv_no= 3;
                
-- 리뷰게시판 좋아요 
SELECT * FROM RvLikes;
SELECT * FROM RvLikes WHERE U_ID='aaa111' AND RV_NO=2;
DESC RvLikes;
CREATE SEQUENCE RV_LIKENO_SQ
        NOCACHE
        NOCYCLE
        MAXVALUE 1000;
DROP SEQUENCE RV_LIKENO_SQ;
INSERT INTO RvLikes (LIKENO, RV_NO, U_ID) 
    VALUES (RV_LIKENO_SQ.NEXTVAL, '14', 'aaa');
DELETE FROM RvLikes WHERE LIKENO='20';
DELETE FROM RvLikes WHERE LIKENO BETWEEN 21 AND 42;

INSERT INTO RvLikes SELECT LIKENO_SQ.NEXTVAL, '1', 'aaa111' 
    FROM DUAL WHERE NOT EXISTS (SELECT U_ID FROM RvLikes WHERE U_ID='aaa111');
                    

COMMIT;

-- 리뷰 댓글 
CREATE TABLE RvComments (
		c_no      NUMBER(10) NOT NULL PRIMARY KEY,
		c_content VARCHAR2(400) NOT NULL,
		c_status  NUMBER(1) NOT NULL,
        c_rdate   DATE DEFAULT SYSDATE,
		rv_no     NUMBER(10) NULL REFERENCES ReviewBoard(rv_no),
		u_id      VARCHAR2(50) NULL REFERENCES Users(u_id)
);

SELECT * FROM RvComments;
DESC RvComments;
CREATE SEQUENCE RV_CNO_SQ
        NOCACHE
        NOCYCLE
        MAXVALUE 1000;
DROP SEQUENCE RV_CNO_SQ;
SELECT * FROM USERS;
-- 댓글리스트
--SELECT R.*, U.U_NICKNAME FROM RvComments R, USERS U WHERE R.U_ID= U.U_ID AND C_STATUS=1 AND RV_NO = #{rv_no} ORDER BY C_STATUS
SELECT R.*, U.U_NICKNAME,U_IMAGE,U_NAME FROM RvComments R, USERS U WHERE R.U_ID= U.U_ID AND C_STATUS=1 AND RV_NO = 25 ORDER BY C_RDATE DESC;
SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT R.*, U.U_NICKNAME,U_IMAGE,U_NAME FROM RvComments R, USERS U WHERE R.U_ID= U.U_ID AND C_STATUS=1 AND RV_NO = 25 ORDER BY C_RDATE DESC)A) WHERE RN BETWEEN 1 AND 1 ;


-- 댓글 개수
SELECT COUNT(*)FROM RvComments WHERE C_STATUS=1 AND RV_NO = 25;

-- 댓글 쓰기
INSERT INTO RvComments (C_NO,C_CONTENT,C_STATUS,RV_NO,U_ID) 
    VALUES (RV_CNO_SQ.NEXTVAL, '댓글내용', 1, 25, 'aaa111' );
    
-- 댓글 수정

UPDATE RvComments SET 
        C_CONTENT ='댓글내용 수정'
        WHERE C_NO=1;
                      
-- 댓글 삭제
UPDATE RvComments SET 
        C_STATUS = 0
        WHERE C_NO=1;











