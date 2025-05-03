use Ahuva_Katering

--מנות1

INSERT INTO courses(course_name)
VALUES
('מנה ראשונה'),
('מנה שניה'),
('מנה אחרונה'),
('מנת תוספת')

--ערים2

INSERT INTO city(city_name)
VALUES
('ירושלים'),
('מעלה אדומים'),
('גבעת זאב'),
('בית שמש'),
('טלזסטון'),
('ביתר')

--אוכל3

INSERT INTO food(food_name,price,course_id)
VALUES
('ממולא',64,1),
('דג',61,1),
('בלינצס',56,1),
('סלומון',67,1),
('עוף',56,2),
('שניצל',63,2),
('פרגית',63,2),
('בשר',70,2),
('סופלה וגלידה',15,3),
('מגוון עוגות ביס',17,3),
('חיתוכי פירות',22,3),
('מרק עוף',33,4),
('מרק כתום',33,4),
('פשטידת גזר',10,4),
('בטטה',8,4)

--לקוחות4

insert into clients(first_name,last_name,client_tz,phone_number,email,second_phone,comments)
values
('אלקי','רובישטיין','213454546','0548563510','elikibaly@gmail.com','026587458','להשאיר מאחורי הדלת'),
('דוד','לוי','123456789','0527178454','david@gmail.com','026587098',null),
('חגית','וולישטיין','567898767','0500007777','fgi7fuy@gmail.com','025870898','מלצרים בלבד')
--פרוצדורה

delete from [dbo].[clients]
where first_name='חנה '


exec PR_insert_new_client 'עופיר','ברדיצוב','241237777','0583234543','no@gmail.com','025676384',null




--הרצה

create or alter procedure PR_insert_new_client (
            @first_name varchar(50),
            @last_name varchar(50),
            @client_tz varchar(13),
            @phone_number varchar(13),
			@email varchar(30),
            @second_phone varchar(16),
			@comments varchar(80)
		   )
as
	begin
	if(dbo.FN_tz_taking(@client_tz))='תקין'
	begin
		insert into [dbo].[clients]
		    (	[first_name],
				[last_name],
				[client_tz],
				[phone_number],
				[email],
				[second_phone],
				[comments]
				)
             VALUES
                   (
					@first_name ,
					@last_name ,
					@client_tz ,
					@phone_number ,
					@email ,
					@second_phone ,
					@comments 
                    )
					print 'הפרטים הוזנו במערכת'
					end
				else
					print 'מס תז שגוי הפרטים לא הוזנו'
end
go

CREATE FUNCTION dbo.FN_tz_taking (@tz varchar(15))
RETURNS varchar(10)
AS
BEGIN

	DECLARE @res varchar(10)

	IF LEN(@tz)=9
	select @res='תקין'
	
	else
	select @res='לא תקין'

	RETURN(@res)
END
--הזמנות5
--הרצה

begin try
exec PR_insert_new_order 16,2,'לא יודע','כתר/בגין 21','2023-10-20','05:00'  

end try
begin catch
select @@ERROR, error_message(),error_procedure() , error_line() 
print 'שגיאה! שדה עיר מקבל רק קוד עיר בחר מתוך הטבלה'
select* from [dbo].[city]
end catch


go

--הפרצדורה

create or alter procedure PR_insert_new_order (
			@client_id int,
            @city_id int,
            @neighborhood varchar(50),
            @street_num varchar(50),
            @order_to_date date,
            @order_to_hour time)
            
as
	begin
		insert into [dbo].[orders]
		    (	[client_id],
				[city_id],
				[neighborhood],
				[street_num],
				[order_to_date],
				[order_to_hour]
				)
             VALUES
                   (@client_id,
                    @city_id,
                    @neighborhood,
                    @street_num ,
                    @order_to_date,
                    @order_to_hour
                    )
					print 'הפרטים הוזנו במערכת'
end

go





--פרטי הזמנות6

--הרצה

exec PR_insert_order_detail 14,11,130

delete from [dbo].[order_detail]
where [order_detail_id]=35
--where [food_id]=10
--הפרצדורה

go

create or alter procedure PR_insert_order_detail(
			@order_id int,
            @food_id int,
            @amount bigint
            )
as
	begin

		insert into [dbo].[order_detail]
		    (	[order_id],
				[food_id],
				[amount]
				)
             VALUES
                   (@order_id ,
					@food_id ,
					@amount 
                    )
			print 'פרטי ההזמנה הוזנו במערכת'
end




--פרוצדורה להכנסת פרטי הזמנה
create or alter procedure PR_insert_order_detail(
			@order_id int,
            @food_id int,
            @amount bigint
            )
as
	begin

		insert into [dbo].[order_detail]
		    (	[order_id],
				[food_id],
				[amount]
				)
             VALUES
                   (@order_id ,
					@food_id ,
					@amount 
                    )
			print 'פרטי ההזמנה הוזנו במערכת'
end


