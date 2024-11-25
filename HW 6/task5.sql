-- 1
SELECT s.first_name, s.surname, b.bill_date, COUNT(b.bill_no) AS num_bills
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
GROUP BY s.first_name, s.surname, b.bill_date
HAVING COUNT(b.bill_no) >= 2;

-- 2
SELECT t.room_name, COUNT(t.table_no) AS num_tables
FROM restRest_table t
WHERE t.no_of_seats > 6
GROUP BY t.room_name;

-- 3
SELECT r.room_name, SUM(b.bill_total) AS total_bills
FROM restBill b
JOIN restRest_table t ON b.table_no = t.table_no
JOIN restRoom_management r ON t.room_name = r.room_name AND b.bill_date = r.room_date
GROUP BY r.room_name;

-- 4
SELECT h.first_name, h.surname, SUM(b.bill_total) AS total_bill_amount
FROM restBill b
JOIN restStaff w ON b.waiter_no = w.staff_no
JOIN restStaff h ON w.headwaiter = h.staff_no
GROUP BY h.first_name, h.surname
ORDER BY total_bill_amount DESC;

-- 5
SELECT b.cust_name, AVG(b.bill_total) AS avg_bill
FROM restBill b
GROUP BY b.cust_name
HAVING AVG(b.bill_total) > 400;

-- 6
SELECT s.first_name, s.surname, b.bill_date, COUNT(b.bill_no) AS num_bills
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
GROUP BY s.first_name, s.surname, b.bill_date
HAVING COUNT(b.bill_no) >= 3;
