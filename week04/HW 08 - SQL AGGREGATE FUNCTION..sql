SELECT customerName, SUM(quantityOrdered) `Quantity Ordered`
from customers
join orders
using (customerNumber)
join orderdetails
using (orderNumber)
group by customerName
order by customerName ASC;

SELECT city, COUNT(employeeNumber)
from offices
join employees
using (officeCode)
group by city
having COUNT(employeeNumber) > 2;

SELECT c.country, od.productCode, od.quantityOrdered, p.buyPrice, (od.quantityOrdered * p.buyPrice) AS `Net Sales`
FROM customers c
JOIN orders o ON c.customerNumber = o.customerNumber
JOIN orderdetails od ON o.orderNumber = od.orderNumber
JOIN products p ON od.productCode = p.productCode;

SELECT e.employeeNumber `Employee Number`, concat(e.firstName, ' ',e.lastName) `Employee Name`, o.country, e.reportsTo, concat(report.firstName, ' ',report.lastName) `Report Name`, 
count(c.customerNumber) `Total customer`
from employees e
join offices o
using (officeCode)
left outer join employees report
on (report.employeeNumber = e.reportsTo)
left outer join customers c
on (e.employeeNumber = c.salesRepEmployeeNumber)
group by e.employeeNumber;

SELECT
    e.employeeNumber AS "Employee Number",
    e.firstName,
    e.lastName,
    sum(creditLimit)
FROM employees e
JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
GROUP BY e.employeeNumber, e.firstName, e.lastName
ORDER BY e.employeeNumber;

SELECT country, COUNT(officeCode) AS `number of offices`
FROM offices
GROUP BY country
ORDER BY COUNT(officeCode) DESC;

SELECT CONCAT('In 2004, Average payment is ', AVG(amount)) AS `Average payment description`
FROM payments WHERE YEAR(paymentDate) = 2004;

SELECT max(amount) - min(amount) `Range`, avg(amount) `Average`
from payments;

SELECT customerName, country, city, ifnull(state, 'No Data') `state`
from customers;

SELECT ifnull(state, 'No Data') `state`, (sum(creditLimit)/count(creditLimit)) `Average Credit`
from customers
group by state;

SELECT
    p.productCode,
    p.productName,
    SUM(od.quantityOrdered * od.priceEach) AS `Sum Net Sales`,
    AVG(od.quantityOrdered * od.priceEach) AS `Average Net Sales`
FROM
    products p
JOIN
    orderdetails od ON p.productCode = od.productCode
GROUP BY
    p.productCode, p.productName
HAVING
    AVG(od.quantityOrdered * od.priceEach) > (
        SELECT AVG(od.quantityOrdered * od.priceEach) AS `Total Average Net Sales`
        FROM orderdetails od
    );

SELECT
    orderNumber,
    sum(quantityOrdered)
FROM orders
JOIN orderdetails USING (orderNumber)
WHERE `status` LIKE 'Ship%'
GROUP BY orderNumber
HAVING MIN(quantityOrdered) >= 24;

SELECT o.orderNumber, count(distinct productCode) FROM orderdetails o
LEFT OUTER JOIN products 
USING (productCode)
WHERE (productLine = 'Planes')
GROUP BY orderNumber
HAVING MIN(quantityOrdered) > 28

SELECT
    customerNumber,
    sum(amount)
FROM customers
JOIN payments USING (customerNumber)
WHERE checkNumber LIKE 'N%' AND paymentDate > '2004-01-01'
GROUP BY customerNumber
HAVING MIN(amount) > 35000;

SELECT
    avg(creditLimit)
FROM customers
WHERE salesRepEmployeeNumber IN (
    SELECT salesRepEmployeeNumber
    FROM customers
    GROUP BY salesRepEmployeeNumber
    HAVING COUNT(DISTINCT customerNumber) > 1
)
GROUP BY salesRepEmployeeNumber;

SELECT customerName, sum(quantityOrdered*priceEach) `Expense`
FROM orderdetails od
join orders o
on (od.orderNumber = o.orderNumber)
join customers c
on (c.customerNumber = o.customerNumber)
GROUP BY customerName
HAVING `Expense` > 15000;

select country, jobTitle, count(*) `Number of employees`
from offices
join employees
using (officeCode)
where territory = 'EMEA'
group by country, jobTitle
having `Number of employees` = 1;

select MONTH(paymentDate) `Month`,sum(amount) `Total amount`
from payments
group by MONTH(paymentDate)
HAVING sum(amount) > 50000

select e.firstName, e.lastName, count(*) `Number of customers`
from employees e
join customers c
on (e.employeeNumber = c.salesRepEmployeeNumber)
join offices o
on (e.officeCode = o.officeCode)
where o.country != c.country
group by e.employeeNumber
having `Number of customers` > 1

select productName, min(priceEach), avg(priceEach), max(priceEach)
from orderdetails
join products
using (productCode)
group by productName
having max(priceEach) - min(priceEach) < 50

select firstName, lastName, city
from employees
join offices
using (officeCode)
where country in (
  select country
  from customers
  group by country
  having count(country) > 1)
order by city

select productName, count(orderNumber), sum(quantityOrdered)
from products
join orderdetails
using (productCode)
where productName like '%America%'
or productVendor like '%Diecast%'
group by productName
having sum(quantityOrdered) < 50;

select customerName, productCode, sum(quantityOrdered) Quantity
from orders
join customers
using (customerNumber)
join orderdetails
using (orderNumber)
group by customerName, productCode
having Quantity > 50
order by Quantity desc;

select country, count(customerNumber), avg(creditLimit)
from customers
left outer join orders
using (customerNumber)
where orders.customerNumber is null
group by country
having avg(creditLimit) > 0;

select productLine 'Product line', sum(quantityInStock + sumQuantity) 'Quantity'
from products
join (
  select productCode, sum(quantityOrdered) sumQuantity
  from orderdetails
  group by productCode
  having sumQuantity > 50
) totalorders
using (productCode)
group by productLine