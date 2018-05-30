--------------------------후기게시판 테이블 & 시퀀스--------------------------------------------
CREATE TABLE LAWTION_REVIEW_BOARD(
      NO      NUMBER(4) CONSTRAINT PK_LAWTION_REVIEW_BOARD_NO PRIMARY KEY,
      TITLE   VARCHAR2(50) NOT NULL,
      CATEGORY  VARCHAR2(20) NOT NULL,
      RDATE   DATE,
      HITS    NUMBER(4),
      LAWYER VARCHAR2(30),
      LAWSUIT    VARCHAR(50),
      CONTENT VARCHAR2(500) NOT NULL,
      FNAME   VARCHAR2(100),
      RFNAME  VARCHAR2(200)
);
SELECT * FROM LAWTION_REVIEW_BOARD;
CREATE SEQUENCE SEQU_LAWTION_REVIEW_BOARD
    START WITH  1
    INCREMENT BY 1;
SELECT * FROM LAWTION_REVIEW_BOARD;
----------------------하소연게시판 테이블 & 시퀀스-------------------------------------------------

CREATE TABLE LAWTION_TALK_BOARD(
      NO      NUMBER(4) CONSTRAINT PK_LAWTION_TALK_BOARD_NO PRIMARY KEY,
      TITLE   VARCHAR2(50) NOT NULL,
      TDATE   DATE,
      HITS    NUMBER(4),
      CONTENT VARCHAR2(500) NOT NULL,
      FNAME   VARCHAR2(100),
      RFNAME  VARCHAR2(200)
);

CREATE SEQUENCE SEQU_LAWTION_TALK_BOARD
    START WITH  1
    INCREMENT BY 1;


---------------------하소연게시판 댓글 테이블 & 시퀀스------------------------------------
CREATE TABLE LAWTION_TALK_REPLY(
  RID   NUMBER(4) PRIMARY KEY,
  REPLYER VARCHAR2(20) NOT NULL,
  CONTENT VARCHAR2(100) NOT NULL,
  RDATE DATE,
  TID   NUMBER(4) REFERENCES LAWTION_TALK_BOARD(NO) ON DELETE CASCADE
);

CREATE SEQUENCE SEQU_LAWTION_TALK_REPLY
    START WITH  1
    INCREMENT BY 1;

SELECT * FROM LAWTION_TALK_REPLY;

---------------------후기게시판 댓글 테이블 & 시퀀스--------------------------------------------


CREATE TABLE LAWTION_REVIEW_REPLY(
  RID   NUMBER(4) PRIMARY KEY,
  REPLYER VARCHAR2(20) NOT NULL,
  CONTENT VARCHAR2(100) NOT NULL,
  RDATE DATE,
  REVIEWID   NUMBER(4) REFERENCES LAWTION_REVIEW_BOARD(NO) ON DELETE CASCADE
);

CREATE SEQUENCE SEQU_LAWTION_REVIEW_REPLY
    START WITH  1
    INCREMENT BY 1;


SELECT * FROM LAWTION_REVIEW_REPLY;
--------------------변호사 기본정보 테이블  & 시퀀스------------------------------------------------
drop table lawtion_introduce;
create table lawtion_introduce(
  no    number(4) constraint lawtion_introduce_no_pk primary key,
  name  varchar2(100) ,
  dname varchar2(200) ,
  part  varchar2(200) 
  );

create sequence sequ_lawtion_introduce
  start with 1
  increment by 1;
  
select * from lawtion_introduce;
select * from user_sequences;
-------------------변호사 기본정보 테이블  & 시퀀스 DB(insert)-------------------------------------------------
/*가상테이블*/
insert into lawtion_introduce 
  values(sequ_lawtion_introduce.nextval,'소지섭','법무법인세종','건설,토지');

insert into lawtion_introduce 
  values(sequ_lawtion_introduce.nextval,'윤제윤','법무법인세종','건설,토지,행정');
insert into lawtion_introduce 
  values(sequ_lawtion_introduce.nextval,'심재두','법무법인세종','건설,보험');
commit;
insert into lawtion_introduce 
  values(sequ_lawtion_introduce.nextval,'가재환','법무법인태양','민사,형사,행정');
insert into lawtion_introduce 
  values(sequ_lawtion_introduce.nextval,'전재민','법무법인태평양','이혼,민사');
insert into lawtion_introduce 
  values(sequ_lawtion_introduce.nextval,'김두식','법무법인태평양','토지,교통사고');
insert into lawtion_introduce 
  values(sequ_lawtion_introduce.nextval,'강지원','법무법인태평양','토지,교통,행정');
insert into lawtion_introduce 
  values(sequ_lawtion_introduce.nextval,'이승민','법무법인태평양','교통,행정');
commit;

SELECT * FROM LAWTION_INTRODUCE;

-------------------변호사 승소 + 경력사항 테이블----------------------------------------------------
create table introduce_member(
  no        number(4) constraint introduce_member_no_fk references lawtion_introduce(no),
  carrer    varchar2(500),
  trial     number(4),
  win       number(4),
  lose      number(4)
);

desc introduce_member;

select * from introduce_member;
------------------변호사 승소 + 경력사항 테이블 DB (insert)----------------------------------------
insert into introduce_member
  values(21,'서울대학교 경영학과 졸업<br>춘천지방법원 속초지원 판사<br>수원지방법원 부장 판사<br>
  똑똑 법률사무소(2012-2017.03)<br>법무법인 세종 대표(2017.08-현재)',30,23,7);
  commit;
insert into introduce_member
  values(22,'부산대학교 경영학과 졸업<br>부산지방법원 속초지원 판사<br>수원지방법원 부장 판사<br>
  똑똑 법률사무소(2012-2017.03)<br>법무법인 세종 대표(2017.08-현재)',30,23,7);
insert into introduce_member
  values(23,'대구대학교 경영학과 졸업<br>대구지방법원 속초지원 판사<br>수원지방법원 부장 판사<br>
  똑똑 법률사무소(2012-2017.03)<br>법무법인 세종 대표(2017.08-현재)',30,23,7);
insert into introduce_member
  values(24,'제주대학교 경영학과 졸업<br>제주지방법원 속초지원 판사<br>수원지방법원 부장 판사<br>
  똑똑 법률사무소(2012-2017.03)<br>법무법인 세종 대표(2017.08-현재)',30,23,7);
insert into introduce_member
  values(25,'춘천대학교 경영학과 졸업<br>춘천지방법원 속초지원 판사<br>수원지방법원 부장 판사<br>
  똑똑 법률사무소(2012-2017.03)<br>법무법인 세종 대표(2017.08-현재)',30,23,7);
insert into introduce_member
  values(26,'울산대학교 경영학과 졸업<br>울산지방법원 속초지원 판사<br>수원지방법원 부장 판사<br>
  똑똑 법률사무소(2012-2017.03)<br>법무법인 세종 대표(2017.08-현재)',30,23,7);
insert into introduce_member
  values(27,'대전대학교 경영학과 졸업<br>대전지방법원 속초지원 판사<br>수원지방법원 부장 판사<br>
  똑똑 법률사무소(2012-2017.03)<br>법무법인 세종 대표(2017.08-현재)',30,23,7);
insert into introduce_member
  values(28,'인천대학교 경영학과 졸업<br>인천지방법원 속초지원 판사<br>수원지방법원 부장 판사<br>
  똑똑 법률사무소(2012-2017.03)<br>법무법인 세종 대표(2017.08-현재)',30,23,7);

commit;

------------------------------일반 회원가입 DB---------------------------------------
CREATE TABLE JOIN_NORMAL(
  ID VARCHAR2(30) CONSTRAINT PK_NORMAL_ID PRIMARY KEY,
  PASSWORD VARCHAR2(30) NOT NULL,
  NAME VARCHAR2(30) NOT NULL,
  PHONE VARCHAR2(30) NOT NULL,
  EMAIL VARCHAR2(30) NOT NULL,
  BIRTH VARCHAR2(30) NOT NULL,
  JDATE VARCHAR2(30)
  );

------------------------------변호사 회원가입 DB---------------------------------------
CREATE TABLE JOIN_LAYER(
  ID VARCHAR2(30) CONSTRAINT PK_LAYER_ID PRIMARY KEY,
  PASSWORD VARCHAR2(30) NOT NULL,
  NAME VARCHAR2(30) NOT NULL,
  PHONE VARCHAR2(30) NOT NULL,
  EMAIL VARCHAR2(30) NOT NULL,
  BIRTH VARCHAR2(30) NOT NULL,
  JDATE VARCHAR2(30),
  LICENSE_NO VARCHAR2(30),
  BUSINESS_NO VARCHAR2(30),
  LICENSE VARCHAR2(100),
  BUSINESS VARCHAR2(100),
  RLICENSE VARCHAR2(100),
  RBUSINESS VARCHAR2(100)
  );


--테이블 & 시퀀스 생성--
create table precedent_normal(
  no        number(4) primary key,
  title     varchar2(50) not null,
  category  varchar2(50),
  scale     varchar2(50),
  content   varchar2(500),
  result    varchar2(10) not null,
  hits      number(4)
);

create table precedent_review(
  no        number(4) primary key,
  title     varchar2(50) not null,
  category  varchar2(50),
  scale     varchar2(50),
  content   varchar2(500),
  result    varchar2(10) not null,
  lname     varchar2(10) not null,
  hits      number(4)
);

create table precedent_search(
  sno number(4) primary key,
  keyword varchar2(50) not null,
  sdate date
);

CREATE SEQUENCE SEQU_precedent_normal
  START WITH 1
  INCREMENT BY 1;

CREATE SEQUENCE SEQU_precedent_review
  START WITH 1
  INCREMENT BY 1;
  
CREATE SEQUENCE SEQU_precedent_search
  START WITH 1
  INCREMENT BY 1;

--기존 판례 테이블 정보 삽입--
insert into precedent_normal 
  values(sequ_precedent_normal.nextval,'소송1','형사','대법원', '내용1', '승소', 0);

insert into precedent_normal 
  values(sequ_precedent_normal.nextval,'소송2','민사','고등법원', '내용2', '패소', 0);

insert into precedent_normal 
  values(sequ_precedent_normal.nextval,'소송3','특허','하급심', '내용3', '승소', 0);
  
--후기 판례 테이블 정보 삽입--
insert into precedent_review 
  values(sequ_precedent_review.nextval,'소송1','형사','대법원', '내용1', '승소', '김선웅', 0);

insert into precedent_review 
  values(sequ_precedent_review.nextval,'소송2','민사','고등법원', '내용2', '패소', '린선웅', 0);

insert into precedent_review 
  values(sequ_precedent_review.nextval,'소송3','특허','하급심', '내용3', '패소', '선웅옹', 0);
  
------------------------------
create table lawtion_auction_board(
  no number(4) constraint pk_lawtion_auction_board_no primary key,
  title varchar2(50) not null,
  content varchar2(500),
  fname varchar2(100),
  adate date,
  hits number(4),
  category varchar2(50),
  edate varchar2(50),
  area varchar2(50),
  agree varchar2(50)
);

create sequence sequ_lawtion_auction_board
  start with 1
  increment by 1;
  
create table lawtion_auction_comment(
  cno number(4) primary key,
  content varchar2(500),
  cdate date,
  ano number(4),
  lawyer number(4), 
  CONSTRAINT fk_lawtion_auction_comment_ano foreign key(ano) REFERENCES lawtion_auction_board(no) ON DELETE CASCADE
);

create sequence sequ_lawtion_auction_comment
  start with 1
  increment by 1;
commit;