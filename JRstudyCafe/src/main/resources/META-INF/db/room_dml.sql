SELECT * FROM ROOM;
SELECT * FROM ROOMOPTION;
SELECT * FROM ROOM R, ROOMOPTION O WHERE R.R_NO = O.R_NO;
delete from room where r_no != -1;
CREATE SEQUENCE R_NO_SQ
        NOCACHE
        NOCYCLE
        MAXVALUE 1000;
drop sequence R_NO_SQ;
INSERT INTO ROOM (R_NO, R_NAME, R_IMAGE, R_PPR, R_PPH, R_STATUS)
            VALUES(R_NO_SQ.NEXTVAL, '805호', '배경.jpg', '4', '2000', 1);

-- OPTION WI-FI(0 없음 1- 100M, 2-1G광랜) TV(1-프로젝터, 2-TV 3- 둘다), PRINT(1-BLACK, 2-COLOR), CHAIR(1   목재 테이블 2-+쇼파)
INSERT INTO ROOMOPTION (R_NO, RO_AIR, RO_CHAIR, RO_PRINT, RO_SMOKE, RO_PC, RO_TV, RO_WIFI, RO_BOARD)
                VALUES (R_NO_SQ.CURRVAL , 1, 1, 1, 0, 1, 0, 1, 1);
SELECT * FROM ROOM;       
            
COMMIT;
select R_NO_SQ.currval from dual;
INSERT INTO ROOMOPTION (R_NO, RO_AIR, RO_CHAIR, RO_PRINT, RO_SMOKE, RO_PC, RO_TV, RO_WIFI, RO_BOARD)
                VALUES ((SELECT MAX(R_NO) FROM ROOM), 1, 1, 1, 0, 1, 0, 1, 1);
CREATE SEQUENCE XX;
select xx.currval from dual;
SELECT MAX(R_NO) FROM ROOM;
SELECT * FROM (SELECT ROWNUM RN, A.* FROM
    (SELECT fb_no, (SELECT u_nickname FROM FreeBoard F, Users U WHERE F.u_id=U.u_id AND FreeBoard.fb_no=fb_no)|| 
        (SELECT a_name FROM FreeBoard F, Admin A WHERE A.a_id=F.a_id AND FreeBoard.fb_no=fb_no) WRITER,
    fb_name, fb_content, fb_status, fb_hit from FreeBoard WHERE fb_status !=0 AND 
    ((SELECT u_nickname FROM FreeBoard F, Users U WHERE F.u_id=U.u_id AND FreeBoard.fb_no=fb_no)|| 
        (SELECT a_name FROM FreeBoard F, Admin A WHERE A.a_id=F.a_id AND FreeBoard.fb_no=fb_no) like '%'||'na'||'%')
    ORDER BY fb_status, fb_no DESC) A) WHERE RN BETWEEN 1 AND 10;