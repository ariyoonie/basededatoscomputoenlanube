use Northwind

select * from Products;

create database ejemploetl

use ejemploetl;

select * from Northwind.dbo.Products;
select * from Northwind.dbo.Categories;

create table productos(
	productoId int not null identity(1,1),
	nombreproducto nvarchar(40) not null,
	precio money not null,
	stock smallint not null,
	importe as (precio * stock),
	categoria nvarchar(15) not null,
	constraint pk_producto
	primary key (productoId)
);
alter table productos add categoria nvarchar(15) not null;
--Permite visuaizar las caracteristicas de las tablas 
select * from sys.tables;
insert into ejemploetl.dbo.productos
select p.ProductName, p.UnitPrice, p.UnitsInStock, c.CategoryName 
from Northwind.dbo.Products as p inner join Northwind.dbo.Categories as c
on c.CategoryID = p.CategoryID;
Select * from productos;

