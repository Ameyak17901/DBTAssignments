/*
drop procedure if exists adduser;
delimiter $
create procedure adduser(username varchar(20),password varchar(20),emailid varchar(40))
BEGIN
	insert into login values(username, password, emailid);
end $
delimiter ;


drop procedure if exists checkuser;
delimiter $
create procedure checkuser(_emailid varchar(40))
BEGIN
	declare flag bool;
	select true into flag from login where emailid = _emailid;
	if flag THEN
		select username, password from login where emailid = _emailid;
	ELSE
		insert into log1 (curr_date,curr_time,message) values(CURRENT_DATE(),CURRENT_TIME(),'emailid not found!');
	end if ;	
end $
delimiter ;


drop procedure if exists getQualifications;
delimiter $
create procedure getQualifications(_Studentid int)
BEGIN
	declare flag bool;
	select true into flag from student where id = _Studentid;
	
	if flag THEN
		select * from student s join student_qualifications sq on s.id = sq.studentid;
	ELSE
		select "Student not found ...";
	end if ;
	
end $
delimiter ;	



drop procedure if exists addStudent;
delimiter $
create procedure addStudent(_id int, _namefirst varchar(30), _namelast varchar(30), _dob date, _emailid varchar(30), _number varchar(30), _address varchar(50))
BEGIN
	declare flag bool;
	select true into flag from student s where s.id = _id;
	
	if flag THEN
		select "Student already present ...";
	ELSE
		insert into student (id,namefirst, namelast, dob, emailid) values(_id, _namefirst, _namelast, _dob, _emailid);
		insert into student_phone (id,studentid, number) values(100,_id, _number);
		insert into student_address (id,studentid, address) values(100,_id, _address);	
	end if ;
end $
delimiter ;	


drop procedure if exists addQualification;
delimiter $
create procedure addQualification(_studentid int, _name varchar(20), _college varchar(20), _university varchar(20), _marks int, _year varchar(20), out message varchar(20))
BEGIN
	declare a BOOLEAN;
	declare _id int;
	select true into a from student where id = _studentid;
	
	IF a THEN
		select max(id)+1 into _id from student_qualifications;
		insert into student_qualifications values(_id, _studentid, _name, _college, _university, _marks, _year);	
		set message := "Record inserted ";
	else 
		set message := "Student not found ";	
	END IF ;	
END $
delimiter ;


drop procedure if exists pro1;
delimiter $
create procedure pro1(str varchar(20))
begin 
	declare ind int;
	set ind := 0;
	
	l1:loop
		if ind+1 > length(str) then
			leave l1;
		end if ;	
	
		select substring(str,1+ind,1) characters;
		set ind := ind + 1;
	end loop l1;
end $
delimiter ;


drop procedure if exists pro1;
delimiter $
create procedure pro1(str varchar(20))
begin 
	declare ind int;
	declare str1 varchar(20);
	set ind := 1;
	set str1 := substring(str,1,1);
	
	l1:loop
		if ind+1 > length(str) then
			leave l1;
		end if ;	
	
		set str1 := concat(str1,',',substring(str,1+ind,1));
		set ind := ind + 1;
	end loop l1;
	select str1;
end $
delimiter ;


drop procedure if exists pro1;
delimiter $
create procedure pro1(s varchar(20), out s1 varchar(20),out s2 varchar(20) )
begin 
	declare ind int;
	declare str1 varchar(20);
	declare str2 varchar(20);
	set str1 := '';
	set str2 := '';
	set ind := 1;
	set str1 := substring(str,1,1);
	l1:loop
		if ind > length(s) then
			leave l1;
		end if ;	
		
		if substring(s,ind,1) not in ('1','2','3','4','5','6','7','8','9','0') then
			set str1 := concat(str1,substring(s,ind,1));
		else 
			set str2 := concat(str2,substring(s,ind,1));
		end if ;
		set ind := ind + 1;
	end loop l1;
	set s1 := str1;
	set s2 := str2;
end $
delimiter ;




drop procedure if exists pro1;
delimiter $
create procedure pro1()
begin 
	select concat(substring(ename,1,1),'(',substring(ename,2,length(ename)),')',' is ', job) R1 from emp;
end $
delimiter ; 


drop procedure if exists pro1;
delimiter $
create procedure pro1(str1 varchar(50), out s1 varchar(20), out s2 varchar(20))
begin 
	declare ind int;
	set s1 := '';
	set s2 := '';
	set ind := 1;
	lp1:loop
		if ind > length(str1) then
			leave lp1;
		end if ;	
		
		if ascii(substring(str1,ind,1)) >= ascii('a') and ascii(substring(str1,ind,1)) <= ascii('z') then
			set s1 := concat(s1,substring(str1,ind,1));
		else 
			set s2 := concat(s2,substring(str1,ind,1));
		end if ;  
		set ind := ind + 1;
	end loop lp1;
end $
delimiter ; 



drop procedure if exists pro1;
delimiter $
create procedure pro1(str1 varchar(20),out countV int,out countS int,out countI int)
begin 
	declare ind,temp int;
	set ind := 1;	
	set countV := 0;
	set countI := 0;
	set countS := 0;
	lb1:loop
		if ind > length(str1) then
			leave lb1;
		end if ;
		
		if substring(str1,ind,1) in ('a','e','i','o','u') then
			set countV := countV + 1;
		end if;
		IF ascii(substring(str1,ind,1)) between ascii('0') and ascii('9') then	
			set countI := countI + 1;
		end if;
		if ascii(substring(str1,ind,1)) = ascii(' ') then
			set countS := countS + 1;	
		end if;

		
		set ind := ind + 1;
	end loop lb1;
	
end $
delimiter ;

drop procedure if exists pro1;
delimiter $
create procedure pro1(str1 varchar(20),out countV int,out countS int,out countI int)
begin 
	declare ind int;
	declare ch char;
	set ind := 1;	
	set countV := 0;
	set countI := 0;
	set countS := 0;
	lb1:loop
		if ind > length(str1) then
			leave lb1;
		end if ;
		
		set ch := subtring(str1,ind,1);
		if ch in ('a','e','i','o','u') then
			set countV := countV + 1;
		elseIF ascii(ch) between ascii('0') and ascii('9') then	
			set countI := countI + 1;
		elseIF ascii(ch) = ascii(' ') then
			set countS := countS + 1;	
		end if;

		
		set ind := ind + 1;
	end loop lb1;
	
end $
delimiter ;



drop procedure if exists pro1;
delimiter $
create procedure pro1()
begin 
	declare i int;
	declare msg varchar(20);
	set i := 1;	
	create table tab (id int, message varchar(20));
	lb1:loop
		if i > 10 then
			leave lb1;
		end if ;
		
		if i mod 2 then 
			insert into tab values(i,'i is odd');
		else
			insert into tab values(i,'i is even');
		end if ;
		set i := i + 1;
	end loop lb1;
	
	select id,message from tab;
	
	drop table tab;
end $
delimiter ;



drop procedure if exists pro1;
delimiter $
create procedure pro1()
begin 
	declare _ename, _job varchar(20);
	declare _sal, _comm, _deptno int;
	declare c1 cursor for select distinct ename, job, sal, comm, deptno from emp order by sal desc limit 5;
	declare exit handler for 1329 select "EOF";
	open c1;
		lb1:loop 
			fetch c1 into _ename, _job, _sal, _comm, _deptno;
			select _ename as name, _job occupation, _sal salary, ifnull(_comm ,0) commission, _deptno 'department No';
		end loop lb1;	
	close c1;	
	
end $
delimiter ;

drop procedure if exists pro1;
delimiter $
create procedure pro1()
begin 
	
	declare _ENAME,_GENDER,_job, _USER_NAME,_PWD,_PHONE varchar(20);
	declare _EMPNO,_SAL,_COMM,_DEPTNO,_BONUSID, _MGR,_isActive int;
	declare _HIREDATE date;
	declare c1 cursor for select * from emp where deptno in (10,20,30);
	declare exit handler for 1329 select "EOF";
	open c1;
		lb1:loop
			fetch c1 into  _EMPNO,_ENAME,_GENDER,_job, _MGR,_HIREDATE,_SAL,_COMM,_DEPTNO,_BONUSID,_USER_NAME,_PWD,_PHONE,_isActive;
		if _DEPTNO = 10 then 
			insert into emp10 (empno,ename, job, mgr, hiredate, sal, comm, deptno,bonus, username, pwd, phone,isActive) values(_EMPNO,_ENAME,_GENDER,_job, _MGR,_HIREDATE,_SAL,_COMM,_DEPTNO,_BONUSID,_USER_NAME,_PWD,_PHONE,_isActive);
		end if;	
		end loop lb1;	
	close c1;	
	delete from emp10;
end $
delimiter ;

*/

/*drop procedure if exists pro1;
delimiter $
create procedure pro1(_cnum int)
begin
	declare _onum, _amt, _snum int;
	declare _odate datetime;
	declare _type varchar(40);
	declare c1 cursor for select * from orders where cnum = _cnum;
	open c1;
		fetch c1 into _onum, _amt,_odate,_cnum,_snum,_type;
		select  _onum, _amt,_odate,_cnum,_snum,_type;
		
	close c1;


end $
delimiter ;*/

drop procedure if exists pro1;
delimiter $
create procedure pro1(_num int)
begin
    declare _string,_word,_temp varchar(40);
	declare _number,ind, _digit int;
	declare flag bool;
	declare c1 cursor for select * from num ;
	declare exit handler for 1329 select 'EOF';
	set _string := '';
	open c1;
	    
		lb1:LOOP
				fetch c1 into _number, _word;
				select reverse(_num);
				
		end loop lb1;
    close c1;
	
end $
delimiter ;
 