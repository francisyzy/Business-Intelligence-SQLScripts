INSERT INTO SalesFact
    ([orderTimeKey], [requiredTimeKey], [shippedTimeKey], [orderNumber], [customerNumber], [productCode], [officeCode], [employeeNumber], [quantityOrdered], [priceEach], [status])
SELECT
    replace(CONVERT(DATE,o.orderdate,112),'-',''),
    replace(CONVERT(DATE,o.requireddate,112),'-',''),
	ISNULL(replace(CONVERT(DATE,o.shippedDate,112),'-',''), 00000000),
	o.orderNumber,
    c.CustomerNumber,
    p.ProductCode,
    myoffice.officeCode,
    myoffice.employeeNumber,
    od.quantityOrdered,
    od.priceEach,
	o.status
    
FROM
BI_CA1_OLTP..orderDetails od
INNER JOIN BI_CA1_OLTP..orders o
ON od.orderNumber = o.orderNumber

INNER JOIN BI_CA1_DW..customer c
ON o.customerNumber = c.customerNumber

INNER JOIN BI_CA1_DW..product p
ON od.productCode = p.productCode

INNER JOIN
(select oc.customerNumber, oe.employeeNumber,oo.officeCode
from BI_CA1_OLTP..customers oc
inner join BI_CA1_OLTP..employees oe
on oc.salesRepEmployeeNumber = oe.employeeNumber
inner join BI_CA1_OLTP..offices oo
on oe.officeCode = oo.officeCode
)myoffice

on c.customerNumber = myoffice.customerNumber

