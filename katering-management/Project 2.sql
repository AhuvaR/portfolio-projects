use Ahuva_Katering

--����1

INSERT INTO courses(course_name)
VALUES
('��� ������'),
('��� ����'),
('��� ������'),
('��� �����')

--����2

INSERT INTO city(city_name)
VALUES
('�������'),
('���� ������'),
('���� ���'),
('��� ���'),
('�������'),
('����')

--����3

INSERT INTO food(food_name,price,course_id)
VALUES
('�����',64,1),
('��',61,1),
('������',56,1),
('������',67,1),
('���',56,2),
('�����',63,2),
('�����',63,2),
('���',70,2),
('����� ������',15,3),
('����� ����� ���',17,3),
('������ �����',22,3),
('��� ���',33,4),
('��� ����',33,4),
('������ ���',10,4),
('����',8,4)

--������4

insert into clients(first_name,last_name,client_tz,phone_number,email,second_phone,comments)
values
('����','���������','213454546','0548563510','elikibaly@gmail.com','026587458','������ ������ ����'),
('���','���','123456789','0527178454','david@gmail.com','026587098',null),
('����','���������','567898767','0500007777','fgi7fuy@gmail.com','025870898','������ ����')
--��������

delete from [dbo].[clients]
where first_name='��� '


exec PR_insert_new_client '�����','�������','241237777','0583234543','no@gmail.com','025676384',null




--����

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
	if(dbo.FN_tz_taking(@client_tz))='����'
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
					print '������ ����� ������'
					end
				else
					print '�� �� ���� ������ �� �����'
end
go

CREATE FUNCTION dbo.FN_tz_taking (@tz varchar(15))
RETURNS varchar(10)
AS
BEGIN

	DECLARE @res varchar(10)

	IF LEN(@tz)=9
	select @res='����'
	
	else
	select @res='�� ����'

	RETURN(@res)
END
--������5
--����

begin try
exec PR_insert_new_order 16,2,'�� ����','���/���� 21','2023-10-20','05:00'  

end try
begin catch
select @@ERROR, error_message(),error_procedure() , error_line() 
print '�����! ��� ��� ���� �� ��� ��� ��� ���� �����'
select* from [dbo].[city]
end catch


go

--��������

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
					print '������ ����� ������'
end

go





--���� ������6

--����

exec PR_insert_order_detail 14,11,130

delete from [dbo].[order_detail]
where [order_detail_id]=35
--where [food_id]=10
--��������

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
			print '���� ������ ����� ������'
end




--�������� ������ ���� �����
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
			print '���� ������ ����� ������'
end


