
drop TRIGGER if EXISTS tr1;
delimiter $
create TRIGGER tr1 BEFORE INSERT ON d2 for EACH ROW
BEGIN
	INSERT INTO d3 values(new.deptno, new.dname, new.loc, CURRENT_DATE(), CURRENT_TIME(),user());
end $
delimiter ;

/*
drop TRIGGER if EXISTS tr1;
delimiter $
create TRIGGER tr1 BEFORE INSERT ON d2 for EACH ROW
BEGIN
	declare z int;
	select max(deptno) + 1 into z from d2;
	set NEW.deptno := z;
end $
delimiter ;

drop TRIGGER if EXISTS tr2;
delimiter $
create TRIGGER tr2 BEFORE UPDATE ON d2 for EACH ROW
BEGIN
		update d2 set dname = new.dname where deptno=51; 
end $
delimiter ;
*/