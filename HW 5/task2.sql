-- 1

SELECT SUM(bill_total) AS "Income" from restBill;

-- 2

SELECT SUM(bill_total) AS "Feb Income" from restBill WHERE bill_date < 160230 AND bill_date > 160200;

-- 3

SELECT AVG(bill_total) from restBill WHERE table_no=2;

-- 4

SELECT MIN(no_of_seats) AS "Min", MAX(no_of_seats) AS "Max", AVG(no_of_seats) AS "Avg" FROM restRest_table WHERE room_name="Blue";

-- 5

SELECT COUNT(DISTINCT table_no) FROM restBill WHERE waiter_no IN (004, 002);
