<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="xml" encoding="utf-8"/>
<xsl:template match="/">
<xsl:variable name="bookCount" select="count(/bookstore/book)"/>
<xsl:variable name="bookTotal" select="sum(/bookstore/book/price)"/>
<xsl:variable name="bookAverage" select="$bookTotal div $bookCount"/>
<books>
<!-- Books That Cost Below Average -->
<xsl:for-each select="/bookstore/book">
<xsl:if test="price < $bookAverage">
<xsl:copy-of select="."/>
</xsl:if>
</xsl:for-each>
</books>
</xsl:template>
</xsl:stylesheet>