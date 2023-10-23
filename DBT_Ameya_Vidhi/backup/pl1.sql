drop procedure if exists pro1;
delimiter $
create procedure pro1()
begin
	declare x int;
	set x := 0;
        
	lb1: loop
		
		if x > 10 then	
			leave lb1;
		end if;
		select x;
		set x := x + 1;		
	end loop lb1; 
end $
delimiter ;


