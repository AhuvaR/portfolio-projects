
create  database Ahuva_Katering collate hebrew_100_ci_as

use Ahuva_Katering

create table courses (
[course_id] [int] IDENTITY(1,1) NOT NULL,
מנה_ראשונה varchar(20) not null,
מנה_שניה varchar(20) not null,
מנה_שלישית varchar(20) not null,
מנה_אחרונה varchar(20) not null)

drop table courses



--מנות1
create table courses(
[course_id] [int] IDENTITY(1,1) NOT NULL,
[course_name] varchar(40) not null
constraint PK_id PRIMARY KEY(course_id)
)

--ערים2
create table city(
city_id [int] IDENTITY(1,1) NOT NULL,
city_name varchar (20) null,
constraint PK_Cid PRIMARY KEY(city_id)
)
--------------------------------
--אוכל3
create table food (
[food_id] [int] IDENTITY(1,1) NOT NULL,
food_name varchar(40)  NOT NULL,
price int not null,
course_id int not null ,
constraint PK_Fid PRIMARY KEY([food_id]),
constraint FK_food_courses FOREIGN KEY(course_id) REFERENCES courses(course_id))

--לקוחות4
create table  clients (
client_id int identity(1,1) not null,
first_name varchar (20) null,
last_name varchar (20) null,
client_tz varchar(9) not null,
phone_number varchar (13) not null,
email varchar(30) null,
constraint PK_CLid PRIMARY KEY(client_id)
) 

--הזמנות5
create table orders (
order_id [int] IDENTITY(1,1) NOT NULL,
client_id int not null,
city_id int  not null,
neighborhood varchar(40) not null,
street_num varchar(80) null,
order_to_date  date not null,
order_to_hour time not null,
constraint PK_Oid PRIMARY KEY(order_id),
constraint FK_orders_city FOREIGN KEY(city_id) REFERENCES city(city_id),
constraint FK_orders_clients FOREIGN KEY(client_id) REFERENCES clients(client_id)
)


--פרטי הזמנות6
create table order_detail(
order_detail_id int IDENTITY(1,1) NOT NULL,
order_id int not null,
food_id int  not null,
amount int not null,
constraint PK_ODid PRIMARY KEY(order_detail_id),
constraint FK_order_detail_food FOREIGN KEY(food_id) REFERENCES food(food_id),
constraint FK_order_detail_orders FOREIGN KEY(order_id) REFERENCES orders(order_id)
)


ALTER TABLE orders
add  paid bit null

ALTER TABLE clients
add  second_phone varchar null,
	 comments varchar null

ALTER TABLE clients
drop column second_phone ,
	 column comments 

ALTER TABLE clients
add  second_phone varchar(16) null,
	 comments varchar(80) null

	
	 select * from[dbo].[courses]
	 select * from[dbo].[food]
	 select * from[dbo].[order_detail]
	 select * from[dbo].[orders]	 select * from[dbo].[clients]
	 select * from [dbo].[city]
	 select *from [dbo].[payment]


 create table payment(
 [order_id] int not null,
[advance_payment_amount] int null,
 advance_payment_paid  bit null,
 payment_amount int null,
 payment_amount_paid bit null
 constraint FK_payment_order FOREIGN KEY([order_id]) REFERENCES orders([order_id])
 )

 alter table payment
 add  Final_Payment bigint null
