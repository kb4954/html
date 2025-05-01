--복습
select * from employees;
select * from employees where emp_name like '%n%'; order by emp_name dse;;

select count(*) from employees where emp_name like '%n%';

select * from stuscore order by rank desc;

select * from stuscore order by kor asc;

-- employees테이블 hire_date
--입사일 가장 일찍인 사원순으로 정렬하시오.
select emp_name, hire_date from employees  order by hire_date asc; 
--------------------------------------------------------------------------------

--숫자함수
--abs(): 절댓값
--round() : 반올림, ceil: 올림, floor():버림, trune():특정자리수를 잘라내기
--mod(): 입력받은 수를 나눈 나머지 값 반환,
--power(m,n): m의 n층을 반환

select -10 from dual;
select -10,abs(-10) from dual;

select kor,eng,kor-eng,abs(kor-eng) from stuscore order by kor-eng desc;

--rownum : 조회된 순서대로 순번을 다시 매김
select rownum,name from stuscore;

select rownum,sno,name,total from stuscore where total>=250 and rownum<=10;
--stuscore테이블에서 1-10등까지의 학생을 출력하시오
select * from stuscore where rank<=10 order by rank asc; 
--rownum, * 은 출력이 안됨 그럴땐 별칭을 매겨야함 a.*
select rownum,a.* from (select * from stuscore where rank <=10 order by rank) a;
--위와같이 하면 rownum가 마지막에 실행됨. select 바로 뒤가 가장 마지막에 보여지는 것

--국어점수가 80점 이상인 학생 5명을 출력하시오.
select rownum, a.* from (select * from stuscore where kor>=80 order by kor) a where rownum<=5;
--구조
select sno, a.* from stuscore a
where sno<=5;

--국어점수와 영어점수 차이가 가장 큰 10명의 학생을 입력하시오. *을 안쓸경우 별칭을 안써두 됨.
select rownum,a. * from(
select kor,eng,abs(kor-eng)ke from stuscore order by ke desc
) a
where rownum<=10;


--------------------------------------------------------------------------------
--floor(): 버림
select 12.5,floor(12.5) from dual;

--ceil: 올림
select 12.1, ceil(12.1) from dual;

--round: 반올림 - (m,3) :소수점 3자리까지 표시
select 12.1257,round(12.1257,3) from dual;
-- '-' 형태로도 가능
select 35.5678, round(35.5678,-1) from dual;
--trunc(): 지정한 자리 버림 floor() 소수점을 제거 
select 34.5678, trunc(34.5678,2), trunc(34.5678,-1) from dual;

--mod() : 나눈 나머지, mod(5,2) 1 -> 5%2
select mod(27,2),mod(27,5),mod(27,7) from dual;

--stuscore sno에서 짝수만 출력하시오.
select * from stuscore where mod(sno,2)=0;
--------------------------------------------------------------------------------
-- 시퀀스 개념 이해와 시퀀스 생성
-- 테이블 내의 유일한 숫자를 자동으로 생성하는 자동번호 발생기 
-- 번호를 뒤로 백 안됨
select stu_seq.nextval from dual; -- 시퀀스 증가
select stu_seq.currval from dual; -- 시퀀스 현재 몇번인지 확인

--시퀀스 새로 만들기
create sequence s_seq
start with 1
increment by 1
minvalue 1
maxvalue 9999
nocache
nocycle
;
select s_seq.nextval from dual;
select s_seq.currval from dual;

-- 새로운 테이블 board 생성
create table board (
bno number(4) primary key, -- 4자리, primary key: 중복이 안되게 해주는 기본키
btitle varchar2(1000),     -- 제목 varchar2 4000byte 약 1400글자까지 가능
bcontent clob,             -- clob: 대용량문자 4기가까지 가능
id varchar2(100),          -- 회원가입 id 연결 
bgroup number(4),          -- 답변달기 부모그룹
bstep number(4),           -- 답변달기 순서
bindent number(4),         -- 답변달기 들어쓰기
bhit number(4),            -- 조회수
bfile varchar2(100),       -- 파일첨부
bdate date                 -- 입력날짜
);

insert into board values(
board_seq.nextval,'게시글을 등록합니다.','홈페이지를 오픈합니다. 많은 이용 바랍니다.',
'aaa',board_seq.currval,0,0,0,'',sysdate);

insert into board values(
board_seq.nextval,'이벤트 등록','이벤트를 등록합니다. 꼭 당첨 기대!!',
'bbb',board_seq.currval,0,0,0,'',sysdate);

insert into board values(
board_seq.nextval,'이벤트 등록2','이벤트를 등록합니다. 꼭 당첨 기대!!',
'ccc',board_seq.currval,0,0,0,'',sysdate);

insert into board values(
board_seq.nextval,'이벤트 등록3','이벤트를 등록합니다. 꼭 당첨 기대!!',
'ddd',board_seq.currval,0,0,0,'',sysdate);

insert into board values(
board_seq.nextval,'이벤트 등록4','이벤트를 등록합니다. 꼭 당첨 기대!!',
'eee',board_seq.currval,0,0,0,'',sysdate);

select * from board;
commit;

select * from stuscore;

insert into stuscore values(
stuscore_seq.nextval,'김보경',90,90,99,90+90+99,(90+90+99)/3,0
);

select * from stuscore;
commit;

--delete stuscore where sno in(101,102);

--drop table stuscore3;
--drop table stuscore4;


select * from stuscore;
update stuscore  set kor=100,total=100+eng+math, avg= (100+eng+math)/3 where sno=104;

rollback;

--이름 김 들어간 학생을 검색하시오
select * from stuscore where name like '%김%';

--------------------------------------------------------------------------------
-- 형변환(중요)
number,varchar2,char,date
--<날짜>
숫자: 사칙연산 가능
select 1+2 from dual;
문자열 숫자는 자동으로 숫자로 변경됨.
select 1+'2' from dual;
문자: +,-안됨.
||,concat(): 문자열을 더하기 해서 출력
select 1||'a' from dual;
--날짜: +,-가능 
select sysdate-1 from dual;

select hire_date from employees;

--현재 시스템 날짜
select sysdate from dual;
--근무일 계산
select sysdate-hire_date from employees;

select hire_date,round(hire_date),to_char(hire_date,'yyyy-mm-dd hh:mi:ss') from employees;
select bdate, to_char(bdate,'yyyy-mm-dd hh24:mi:ss') from board;
insert into board values(
board_seq.nextval,'추가 게시글 등록','추가로 게시글을 등록합니다. 당첨부탁드려요.',
'aaa',board_seq.currval,0,0,0,'',sysdate);

select * from board;
desc board;

--한주가 시작되는 날짜기준으로 반올림.
select bdate,to_char(bdate, 'yyy-mm-dd hh:mi:ss'),round(bdate,'day') from board;
select bdate,to_char(bdate, 'yyy-mm-dd hh:mi:ss'),to_char(round(bdate,'mi'),'yyyy-mm-dd hh24:mi:ss') from board;


-- 16일을 기준으로 월을 반올림 month

select mdate,to_char(mdate,'yyyy-mm-dd hh:mi:ss'), round(mdate,'month') from member;

trunc --절사
select mdate,to_char(mdate,'yyyy-mm-dd hh:mi:ss'),trunc(mdate,'month') from member;
select mdate,trunc(mdate,'month');

현재일 입사일의 개월수 계산
select emp_name,hire_date,sysdate,months_between(sysdate,hire_date) from employees;

select mdate, sysdate,round(months_between(sysdate,mdate))||'개월' from member;

--학생성적이 등록된 달이 4개월된 학생들을 출력하시오.
select name, mdate, sysdate,round(months_between(sysdate,mdate)) from member
where round(months_between(sysdate,mdate))=4;

substr()
24/07/14
select mdate,substr( to_char(mdate),4,2) from member;

파이썬 substring() a[3:7] abcdefghijklmn

select name from stuscore;
select emp_name from employees;

emp_name 3,4  3번째부터 4개의 글자를 가지고와 출력하시오

select emp_name, substr((emp_name),3,4) from employees;

round (달을 기준으로 날짜를 반올림해보기: 16일 이상이면 월+1, 16일 미만 일을 절사)
select mdate from member;
select mdate, round(mdate,'month') from member;
select 1.5,round(1.5), trunc(1.5) from dual;
trunc(달을 기준) 일을 절사 : 뒤에 다 잘라버림
select mdate, trunc(mdate,'month') from member;

round(년을 기준) round(mdate,'year')
select mdate, round(mdate,'year') from member;

-- months_between( 두 날짜 사이의 달수를 계산)

select sysdate,mdate,sysdate-mdate from member;
select sysdate,mdate,trunc (months_between(sysdate,mdate),1) from member;
--소수점 첫째짜리 반올림

--add_months( 날짜에 달을 더해줌.)

select sysdate,mdate,add_months(mdate,12)-1 from member;

다음번 요일찾기
select sysdate, next_day(sysdate,'수요일')from dual;
마지막 날 찾기
select sysdate, last_day (sysdate) from dual;
select mdate,last_day(mdate) from member;

select hire_date, last_day(hire_date) from employees;

--To char : 날짜형 혹은 숫자형을 문자형으로 변환
--날짜를 문자타입으로 변경
select sysdate, to_char(sysdate,'yyyy') from dual;
select sysdate, to_number(to_char(sysdate, 'mm')) from dual;

member 테이블에서 5월 회원가입한 회원을 출력하시오.

select mdate from member 
where to_char(mdate, 'mm') in ('05','06','07') order by mdate asc;

employees 테이블 hire_date, 5,6,7 입사한 사원을 출력하시오.(mm으로 별칭생성해서 하는경우)

select hire_date, to_char(hire_date, 'mm') mm from employees
where to_char(hire_date, 'mm') in ('05','06','07') order by mm;

-- 한개만 하는 경우
select hire_date from employees
where to_char(hire_date, 'mm')='05' order by hire_date asc;


mm - 숫자열, mon 영문, 한글명
select sysdate,to_char(sysdate,'mon') from dual;
select mdate, to_char(mdate, 'mon') from member;
-day
select mdate,to_char(mdate,'day') from member;

일요일에 가입한 사람을 출력하시오

select mdate,to_char(mdate,'day') from member
where to_char(mdate,'day')='일요일' order by mdate;

--am: 오전, pm:오후  hh: 02
select bdate, to_char(bdate,'yyyy-mm-dd hh:mi:ss') from board ;

--------------------------------------------------------------------------------
--<숫자타입을 문자타입으로 변경>
L 국가 통화표시, $ 달러 표시 , 9: 빈공간 표시, 0:빈공간 0으로 표시 ,: 천단위 표시 .: 소수점 표시
select 123000000, to_char(123000000) from dual; -- 앞에는 숫자 뒤에는 문자열타입

select 123000000, to_char(123000000,'999,999,999') from dual; -- 앞에는 숫자 뒤에는 문자열타입
select 123000000, to_char(123000000,'999,999,999,999') from dual; -- 넘은 공간은 빈공간으로 나타남

select 123000000, to_char(123000000,'$000,999,999,999.99') from dual; --0은 빈공간을 0으로 채워줌  


salary 달러 표시, 1438원 곱해서 원화표시와 천단위 표시 소수점 2자리 넣어 출력하시오.

select salary , to_char(salary,'$999,999'),to_char(salary*1438,'L999,999,999') from employees;
-------------------------------------------------------------------------------
--To_date 함수는 문자열을 날짜형으로 변환함. to_date('문자','format')
날짜형 타입 변환
select 20221231,to_date(20221231,'yyyy-mm-dd') from dual;
select '20221231'-1,to_date('20221231','yyyy-mm-dd') from dual;
select '20221231'-1,add_months(to_date('20221231','yyyy-mm-dd'),3) from dual;


'09/01/01'  날짜타입으로 변경해서, 현재 날짜 기준으로 몇개월이 지났는지 출력하시오.
select sysdate,'09/01/01',months_between(sysdate,'09/01/01')||'개월'from dual  ; -- 형태를 굳이 안바꿔두됨. 

--숫자형 변환 to_number()
select '20,000'-1 from dual; -- 에러남 쉼표가 문자열이기 때문에
select to_number('20,000','999,999')-1 from dual; 



--replace(): 특정문자를 대체하지만 숫자를 대체하는 경우에는 to_number를 쓰는게 정석이다
select '***,111',replace('***,111','*','0') from dual; --***,111	000,111 *을 0으로 바꿔서 출력
select '20,000', replace('20,000',',','') from dual;
select '20,000', replace('20,000',',','')-1 from dual;

select '      aaa111 111 111    ' from dual;
select trim('      aaa111 111 111    ') from dual; -- 바깥쪽 빈공백만 제거 trim을 사용할경우에는 숫자임에도 불구하고 사칙연산이 안됨.
select replace('      aaa111 111 111    ',' ','') from dual;

to_date(): 날짜변환: 문자, 숫자를 날짜로 변경해서 날짜형태를 +,- 날짜함수를 사용해서 계산
to_char(): 문자변환: 숫자를 문자로 변경해서 천단위, 0표시, 통화표시
to_number(): 숫자변환: 천단위 표시된 문자를 숫자변환해서 사칙연산을 할수 있는 장점

commission_pct 커미션 부분 월급 * 커미션을 더해서 계산
select salary,commission_pct,salary+salary*commission_pct "실제월급" from employees;
select salary,commission_pct,salary+salary*nvl(commission_pct,0) "실제월급" from employees;
--첫문장에 월급 명세서에 null이 찍혀서 월급이 계산되지 않으므로, 두번째 문장에서 nvl을 통해 null을 없애고 0을 집어넣는다.

select manager_id from employees;
- 37 null
- CEO null ceo
먼저 null에 0 넣기

select manager_id, nvl(manager_id,0) from employees;

select manager_id,nvl(manager_id,0), nvl(to_char(manager_id),'CEO') from employees;

desc employees;

그룹함수
그룹함수는 단일함수와 함께 쓸수 없음
max,min,sum,avg,count,median
select max(salary) from employees;
select min(salary) from employees;
select sum(salary) from employees;
select avg(salary) from employees;
select count(salary) from employees;
select median(salary) from employees;

-- 이중쿼리를 사용해서 월급평균 이상 받는 샐러리 조회 인원수가 증가함에 따라 저절로 바뀜.
select count(*) from employees
where salary >=(select avg(salary) from employees);

그룹함수는 단일컬럼과 함께 쓸수 없음
select min(salary) from employees;
select * from employees where salary=2100;

select * from employees
where salary = (select min(salary) from employees);

select max(salary),min(salary),avg(salary),count(salary),sum(salary) from employees;
select * from employees;

부서번호가 50번인 사원들의 합계를 출력하시오
select sum(salary),count(salary),avg(salary) from employees
where department_id = 50;


그룹함수 경우
select count(*) from employees; -- 107명
select count(manager_id) from employees; -- 106명
--null이 있으면 카운팅이 안됨 조심
select manager_id from employees where manager_id is null;
select count(*) from employees where manager_id is null;
--한명나옴

--문자열 함수

initcap, lower,upper
select emp_name from employees;
select emp_name,upper(emp_name),lower(emp_name) from employees;
select name from member;

--LPAD RPAD : 빈공간을 ''으로 채워줌
lpad : 자리수 만큼 특정문자로 대체
select kor,lpad(kor,10,' ') from stuscore;

trim, ltrim,rtrim 빈공백 제거
select '     aaa      aaa   ',ltrim('     aaa      aaa   '),rtrim('     aaa      aaa   '),trim('     aaa      aaa   ') from dual;

substr() 해당하는 만큼 문자열을 분리해서 가져옴.
select name from stuscore;
select substr(name,2,2) from stuscore;
select substr(name,0,2) from stuscore;

translate : 문자열 치환-> 그냥 replace 사용
select '111222333aaa',replace('111222333aaa','a','0') from dual;

length: 문자열 길이
select kor from stuscore;
select length(kor) from stuscore;
select length(name) from stuscore;

이름 가져오는 마지막 글자만 제외 후 출력하시오
select name, substr(name,0,length(name)-1) from stuscore; 

create table test(
ch1 char(30),
ch2 varchar2(30)
);
insert into test values(
'1234','1234'
);
insert into test values(
'12345','12345'
);
rollback;
commit;

select  * from test;
select length(ch1), length(ch2) from test;

--날짜함수
날짜의 달의 첫일과 마지막 일을 출력하시오. 첫일, mdate, 마지막일을 출력하시오.
select 
select mdate from member;
select trunc( mdate, 'month') from member; --첫일
select mdate, last_day(mdate) from member;

select mdate, to_char(mdate,'mm') from member where to_char(mdate,'mm')='07'; -- 07월만 뽑아줌

select * from member;
홍길동 가입일:2024년 07월 14일 화요일
--구성 자체가 to_char(mdate, '여기안에 모든 데이터를 작성함. ' 
select name,to_char(mdate, '"가입일: "yyyy"년"mm"월" dd"일" day' ) from member;










