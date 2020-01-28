<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei" xpath-default-namespace="http://www.tei-c.org/ns/1.0" xmlns="http://www.tei-c.org/ns/1.0" version="2.0">
   
    <xsl:output method="xml" indent="yes"/>

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
            <xsl:element name="body">
                <xsl:apply-templates/>
            </xsl:element>
        </xsl:copy>
    </xsl:template>
    
    <xsl:variable name="titre">
        <xsl:value-of select="upper-case(//title)"/>
    </xsl:variable>

    <xsl:template match="lg[@type = 'sonnet']">
        <xsl:element name="head">
            <xsl:value-of select="$titre"/>
        </xsl:element>
        <xsl:element name="lg">
            <xsl:apply-templates select="lg[@type = 'sizain']"/>
            <xsl:apply-templates select="lg[@type = 'quatrain']"/>
        </xsl:element>
    </xsl:template>



    <xsl:template match="lg[@type = 'sizain']">
        <xsl:element name="lg">
         <xsl:attribute name="type">
             <xsl:value-of select="@type"/>
         </xsl:attribute>
        <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="lg[@type = 'quatrain']">
        <xsl:element name="lg">
            <xsl:attribute name="type"><xsl:value-of select="@type"/></xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="lg">
        <xsl:element name="lg">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="l">
        <xsl:element name="l">
            <xsl:attribute name="n">
                <xsl:number count="l" level="single"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
