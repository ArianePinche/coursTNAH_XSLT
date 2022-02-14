<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs" version="2.0">
 
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>

    <xsl:template match="TEI">
        <html>
            <head>
                <meta charset="UTF-8"/>
                <title>Exercice de structuration HTML</title>
            </head>
            <body>
                <h1>
                    <xsl:apply-templates select="teiHeader"/>
                </h1>
                 <xsl:element name="ul">
                <xsl:apply-templates select="descendant::body"/>
                 </xsl:element> 

                <xsl:element name="div">
                    <xsl:text>Ce </xsl:text>
                    <xsl:value-of select="descendant::body/lg/@type"/>
                    <xsl:text> comprend </xsl:text>
                    <xsl:value-of select="count(descendant::l)"/>
                    <xsl:text> vers.</xsl:text>
                </xsl:element>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="teiHeader">
        <xsl:variable name="titre">
            <!-- <xsl:variable name="titre" select="descendant::title"/>
             <xsl:variable name="auteur" select="descendant::author"/> -->
            <xsl:value-of
                select="concat(descendant::title/text(), ' ', 'écrit par', ' ', descendant::author/text())"/>
            <!-- <xsl:value-of select="concat($titre, ' écrit par ', $auteur)"/> -->
        </xsl:variable>

        <xsl:value-of select="replace($titre, 'Mon', 'Un')"/>
    </xsl:template>

 <xsl:template match="lg">
        <xsl:element name="ul"><xsl:apply-templates/></xsl:element>
    </xsl:template>


</xsl:stylesheet>
