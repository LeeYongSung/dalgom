CREATE TABLE java_users (
  USER_NO int NOT NULL,
  USER_NM varchar(100) NULL,
  EMAIL varchar(50) NULL,
  PWD varchar(20) NULL,
  USER_DESC varchar(200) NULL,
  DEL_YN varchar(1) DEFAULT 'N' NOT NULL,
  REG_ID varchar(50) NULL,
  REG_DATE date DEFAULT sysdate NOT NULL,
  MOD_ID varchar(50) NULL,
  MOD_DATE date DEFAULT sysdate NOT NULL
);



insert into java_users (USER_NO, USER_NM, EMAIL, PWD, USER_DESC, REG_ID, MOD_ID) values (USER_SEQ.NEXTVAL, '관리자','admin@goodee.co.kr','1234','전체 관리자','admin@goodee.co.kr','admin@goodee.co.kr');
insert into java_users (USER_NO, USER_NM, EMAIL, PWD, USER_DESC, REG_ID, MOD_ID) values (USER_SEQ.NEXTVAL, '손님','guest','guest','비회원','guest','guest');
commit;

CREATE SEQUENCE USER_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 100000;

SELECT * FROM JAVA_USERS WHERE DEL_YN = 'N' AND EMAIL = 'admin@goodee.co.kr';

CREATE TABLE java_board (
  BOARD_NO int NOT NULL,
  TITLE varchar(50) NULL,
  CONTENT varchar(20) NULL,
  DEL_YN varchar(1) NOT NULL DEFAULT 'N',
  REG_ID varchar(50) NULL,
  REG_DATE date NOT NULL DEFAULT sysdate,
  MOD_ID varchar(50) NULL,
  MOD_DATE date NOT NULL DEFAULT sysdate
);

INSERT INTO JAVA_BOARD (BOARD_NO, TITLE, CONTENT, REG_ID, MOD_ID) VALUES (BOARD_SEQ.NEXTVAL, '테스트','테스트 내용','admin@goodee.co.kr','admin@goodee.co.kr');
INSERT INTO JAVA_BOARD (BOARD_NO, TITLE, CONTENT, REG_ID, MOD_ID) VALUES (BOARD_SEQ.NEXTVAL, '테스트','테스트 내용1','admin@goodee.co.kr','admin@goodee.co.kr');
INSERT INTO JAVA_BOARD (BOARD_NO, TITLE, CONTENT, REG_ID, MOD_ID) VALUES (BOARD_SEQ.NEXTVAL,, '테스트','테스트 내용2','admin@goodee.co.kr','admin@goodee.co.kr');
commit;

CREATE SEQUENCE BOARD_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 100000;

SELECT * FROM JAVA_BOARD WHERE DEL_YN = 'N';