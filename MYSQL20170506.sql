show databases;
use  bd101;
select *
from dept;
show tables;

select empno,ename,job,hiredate
from emp;

select empno "emp#",ename "Employee",job "JOB",hiredate "Hire Date"
from emp;

select *
from emp;

select ename,sal
from emp
where sal>2850 ;

select ename ,empno
from emp
where empno=7566;

select ename,sal
from emp
where sal between 1500 and 2850;

select ename,job,hiredate
from emp
where hiredate between '1981-02-20' and '1981-05-01'
order by hiredate;

select ename,deptno
from emp
where deptno IN (10,30)
order by ename;

select ename 'Employee',sal 'Monthly Salary'
from emp
where sal>1500 and deptno IN (10,30);

select ename,job,hiredate
from emp
where hiredate like '1982%';

select ename,job
from emp 
where mgr is null;

select ename,sal,comm
from emp 
where comm is not null
order by sal desc,comm desc; 
 

select ename,job
from emp  
where ename like '__A%';

select ename,mgr,deptno
from emp
where (ename like '%l%l%' and deptno=30) or mgr=7782;

select ename,job,sal
from emp
where job IN ('Clerk', 'Analyst') and sal NOT IN (1000,2000,5000);

select ename,sal,comm
from emp
where sal*1.1<comm;

select empno,ename,
case
	when sal between 0 and 1000 then 'A'
    when sal between 1001 and 2000 then 'B'

    
End sal
from emp;    




select distinct job
from emp;

select concat(ename ," ,",job ) as "employee and title"
from emp;

select * from EMP
where hiredate>'1981-02-20' and hiredate<'1981-05-01';

select ename,job,hiredate 
from emp 
where hiredate>='1982-01-01' and hiredate<='1982-12-31';





select ename,sal,sal/100, round(sal/100,0),repeat('*',round(sal/100,0))
from emp;
/*2*/
select empno,ename, round(sal*1.15,0) as 'New Salar'
from emp;
/*3*/
select empno,ename, round(sal*1.15,0) as 'New Salar', round(sal*1.15,0)-sal as 'increase'
from emp;
/*7*/
select ename,sal , lpad(sal,15,'$') as  'SALARY'
from emp;


/*10*/
select concat(ename,'_SALARIE_is_ ',repeat('*',round(sal/100,0))) as 'EMPLOYEE_AND_THEIR_SALARIE'
from emp
order by sal desc;
/*6*/
select concat(ename,' ','earns',' ',sal,' ','monthly but wants',' ',3*sal,' ') as 'dream salary'
from emp;

select curdate()
from emp;

select concate(year(curdate()),month(curdate());
select curdate(),date_format();

/*1*/
select curdate() as '系統日期';

/*4*/
select empno,ename,hiredate,concat(date_format(hiredate,'%W'),' ',date_format(HIREDATE,'%D'),' ',' of',' ',MONTHNAME(hiredate)  )
from emp;

/*5*/
select ename,PERIOD_DIFF(date_format(curdate(),'%Y%m'),date_format(hiredate,'%Y%m')) as 'MONTHS_WORKED'
/*PERIOD_DIFF(date_fromat(hiredate,'%Y%m'),date_fromat(curdate(),'%Y%m'))    format 拼錯*/
from emp;

/*8*/
select ename,date_format((hiredate),'%W')
from emp
order by weekday(hiredate) asc;



/*9*/
select ename,comm,ifnull(comm,'no commission')
from emp;


/*5-1*/
select max(sal) as 'Maximum' ,min(sal) as 'Minimum',sum(sal) as 'Sum',avg(sal) as 'Average'
from emp;

/*5-4*/

select count(job) as 'Number of Managers'
from emp
where job='manager';

/*5-5*/
select max(sal)-min(sal) as 'DIFFERENC'
from emp;

/*5-2*/

select job, max(sal) as 'Maximum' ,min(sal) as 'Minimum',sum(sal) as 'Sum',avg(sal) as 'Average'
from emp
group by job;
/*5-3*/

select job,count(job)
from emp
group by job;

/*5-7*/
select date_format(hiredate,'%Y'),count(date_format(hiredate,'%Y')) as 'hire date by year '
from emp
group by date_format(hiredate,'%Y');


/*5-6*/
select mgr,empno,min(sal)
from emp
where  mgr is not null
group by MGR
having min(sal)>1000
order by  min(sal) desc;

select mgr,empno,min(sal)
from emp
where  mgr is not null
group by MGR
order by  min(sal) desc;


select *
from emp
order by mgr desc;

/*day3 多表查詢*/

use bd101;

show tables;

/*找出員工的薪資等級*/
select ename,salgrade.grade
from emp,salgrade
where emp.sal>=salgrade.losal AND emp.sal<=salgrade.hisal;

select *
from emp,salgrade;

select *
from salgrade;

select *
from dept;

select *
from emp;
/*找出員工的部門主管是誰*/

select worker.empno as 'worker empno',manager.ename as 'manager name'
from emp worker,emp manager 
where worker.mgr=manager.empno;

/*1.1.顯示所有員工之姓名,所屬部門編號,部門名稱及部門所在地點。*/

select ENAME,emp.deptno,DNAME,LOC
from emp ,dept
where emp.deptno=dept.deptno;

select ENAME,emp.deptno,DNAME,LOC
from emp natural join dept
where emp.deptno=dept.deptno;


/*2.顯示所有有賺取佣金的員工之姓名,佣金金額,部門名稱及部門所在地點。*/
select ENAME,COMM,DNAME,LOC
from emp ,dept
where emp.deptno=dept.deptno and comm is not null ;

select e.ename,e.COMM,d.DNAME,d.LOC
from dept d natural join emp e
where COMM is not null and e.deptno=d.deptno;


/*3.顯示姓名中包含有”A”的員工之姓名及部門名稱。*/
select ENAME,DNAME
from emp ,dept
where emp.deptno=dept.deptno and ename like '%A%';


select e.ename,d.dname
from dept d join emp e on(e.ename LIKE '%A%');

/*4.顯示所有在”DALLAS”工作的員工之姓名,職稱,部門編號及部門名稱。*/

select ENAME,job,emp.deptno,DNAME,loc
from emp ,dept
where emp.deptno=dept.deptno and loc='DALLAS';

select d.loc,e.ENAME,e.JOB,e.deptno,d.dname
from dept d join emp e on(d.LOC='DALLAS');


/*5.顯示出表頭名為:Employee, Emp#, Manager, Mgr#，分別表示所有員工之姓
名,員工編號,主管姓字, 主管的員工編號。*/

select  worker.ename as 'Employee', worker.empno as 'Emp#',manager.ename as 'manager name',manager.empno as 'MGR#'
from emp worker,emp manager 
where worker.mgr=manager.empno;


select w.ENAME 'Employee',w.empno 'EMP#',e.ENAME 'Manager',e.empno 'Mgr#'
from emp w join emp e on(w.MGR = e.empno);

/*6.顯示出SALGRADE資料表的結構，並建立一查詢顯示所有員工之姓名,職稱,部門名稱,薪資及薪資等級。*/

desc salgrade;

select *
from salgrade;

select ename,job,Dname,emp.sal,salgrade.grade
from emp,salgrade,dept
where emp.deptno=dept.deptno  and  emp.sal>=salgrade.losal AND emp.sal<=salgrade.hisal;

select emp.ename,emp.job,dept.dname,emp.sal,salgrade.GRADE
from emp join salgrade on(emp.sal BETWEEN salgrade.losal and salgrade.HISAL)
         join dept on(emp.deptno=dept.deptno);

/*7.顯示出表頭名為: Employee, EmpHiredate, Manager, Mgr Hiredate的資料項，來顯示所有比他的主管還要早進公司的員工之姓名,進公司日期和主管之
姓名及進公司日期。*/

select  worker.ename as 'Employee', worker.HIREDATE as 'EmpHiredate#',manager.ename as 'manager name',
manager.empno as 'MGR#',manager.empno as 'MGR#', manager.hiredate as  'Mgr Hiredate'
from emp worker,emp manager 
where worker.mgr=manager.empno;

select w.ENAME 'Employee',w.HIREDATE 'Emp Hiredate',e.ENAME 'Manager',e.HIREDATE 'Mgr Hiredate'
from emp w join emp e on(w.MGR = e.empno and w.hiredate < e.hiredate);

/*8.顯示出表頭名為: dname, loc, Number of People, Salary的資料來顯示所
有部門之部門名稱,部門所在地點,部門員工數量及部門員工的平均薪資，平
均薪資四捨五入取到小數第二位。*/

/*89*/
select dept.Dname ,dept.loc ,count(*),round(avg(sal),2)
from emp ,dept
where emp.deptno=dept.deptno
group by emp.DEPTNO;

/*92*/

select dname,loc,count(empno) 'Number of people',sum(sal),round(avg(sal),2) 'Salary'
from dept left outer join emp on(dept.deptno=emp.deptno)
group by dname,loc;



/*選擇與SCOTT 相同部門的員工*/

select *
from emp
where deptno=(select deptno from emp where ename='scott');

/*1.顯示和Blake同部門的所有員工之姓名和進公司日期。*/
select ename,HIREDATE
from emp
where deptno=(select deptno from emp where ename='blake');
/*2.顯示所有在Blake之後進公司的員工之姓名及進公司日期。*/
select ename,HIREDATE
from emp
where hiredate >=(select hiredate from emp where ename='blake');
/*3.顯示薪資比公司平均薪資高的所有員工之員工編號,姓名和薪資，並依薪資由高到
低排列。*/
select EMPNO,ename,sal
from emp
where sal > (select avg(sal) from emp);

select avg(sal) from emp;
/*4.顯示和姓名中包含T的人在相同部門工作的所有員工之員工編號和姓名。  (in)*/
select deptno,ename
from emp
where deptno in (select deptno from emp where ename like '%T%');

select deptno from emp where ename like '%T%';
/*5.顯示在Dallas工作的所有員工之姓名, 部門編號和職稱。*/
select *
from emp,dept;

select ename,DEPTNO,job
from emp
where DEPTNO in (select DEPTNO from dept where loc='dallas');

select DEPTNO from dept where loc='dallas';
/*6.顯示直屬於”King”的員工之姓名和薪資。*/
select *
from emp;

select ename ,sal
from emp 
where MGR=(select empno from emp where ename='king');

select empno from emp where ename='king';

/*7.顯示銷售部門”Sales” 所有員工之部門編號,姓名和職稱。*/
select ename,DEPTNO,job
from emp
where deptno = (select deptno from dept where dname='sales');

select deptno from dept where dname='sales';

select *
from dept;

select *
from emp;
/*8.顯示薪資比公司平均薪資還要高且和名字中有T的人在相同部門上班的所有員工
之員工編號,姓名和薪資。*/
select EMPNO,ename,sal
from emp 
where sal > (select avg(sal) from emp) and  deptno in (select deptno from emp where ename like '%T%');

select EMPNO,ename,sal
from emp
where sal > (select avg(sal) from emp);

select deptno,ename
from emp
where deptno in (select deptno from emp where ename like '%T%');

/*9.顯示和有賺取佣金的員工之部門編號和薪資都相同的員工之姓名,部門編號和薪資。*/

select DEPTNO,SAL
from emp 
where (DEPTNO,sal) in (select deptno,sal from emp where comm is not null ); 
/*10.顯示和在Dalls工作的員工之薪資和佣金都相同的員工之姓名,部門編號和薪資。*/
select ename,deptno,sal
from emp
where (sal,ifnull(comm,'a')) in (select sal,ifnull(comm,'a') from emp where deptno = (select deptno from dept where loc='dallas') ); 

select sal,comm from emp where deptno=(select deptno from dept where loc='dallas') ;

/*11.顯示薪資和佣金都和Scott相同的所有員工之姓名,進公司日期和薪資。(不要在
結果中顯示Scott的資料)*/
select ename,hiredate,sal
from emp
where  sal in (select sal from emp where ename = 'Scott') and ifnull(comm,'a') in (select ifnull(comm,'a') from emp where ename = 'Scott') and ename !='scott';



/*12.顯示薪資比所有職稱是”Clerks”還高的員工之姓名,進公司日期和薪資，並將
結果依薪資由高至低顯示。*/

select hiredate,sal
from emp
where sal > all(select sal from emp where job='clerk');

select sal from emp where job='clerk';

select *
from emp;



/*1.*/
use bd101;
show databases;
show tables;

select * from my_emp1;

create table my_emp1
 as (select * from my_emp);
 
 create table emp1
 as (select * from emp);


insert into my_emp1()
value('1','Patel','Ralph','rpatel','795');

insert into my_emp1(id,LAST_NAME,FIRST_NAME,USERID,salary)
value('2','Dancs','Betty','bdancs','860');

insert into my_emp1(id,LAST_NAME,FIRST_NAME,USERID,salary)
value('4','Biri','Ben','bbiri','1100'),('5','Newman','Chad','cnewman','750');
 
 
 select @@sql_safe_updates;
 set sql_safe_updates=0;
 
 update my_emp1
 set last_name ='Drexler'
 where id=1;
 
 update my_emp1
 set last_name ='Drexler'
 where id=1;
 
 /*5*/
 update my_emp1
 set SALARY =1000
 where salary<900;
 
  /*6*/
 select * from my_emp1;

 
 
   /*7*/
delete from my_emp1
where FIRST_NAME='Betty';
 
 
 /*8*/
 select @@autocommit;
 set autocommit=0;
 update my_emp1
 set SALARY=SALARY*1.1;
 savepoint a;
 delete from my_emp1;
  rollback;
 select * from my_emp1;

 commit;
 
 
  
 /*1*/
 	drop table department;
 
 create table department(
 id  numeric(7) not null,
 name varchar(24) not null
 );
 desc department;
/*2*/
select * from dept;

insert into department (id,name)
 select deptno,dname
 from dept;
 
 select * from department;
/*3*/
show tables;
 drop table employee;

 create table employee(
 id  numeric(7),
 last_name varchar(24),
 first_name varchar(24),
 dept_id  numeric(7)
 );
 
	alter table employee
    modify column  id numeric(7) not null;
    alter table employee 
	modify column  last_name varchar(24) not null;
 
 desc employee;
 select * from employee;
/*4*/
    alter table employee
    modify column  last_name varchar(40);
    desc employee;
/*5*/

create table employee2
 as (select empno as id,ENAME as last_name ,DEPTNO as dept_id 
	from emp);
    
    select * from employee2;
	
/*6*/
show tables;
	drop table employee;
/*7*/
	rename table employee2 to employee;
/*8*/
	desc employee;
    alter table employee drop dept_id;
/*9*/
	alter table employee add salary numeric(7);
    select * from employee;
  /*test*/  
create table department3(
 id  numeric(7) default '1234567',
 name varchar(24) not null
 );  
 
 desc department3;
 insert into department3 (name)
value('adam');

select * from department3;


create table phonebook(
	stdid int,
    stdname varchar(12)
);
select * from phonebook;

alter table phonebook
 drop primary key,
 add primary key(stdname);
 
 desc phonebook;
 
 select * 
 from information_schema.tables
 where table_schema='bd101';
 

 
 
 
 
 
 use bd101;
 /*10*/
 
alter table employee
  add primary key(id);
  
 alter table employee 
 CHANGE COLUMN 'id' 'id1' decimal(7,0) ;
  
  
  desc employee;
  
  
  