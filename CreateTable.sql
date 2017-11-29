--Offices Table
Create table offices(
officeCode VARCHAR(10) not null ,
city VARCHAR(50) not null ,
phone VARCHAR(50) not null ,
addressLine1 VARCHAR(50) not null ,
addressLine2 VARCHAR(50) null ,
state VARCHAR(50) null ,
country VARCHAR(50) not null ,
postalCode VARCHAR(10) not null ,
territory VARCHAR(10) null,
primary key (officeCode)
)

--Employees Table

Create table employees(
employeeNumber int not null,
lastName VARCHAR(50) not null,
firstName VARCHAR(50) not null,
extension VARCHAR(10) not null,
email VARCHAR(100) not null,
officeCode VARCHAR(10) not null,
reportsTo int null,
jobTitle VARCHAR(50) not null,
primary key(employeeNumber),
foreign key (officeCode)
references Offices (officeCode),
)

--Customer Table
Create table customers(
customerNumber int not null,
customerName VARCHAR(50) not null,
contactLastName VARCHAR(50) not null,
contactFirstName VARCHAR(50) not null,
phone VARCHAR(50) not null,
addressLine1 VARCHAR(50) not null,
addressLine2 VARCHAR(50) null,
city VARCHAR(50) not null,
state VARCHAR(50) null,
postalCode VARCHAR(15) null,
country VARCHAR(50) not null,
salesRepEmployeeNumber int null,
creditLimit Decimal(20,2) not null,
primary key (customerNumber),
foreign key (salesRepEmployeeNumber)
references employees (employeeNumber)
)

--Payment Table

Create table payments(
customerNumber int not null,
checkNumber VARCHAR(50) not null,
paymentDate DATETIME not null,
amount Decimal(20,2) not null,
primary key (customerNumber, checkNumber),
foreign key (customerNumber)
references customers(customerNumber)
)

--Order Table
Create table orders(
orderNumber int not null,
orderDate DATETIME not null,
requiredDate DATETIME null,
shippedDate DATETIME null,
status VARCHAR(15) not null,
comments TEXT null,
customerNumber int not null,
primary key (orderNumber),
foreign key (customerNumber)
references customers(customerNumber)
)

--Product Line
create table ProductLines
( 
  productLine varchar(50) primary key,
  textDescription text not null,
  htmlDescription text null
)

--Product table
create table Products
(
   productCode varchar(15) primary key,
   productName varchar(70) not null,
   productLine varchar(50) not null,
   productScale varchar(10) not null,
   productVendor varchar(50) not null,
   productDescription text not null,
   quantityInStock int not null,
   buyPrice	Decimal(20,2) not null,
   MSRP Decimal(20,2) not null,
   foreign key (productLine)
   references ProductLines (productLine)
)

--OrderDetails Table
Create table orderdetails(
orderNumber int not null,
productCode VARCHAR(15) not null,
quantityOrdered int not null,
priceEach Decimal(20,2) not null,
orderLineNumber SMALLINT  not null,
primary key(orderNumber, productCode),
foreign key (orderNumber)
references orders (orderNumber),
foreign key (productCode)
references Products (productCode)
)
