
--1טריגר
CREATE or alter TRIGGER TR_insert_order_detail
ON [dbo].[order_detail]
FOR insert
AS
begin
declare @y int
set @y=(SELECT [order_id] FROM inserted) 
SELECT * FROM [dbo].[order_detail] o_d join [dbo].[food] f on o_d.food_id=f.food_id join [dbo].[courses] c on f.course_id=c.course_id where [order_id]=@y
if (not exists(SELECT * FROM [dbo].[order_detail] o_d join [dbo].[food] f on o_d.food_id=f.food_id where [order_id]=@y and [course_id]=1) 
	or not exists(SELECT * FROM [dbo].[order_detail] o_d join [dbo].[food] f on o_d.food_id=f.food_id where [order_id]=@y and [course_id]=2) 
		or not exists(SELECT * FROM [dbo].[order_detail] o_d join [dbo].[food] f on o_d.food_id=f.food_id where [order_id]=@y and [course_id]=3))
	begin
		declare @hey varchar(50)
		set @hey='?הי חסר לך מנה בתפריט,האם תרצה להוסיף משהו'
		select @hey
	end
end
--הרצה
exec PR_insert_order_detail 9,11,150

--טריגר 2 מעדכן תשלום לפי  מקדמה האם שולמה או לא
CREATE or alter TRIGGER TR_update_amount_Or_FoodId
 on [dbo].[order_detail]  
 for update 
 as
 begin
 if update([food_id]) or  update([amount])
	begin
	declare @d int
	set @d=(select top 1 [order_id] from inserted)
	declare @w bit declare @s bit
	set @w=(select p.advance_payment_paid from [dbo].[payment] p where order_id=@d)
	set @s=(select p.payment_amount_paid from [dbo].[payment] p where order_id=@d)
	if((@w=1 and @s is null) or (@w=1 and @s=0))
		begin
		update [dbo].[payment]
		set [Final_Payment]=[advance_payment_amount]*(-1)
		where [order_id]=@d
		update [dbo].[payment]
		set [advance_payment_paid]=0
		where [order_id]=@d
		end
	else if(@w=1 and @s=1)
		begin
		update [dbo].[payment]
		set [Final_Payment]=[Final_Payment]*-1
		where [order_id]=@d
		update [dbo].[payment]
		set [advance_payment_paid]=null
		where [order_id]=@d
		update [dbo].[payment]
		set [payment_amount_paid]=0
		where [order_id]=@d
		end
	else if((@w is null and @s is null) or (@w=0 and @s=0))
		begin
		update [dbo].[payment]
		set [Final_Payment]=[Final_Payment]*0
		where [order_id]=@d
		select p.Final_Payment from payment p
		end
	 exec PR_payments @d
	 end
end

	 exec PR_payments 9

--פרוצדורה להכנסת פרטי הזמנות או לשינויים
create or alter procedure PR_payments(@order_id int)
as
begin
if(not exists(select order_id from [dbo].[payment] where order_id=@order_id))
		begin
		declare @q int
		set @q=(select sum(sumOfObject) from sum_Of_Objcte where order_id=@order_id group by order_id)
		insert into  [dbo].[payment]([order_id], [Final_Payment], [payment_amount], [advance_payment_amount])
		VALUES(@order_id, @q,@q*0.9,@q*0.1)
		select *from payment
	end
	else
		begin 
		update [dbo].[payment]
		set Final_Payment=Final_Payment+(select sum(sumOfObject) from sum_Of_Objcte where order_id=@order_id group by order_id)
		where [order_id]=@order_id
		update [dbo].[payment]
		set advance_payment_amount=Final_Payment*0.1
		where [order_id]=@order_id
		update [dbo].[payment]
		set [payment_amount]=Final_Payment*0.9
		where [order_id]=@order_id
		
		select *from payment
		end
end

select * from payment
--דג--' להדגמת הטריגר והפרוצדורה
exec PR_payments 6

update [dbo].[order_detail]
set amount=100
where order_id=6

update [dbo].[payment]
set [advance_payment_paid]=1
where order_id=6

 
delete from [dbo].[payment]
where order_id=6

select *from [dbo].[order_detail]
select *from payment

select GETDATE()
SELECT DATEDIFF (DD,'2023-04-27',GETDATE())

--הרצה
exec PR_last_day__for_payment
--פרוצדורה שמחזירה לקוחות שלא שילמו חמש ימים לפני מועד ההזמנה מקדמה 
create or alter procedure PR_last_day__for_payment
as
begin
select p.advance_payment_amount,p.advance_payment_paid,o.order_id,o.order_to_date, convert(date, getdate()) as the_date_today,DATEDIFF (dd,GETDATE(),o.order_to_date)as how_many_days_left,c.* from payment p
left join orders o on o.order_id=p.order_id
left join clients c on c.client_id=o.client_id
where (p.advance_payment_paid=0 or p.advance_payment_paid is null ) 
and 5>=(SELECT DATEDIFF (dd,GETDATE(),o.order_to_date)) and 0<(SELECT DATEDIFF (dd,GETDATE(),o.order_to_date))
end

select DATEDIFF (dd,GETDATE(),'2023-05-01')

update[dbo].[orders]
set [order_to_date]='2023-05-03'
where [order_id]=3


--ראיית כל הההזמנות + התשלום לכל מנה
create or ALTER  VIEW sum_Of_Objcte AS
select o.order_id,o.order_detail_id,o.food_id,o.amount,f.food_name,f.price,o.amount*F.price as sumOfObject 
from order_detail o
left join [dbo].[food] f on f.food_id=o.food_id

select * from sum_Of_Objcte

go

CREATE or alter FUNCTION dbo.FN_checking_how_use_of_food (@food_type varchar(50))
RETURNS varchar(10)
AS
BEGIN

	DECLARE @ans int

	set @ans=(select  sum(o.amount)  from order_detail o left join food f on f.food_id=o.food_id where f.food_name=@food_type
	--group by o.amount
	)
	if(@ans is null)
	begin
	set @ans=0 end
	RETURN(@ans)
END


select dbo.FN_checking_how_use_of_food('בשר')


--הזמנות עתידיות
--create or ALTER  VIEW future_orders AS
select o.* from orders o
where o.order_to_date>getdate()
order by o.order_to_date asc


create or alter view see_city_where_no_orders as
select c.city_name from city c
except
select c.city_name from orders o 
left join city c  on c.city_id=o.city_id

select c.city_name from city c
except
select * from see_city_where_no_orders



select * from payment p
order by p.Final_Payment desc

