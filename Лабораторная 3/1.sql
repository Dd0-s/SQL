use my_db

create table Type_of_payment
(
	Payment_id int not null primary key,
	Type_pay nvarchar(50)
)

create table [Type]
(
	[Type_id] int not null primary key,
	Type_dish nvarchar(50)
)

create table [Order]
(
	Order_id int not null primary key,
	Payment_id int,
	Date datetime,
	Employee_id int
)

create table Order_Dish
(
	Cook_id int,
	Order_id int not null,
	Dish_id int not null,
	constraint Or_Di primary key(Order_id, Dish_id)
)

create table Dish
(
	Dish_id int not null primary key,
	[Type_id] int,
	Dish_name nvarchar(50),
	KKal int,
	Price int,
	Menu bit
)

create table Employee
(
	Employee_id int not null primary key,
	Canteen_id int not null,
	Surname nvarchar(50),
	Name nvarchar(50),
	[Start_date] date,
	End_date date,
	Phone nvarchar(20),
	Job_id int,
	Day_work nvarchar(20)
)

create table Canteen
(
	Canteen_id int not null primary key,
	Location nvarchar(50)
)

create table Dish_Ingredients
(
	Dish_id int not null,
	Ingredients_id int not null,
	constraint Di_In primary key(Dish_id, Ingredients_id)
)

create table Ingredients
(
	Ingredients_id int not null primary key,
	Weight_portion float,
	Ingredients_name nvarchar(50)
)

create table Provider
(
	Provider_id int not null primary key,
	provider_name nvarchar(50),
)

create table Job
(
	Job_id int not null primary key,
	Type_job nvarchar(50),
	[day] nvarchar(50)
)

create table Purchase
(
	Canteen_id int,
	Ingredients_id int,
	Buy_date date,
	Price int,
	Wight float,
	Total int,
	Provider_id int,
	constraint In_Bu primary key(Ingredients_id, Buy_date)
)
alter table Employee add foreign key(Job_id) references Job(Job_id)
alter table Employee add foreign key(Canteen_id) references Canteen(Canteen_id)
alter table [Order] add foreign key(Payment_id) references Type_of_payment(Payment_id)
alter table [Order] add foreign key(Employee_id) references Employee(Employee_id)
alter table Dish add foreign key([Type_id]) references [Type]([Type_id])
alter table Dish_Ingredients add foreign key(Dish_id) references Dish(Dish_id)
alter table Dish_Ingredients add foreign key(Ingredients_id) references Ingredients(Ingredients_id)
alter table Order_Dish add foreign key(Order_id) references [Order](Order_id) on delete cascade
alter table Order_Dish add foreign key(Dish_id) references Dish(Dish_id)
alter table Purchase add foreign key(Canteen_id) references Canteen(Canteen_id)
alter table Purchase add foreign key(Ingredients_id) references Ingredients(Ingredients_id)
alter table Purchase add foreign key(Provider_id) references Provider(Provider_id)

