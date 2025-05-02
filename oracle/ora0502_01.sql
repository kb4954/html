select sysdate from dual;

현재일에서 이 달의 최초일, 이달의 마지막일을 출력하시오.
select trunc(sysdate,'month'),sysdate,last_day(sysdate) from dual;

select * from stuscore;
select * from stuscore 
where avg>=80
and rownum<=5
order by avg desc;

--rownum: 검색된 것에 일련번호를 다시 붙이는 것을 말함
--게시판에 번호를 붙여서 순차적으로 출력하고 싶을 때 사용
select rownum, stuscore.* from stuscore where kor>=80;
select rownum, stuscore.* from stuscore where name like '%s%';

국어점수와 영어점수 차이가 가장 큰 10명의 학생을 출력하시오.
그리고 rownum을 붙여서 출력하시오
-- 처음안의 select을 먼저 작성하고 나중에 로먼에 넣어서 뒤에 where절에 로먼 조건 적기
select rownum, a.*
from(select rownum,kor,eng,kor-eng,abs(kor-eng) ke from stuscore order by ke desc) a
where rownum<=10;

--처음 국어점수와 영어점수 차이 표헌
select rownum,kor,eng,kor-eng,abs(kor-eng) ke from stuscore order by ke desc;

날짜 표현
select sysdate from dual;
select to_char(sysdate,'yyyy-mm-dd hh:mi:ss day') from dual;
select next_day(sysdate,'금요일') from dual;

min: 가장 낮은 사원 검색
select min(salary),max(salary),avg(salary),count(salary),sum(salary) from employees;

현재날짜에서 3일전의 날짜, 3달전의 날짜를 출력하시오.
select sysdate-3, sysdate, add_months(sysdate,-3) from dual;

ABC좋은나라DEF :좋은나라만 substr 사용해서 출력하시오.
substr: 원하는 글자만 떼오기
select 'ABC좋은나라DEF', substr('ABC좋은나라DEF',4,4) from dual;

select mdate from member;
월만 분리해서 출력하고, 05,06,07인 회원만 출력하시오.
select mdate, substr(mdate,4,2) subs 
from member where substr(mdate,4,2) in('05','06','07') order by mdate; --where 조건에서 어디에 있는 무엇을 잘 표현하기

desc stuscore;

create table stuscore5(
sno number(4),
name varchar2(100),
KOR   NUMBER(3),     
ENG  NUMBER(3),    
MATH  NUMBER(3)
);

select * from stuscore3;

1.테이블과 함께 데이터를 모두 복사
create table stuscore4 as select * from stuscore;

2. 기존테이블이 존재시, 데이터 모두 복사
insert into stuscore3 select * from stuscore;

3. 컬럼이 다른 경우, 컬럼을 부여한 후 데이터 모두 복사
insert into stuscore5(sno, name, kor, eng,math) select sno,name,kor,eng,math from stuscore;

컬럼추가
alter table stuscore5 add total number(3);
컬럼 삭제
alter table stuscore5 drop column total;

다시 넣음 변경을 위해서
alter table stuscore5 add total number(2);

컬럼 변경 - 타입변경(modify)
alter table stuscore5 modify total number(3);
기존에 들어가 있는 데이터 3자리가 있는데, 2자리로 변경을 하려고 하면 변경되지 않음.
기존에 문자가 들어가 있는데, 숫자형으로 변경하려면 변경되지 않음.

컬럼변경 - 이름 변경(rename)
alter table stuscore5 rename column total to tot;

테이블명 변경
alter table stuscore2 rename to stu2;
alter table stu2 rename to stuscore2;


desc stuscore5;

컬럼 순서 변경
alter table stuscore5 modify name invisible;

alter table stuscore5 modify kor invisible;

alter table stuscore5 modify eng invisible;
alter table stuscore5 modify math invisible;

alter table stuscore5 modify name visible;
alter table stuscore5 modify kor visible;
alter table stuscore5 modify eng visible;
alter table stuscore5 modify math visible;

select * from stuscore5;

--drop table stuscore3;
--drop table stuscore4;
--drop table stuscore5;

select * from stuscore5;

commit;

--------------------------------------------------------------------------------
create table mem(
    id varchar2(30) primary key, -- 중복X null X
    name varchar2(100) not null, -- 중복 O null X
    phone varchar2(20) unique, --중복X null O
    gender nchar(2) check(gender in ('남성','여성')),
    kor number(3) check(kor between 0 and 100)
);

insert into mem values(
'aaa','홍길동','010-1111','남성',100);

insert into mem values(
'bbb','유관순',null,'여성',95);

insert into mem values(
'ccc','유관순',null,'여성',99);


insert into mem values(
'ddd','이순신',null,'남성',95);

insert into mem values(
'eee','이순신',010-2222,'남성',100);

commit;

UPDATE mem
SET phone = '010-2222'
WHERE id = 'eee';

select * from mem;



--테이블 mem 테이블 primary key id

constraint 별칭(fk_score_id) foreign key(현재테이블의 컬럼) references pk테이블(컬럼)
constraint fk_score_id foreign key(id) references mem(id)
이렇게 지정을 해줘야지 foreign key로 등록이 가능함.
-----기본키 설정
sno number(4) primary key

기본키 삭제
alter table score drop constraint SYS_C008355;
기본키 설정
alter table score add constraint pk_score_id primary key(sno);

----외래키 설정
create table score(
sno number (4) primary key,
id varchar2(30),
kor number(3),
constraint fk_score_id foreign key(id) references mem(id) -- 외래키 등록
); 

--<매우중요>
기본키: 중복X null X   
외래키: 기본키 없는 데이터를 입력하면 입력이 되지 않게함.

-- 외래키를 삭제하고 다시 등록할때
alter table score add constraint fk_score_id foreign key(id) references mem(id);

--외래키 조건 삭제
--alter table score drop constraint fk_score_id;


select * from mem;
insert into score values(1,'aaa',100);
insert into score values(2,'bbb',90);
insert into score values(3,'bb2',90);

delete score where sno=2;
commit;

select * from score;

select * from mem;
delete mem where id='bbb'; -- 자식을 먼저 삭제해야지 부모도 삭제가능

--------------------------------------------------------------------------------

--조인

select * from employees;
select department_id from employees;
cross join - 테이블 2개 선택해서 출력
select * from employees, departments; 
(13+6)=19개 : 전체 컬럼수
107*27 =2889개 합친 데이터 갯수
--107
select * from departments;
--27
desc employees; --13
desc departments; --6

--equi join : 같은 컬럼을 가지고 조인 employees랑 departments 둘다 department_id가 존재
select emp_name, a.department_id,department_name, salary
from employees a,departments b
where a.department_id = b.department_id
;

select * from member;
select * from stuscore;

select id,gender,rank, sno, phone, a.name,total,avg
from member a,stuscore b
where a.name = b.name;

select emp_name,salary,job_id from employees;
select min_salary,max_salary from jobs;

select emp_name,b.department_id,department_name, salary, a.job_id, min_salary, max_salary
from jobs a, employees b, departments c
where a.job_id = b.job_id and b.department_id = c.department_id ;

select * from jobs;
select * from employees;



desc board;
select * from board;

alter table board add bfile3 varchar2(100);


alter table board modify bdate invisible;
alter table board modify bdate visible;

desc board;
create table bfile(
bno number(4),
bfile varchar2(100));

insert into bfile values(
1,'2.jpg'
);
insert into bfile values(
4,'d1.jpg'
);

select * from bfile;
rollback;

select * from board a, bfile b
where a.bno = b.bno;

alter table board drop column bfile;
alter table board drop column bfile2;
alter table board drop column bfile3;

desc board;

select * from board a, bfile b where a.bno=b.bno and a.bno=1;

select * from board where bno=1;
select * from bfile where bno=1;


select department_id,department_name from departments;

select * from board;
-- bno,btitle, bcontent,id, bgroup,bstep,bindent,bdate
bno: board_seq.nextval
bgroup: board_seq.currval
bdate: sysdate
--나머진 그대로 가져감

insert into board values(
board_seq.nextval, '2번째 게시글','파이썬에서 글쓰기 테스트','aaa',board_seq.currval,
0,0,0,sysdate
);
commit;

select * from stuscore;
select * from board;

desc board;

cross join -> equi join, non-equi join, inner join, outer join

non_equi join

create table scoreGrade(
grada char(1),
minscore number(3),
maxscore number(3));

insert into scoregrade values('F',0,59);
insert into scoregrade values('D',60,69);
insert into scoregrade values('C',70,79);
insert into scoregrade values('B',80,89);
insert into scoregrade values('A',90,100);

select * from scoregrade;
commit;

select * from scoregrade;
select * from stuscore;
--stuscore 테이블 avg를 가지고 scoregrade 테이블의 grade를 출력할 수 있게 구성

select sno,name,avg,grade 
from stuscore,scoregrade
where avg between minscore and maxcore;



select department_id from departments;
group by department_id;

28,17,15,30,45,49,37,35,32,12,19,27
생일 만나이로 환산해서 출력하시오
select hire_date from employees;
select trunc(to_char(sysdate, 'yyyy')-to_char( hire_date, 'yyyy'),-1) tyear,count(*) 
from employees
group by trunc(to_char(sysdate, 'yyyy')-to_char( hire_date, 'yyyy'),-1);

부서별 평균 월급을 출력하시오.
select * from departments;
select salary from employees;


select a.department_id,department_name, avg(salary) 
from employees a,departments b
where a.department_id = b.department_id
group by a.department_id,department_name
;















