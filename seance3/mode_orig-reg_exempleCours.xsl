<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei" 
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" 
    xmlns="http://www.tei-c.org/ns/1.0" version="2.0">
    
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    
    <xsl:template match="div">
        <div>
        <xsl:apply-templates mode="orig"/>
        </div>
            <div>
        <xsl:apply-templates mode="reg"/>
                </div>      
    </xsl:template>
    
    <xsl:template match="descendant::choice" mode="orig">
        <xsl:value-of select="orig"/>
    </xsl:template>
    
    <xsl:template match="descendant::choice" mode="reg">
        <xsl:value-of select="reg"/>
    </xsl:template>
    
    
</xsl:stylesheet>