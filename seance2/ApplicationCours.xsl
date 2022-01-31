<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0" 
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <!--  
    <xsl:template match="lg[@type='tercet']">
        <xsl:text>ici il y avait un tercet</xsl:text>
    </xsl:template>
    
    <xsl:template match="lg[@type='quatrain']">
        <xsl:text>ici il y avait un quatrain</xsl:text>
    </xsl:template>
    -->
 <!--  
    <xsl:template match="lg">
        <div n="{@type}" type="{@n}">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    -->

<!--
    <xsl:template match="lg">
        <xsl:element name="div">
            <xsl:attribute name="n">
                <xsl:value-of select="@n"/>
            </xsl:attribute>
            <xsl:attribute name="type">
                <xsl:value-of select="@type"/>
            </xsl:attribute>   
            <xsl:apply-templates/>
        </xsl:element>  
    </xsl:template>
-->
<!--  
  <xsl:template match="l">
      <xsl:element name="p">
          <xsl:apply-templates/>
      </xsl:element>  
  </xsl:template>
 -->
    <xsl:template match="teiHeader">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="l">
        <xsl:element name="l">
            <xsl:attribute name="n">
                <xsl:number select="." level="any" format="1"/>
            </xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>


 

    
    


    
</xsl:stylesheet>