-- 1

SELECT bill_date, bill_total FROM restBill WHERE cust_name="Bob Crow";

-- 2

SELECT DISTINCT cust_name FROM restBill WHERE cust_name LIKE "%Smith" ORDER BY cust_name DESC;

-- 3

SELECT DISTINCT cust_name FROM restBill WHERE cust_name LIKE "% C%";

-- 4

SELECT first_name, surname FROM restStaff WHERE headwaiter IS NULL;

-- 5

SELECT * FROM restBill WHERE bill_date <160230 AND bill_date >= 160201;

-- 6

SELECT DISTINCT bill_date FROM restBill WHERE bill_date > 150000 AND bill_date < 160000 ORDER BY bill_date ASC;
