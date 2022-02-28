<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0" 
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    
   
    <xsl:template match="body">
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
   
    <!--
    <xsl:template match="TEI">
        <xsl:copy>
        <xsl:copy-of select="teiHeader"/>
         <xsl:apply-templates select="text"/>  
        </xsl:copy>
    </xsl:template>
    -->
   <!-- 
    <xsl:template match="div[@type='act']">
        <xsl:copy>
            <xsl:element name="head">
                <xsl:value-of select="concat(upper-case(@type), ' ', @n)"/>
            </xsl:element>
            <xsl:apply-templates/>  
        </xsl:copy>  
    </xsl:template>
    -->
    <!--
    <xsl:template match="div[@type='act']">
        <xsl:if test="div[@type='scene']">
        <xsl:copy>
            <xsl:element name="head">
                <xsl:value-of select="concat(upper-case(@type), ' ', @n)"/>
            </xsl:element>
            <xsl:apply-templates/>  
        </xsl:copy>
        </xsl:if>
    </xsl:template>
    -->
    <xsl:template match="title">
        <xsl:choose>
            <xsl:when test="@type='main'">
                <xsl:copy-of select="."/>
            </xsl:when>
            <xsl:when test="@type='sub'">
                <xsl:copy-of select="."/>
            </xsl:when>
            <xsl:otherwise/>
        </xsl:choose>
    </xsl:template>
    
    
</xsl:stylesheet>