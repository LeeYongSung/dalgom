--테이블명 : J_USER
--컬럼 1: J_ID
--컬럼 2: J_PW
--컬럼 3: J_NM
--컬럼 4: DEL_YN

create table J_USER (
  J_ID varchar2(20),
  J_PW varchar2(16),
  J_NM varchar2(20),
  DEL_YN varchar2(1) DEFAULT ('N')
);

insert into J_USER (J_ID,J_PW,J_NM) values ('admin','admin','관리자');
commit;

select * from J_USER;