<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0" 
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
     exclude-result-prefixes="xs" version="2.0">
    
    
  <!--
    <xsl:template match="tei:lg[@type='quatrain']">
        <xsl:copy-of select="."/>
    </xsl:template>
    -->
<!--
    <xsl:template match="tei:l[position()=3]">
        <xsl:copy-of select="."/>
    </xsl:template>
   --> 
   <!--
        <xsl:template match="tei:lg[1]">
           Ici, il y avait un lg
           <xsl:apply-templates/>
        </xsl:template>
-->
  <!--
    <xsl:template match="tei:lg[@type = 'tercet'][2]/tei:l[3]">
        <xsl:copy-of select="."/>
    </xsl:template>
  -->
   <!--
    <xsl:template match="tei:lg[position() &lt; 2]">
        <xsl:copy-of select="."/>
    </xsl:template>
    -->    
   <!--
    <xsl:template match="tei:lg[position() &gt; 1]"> 
        <xsl:copy-of select="."/>
    </xsl:template>
   --> 
    <!--  &lt; = '<' -->
    <!--  &gt; = '>' -->
  

    <xsl:template match="(body//l)[3]">
        <xsl:copy-of select="."/>
    </xsl:template> 
    
</xsl:stylesheet>
