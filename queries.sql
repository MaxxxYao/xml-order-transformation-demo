-- 0) sanity check
SELECT COUNT(*) AS row_count FROM order_lines;

-- 1) show full rows for this order
SELECT *
FROM order_lines
WHERE order_number='PO-100045'
ORDER BY line_no;

-- 2) shipping check
SELECT order_number, buyer, order_date, shipto_city, shipto_postcode, notes
FROM order_lines
WHERE order_number='PO-100045'
LIMIT 5;

-- 3) validation checks
SELECT * FROM order_lines
WHERE (sku IS NULL OR TRIM(sku)='')
   OR qty <= 0
   OR unit_price < 0
ORDER BY line_no;

-- 4) duplicate line numbers within the same order
SELECT order_number, line_no, COUNT(*) AS dup_count
FROM order_lines
WHERE order_number='PO-100045'
GROUP BY order_number, line_no
HAVING COUNT(*) > 1;

-- 5) order totals
SELECT order_number,
       buyer,
       currency,
       SUM(qty) AS total_qty,
       ROUND(SUM(qty * unit_price), 2) AS total_value
FROM order_lines
WHERE order_number='PO-100045'
GROUP BY order_number, buyer, currency;

SELECT COUNT(*) FROM order_lines;

SELECT order_number, line_no, sku, qty, unit_price
FROM order_lines
ORDER BY line_no;