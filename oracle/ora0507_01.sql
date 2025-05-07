select * from employees;

--employees 테이블에 dapartment_name 컬럼을 생성
select department_id from employees;

select department_name from departments;
desc employees;
DEPARTMENT_ID           NUMBER(6) 
desc departments; --아이디 네임 둘다있음
DEPARTMENT_NAME NOT NULL VARCHAR2(80)

--equi-join
select emp_name,a.department_id, department_name 
from employees a, departments b
where a.department_id =b.department_id
;


create table emp1(
EMP_NAME VARCHAR2(80),
DEPARTMENT_ID NUMBER(6),
DEPARTMENT_NAME VARCHAR2(80),
SALARY NUMBER(8,2)
);

insert into emp1 values('홍길동',10,'총무기획부','100');
insert into emp1 values('유관순',20,'마케팅','200');
insert into emp1 values('이순신',30,'구매/생산부','200');

commit;

update emp1 set department_name = '전략기획부'
where department_id = 10;

select * from emp1;
select * from depart1;

create table depart1(
DEPARTMENT_ID NUMBER(6),
DEPARTMENT_NAME VARCHAR2(80)
);

insert into depart1 values(10,'총무기획부');
insert into depart1 values(20,'마케팅');
insert into depart1 values(30,'구매/생산부');

--테이블 설계시 컬럼먼저 작성-> 중복된 컬럼을 어떻게 처리할지 고민

select count(*) from board;

select * from board;

select * from member;

update member set id = 'aaa' where id='Flori';
update member set id = 'bbb' where id='Holt';
update member set id = 'ccc' where id='Byrom';
update member set id = 'ddd' where id='Austin';
update member set id = 'eee' where id='Allard';
update member set id = 'fff' where id='Dolores';


commit;
-------------------------------------------------------------------------------

select bno,btitle,id,name from member a,board b
where a.id = b.id;

select * from scoregrade;

select * from stuscore;
select * from scoregrade;
alter table stuscore add grade char(1) default 'c' not null;

alter table stuscore rename column grade to sgrade;

--scoregrade, stuscore 테이블 non-equi join 

select avg,grade
from stuscore, scoregrade
where avg between minscore and maxscore ;

구매리스트 정보 1달별로 총 구매금액 출력 회원등급기준으로 등급 입력시킬때
non-equi join

--그룹함수 sum
select a.department_id, department_name, 
count(salary), round(avg(salary),2) sum(salary) 
from employees a, departments b
where a.department_id = b.department_id
group by a.department_id, department_name
order by sum(salary) desc
;


select * from stuscore2;
update stuscore2 set rank=0;
commit;

rank() 함수를 사용해서 등수를 입력하시오.

update stuscore2
set rank=1;
select  sno, rank() over(order by total desc) from stuscore2;

update stuscore2 a
set rank = (select ranks from
(
select sno,rank() over(order by total desc) ranks from stuscore2)b
where a.sno = b.sno);




select * from stuscore2 order by total desc;
select count(*) from stuscore2;
select * from scoregrade;

update scoregrade set maxscore = 59.999 where grada='F';
update scoregrade set maxscore = 69.999 where grada='D';
update scoregrade set maxscore = 79.999 where grada='C';
update scoregrade set maxscore = 89.999 where grada='B';

desc scoregrade;

commit;
--컬럼 수정
alter table scoregrade modify (maxscore number(6,3));

select * from stuscore2;
alter table stuscore2 add sgrade char(1) default 'F';

select sno, avg,grada
from stuscore2, scoregrade
where avg between minscore and maxscore;

update stuscore2 a
set sgrade =
(
select sgrada from
(
select sno,avg, sgrada
from stuscore2,scoregrade
where avg between minscore and maxscore
) b
where a.sno = b.sno
);

select * from stuscore2;

update stuscore2
set rank=1;
select  sno, rank() over(order by total desc) from stuscore2;

update stuscore2 a
set rank = (select ranks from
(
select sno,rank() over(order by total desc) ranks from stuscore2)b
where a.sno = b.sno);

select count(*) from stuscore2;

select * from scoregrade;

rollback;


--drop table stuscore;

select * from stuscore;
create table stuscore as select * from stuscore2; 
create table stuscore3 as select * from stuscore where 1=2;
select * from stuscore;

--drop table stuscore3;

alter table stuscore2 drop column sgrade;
alter table stuscore2 drop column rank;
--랭크를 없앴는데 다시 랭크 생성함
select * from 
(select a.*,rank() over(order by total desc) ranks from stuscore2 a) -- 얘가 테이블이 됨
order by sno
;-- 이렇게 하면 다시 sno로 정렬이 가능함.

select * from member;
alter table member add total number(3) default 0;
update member a set a.total = (
select b.total from stuscore2 b);


insert into  member(total) select total from stuscore where total>0;
select * from member;



insert into member(no,total) select sno,total from stuscore;
update member set no, total select sno,total from stuscore;

delete from member where id is null;


select rownum, no from member;
update member set no=(select rownum from member);

-------------------------------------------------------------------------------
--등급처리

select * from stuscore;
update stuscore set sgrade = 'F';

commit;
select * from scoregrade;



update stuscore a set sgrade = (
select grada from(
select sno,avg,grada from stuscore, scoregrade
where avg between minscore and maxscore
) b where a.sno=b.sno
);

select grada0 from stuscore, scoregrade
where avg between minscore and maxscore;

select * from stuscore where name like '%||:search||%"

