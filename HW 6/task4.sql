-- 1
SELECT DISTINCT b.cust_name
FROM restBill b
JOIN restRoom_management r ON b.table_no IN (
    SELECT table_no
    FROM restRest_table
    WHERE room_name = r.room_name
)
JOIN restStaff s ON r.headwaiter = s.staff_no
WHERE b.bill_total > 450.00 AND s.first_name = 'Charles';


-- 2
SELECT DISTINCT s.first_name, s.surname
FROM restStaff s
JOIN restRoom_management r ON s.staff_no = r.headwaiter
JOIN restRest_table t ON r.room_name = t.room_name
JOIN restBill b ON b.table_no = t.table_no
WHERE b.cust_name = 'Nerida Smith' AND b.bill_date = 160111;

-- 3
SELECT b.cust_name
FROM restBill b
WHERE b.bill_total = (
    SELECT MIN(bill_total) 
    FROM restBill
);


-- 4
SELECT s.first_name, s.surname
FROM restStaff s
WHERE s.staff_no NOT IN (
    SELECT DISTINCT b.waiter_no
    FROM restBill b
);


-- 5
SELECT b.cust_name, hs.first_name AS headwaiter_first_name, hs.surname AS headwaiter_surname, t.room_name
FROM restBill b
JOIN restRest_table t ON b.table_no = t.table_no
JOIN restRoom_management r ON t.room_name = r.room_name AND b.bill_date = r.room_date
JOIN restStaff hs ON r.headwaiter = hs.staff_no
WHERE b.bill_total = (SELECT MAX(bill_total) FROM restBill);

