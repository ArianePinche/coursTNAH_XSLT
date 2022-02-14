<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs" version="2.0">
   <!-- Exemple de règles avec des conditions -->
   
    <!-- condition  pour triApp.xml 
    <xsl:template match="rdg">
        <xsl:if test="@type='semantic'">
            <xsl:copy-of select="."/>
        </xsl:if>
    </xsl:template>
    -->
    <!-- condition  pour lucain.xml 
    <xsl:template match="rdg">
        <xsl:if test="contains(@wit ,'#P')">
            <xsl:copy-of select="."/>
        </xsl:if>
    </xsl:template>
    -->
    <!-- condition pour Mon_reve_familier.xml
    <xsl:template match="l">
        <xsl:if test="position() = 2">       
        <xsl:element name="li">
            <xsl:attribute name="title">
                <xsl:number select="." format="1" level="any"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
        </xsl:if>
    </xsl:template>
   -->
    
    <!-- condition pour Mon_reve_familier.xml
    <xsl:template match="lg">
        <xsl:choose>
            <xsl:when test="@type='sonnet'">
                <ul>
                    <xsl:apply-templates/>
                </ul>
            </xsl:when>
            <xsl:when test="@type='quatrain'">
                <ul>
                    <xsl:apply-templates/>
                </ul>
            </xsl:when>
            <xsl:otherwise/>
        </xsl:choose>
    </xsl:template>
    -->
    
</xsl:stylesheet>
