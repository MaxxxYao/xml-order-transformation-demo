import csv
import sqlite3

DB_FILE = "tac_demo.db"
CSV_FILE = "orders.csv"

conn = sqlite3.connect(DB_FILE)
cur = conn.cursor()

cur.execute("""
CREATE TABLE IF NOT EXISTS order_lines (
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
)
""")


cur.execute("DELETE FROM order_lines;")

with open(CSV_FILE, newline="", encoding="utf-8") as f:
    reader = csv.DictReader(f)
    rows = []
    for r in reader:
        rows.append((
            r["order_number"],
            r["buyer"],
            r["order_date"],
            r.get("currency", ""),

            r.get("shipto_name", ""),
            r.get("shipto_city", ""),
            r.get("shipto_postcode", ""),
            r.get("shipto_country", ""),
            r.get("notes", ""),

            int(r["line_no"]) if r["line_no"] else None,
            r.get("sku", ""),
            r.get("description", ""),
            int(r["qty"]) if r["qty"] else None,
            float(r["unit_price"]) if r["unit_price"] else None,
            r.get("uom", "")
        ))

cur.executemany("""
INSERT INTO order_lines (
  order_number,buyer,order_date,currency,
  shipto_name,shipto_city,shipto_postcode,shipto_country,notes,
  line_no,sku,description,qty,unit_price,uom
) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)
""", rows)

conn.commit()
conn.close()

print("Imported orders.csv into tac_demo.db (table: order_lines)")