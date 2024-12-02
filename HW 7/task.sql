-- 1
CREATE VIEW samsBills AS
SELECT s.first_name, s.surname, b.bill_date, b.cust_name, b.bill_total
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
WHERE s.first_name = 'Sam' AND s.surname = 'Pitt';

-- 2
SELECT * 
FROM samsBills
WHERE bill_total > 400;

-- 3
CREATE VIEW roomTotals AS
SELECT rm.room_name, SUM(b.bill_total) AS total_sum
FROM restRoom_management rm
JOIN restBill b ON rm.room_name = (SELECT room_name FROM restRest_table WHERE table_no = b.table_no)
GROUP BY rm.room_name;

-- 4
CREATE VIEW teamTotals AS
SELECT CONCAT(s.first_name, ' ', s.surname) AS headwaiter_name, SUM(b.bill_total) AS total_sum
FROM restRoom_management rm
JOIN restBill b ON rm.room_name = (SELECT room_name FROM restRest_table WHERE table_no = b.table_no)
JOIN restStaff s ON rm.headwaiter = s.staff_no
GROUP BY rm.headwaiter;

