<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"  exclude-result-prefixes="xs tei" 
    version="2.0">

    <xsl:template match="TEI">
        <xsl:copy>
            <xsl:copy-of select="teiHeader"/>
            <xsl:apply-templates select="text"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="text">
        <xsl:copy>
            <xsl:element name="body" >
                <xsl:apply-templates/>
            </xsl:element>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="body/div | body/div/@*">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
  
    <xsl:template match="div[@type='letter'] | div[@type='letter']/@*">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template> 
    
    <xsl:template match="head">
        <xsl:copy>
            <xsl:value-of select="upper-case(.)"/>
        </xsl:copy>
    </xsl:template>
    
    <!--
    <xsl:template match="div[@type='section']">
        <xsl:element name="div">
            <xsl:attribute name="type">
                <xsl:value-of select="@type"/>
            </xsl:attribute>
            <xsl:attribute name="n">
                <xsl:number count="div" level="single"/>
            </xsl:attribute>
            <xsl:copy-of select="p"/>
        </xsl:element>
    </xsl:template>
     -->
     
    <xsl:template match="div[@type='section']">
        <xsl:copy>
            <xsl:if test="@subtype='A'">
                <head>Section A</head>
            </xsl:if>         
            <xsl:copy-of select="p"/>
        </xsl:copy>
    </xsl:template>
       
    
   <!-- 
    <xsl:template match="div[@type='section']/div">     
            <xsl:choose>
                <xsl:when test="@n='A'">
                    <xsl:copy-of select="."/>
                </xsl:when>
                <xsl:otherwise/>
            </xsl:choose>
    </xsl:template>
    -->
    
</xsl:stylesheet>
