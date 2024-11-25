-- 1
SELECT DISTINCT s.first_name, s.surname
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
WHERE b.cust_name = 'Tanya Singh';

-- 2
SELECT room_date
FROM restRoom_management r
JOIN restStaff s ON r.headwaiter = s.staff_no
WHERE r.room_name = 'Green'
  AND s.first_name = 'Charles'
  AND room_date BETWEEN 160201 AND 160229;

-- 3
SELECT DISTINCT s.first_name, s.surname
FROM restStaff s
WHERE s.headwaiter = (
    SELECT headwaiter
    FROM restStaff
    WHERE first_name = 'Zoe' AND surname = 'Ball'
)
AND s.staff_no != (
    SELECT staff_no
    FROM restStaff
    WHERE first_name = 'Zoe' AND surname = 'Ball'
);

-- 4
SELECT b.cust_name, b.bill_total, s.first_name, s.surname
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
ORDER BY b.bill_total DESC;

-- 5
SELECT DISTINCT s.first_name, s.surname
FROM restStaff s
WHERE s.staff_no IN (
    SELECT b1.waiter_no
    FROM restBill b1
    WHERE b1.table_no IN (
        SELECT b2.table_no
        FROM restBill b2
        WHERE b2.bill_no IN (00014, 00017)
    )
);

-- 6
SELECT DISTINCT s.first_name, s.surname
FROM restStaff s
WHERE s.staff_no IN (
    SELECT b.waiter_no
    FROM restBill b
    WHERE b.table_no IN (
        SELECT table_no
        FROM restRest_table
        WHERE room_name = 'Blue'
    )
    AND b.bill_date = 160312
)
OR s.staff_no = (
    SELECT headwaiter
    FROM restRoom_management
    WHERE room_name = 'Blue' AND room_date = 160312
);
