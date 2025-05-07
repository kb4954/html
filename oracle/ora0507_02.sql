select employee_id, emp_name,manager_id,job_id from employees;

--equi-join: 서로 다른 2개 테이블에서 같은 컬럼을 가지고 검색
--non equi join: 


--같은 테이블 2개를 가지고 조인 : 셀프조인
--outer join : null 값이 있을때, null값도 포함해서 검색
select a.employee_id a.emp_name,a.manager_id,b.emp_name 
from employees a employees b
where a.manager_id = b.employee_id;


--셀프조인 -106명, null 검색이 안됨 
select sum(a.salary),a.manager_id,b.emp_name 
from employees a, employees b
where a.manager_id = b.employee_id(+)
group by a.manager_id, b.emp_name
;

manager_id null
select * from employees where manager_id is null;


--ansi cross join
select * from employees cross join departments;
--기본 sql 구문 둘이 동일함 근데 cross join이 아우터조인에서 이점이 있음
select * from employees,departments;

--기본 sql 구문 equi-join
select a.department_id, department_name 
from employees a, departments b
where a.department_id = b.department_id;

--ansi 조인 equi-join
select * from employees a inner join departments b
on a.department_id = b.department_id;

--기본 sql 구문에서는 full-join을 사용할 수 없음
--: outer-join
select a.manager_id,b.emp_name 
from employees a, employees b
where a.manager_id =b.employee_id(+)
;


--ansi 조인구문: outer - join
select a.manager_id, b.emp_name from employees a
left outer join employees b
on a.manager_id = b.employee_id
;


select department_id,department_name 
from employees join departments
using(department_id)
;
-- 위의 형태에 inner를 추가해도 되고 안해도 됨.
select department_id,department_name 
from employees inner join departments
using(department_id)
;


--------------------------------------------------------------------------------

-- UNION: 각 쿼리의 결과 합을 반환하는 합집합(중복제거): 2개의 테이블을 출력할 때 사용

select * from departments;
select department_id, manager_id
from departments
where manager_id is not null
union
select department_id, manager_id
from employees
where department_id>80;

--employees 테이블에서 부서번호가 50검색->department_id, department_name
--employees 테이블에서 없는 departments의 부서검색 12개를 union 하시오 ->department_id, department_name

department_id,department_name
select * from employees;

select distinct a.department_id, department_name
from employees a,departments b 
where a.department_id = b.department_id and a.department_id>50
union
select department_id, department_name
from departments a
where not exists( -- 검색되지 않는것 : exists
select * from employees b where a.department_id = b.department_id)
;


select * from member;
select * from employees;


create or replace view emp
as select employee_id,emp_name, email,phone_number from employees;

select * from emp; -- 가상의 테이블 생성

update employees set phone_number ='650.507.9834' where employee_id =198;
--not null이라고 설정된 부분들은 수정이 안됨. 업데이트가 안됨.
--drop view emp;


select * from stuscore;
select * from member;

select a.department_id, department_name 
from employees a, departments b
where a.department_id = b.department_id;

select id,phone,a.name, kor,eng,math,a.total,avg,a.rank 
from stuscore a, member b
where a.name = b.name;







