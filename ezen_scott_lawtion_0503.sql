--------------------------�ı�Խ��� ���̺� & ������--------------------------------------------
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
----------------------�ϼҿ��Խ��� ���̺� & ������-------------------------------------------------

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


---------------------�ϼҿ��Խ��� ��� ���̺� & ������------------------------------------
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

---------------------�ı�Խ��� ��� ���̺� & ������--------------------------------------------


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
--------------------��ȣ�� �⺻���� ���̺�  & ������------------------------------------------------
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
-------------------��ȣ�� �⺻���� ���̺�  & ������ DB(insert)-------------------------------------------------
/*�������̺�*/
insert into lawtion_introduce 
  values(sequ_lawtion_introduce.nextval,'������','�������μ���','�Ǽ�,����');

insert into lawtion_introduce 
  values(sequ_lawtion_introduce.nextval,'������','�������μ���','�Ǽ�,����,����');
insert into lawtion_introduce 
  values(sequ_lawtion_introduce.nextval,'�����','�������μ���','�Ǽ�,����');
commit;
insert into lawtion_introduce 
  values(sequ_lawtion_introduce.nextval,'����ȯ','���������¾�','�λ�,����,����');
insert into lawtion_introduce 
  values(sequ_lawtion_introduce.nextval,'�����','�������������','��ȥ,�λ�');
insert into lawtion_introduce 
  values(sequ_lawtion_introduce.nextval,'��ν�','�������������','����,������');
insert into lawtion_introduce 
  values(sequ_lawtion_introduce.nextval,'������','�������������','����,����,����');
insert into lawtion_introduce 
  values(sequ_lawtion_introduce.nextval,'�̽¹�','�������������','����,����');
commit;

SELECT * FROM LAWTION_INTRODUCE;

-------------------��ȣ�� �¼� + ��»��� ���̺�----------------------------------------------------
create table introduce_member(
  no        number(4) constraint introduce_member_no_fk references lawtion_introduce(no),
  carrer    varchar2(500),
  trial     number(4),
  win       number(4),
  lose      number(4)
);

desc introduce_member;

select * from introduce_member;
------------------��ȣ�� �¼� + ��»��� ���̺� DB (insert)----------------------------------------
insert into introduce_member
  values(21,'������б� �濵�а� ����<br>��õ������� �������� �ǻ�<br>����������� ���� �ǻ�<br>
  �ȶ� �����繫��(2012-2017.03)<br>�������� ���� ��ǥ(2017.08-����)',30,23,7);
  commit;
insert into introduce_member
  values(22,'�λ���б� �濵�а� ����<br>�λ�������� �������� �ǻ�<br>����������� ���� �ǻ�<br>
  �ȶ� �����繫��(2012-2017.03)<br>�������� ���� ��ǥ(2017.08-����)',30,23,7);
insert into introduce_member
  values(23,'�뱸���б� �濵�а� ����<br>�뱸������� �������� �ǻ�<br>����������� ���� �ǻ�<br>
  �ȶ� �����繫��(2012-2017.03)<br>�������� ���� ��ǥ(2017.08-����)',30,23,7);
insert into introduce_member
  values(24,'���ִ��б� �濵�а� ����<br>����������� �������� �ǻ�<br>����������� ���� �ǻ�<br>
  �ȶ� �����繫��(2012-2017.03)<br>�������� ���� ��ǥ(2017.08-����)',30,23,7);
insert into introduce_member
  values(25,'��õ���б� �濵�а� ����<br>��õ������� �������� �ǻ�<br>����������� ���� �ǻ�<br>
  �ȶ� �����繫��(2012-2017.03)<br>�������� ���� ��ǥ(2017.08-����)',30,23,7);
insert into introduce_member
  values(26,'�����б� �濵�а� ����<br>���������� �������� �ǻ�<br>����������� ���� �ǻ�<br>
  �ȶ� �����繫��(2012-2017.03)<br>�������� ���� ��ǥ(2017.08-����)',30,23,7);
insert into introduce_member
  values(27,'�������б� �濵�а� ����<br>����������� �������� �ǻ�<br>����������� ���� �ǻ�<br>
  �ȶ� �����繫��(2012-2017.03)<br>�������� ���� ��ǥ(2017.08-����)',30,23,7);
insert into introduce_member
  values(28,'��õ���б� �濵�а� ����<br>��õ������� �������� �ǻ�<br>����������� ���� �ǻ�<br>
  �ȶ� �����繫��(2012-2017.03)<br>�������� ���� ��ǥ(2017.08-����)',30,23,7);

commit;

------------------------------�Ϲ� ȸ������ DB---------------------------------------
CREATE TABLE JOIN_NORMAL(
  ID VARCHAR2(30) CONSTRAINT PK_NORMAL_ID PRIMARY KEY,
  PASSWORD VARCHAR2(30) NOT NULL,
  NAME VARCHAR2(30) NOT NULL,
  PHONE VARCHAR2(30) NOT NULL,
  EMAIL VARCHAR2(30) NOT NULL,
  BIRTH VARCHAR2(30) NOT NULL,
  JDATE VARCHAR2(30)
  );

------------------------------��ȣ�� ȸ������ DB---------------------------------------
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


--���̺� & ������ ����--
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

--���� �Ƿ� ���̺� ���� ����--
insert into precedent_normal 
  values(sequ_precedent_normal.nextval,'�Ҽ�1','����','�����', '����1', '�¼�', 0);

insert into precedent_normal 
  values(sequ_precedent_normal.nextval,'�Ҽ�2','�λ�','������', '����2', '�м�', 0);

insert into precedent_normal 
  values(sequ_precedent_normal.nextval,'�Ҽ�3','Ư��','�ϱ޽�', '����3', '�¼�', 0);
  
--�ı� �Ƿ� ���̺� ���� ����--
insert into precedent_review 
  values(sequ_precedent_review.nextval,'�Ҽ�1','����','�����', '����1', '�¼�', '�輱��', 0);

insert into precedent_review 
  values(sequ_precedent_review.nextval,'�Ҽ�2','�λ�','������', '����2', '�м�', '������', 0);

insert into precedent_review 
  values(sequ_precedent_review.nextval,'�Ҽ�3','Ư��','�ϱ޽�', '����3', '�м�', '������', 0);
  
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