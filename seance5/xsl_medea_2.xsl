<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    version="2.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="TEI">
        <xsl:element name="TEI">
            <xsl:copy-of select="teiHeader"/>
            <xsl:element name="text">
                <xsl:attribute name="n">
                    <xsl:value-of select="text/@n"/>
                </xsl:attribute>
                <xsl:apply-templates select="text"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    <xsl:template match="body">
       <xsl:element name="body">
           <xsl:attribute name="n">Play</xsl:attribute>
           <xsl:apply-templates/>
       </xsl:element>
    </xsl:template>
   
    <xsl:template match="body/div/div">
        <xsl:element name="div">
            <xsl:attribute name="type">act</xsl:attribute>
            <xsl:attribute name="n">
                <xsl:number count="div" level="single" format="1"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="pb|milestone"/>
    <xsl:template match="sp|@*">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="speaker">
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="l">
        <xsl:element name="l">
            <xsl:attribute name="n">
                <xsl:number count="l" level="any" format="1"/>
            </xsl:attribute>
           <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
</xsl:stylesheet>