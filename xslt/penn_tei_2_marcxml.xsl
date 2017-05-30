<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:tei="http://www.tei-c.org/ns/1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:marc="http://www.loc.gov/MARC21/slim"
	exclude-result-prefixes="tei">

<xsl:output method="xml" indent="yes" encoding="UTF-8"/>

<xsl:template match="/">
	<marc:record xmlns:marc="http://www.loc.gov/MARC21/slim">
		<xsl:apply-templates select="//tei:teiHeader" />
	</marc:record>
</xsl:template>

<xsl:template match="tei:teiHeader">
	<xsl:apply-templates />
</xsl:template>

<xsl:template match="tei:fileDesc">
	<marc:datafield tag="245" ind1="1" ind2="0">
    <marc:subfield code="a"><xsl:value-of select="tei:titleStmt/tei:title"/></marc:subfield>
  </marc:datafield>
</xsl:template>
