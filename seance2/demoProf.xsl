<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    version="2.0">
    
   <xsl:template  match="lg">
       <xsl:element name="lg">
           <xsl:attribute name="n">
               <xsl:number count="lg" level="multiple" format="1.1"/>
           </xsl:attribute>
           <xsl:apply-templates/>
       </xsl:element>
   </xsl:template>
    
   <xsl:template match="l">
       <xsl:element name="l">
           <xsl:attribute name="n">
               <xsl:number count="l" level="any"/>
           </xsl:attribute>
           <xsl:apply-templates/>
       </xsl:element>
   </xsl:template> 
    
</xsl:stylesheet>