Create table Salesfacts(
customerNumber int not null references Customers,
productCode nvarchar(15) not null references Products,
employeeNumber int not null references Employees,
orderTimeKey int not null references Time,
requiredTimeKey int not null references Time,
shippedTimeKey int not null references Time,
officeCode NVARCHAR(10) not null references Offices,
orderNumber int not null,
quantityOrdered int not null,
priceEach decimal(10,2) not null ,
primary key (customerNumber, productCode, employeeNumber, orderTimeKey, requiredTimeKey, shippedTimeKey, officeCode, orderNumber)
)
