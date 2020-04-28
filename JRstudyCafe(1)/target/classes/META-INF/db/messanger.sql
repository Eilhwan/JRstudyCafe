
-- UserMessage
ALTER TABLE Messanger modify(
    m_sendtime varchar2(50) default sysdate) ;
	
    
SELECT * FROM MESSANGER;

drop table messanger;
CREATE TABLE Messanger (
		m_No NUMBER(10) PRIMARY KEY,
		m_title VARCHAR2(30) NOT NULL,
		m_content VARCHAR2(160) NOT NULL,
		m_status NUMBER(1) NOT NULL,
		m_reciever VARCHAR2(50),
		m_sender VARCHAR2(50) NOT NULL,
         m_sendtime varchar2(50) default sysdate
);
CREATE SEQUENCE M_NO_SQ;
--메시지 전송
SELECT * FROM MESSANGER WHERE M_RECIEVER = 'aaa' ORDER BY M_STATUS DESC, M_NO DESC;
INSERT INTO  MESSANGER (m_no, m_title, m_content, m_status, m_reciever, m_sender)VALUES(M_NO_SQ.NEXTVAL, 'MESSAGE', 'CONTENT', 2, 'aaa', 'admin');

--메시지 삭제
DELETE FROM MESSANGER WHERE M_NO = 1;

--읽지않은 메시지 갯수 출력
SELECT COUNT(*) FROM MESSANGER WHERE M_RECIEVER = 'aaa' and m_status = 2;
--메시지 갯수 출력
SELECT COUNT(*) FROM MESSANGER WHERE M_RECIEVER = 'aaa' ORDER BY M_STATUS DESC, M_NO DESC;
--메시지 읽음 처리
UPDATE MESSANGER SET M_STATUS = 1 WHERE M_NO = 1;
--메시지 리스트 출력
SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM MESSANGER WHERE M_RECIEVER = 'aaa' ORDER BY M_STATUS DESC, M_NO DESC) A) WHERE RN BETWEEN 1 AND 10;
--메시지 1개 출력
SELECT * FROM MESSANGER WHERE M_NO = 24;

SELECT COUNT(*) FROM USERS WHERE U_ID = 'aaa';
Commit;