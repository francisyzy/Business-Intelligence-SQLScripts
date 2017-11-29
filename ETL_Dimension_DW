--ETL Customer--
INSERT INTO BI_CA1_DW..Customer
    ([customerNumber], [contactFirstName], [contactLastName], [phone], [addressLine1], [addressLine2], [postalCode], [city], [state], [country], [creditLimit])
SELECT [customerNumber], [contactFirstName], [contactLastName], [phone], [addressLine1], [addressLine2], [postalCode], [city], [state], [country], [creditLimit]
FROM BI_CA1_OLTP..customers

--ETL Product--
INSERT INTO BI_CA1_DW..Product
    ([productCode], [productName], [productScale], [productVendor], [productLine], [quantityInStock], [buyPrice], [msrp])
SELECT [productCode], [productName], [productScale], [productVendor], [productLine], [quantityInStock], [buyPrice], [msrp]
FROM BI_CA1_OLTP..Products

--ETL Employees --
INSERT INTO BI_CA1_DW..Employee
    ([employeeNumber], [firstName], [lastName], [jobTitle], [extension], [email], [reportsTo])
SELECT [employeeNumber], [firstName], [lastName], [jobTitle], [extension], [email], [reportsTo]
FROM BI_CA1_OLTP..Employees

--ETL Offices
INSERT INTO BI_CA1_DW..Office
    ([officeCode], [city], [state], [country], [territory])
SELECT [officeCode], [city], [state], [country], [territory]
FROM BI_CA1_OLTP..offices
