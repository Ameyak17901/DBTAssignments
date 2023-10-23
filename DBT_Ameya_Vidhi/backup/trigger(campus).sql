/*
drop trigger if exists insertStudent;
delimiter $
create trigger insertStudent after insert on insertStudent for each ROW
BEGIN
	insert into log1 (curr_date, curr_time, message)values(CURRENT_DATE(),CURRENT_TIME(),'Record inserted successfully ...');
end $
delimiter ;


drop trigger if exists insertDuplicate;
delimiter $
create trigger insertDuplicate after insert on student for each ROW
BEGIN
	insert into student_log values(new.id,new.namefirst,new.namelast,new.dob,new.emailid);
end $
delimiter ;


drop trigger if exists updateStudent;
delimiter $
create trigger updateStudent after update on student for each ROW
BEGIN
	insert into student_log values(new.id,new.namefirst,old.namelast,old.dob,old.emailid);
end $
delimiter ;



drop trigger if exists deleteStudent;
delimiter $
create trigger deleteStudent after delete on student for each ROW
BEGIN
	insert into student_log values(old.id+1,old.namefirst,old.namelast,old.dob,old.emailid);
end $
delimiter ;
*/

drop trigger if exists t1;
delimiter $
create trigger t1 before insert on student for each ROW
BEGIN
	if dayname(now()) = 'sunday' then
		signal sqlstate '42000' set message_text='today is sunday';
	end if;
end $
delimiter ;