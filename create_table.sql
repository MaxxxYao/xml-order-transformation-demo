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
