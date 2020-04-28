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
drop table freeboard;
-- Board
ALTER TABLE FreeBoard
	ADD CONSTRAINT PK_FreeBoard -- Board 기본키
	PRIMARY KEY (
		fb_no -- 자유게시판번호
	);
    
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
	ADD CONSTRAINT FK_Admin_TO_FreeBoard -- 새 테이블3 -> Board
	FOREIGN KEY (
		a_id -- 관리자아이디
	)
	REFERENCES Admin ( -- 새 테이블3
		a_id -- 관리자아이디
	);

-- 게시판첨부파일
CREATE TABLE FreeBoardFile (
		bf_no NUMBER(10) NOT NULL,
		bf_name VARCHAR2(100) NOT NULL,
		bf_ori VARCHAR2(100) NOT NULL,
		bf_size INT NOT NULL,
		fb_no NUMBER(10) NOT NULL
);

-- 게시판첨부파일
ALTER TABLE FreeBoardFile
	ADD CONSTRAINT PK_FreeBoardFile -- 게시판첨부파일 기본키
	PRIMARY KEY (
		bf_no -- 파일번호
	);
    
-- 게시판첨부파일
ALTER TABLE FreeBoardFile
	ADD CONSTRAINT FK_FreeBoard_TO_FreeBoardFile -- Board -> 게시판첨부파일
	FOREIGN KEY (
		fb_no -- 자유게시판번호
	)
	REFERENCES FreeBoard ( -- Board
		fb_no -- 자유게시판번호
	);
-- 새 테이블2
CREATE TABLE FreeLikes (
		likeno NUMBER(10) NOT NULL,
		fb_no NUMBER(10) NULL,
		u_Id VARCHAR2(50) NULL
);

-- 새 테이블2
ALTER TABLE FreeLikes
	ADD CONSTRAINT PK_FreeLikes -- 새 테이블2 기본키
	PRIMARY KEY (
		likeno -- 좋아요 번호
	);
ALTER TABLE FreeLikes
	ADD CONSTRAINT FK_FreeBoard_TO_FreeLikes -- Board -> 새 테이블2
	FOREIGN KEY (
		fb_no -- 자유게시판번호
	)
	REFERENCES FreeBoard ( -- Board
		fb_no -- 자유게시판번호
	);

-- 새 테이블2
ALTER TABLE FreeLikes
	ADD CONSTRAINT FK_Users_TO_FreeLikes -- userPrimary -> 새 테이블2
	FOREIGN KEY (
		u_Id -- userId
	)
	REFERENCES Users ( -- userPrimary
		u_Id -- userId
	);
-- 새 테이블10
CREATE TABLE FreeComments (
		c_no NUMBER(10) NOT NULL,
		u_Id VARCHAR2(50) NOT NULL,
		c_content VARCHAR2(400) NOT NULL,
		c_status NUMBER(1) NOT NULL,
		fb_no NUMBER(10) NULL
);

-- 새 테이블10
ALTER TABLE FreeComments
	ADD CONSTRAINT PK_FreeComments -- 새 테이블10 기본키
	PRIMARY KEY (
		c_no -- 댓글 번호
	);
-- Board

ALTER TABLE FreeComments
	ADD CONSTRAINT FK_FreeBoard_TO_FreeComments -- Board -> 새 테이블10
	FOREIGN KEY (
		fb_no -- 자유게시판번호
	)
	REFERENCES FreeBoard ( -- Board
		fb_no -- 자유게시판번호
	);

-- 새 테이블10
ALTER TABLE FreeComments
	ADD CONSTRAINT FK_Users_TO_FreeComments -- userPrimary -> 새 테이블10
	FOREIGN KEY (
		u_Id -- userId
	)
	REFERENCES Users ( -- userPrimary
		u_Id -- userId
	);
    
    
------- 자유게시판 관련 sql문 -------

SELECT * FROM USERS;
SELECT * FROM ADMIN;
SELECT * FROM FreeBoard;
CREATE SEQUENCE fb_no MAXVALUE 9999999999 NOCYCLE NOCACHE;
-- 1. 글쓰기
INSERT INTO FreeBoard (fb_no, fb_name, fb_content, fb_status, fb_hit, u_Id, a_id) 
    VALUES (fb_no.NEXTVAL, '자유게시판이름','자유게시판내용',1,0,'user',NULL);
INSERT INTO FreeBoard (fb_no, fb_name, fb_content, fb_status, fb_hit, u_Id, a_id) 
    VALUES (fb_no.NEXTVAL, '자유게시판이름2','자유게시판내용2',0,0,'user',NULL);
INSERT INTO FreeBoard (fb_no, fb_name, fb_content, fb_status, fb_hit, u_Id, a_id) 
    VALUES (fb_no.NEXTVAL, '자유게시판이름2','자유게시판내용2',-1,0,NULL,'admin');
-- 2. 글갯수
SELECT COUNT(*) FROM FreeBoard WHERE fb_status!=0;
SELECT COUNT(*) FROM FreeBoard WHERE fb_status!=0 AND fb_name like '%'||'2'||'%';
SELECT COUNT(*) FROM FreeBoard WHERE fb_status!=0 AND fb_content like '%'||'내'||'%';
SELECT COUNT(*) FROM FreeBoard WHERE fb_status!=0 AND (fb_name like '%'||'2'||'%' OR fb_content like '%'||'내'||'%');
SELECT COUNT(*) FROM FreeBoard WHERE fb_status!=0 AND 
    ((SELECT u_nickname FROM FreeBoard F, Users U WHERE F.u_id=U.u_id AND FreeBoard.fb_no=fb_no)|| 
        (SELECT a_name FROM FreeBoard F, Admin A WHERE A.a_id=F.a_id AND FreeBoard.fb_no=fb_no) like '%'||'na'||'%');
-- 3. 글목록(startRow부터 endRow까지) (search조건 없을 때)
 SELECT * FROM (SELECT ROWNUM RN, A.* FROM
    (SELECT fb_no, (SELECT u_nickname FROM FreeBoard F, Users U WHERE F.u_id=U.u_id AND FreeBoard.fb_no=fb_no)|| 
        (SELECT a_name FROM FreeBoard F, Admin A WHERE A.a_id=F.a_id AND FreeBoard.fb_no=fb_no) WRITER,
    fb_name, fb_content, fb_status, fb_hit, (SELECT COUNT(*) FROM FreeLikes L WHERE FreeBoard.fb_no =fb_no) LIKECNT
    from FreeBoard WHERE fb_status !=0 ORDER BY fb_status, fb_no DESC) A)
    WHERE RN BETWEEN 1 AND 2;
    
-- 4. FHit 하나 올리기(1번글 조회수 하나 올리기)
UPDATE FreeBoard SET fb_hit = fb_hit + 1 WHERE fb_no=2;
-- 5. fNo로 글 dto보기
SELECT fb_no, (SELECT u_nickname FROM FreeBoard F, Users U WHERE F.u_id=U.u_id AND FreeBoard.fb_no=fb_no)|| 
        (SELECT a_name FROM FreeBoard F, Admin A WHERE A.a_id=F.a_id AND FreeBoard.fb_no=fb_no) WRITER,
    fb_name, fb_content, fb_hit, fb_status, (SELECT COUNT(*) FROM FreeLikes L WHERE FreeBoard.fb_no =fb_no) LIKECNT
    from FreeBoard WHERE fb_no=3;
-- 6. 글 수정하기(fTitle, fCategory, fContent, fFILENAME, fIp)
UPDATE FreeBoard SET fb_name='새로운게시판이름', fb_content='새로운게시판내용' WHERE fb_no=4;
-- 글 삭제하기(bId로 삭제하기)
UPDATE FreeBoard SET fb_status=0 WHERE fb_no=4;

-- search조건이 fb_name일 때
SELECT * FROM (SELECT ROWNUM RN, A.* FROM
    (SELECT fb_no, (SELECT u_nickname FROM FreeBoard F, Users U WHERE F.u_id=U.u_id AND FreeBoard.fb_no=fb_no)|| 
        (SELECT a_name FROM FreeBoard F, Admin A WHERE A.a_id=F.a_id AND FreeBoard.fb_no=fb_no) WRITER,
    fb_name, fb_content, fb_status, fb_hit
    from FreeBoard WHERE fb_status !=0 AND fb_name like '%'||'2'||'%' ORDER BY fb_status, fb_no DESC) A)
    WHERE RN BETWEEN 1 AND 2;
    
-- search조건이 fb_content일 때
SELECT * FROM (SELECT ROWNUM RN, A.* FROM
    (SELECT fb_no, (SELECT u_nickname FROM FreeBoard F, Users U WHERE F.u_id=U.u_id AND FreeBoard.fb_no=fb_no)|| 
        (SELECT a_name FROM FreeBoard F, Admin A WHERE A.a_id=F.a_id AND FreeBoard.fb_no=fb_no) WRITER,
    fb_name, fb_content, fb_status, fb_hit, (SELECT COUNT(*) FROM FreeLikes L WHERE FreeBoard.fb_no =fb_no) LIKECNT
    from FreeBoard WHERE fb_status !=0 AND fb_content like '%'||'내'||'%' ORDER BY fb_status, fb_no DESC) A)
    WHERE RN BETWEEN 1 AND 2;
-- search조건이 fb_name+fb_content일 때
SELECT * FROM (SELECT ROWNUM RN, A.* FROM
    (SELECT fb_no, (SELECT u_nickname FROM FreeBoard F, Users U WHERE F.u_id=U.u_id AND FreeBoard.fb_no=fb_no)|| 
        (SELECT a_name FROM FreeBoard F, Admin A WHERE A.a_id=F.a_id AND FreeBoard.fb_no=fb_no) WRITER,
    fb_name, fb_content, fb_status, fb_hit, (SELECT COUNT(*) FROM FreeLikes L WHERE FreeBoard.fb_no =fb_no) LIKECNT
    from FreeBoard WHERE fb_status !=0 AND (fb_name like '%'||'2'||'%' OR fb_content like '%'||'내'||'%')
    ORDER BY fb_status, fb_no DESC) A) WHERE RN BETWEEN 1 AND 10;

-- search조건이 WRITER일 때
SELECT * FROM (SELECT ROWNUM RN, A.* FROM
    (SELECT fb_no, (SELECT u_nickname FROM FreeBoard F, Users U WHERE F.u_id=U.u_id AND FreeBoard.fb_no=fb_no)|| 
        (SELECT a_name FROM FreeBoard F, Admin A WHERE A.a_id=F.a_id AND FreeBoard.fb_no=fb_no) WRITER,
    fb_name, fb_content, fb_status, fb_hit, (SELECT COUNT(*) FROM FreeLikes L WHERE FreeBoard.fb_no =fb_no) LIKECNT
    from FreeBoard WHERE fb_status !=0 AND 
    ((SELECT u_nickname FROM FreeBoard F, Users U WHERE F.u_id=U.u_id AND FreeBoard.fb_no=fb_no)|| 
        (SELECT a_name FROM FreeBoard F, Admin A WHERE A.a_id=F.a_id AND FreeBoard.fb_no=fb_no) like '%'||'na'||'%')
    ORDER BY fb_status, fb_no DESC) A) WHERE RN BETWEEN 1 AND 10;
commit;

-- 좋아요 
DROP SEQUENCE likeno;
DROP TABLE FreeLikes;
CREATE SEQUENCE likeno MAXVALUE 9999999999 NOCYCLE NOCACHE;
SELECT fb_no, u_id FROM FreeLikes WHERE u_id='user';
-- 1. 좋아요 입력
INSERT INTO FreeLikes (likeno,fb_no,u_id) 
    VALUES (likeno.NEXTVAL,3,'user');
-- 2. 좋아요 개수
SELECT COUNT(*) FROM FreeLikes WHERE fb_no=6;
COMMIT;