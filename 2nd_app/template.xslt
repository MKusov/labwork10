<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> <xsl:template match="/">
    <table border="1">
        <tr bgcolor="#9acd32">
            <th>Число Мерсена</th> </tr>
        <xsl:for-each select="fixnums/fixnum"> <tr>
            <td align="center"><xsl:value-of select="."/></td> </tr>
        </xsl:for-each> </table>
</xsl:template> </xsl:stylesheet>
