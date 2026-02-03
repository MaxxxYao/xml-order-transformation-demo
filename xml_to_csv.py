from lxml import etree

XML_FILE = "order.xml"
XSLT_FILE = "transfer_to_csv.xslt"
OUT_FILE = "orders.csv"

xml = etree.parse(XML_FILE)
xslt = etree.parse(XSLT_FILE)
transform = etree.XSLT(xslt)

result = transform(xml)

with open(OUT_FILE, "w", encoding="utf-8", newline="") as f:
    f.write(str(result))

print(f"Generated {OUT_FILE}")
