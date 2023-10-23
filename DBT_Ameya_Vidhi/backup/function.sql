/*
drop function if exists sumSalary;
delimiter $
create function sumSalary(_deptno int) returns int deterministic
BEGIN
	declare s int;
	declare flag bool;
	select true into flag from emp where deptno = _deptno limit 1; 
	if flag then
		select sum(sal) into s from emp where deptno = _deptno;
		return (s);
	else 
		return (0);
	end if;	
	

end $
delimiter ;


drop function if exists autoNumber;
delimiter $
create function autoNumber() returns int deterministic
BEGIN
	declare autonum int;
	select (max(studentid)+1) into autonum from student_new;  
	return autonum;

end $
delimiter ;



drop function if exists f1;
delimiter $
create function f1(_emailid varchar(30)) returns varchar(20) deterministic
BEGIN
	declare flag bool;
	declare _username, _password varchar(30); 
	select true into flag from login where emailid = _emailid;
	select username,password into _username, _password from login where emailid = _emailid; 
	if flag then
		return (concat(_username," ",_password));
	else 
		return 'Employee not exists';
	end if;

end $
delimiter ;


drop function if exists f1;
delimiter $
create function f1(_studentid int) returns int deterministic
BEGIN
	declare flag bool;
	declare _marks int; 
		select distinct true into flag from student_qualifications where studentid = _studentid;
		if flag then
		select sum(marks) into _marks from student_qualifications where name in (10,12,'be') and studentid = _studentid;
		return (_marks);
		else
			return 0;
		end if;
end $
delimiter ;



drop function if exists f1;
delimiter $
create function f1() returns int deterministic
BEGIN
	declare otp int; 
	set otp := round(rand()*1000000 + 100000);
	return otp;	
end $
delimiter ;
*/