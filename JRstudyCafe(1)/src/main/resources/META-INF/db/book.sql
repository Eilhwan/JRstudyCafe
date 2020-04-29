select * from book;
select * from users;
select * from room;
drop table book;
DROP TABLE ROOM;
drop SEQUENCE book_seq;
CREATE SEQUENCE BOOK_SEQ MAXVALUE 999999 NOCACHE NOCYCLE;
CREATE TABLE Book (
		bk_no NUMBER(10) PRIMARY KEY NOT NULL,
		bk_date DATE NOT NULL,
		bk_stime TIMESTAMP NOT NULL,
		bk_status NUMBER(1) DEFAULT 1 NOT NULL,
        bk_tp NUMBER(10) NOT NULL,
        bk_tt NUMBER(2) NOT NULL,
        bk_rdate DATE DEFAULT SYSDATE NOT NULL,
		bk_etime TIMESTAMP NOT NULL,
		u_Id VARCHAR2(50) NOT NULL,
		r_No NUMBER(10) NULL
);
CREATE SEQUENCE ROOM_SEQ MAXVALUE 999999 NOCACHE NOCYCLE;
CREATE TABLE Room (
		r_No NUMBER(10) PRIMARY KEY NOT NULL,
		r_name VARCHAR2(100) NOT NULL,
		r_image VARCHAR2(100) DEFAULT 'noImg' NOT NULL,
		r_ppr NUMBER(2) NOT NULL,
		r_pph NUMBER(10) NOT NULL,
		r_status NUMBER(1) DEFAULT 1 NOT NULL
);
INSERT INTO room(r_no, r_name, r_ppr, r_pph)
        values(ROOM_SEQ.nextval, '805호', 4, 5000);  


-- ����Ʈ ���
  SELECT * FROM (SELECT ROWNUM RN, A.* FROM
    (SELECT bk_no, (SELECT u_name FROM Book B, Users U WHERE B.u_id=U.u_id AND Book.bk_no=bk_no) subscriber, 
        (SELECT r_name FROM Book B, Room R WHERE R.r_no=B.r_no AND book.bk_no=bk_no) roomname,
    bk_date, bk_stime, bk_etime, bk_tt, bk_tp, bk_rdate
    from Book WHERE bk_status !=0 ORDER BY bk_date DESC) A)
    WHERE RN BETWEEN 1 AND 20;
-- �� ����
 SELECT count(*) FROM BOOK;
-- �����ϱ�
 INSERT INTO BOOK (bk_no, bk_date, bk_stime, bk_tp, bk_tt, bk_etime, u_id, r_no)
          values (book_seq.nextval, to_date('20200424', 'YYYY-MM-DD'), to_timestamp('2020/04/24/14'), 10000, 2, to_timestamp('2020-04-24 18:00:00'), 'aaa', 3); 
INSERT INTO BOOK (bk_no, bk_date, bk_stime, bk_tp, bk_tt, bk_etime, u_id, r_no)
          values (book_seq.nextval, to_date('2020-04-30', 'YYYY-MM-DD'), to_timestamp('2020-04-30 12:00:00'), 10000, 2, to_timestamp('2020-04-30 14:00:00'), 'aaa', 3);
INSERT INTO BOOK (bk_no, bk_date, bk_stime, bk_tp, bk_tt, bk_etime, u_id, r_no)
          values (book_seq.nextval, to_date('2020-05-01', 'YYYY-MM-DD'), to_timestamp('2020-05-01 12:00:00'), 10000, 2, to_timestamp('2020-05-01 14:00:00'), 'aaa', 3);
INSERT INTO BOOK (bk_no, bk_date, bk_stime, bk_tp, bk_tt, bk_etime, u_id, r_no)
          values (book_seq.nextval, to_date('2020-05-02', 'YYYY-MM-DD'), to_timestamp('2020-05-02 12:00:00'), 10000, 2, to_timestamp('2020-05-02 14:00:00'), 'aaa', 3);
INSERT INTO BOOK (bk_no, bk_date, bk_stime, bk_tp, bk_tt, bk_etime, u_id, r_no)
          values (book_seq.nextval, to_date('2020-05-03', 'YYYY-MM-DD'), to_timestamp('2020-05-03 12:00:00'), 10000, 2, to_timestamp('2020-05-03 14:00:00'), 'aaa', 3);
-- �󼼺���
 select * from book where r_no=3;
-- �����ϱ�
 update book set bk_status=0 where bk_no=3;
 UPDATE BOOK SET bk_status=0 WHERE bk_no=3;
-- ���� �ߺ�üũ
 select count(*) from book where bk_stime <= v_bk_etime AND bk_etime >= v_bk_stime; 

 SELECT COUNT(*) FROM BOOK WHERE BK_STIME BETWEEN '2020/04/24/15' AND '2020/04/24/20' OR BK_ETIME BETWEEN '2020/04/24/15' AND '2020/04/24/20' AND R_NO=3 AND bk_status=1;
 
 commit;
 SELECT * FROM ROOM;

 
