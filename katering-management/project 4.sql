create or alter procedure PR_check_for_specific_food_detailss(@food int)
as
begin
Select order_nums.food_in_order,f.food_name ,count(*) as 'כמות הזמנות שהזמינו מנה זו', avg(num_dishes)as 'ממוצע כמות המנות של האנשים שהזמינו'
       , avg(avg_amount) as 'ממוצע כמות האנשים שהזמינו  מנה זו'
from
	(
	------
	Select order_ids.food_id as food_in_order, order_ids.order_id,count(*) as num_dishes, avg(oda.amount) as avg_amount 
	from
		(Select od.food_id,o.order_id  
		from orders  o join order_detail  od on o.order_id = od.order_id
		where od.food_id =@food) order_ids 
		 join order_detail oda on order_ids.order_id = oda.order_id
		 group by order_ids.food_id, order_ids.order_id
	----
	)  order_nums
left join food f on f.food_id=order_nums.food_in_order
group by order_nums.food_in_order,f.food_name

end

exec PR_check_for_specific_food_detailss 2

select*from food



DECLARE @Counter INT , @MaxId INT, 
        @foodName NVARCHAR(100)
SELECT @Counter = min([food_id]) , @MaxId = max([food_id]) 
FROM [dbo].[food]
 
WHILE(@Counter IS NOT NULL
      AND @Counter <= @MaxId)
BEGIN
   SELECT @foodName = food_name
   FROM [dbo].[food] WHERE  [food_id]= @Counter
    
   PRINT CONVERT(VARCHAR,@Counter)+'. ' + ' -סוג מנה ' + @foodName 
   SET @Counter  = @Counter  + 1        
END


create or alter FUNCTION dbo.FN_avg_payment ()
RETURNS int
AS
BEGIN
declare @rtn int
set @rtn=(select avg(p.Final_Payment) as payments_avg from payment  p
group by p.payment_amount_paid)
return(@rtn)
end

select dbo.FN_avg_payment()

select p.* from payment p
where p.Final_Payment>dbo.FN_avg_payment()