 drop procedure if exists pro1;
 delimiter $
 create procedure pro1(in x int)
 BEGIN
	insert into d values(1,1,1);
	select * from d limit x;
 end $	
 delimiter ;