<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text" encoding="UTF-8"/>
  <xsl:template match="/">
    <!-- Header -->
    <xsl:text>order_number,buyer,order_date,currency,shipto_name,shipto_city,shipto_postcode,shipto_country,notes,</xsl:text>
    <!-- Line -->
    <xsl:text>line_no,sku,description,qty,unit_price,uom&#10;</xsl:text>

    <xsl:for-each select="/Order/Lines/Line">
      <!-- Header fields repeated for each line -->
      <xsl:value-of select="/Order/Header/OrderNumber"/><xsl:text>,</xsl:text>
      <xsl:value-of select="/Order/Header/Buyer"/><xsl:text>,</xsl:text>
      <xsl:value-of select="/Order/Header/OrderDate"/><xsl:text>,</xsl:text>
      <xsl:value-of select="/Order/Header/Currency"/><xsl:text>,</xsl:text>

      <xsl:value-of select="/Order/Header/ShipTo/Name"/><xsl:text>,</xsl:text>
      <xsl:value-of select="/Order/Header/ShipTo/City"/><xsl:text>,</xsl:text>
      <xsl:value-of select="/Order/Header/ShipTo/Postcode"/><xsl:text>,</xsl:text>
      <xsl:value-of select="/Order/Header/ShipTo/Country"/><xsl:text>,</xsl:text>

      <!-- Notes: replace commas with spaces to keep CSV simple -->
      <xsl:value-of select="translate(/Order/Header/Notes, ',', ' ')"/><xsl:text>,</xsl:text>

      <!-- Line fields -->
      <xsl:value-of select="LineNo"/><xsl:text>,</xsl:text>
      <xsl:value-of select="SKU"/><xsl:text>,</xsl:text>
      <xsl:value-of select="translate(Description, ',', ' ')"/><xsl:text>,</xsl:text>
      <xsl:value-of select="Qty"/><xsl:text>,</xsl:text>
      <xsl:value-of select="UnitPrice"/><xsl:text>,</xsl:text>
      <xsl:value-of select="UOM"/>

      <xsl:text>&#10;</xsl:text>
    </xsl:for-each>
  </xsl:template>

</xsl:stylesheet>

