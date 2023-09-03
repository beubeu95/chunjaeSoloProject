CREATE DATABASE ntedu;

USE ntedu;

-- 멤버 테이블 생성
CREATE TABLE member(
                    id VARCHAR(16) NOT NULL,
                    pw VARCHAR(330) NOT NULL,
                    NAME VARCHAR(100) NOT NULL,
                    email VARCHAR(100) NOT NULL,
                    tel VARCHAR(13),
                    resdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
                    POINT INT DEFAULT 0,
                    per VARCHAR(5),
                    PRIMARY KEY (id));
  
 -- 더미 데이터 작성                  
INSERT INTO member(id, pw, NAME, email, tel) VALUES('admin','1234', '관리자', 'admin@edu.com', '010-1004-1004');
INSERT INTO member(id, pw, NAME, email, tel) VALUES('kimhk','9876', '김현경', 'kimhk@edu.com', '010-1234-5678');
INSERT INTO member(id, pw, NAME, email, tel) VALUES('kimbk','1111', '김보경', 'kimbk@edu.com', '010-8765-4321');
INSERT INTO member(id, pw, NAME, email, tel) VALUES('park','2222', '박진권', 'park@edu.com', '010-1111-2222');
INSERT INTO member(id, pw, NAME, email, tel) VALUES('oh','4321', '오태훈', 'oh@edu.com', '010-1122-3344');
INSERT INTO member(id, pw, NAME, email, tel) VALUES('shin','3333', '신예은', 'shin@edu.com', '010-9999-8888');

--공지사항 테이블 생성
CREATE TABLE notice(
	                   no INT PRIMARY KEY AUTO_INCREMENT,
	                   title VARCHAR(200) NOT NULL,
	                   content VARCHAR(1000),
	                   author VARCHAR(16),
	                   resdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	                   cnt INT DEFAULT 0);
	
-- 더미 데이터 작성                   
INSERT INTO notice(title, content, author) VALUES ('공지사항1', '여기는 공지사항1입니다', 'admin');
INSERT INTO notice(title, content, author) VALUES ('공지사항2', '여기는 공지사항2입니다', 'admin');
INSERT INTO notice(title, content, author) VALUES ('공지사항3', '여기는 공지사항3입니다', 'admin');
INSERT INTO notice(title, content, author) VALUES ('공지사항4', '여기는 공지사항4입니다', 'admin');
INSERT INTO notice(title, content, author) VALUES ('공지사항5', '여기는 공지사항5입니다', 'admin');
INSERT INTO notice(title, content, author) VALUES ('공지사항6', '여기는 공지사항6입니다', 'admin');
INSERT INTO notice(title, content, author) VALUES ('공지사항7', '여기는 공지사항7입니다', 'admin');
INSERT INTO notice(title, content, author) VALUES ('공지사항8', '여기는 공지사항8입니다', 'admin');

--커뮤니티 테이블 생성
CREATE TABLE board(
                   bno INT PRIMARY KEY AUTO_INCREMENT,
                   title VARCHAR(200) NOT NULL,
                   content VARCHAR(1000),
                   author VARCHAR(16),
                   resdate TIMESTAMP NOT NULL default CURRENT_TIMESTAMP,
                   cnt INT DEFAULT 0,
                   FOREIGN KEY(author) REFERENCES member(id) ON DELETE CASCADE);	 
		
-- -- board와 member JOIN & VIEW 생성 ( 내가 쓴 글에 이용)	 
SELECT a.bno AS bno, a.title AS title, a.content AS content ,a.author AS author,a.resdate AS resdate ,a.cnt AS cnt, b.id as id FROM motherboard a, member b WHERE a.author =b.id;
CREATE view boardlist AS (SELECT a.bno AS bno ,a.title AS title, a.content AS content ,a.author AS author,a.resdate AS resdate ,a.cnt AS cnt, b.id as id FROM board a, member b WHERE a.author =b.id);
SELECT * FROM boardlist;

-- 더미 데이터 작성
INSERT INTO board(title, content, author) VALUES ('2024 EBS 수능완성 실전편 5회 전문항 풀이', '여기는 학생 게시판1입니다', 'kimhk');
INSERT INTO board(title, content, author) VALUES ('유니스트/지스트/디지스트 합격하는 과학 기술원 자기 소개서 만들기 사진링크new', '여기는 학생 게시판2입니다', 'kimbk');
INSERT INTO board(title, content, author) VALUES ('[수학칼럼] 예비 고3은 개념정리를 꼼꼼하게 하세요 + 반드시 알아야하는 내용 3개 정리', '여기는 학생 게시판3입니다', 'kimbk');
INSERT INTO board(title, content, author) VALUES ('[자료] 하루하루 남기다 보면 늘어가는 국어 #196 비문학 사진 [1]', '여기는 학생 게시판4입니다', 'kimhk');
INSERT INTO board(title, content, author) VALUES ('[칼럼] 방학기간 예비 고3 선택과목 준비법', '여기는 학생 게시판5입니다', 'kimhk');
INSERT INTO board(title, content, author) VALUES ('수능과 내신 대비) EBS 수능특강 문학 고전산문 03강 임춘 - 공방전 (036)', '여기는 학생 게시판6입니다', 'kimbk');
INSERT INTO board(title, content, author) VALUES ('[칼럼] 새학기가 시작되기 직전, 슬럼프가 온 여러분들에게 쓰는 글 사진링크', '여기는 학생 게시판7입니다', 'kimbk');
INSERT INTO board(title, content, author) VALUES ('의대 박살내는 회독법 총정리', '여기는 학생 게시판8입니다', 'kimbk');	

-- qna 테이블 생성 
CREATE TABLE qna(
                    qno INT PRIMARY KEY AUTO_INCREMENT,
                    title VARCHAR(200) NOT NULL,
                    content VARCHAR(1000),
                    author VARCHAR(16),
                    resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
                    cnt INT DEFAULT 0,
                    lev INT DEFAULT 0,		
                    FOREIGN KEY(author) REFERENCES member(id) ON DELETE CASCADE
);			


-- 더미 데이터 작성
INSERT INTO qna(title, content, author, lev) VALUES('질문1', '질문입니다. 1', 'kimbk', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=1;

INSERT INTO qna(title, content, author, lev) VALUES('질문2', '질문입니다. 2', 'park', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=2;

INSERT INTO qna(title, content, author, lev) VALUES('질문3', '질문입니다. 3', 'kimhk', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=3;

INSERT INTO qna(title, content, author, lev) VALUES('질문4', '질문입니다. 4', 'park', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=4;

INSERT INTO qna(title, content, author, lev) VALUES('질문5', '질문입니다. 5', 'kimbk', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=5;

INSERT INTO qna(title, content, author, lev) VALUES('질문6', '질문입니다. 6', 'oh', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=6;

INSERT INTO qna(title, content, author, lev) VALUES('질문7', '질문입니다. 7', 'shin', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=7;

INSERT INTO qna(title, content, author, lev) VALUES('질문8', '질문입니다. 8', 'shin', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=8;

INSERT INTO qna(title, content, author, lev) VALUES('질문9', '질문입니다. 9', 'park', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=9;

INSERT INTO qna(title, content, author, lev) VALUES('질문10', '질문입니다. 10', 'kimbk', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=10;	

INSERT INTO qna(title, content, author, lev, par) VALUES ('질문1에 대한 답변', '답변입니다. 1', 'park', 1, 1);
INSERT INTO qna(title, content, author, lev, par) VALUES ('질문2에 대한 답변', '답변입니다. 2.', 'admin', 1, 2);
INSERT INTO qna(title, content, author, lev, par) VALUES ('질문3에 대한 답변', '답변입니다. 3', 'admin', 1, 3);
INSERT INTO qna(title, content, author, lev, par) VALUES ('질문4에 대한 답변', '답변입니다. 4', 'admin', 1, 4);
INSERT INTO qna(title, content, author, lev, par) VALUES ('질문5에 대한 답변', '답변입니다. 5', 'admin', 1, 5);
INSERT INTO qna(title, content, author, lev, par) VALUES ('질문6에 대한 답변', '답변입니다. 6', 'admin', 1, 6);
INSERT INTO qna(title, content, author, lev, par) VALUES ('질문7에 대한 답변', '답변입니다. 7', 'admin', 1, 7);
INSERT INTO qna(title, content, author, lev, par) VALUES ('질문8에 대한 답변', '답변입니다. 8', 'admin', 1, 8);
INSERT INTO qna(title, content, author, lev, par) VALUES ('질문9에 대한 답변', '답변입니다. 9', 'admin', 1, 9);
INSERT INTO qna(title, content, author, lev, par) VALUES ('질문10에 대한 답변', '답변입니다. 10', 'admin', 1, 10);

-- QnA 리스트
CREATE VIEW qnalist AS (SELECT a.qno AS qno, a.title AS title, a.content AS content, a.author AS author, a.resdate AS resdate, a.cnt AS cnt, a.lev AS lev,a.par AS par, b.name AS name FROM qna a, member b WHERE a.author=b.id ORDER BY a.par DESC, a.lev ASC, a.qno ASC);

-- qna와 member JOIN & VIEW 생성 ( 내가 쓴 글에 이용)
CREATE VIEW qnalist2 AS (SELECT a.qno AS qno, a.title AS title, a.content AS content, a.author AS author, a.resdate AS resdate, a.cnt AS cnt, a.lev AS lev, a.par AS par, b.id AS id FROM qna a, member b WHERE a.author=b.id ORDER BY a.par DESC, a.lev ASC, a.qno ASC);


-- faq 테이블 생성
CREATE TABLE faq (
                     fno INT PRIMARY KEY AUTO_INCREMENT,
                     question VARCHAR(1000) NOT NULL,
                     answer VARCHAR(1000) NOT NULL,
                     cnt INT DEFAULT 0 NOT NULL
);

INSERT INTO faq(question, answer) VALUES('자주 묻는 질문입니다1', '답변입니다1');
INSERT INTO faq(question, answer) VALUES('자주 묻는 질문입니다2', '답변입니다2');
INSERT INTO faq(question, answer) VALUES('자주 묻는 질문입니다3', '답변입니다3');
INSERT INTO faq(question, answer) VALUES('자주 묻는 질문입니다4', '답변입니다4');
INSERT INTO faq(question, answer) VALUES('자주 묻는 질문입니다5', '답변입니다5');

