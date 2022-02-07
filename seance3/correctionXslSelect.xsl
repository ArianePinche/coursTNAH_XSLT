<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei" xpath-default-namespace="http://www.tei-c.org/ns/1.0" 
    xmlns="http://www.tei-c.org/ns/1.0"
    version="2.0">
    
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    
    <xsl:template match="TEI">
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="teiHeader">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="text">      
        <xsl:copy>
            <body>
                <xsl:apply-templates/>
            </body>
        </xsl:copy>       
    </xsl:template>
    
    <xsl:template match="lg[@type='sonnet']">
        <lg type="sonnet">
            <xsl:apply-templates select=".//lg[@type='tercet'][2]"/>
            <xsl:apply-templates select=".//lg[@type='tercet'][1]"/>
            <xsl:apply-templates select="lg[@type='quatrain'][2]"/>
            <xsl:apply-templates select="lg[@type='quatrain'][1]"/>
        </lg>    
    </xsl:template>
    
    <xsl:template match="lg[not(@type='sonnet')]">
        <xsl:element name="lg">
            <xsl:attribute name="type">
                <xsl:value-of select="@type"/>
            </xsl:attribute>
            <xsl:attribute name="n">
                <xsl:value-of select="@n"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="l">
        <xsl:element name="l">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>