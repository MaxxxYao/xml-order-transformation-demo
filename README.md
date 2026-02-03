XML Order Transformation Demo

This project demonstrates a simple data processing pipeline for order messages using XML, XSLT, Python and SQLite.

An order is received in XML format, transformed into a flat CSV file using XSLT, loaded into a SQLite database with Python, and queried using SQL for validation and analysis.

The processing flow is:
order.xml -> orders.csv -> tac_demo.db -> SQL queries

Project files:
order.xml is a sample order message in XML format.
transfer_to_csv.xslt defines the transformation rules from XML to CSV.
xml_to_csv.py runs the XSLT transformation and generates orders.csv.
orders.csv is the generated flat file output.
create_table.sql creates the SQLite table order_lines.
csv_to_sqlite.py loads the CSV file into the SQLite database.
tac_demo.db is the SQLite database file.
queries.sql contains SQL queries for validation and troubleshooting.

How to run the project:

Transform XML to CSV by running:
python xml_to_csv.py
This generates the file orders.csv.

Create the table in SQLite by running create_table.sql:
DROP TABLE IF EXISTS order_lines;
CREATE TABLE order_lines (
order_number TEXT,
buyer TEXT,
order_date TEXT,
currency TEXT,
shipto_name TEXT,
shipto_city TEXT,
shipto_postcode TEXT,
shipto_country TEXT,
notes TEXT,
line_no INTEGER,
sku TEXT,
description TEXT,
qty INTEGER,
unit_price REAL,
uom TEXT
);

Load the CSV into the database by running:
python csv_to_sqlite.py
This inserts all rows from orders.csv into the order_lines table in tac_demo.db.

Run SQL queries from queries.sql to validate and analyze the data.
Example queries:
SELECT COUNT() FROM order_lines;
SELECT * FROM order_lines WHERE qty <= 0 OR unit_price < 0;
SELECT order_number, line_no, COUNT() AS dup_count FROM order_lines GROUP BY order_number, line_no HAVING COUNT(*) > 1;

Sample order.xml:

<Order> 
 <Header> 
   <OrderNumber>PO-100045</OrderNumber> 
   <Buyer>ACME UK</Buyer> 
   <OrderDate>2026-01-31</OrderDate> 
 </Header> 
 <Lines> 
  <Line> 
   <LineNo>1</LineNo> 
   <SKU>APPLE-001</SKU> 
   <Qty>10</Qty> 
   <UnitPrice>2.50</UnitPrice> 
  </Line> 
  <Line> 
   <LineNo>2</LineNo> 
   <SKU>BANANA-002</SKU> 
   <Qty>5</Qty> 
   <UnitPrice>1.20</UnitPrice> 
  </Line> 
 </Lines>
</Order>

This project simulates a basic order processing and support workflow. XML represents incoming business messages, XSLT defines transformation rules, SQLite stores structured data, and SQL is used for validation and troubleshooting. The project is intended for learning and demonstration purposes.