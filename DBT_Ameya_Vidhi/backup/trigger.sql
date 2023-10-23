drop trigger if exists t1;
delimiter $
create trigger t1 before insert on R for each ROW
begin
	if new.age < 18 THEN
		signal sqlstate '42000' set message_text='Person not eligible for voting';
	end if;

 
end $
delimiter ; 