-- 실행: ctrl+Enter , f9번 누르기

alter session set "_ORACLE_SCRIPT"=true; --userid ## 붙여야 하는 것을 생략가능

create user ora_user identified by 1111; -- ora_user, 1111 계정생성

-- 접속권한, 지원할당, db명령어 사용권한 할당
grant connect, resource, dba to ora_user; --여기까지가 권한 설정

create user ora_user2 identified by 1111;

grant connect, resource, dba to ora_user2;

