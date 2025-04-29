-- 테이블 생성

create table member(
id varchar2(100) primary key,
pw VARCHAR2(100),
name VARCHAR2(100),
phone VARCHAR2(20)
);

--입력 명령어 insert into : 임시저장 
insert into member(id,pw,name,phone) values(
'aaa','1111','홍길동','010-1111-1111'
);
insert into member values(
'bbb','1111','유관순','010-2222-2222'
);

insert into member(id,pw,name) values(
'ccc','1111','이순신'
);--null 데이터가 안들어감

insert into member(id,pw,name,phone) values(
'ddd','강감찬','010-3333-3333'
);
insert into member(id,pw,name,phone) values(
'ddd','1111','강감찬','010-3333-3333'
);
insert into member(id,pw,name,phone) values(
'eee','1111','김구','010-4444-4444');
insert into member(id,pw,name,phone) values(
'fff','1111','김유신','010-5555-5555');


--select : 검색이면서 출력
select id,pw,name,phone from member;

select * from member; -- 컬럼 모두 출력
select id,name from member;


update member set phone = '010-1234-1234' where id='ccc';

select * from member;
commit;
rollback;

drop table member;

create table member(
id VARCHAR2(100) primary key,
pw VARCHAR2(100),
name VARCHAR2(100),
phone VARCHAR2(100)
);

insert into member (id,pw,name,phone) values(
'aaa','1111','홍길동','010-1111-1111');
insert into member (id,pw,name,phone)values(
'bbb','1111','유관순','010-2222-2222');
insert into member (id,pw,name, phone) values(
'ccc','1111','이순신','010-1234-1234');
insert into member (id,pw,name,phone) values(
'ddd','1111','강감찬','010-4444-4444');
insert into member (id,pw,name,phone) values(
'eee','1111','김구','010-5555-5555');
insert into member(id, pw, name,phone) values(
'fff','1111','김유신','010-6666-6666');

select * from member;

--delete 삭제
delete member;
rollback;

delete member where id = 'aaa';
delete member where name = '유관순';
delete member where name like '%김%';

rollback ;



commit;-- 커밋까지 해야지 데이터 등록 완료 그전엔 임시저장

create table stuscore(
sno number(4) primary key,
name VARCHAR2(100),
kor number(3),
eng number(3),
math number(3),
total number(3),
avg number(4),
rank number(3)
);

