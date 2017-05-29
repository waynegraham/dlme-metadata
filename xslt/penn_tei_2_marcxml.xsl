<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xlink="http://www.w3.org/1999/xlink"
	xmlns:mods="http://www.loc.gov/mods/v3"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	exclude-result-prefixes="mods xlink"
	xmlns:marc="http://www.loc.gov/MARC21/slim">

<xsl:output method="xml" indent="yes" encoding="UTF-8"/>

<xsl:template match="/">
		<xsl:apply-templates/>
</xsl:template>
