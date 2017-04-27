CREATE TABLE java_users (
  USER_NO int NOT NULL,
  USER_NM varchar2(100) NULL,
  EMAIL varchar2(50) NULL,
  PWD varchar2(20) NULL,
  USER_DESC varchar2(200) NULL,
  DEL_YN varchar2(1) DEFAULT 'N',
  REG_ID varchar2(50) NULL,
  REG_DATE date DEFAULT sysdate,
  MOD_ID varchar2(50) NULL,
  MOD_DATE date DEFAULT sysdate
);

CREATE TABLE java_board (
  BOARD_NO int NOT NULL,
  TITLE varchar2(50) NULL,
  CONTENT varchar2(20) NULL,
  DEL_YN varchar2(1) DEFAULT 'N' NOT NULL,
  REG_ID varchar2(50) NULL,
  REG_DATE date DEFAULT sysdate NOT NULL,
  MOD_ID varchar2(50) NULL,
  MOD_DATE date DEFAULT sysdate NOT NULL
);

CREATE SEQUENCE USERS_SEQ  START WITH 1 INCREMENT BY 1 MAXVALUE 100000;
CREATE SEQUENCE BOARD_SEQ  START WITH 1 INCREMENT BY 1 MAXVALUE 100000;

insert into java_users (USER_NO, USER_NM, EMAIL, PWD, USER_DESC, REG_ID, MOD_ID) values (USERS_SEQ.NEXTVAL, '관리자','admin@goodee.co.kr','1234','전체 관리자','admin@goodee.co.kr','admin@goodee.co.kr');
insert into java_users (USER_NO, USER_NM, EMAIL, PWD, USER_DESC, REG_ID, MOD_ID) values (USERS_SEQ.NEXTVAL, '손님','guest','guest','비회원','guest','guest');
commit;

SELECT * FROM JAVA_USERS;

INSERT INTO JAVA_BOARD (BOARD_NO, TITLE, CONTENT, REG_ID, MOD_ID) VALUES (BOARD_SEQ.NEXTVAL,'테스트','테스트 내용','admin@goodee.co.kr','admin@goodee.co.kr');
INSERT INTO JAVA_BOARD (BOARD_NO, TITLE, CONTENT, REG_ID, MOD_ID) VALUES (BOARD_SEQ.NEXTVAL,'테스트','테스트 내용1','admin@goodee.co.kr','admin@goodee.co.kr');
INSERT INTO JAVA_BOARD (BOARD_NO, TITLE, CONTENT, REG_ID, MOD_ID) VALUES (BOARD_SEQ.NEXTVAL,'테스트','테스트 내용2','admin@goodee.co.kr','admin@goodee.co.kr');
commit;

SELECT * FROM JAVA_BOARD WHERE DEL_YN = 'N';