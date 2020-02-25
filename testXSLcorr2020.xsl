<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0" 
    xmlns="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"  exclude-result-prefixes="xs tei" 
    version="2.0">

    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="TEI">
        <xsl:copy>
            <xsl:copy-of select="teiHeader"/>
            <xsl:apply-templates select="text"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="head">
        <xsl:copy>
            <xsl:value-of select="upper-case(.)"/>
        </xsl:copy>
    </xsl:template>

    
    <xsl:template match="body">
        <text>
        <xsl:copy>
            <xsl:apply-templates/>           
        </xsl:copy>
        </text>
    </xsl:template>
    
    
    

    <xsl:template match="div[@subtype='book']">
        <xsl:element name="div">
            <xsl:attribute name="type">
                <xsl:value-of select="@subtype"/>
            </xsl:attribute>
            <xsl:attribute name="n">
                <xsl:value-of select="@n"/>
            </xsl:attribute>
            <xsl:element name="head">
                <xsl:value-of select="concat(@subtype, ' n°', @n)"/>
            </xsl:element>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>


    <xsl:template match="name">
        <xsl:if test="@type='main'">
            <xsl:copy-of select="."></xsl:copy-of>
        </xsl:if>
    </xsl:template>
 
    
   
   
    <xsl:template match="div">
        <xsl:choose>
            <xsl:when test="@subtype='chapter'">
                <div1>
                   <xsl:apply-templates/>
                </div1>
            </xsl:when>
            <xsl:when test="@subtype='section'">
                <div2>
                   <xsl:apply-templates/>
                </div2>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template> 

</xsl:stylesheet>
