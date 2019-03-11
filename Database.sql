create database InventoryManagement
go


create table Units
(
	Id int identity(1,1) primary key,
	DisplayName nvarchar(50)
)
go

create table Suppliers
(
	Id int identity(1,1),
	SupplierID nvarchar(50) primary key,
	DisplayName nvarchar(max),
	Address nvarchar(max),
	PhoneNumber nvarchar(20),
	Email nvarchar(50),
	ContractDate Datetime
)
go

create table Customers
(
	Id int identity(1,1),
	CustomerID nvarchar(50) primary key,
	DisplayName nvarchar(max),
	Address nvarchar(max),
	Phone nvarchar(20),
	Email nvarchar(50),
	PersonalID nvarchar(50)
)
go

create table Products
(
	Id int identity(1,1),
	ProductID nvarchar(50)  primary key,
	UnitID int not null,
	SupplierID nvarchar(50) not null,
	DisplayName nvarchar(max),
	BarCode nvarchar(max),

	foreign key(UnitID) references Units(Id),
	foreign key(SupplierID) references Suppliers(SupplierID)
)
go

create table UserRole
(
	Id int identity(1,1) primary key,
	DisplayName nvarchar(max)
)
go

insert into UserRole(DisplayName) values (N'Nhân viên')
insert into UserRole(DisplayName) values (N'Admin')

create table Users
(
	Id int Identity(1,1) primary key,
	UserName nvarchar(max),
	DisplayName nvarchar(max),
	Password nvarchar(max),
	RollId int not null,

	foreign key(RollId) references UserRole(Id)
)
go

insert into Users(UserName, DisplayName,Password ,RollId) values	(N'admin', N'Giám đốc', 'db69fc039dcbd2962cb4d28f5891aae1', 2)
insert into Users(UserName, DisplayName, Password, RollId) values (N'staff', N'Nhân viên', '978aae9bb6bee8fb75de3e4830a1be46',1)
create table Input
(
	Id nvarchar(128) primary key,
	DateInput Datetime
)
go
create table InputInfo
(
	Id nvarchar(128) primary key,
	ProductID nvarchar(50) not null,
	InputID nvarchar(128) not null,
	Amount int,
	InputPrice float default 0,
	OutputPrice float default 0,
	Status nvarchar(50)

	foreign key(ProductID) references Products(ProductID),
	foreign key(InputID) references Input(Id)
)
go


create table Output
(
	Id nvarchar(128) primary key,
	DateOutput Datetime
)
go

create table OutputInfo
(
	Id nvarchar(128) primary key,
	ProductID nvarchar(50) not null,
	OutputID nvarchar(128) not null,
	CustomerID nvarchar(50) not null,
	InputInfoID nvarchar(128) not null,
	Amount int,
	Status nvarchar(50)

	foreign key(ProductID) references Products(ProductID),
	foreign key(OutputID) references Output(Id),
	foreign key(CustomerID) references Customers(CustomerID),
	foreign key(InputInfoID) references InputInfo(Id)
)
go